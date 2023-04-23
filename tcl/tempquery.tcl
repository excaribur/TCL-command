puts "==== Temp Query ===="
puts "Enter TYPE to query :"
gets stdin sType
puts "Enter NAME to query :"
gets stdin sName
puts "Enter REVISON to query :"
gets stdin sRevion

set sBus [split [mql temp query bus $sType $sName $sRevion] "\n"]

proc delete {bus} {
	puts "====DELETE===="
	foreach bus $bus {
		puts [mql del bus $bus]
	}
	return "====DONE===="
}

proc print {id} {
	foreach bus $sBus {
		puts "$bus"
	}
}

puts "Do you want to delete all? (yes or no) :"
gets stdin argDelete

if {$argDelete == "yes"} {
	puts [delete $sBus]
} elseif {$argDelete == "no"} {
	puts "OK no delete"
} else {
	puts "typo, missing command"
}
