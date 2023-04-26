tcl;

mql set context user creator;
mql verbose on;

puts "==== DELETE ALL BUSSINESS OBJECT ===="

#================MODE 1==============================================================
# FOR USER INPUT , IF USE UNCOMMENT THIS CODE
# AND COMMENT MODE 2  
puts "Enter TYPE to query :"
gets stdin sType
puts "Enter NAME to query :"
gets stdin sName
puts "Enter REVISON to query :"
gets stdin sRevion
#====================================================================================
#================MODE 2==============================================================
# INPUT TYPE NAME REVISON OF BUSSINESS OBJECT
# IF USE UNCOMMENT THIS CODE AND COMMENT MODE 1
#set sType ESP*
#set sName *pub*1
#set sRevion *
#====================================================================================

# MQL TO RETRIEVE DATA
set liBus [split [mql temp query bus $sType $sName $sRevion select id dump |] \n]

# PROCEDURE TO PRINT DATA
proc print {id} {
	puts "====	Print	===="
	foreach bus $id {
		puts "$bus"
	}
}

# PROCEDURE TO WRITE FILE MQL
proc putstr {str} {
	puts "====	Start Write	===="
	set fp [open "del.tcl" w+]
	
	puts $fp "tcl;"
	puts $fp "mql set context user creator;"
	puts $fp "mql verbose on;"
	
 
	foreach obj $str {
		set id [lindex [split $obj |] end]
		puts $fp "mql del bus $id"
	}

	close $fp
	
	return "====	Write file DONE	===="
}

puts [print $liBus]  

puts "Do you want to delete all? (yes or no or exit) :"
gets stdin argDelete

# LOOP TO ENSURE USER WANT TO DELETE ALL
while {$argDelete != "exit"} {
	if {$argDelete == "yes"} {
		puts [putstr $liBus]
		puts "====	Open file to Delete	===="
		mql run del.tcl;
		puts "==== DELETE All DONE	===="
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