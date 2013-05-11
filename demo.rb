require './aminobeats.rb'
#Sample file explaining how to use the aminobeats ui api

#We require a function that is called whenever the user opens
#or edits the mappings of amionacids to notes. This function
#will recieive as it's first argument a string containing the
#mappings

editMappings = Proc.new do |mappings|
  #Just print the mappings for demostration
  printf("The mappings are: " + mappings + "\n")
end


#Second we require a function to be executed when the user
#writes an input sequence and clicks play. The function 
#will receive as it's first argument the string containing
#the sequence

playSequence = Proc.new do |seq|
  #Just print ...
  printf("Playing the sequence: " << seq << "\n")
end

#Finally we require a function to be called when the
#user clicks the stop button. It takes no arguments.
stopPlay = Proc.new do
#Indicate that music was stopped
  printf "Stopped"
end

#Call the function to initialize the gui with your callbacks
initApp(editMappings,playSequence,stopPlay)
