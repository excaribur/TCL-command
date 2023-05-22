puts "==== Temp Query ===="
puts "Enter TYPE to query :"
gets stdin sType
puts "Enter NAME to query :"
gets stdin sName
puts "Enter REVISON to query :"
gets stdin sRevion

set sBus [split $sType ","]

proc delete {bus} {
	puts "====DELETE===="
	foreach bus $bus {
		puts "mql del bus $bus"
	}
	return "====DONE===="
}

proc print {id} {
	foreach bus $id {
		puts "$bus"
	}
}

puts [print $sBus]  
puts "Do you want to delete all? (yes or no or exit) :"
gets stdin argDelete

while {$argDelete != "exit"} {
	if {$argDelete == "yes"} {
		puts [delete $sBus]
		set argDelete "exit"
	} elseif {$argDelete == "no"} {
		puts "==== OK no delete ===="
		puts "Do you want to delete all? (yes or no or exit) :"
		gets stdin argDelete
	} else {
		puts "==== typo, missing command ===="
		puts "Do you want to delete all? (yes or no or exit) :"
		gets stdin argDelete
	}
}
puts "==== Goodbye ===="