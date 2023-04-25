tcl;

mql set context user creator;
mql verbose on;

#puts "==== Temp Query ===="
#puts "Enter TYPE to query :"
#gets stdin sType
#puts "Enter NAME to query :"
#gets stdin sName
#puts "Enter REVISON to query :"
#gets stdin sRevion

set sType ESP*
set sName *
set sRevion *
#set sBus [mql temp query bus $sType $sName $sRevion dump |]
#set liBus [split $sBus \n]
set getinfo [split [mql temp query bus $sType $sName $sRevion select id dump |] \n]
set liBus [split $getinfo |]

#proc delete {bus} {
#	puts "====	DELETE	===="
#	foreach bus $bus {
#		puts [mql del bus $bus]
#	}
#	return "====	DONE	===="
#}

proc print {id} {
	puts "====	Print	===="
	foreach bus $id {
		puts "$bus"
	}
}

proc putstr {str} {
	puts "====	Start Write	===="
	set fp [open "del.tcl" w+]
	
	puts $fp "tcl;"
	puts $fp "mql set context user creator;"
	puts $fp "mql verbose on;"
 
	foreach obj $str {
		puts $fp "mql del bus $obj"
	}

	close $fp
	
	return "====	Write file DONE	===="
}

puts [print $liBus]  

puts "Do you want to delete all? (yes or no or exit) :"
gets stdin argDelete

while {$argDelete != "exit"} {
	if {$argDelete == "yes"} {
		puts [putstr $liBus]
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