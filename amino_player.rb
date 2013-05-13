require 'midilib/sequence'
require 'midilib/consts'
include MIDI

class AminoPlayer
  def readMappings(filestring,toneMap)
    @translation = Hash.new
    filestring.each_line do |line|
      linearr = line.split(" - ")
      key = linearr[0]

      base = linearr[1].sub(/\s+/){|s| ""}
      if toneMap[base]
        tone = toneMap[base][0]
      else
        tone = 0
      end
      @translation[key] = tone
    end
  end

  def createDataArray(filestring)
    @tones = Array.new
    filestring.each_line do |line|
      linearr = line.scan(/.{1,3}/)
      linearr.each do |s|
        @tones << @translation[s]
      end
    end
    @tones
  end

  def createSequence()
    @seq = Sequence.new()
    # Create a first track for the sequence. This holds tempo events and stuff
    # like that.
    track = Track.new(@seq)
    @seq.tracks << track
    track.events << Tempo.new(Tempo.bpm_to_mpq(120))
    track.events << MetaEvent.new(META_SEQ_NAME, 'Sequence Name')

    # Create a track to hold the notes. Add it to the sequence.
    track = Track.new(@seq)
    @seq.tracks << track

    # Give the track a name and an instrument name (optional).
    track.name = 'AminoBeats'
    track.instrument = GM_PATCH_NAMES[0]

    # Add a volume controller event (optional).
    track.events << Controller.new(0, CC_VOLUME, 127)

    # Add events to the track: a major scale. Arguments for note on and note off
    # constructors are channel, note, velocity, and delta_time. Channel numbers
    # start at zero. We use the new Sequence#note_to_delta method to get the
    # delta time length of a single quarter note.
    track.events << ProgramChange.new(0, 1, 0)
    quarter_note_length = @seq.note_to_delta('quarter')
    @tones.each do |offset|
      if offset == -1
        offset = 0
      end 
        track.events << NoteOn.new(0, offset, 127, 0)
        track.events << NoteOff.new(0, offset, 127, quarter_note_length)
    end

    # Calling recalc_times is not necessary, because that only sets the events'
    # start times, which are not written out to the MIDI file. The delta times are
    # what get written out.

    # track.recalc_times

    File.open('translation.mid', 'wb') { |file| @seq.write(file) }

    #%x(open translation.mid)
    @t = Thread.new do 
      %x(timidity translation.mid)
      #exec "timidity translation.mid"
    end
  end

  def stop
    %x(killall -9 timidity)
    Thread.kill @t
  end

end
