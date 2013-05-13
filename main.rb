require './aminobeats.rb'
require './amino_player.rb'

player = AminoPlayer.new

#Sample file explaining how to use the aminobeats ui api

#We require a function that is called whenever the user opens
#or edits the mappings of amionacids to notes. This function
#will recieive as it's first argument a string containing the
#mappings

editMappings = Proc.new do |filestring,mappings|
  player.readMappings(filestring,mappings)
end


#Second we require a function to be executed when the user
#writes an input sequence and clicks play. The function 
#will receive as it's first argument the string containing
#the sequence

playSequence = Proc.new do |seq|
  t = player.createDataArray(seq)
  player.createSequence()
  t
end

#Finally we require a function to be called when the
#user clicks the stop button. It takes no arguments.
stopPlay = Proc.new do
#Indicate that music was stopped
  player.stop
end

parseData = Proc.new do |seq|
  player.createDataArray(seq)
  
end

#Call the function to initialize the gui with your callbacks
initApp(editMappings,playSequence,stopPlay,parseData)
