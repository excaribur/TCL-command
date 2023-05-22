tcl;

mql set context user creator;
mql verbose on;

puts ""
puts "================ DELETE ALL BUSSINESS OBJECT ================"
puts ""

#================MODE 1==============================================================
# FOR USER INPUT , IF USE UNCOMMENT THIS CODE
# AND COMMENT MODE 2  
#puts "ENTER BUSINESS OBJECT DATA"
#puts "TYPE:"
#gets stdin sType
#puts "NAME:"
#gets stdin sName
#puts "REVISON:"
#gets stdin sRevion
#====================================================================================
#================MODE 2==============================================================
# INPUT TYPE NAME REVISON OF BUSSINESS OBJECT
# IF USE UNCOMMENT THIS CODE AND COMMENT MODE 1
set sType ESP*
set sName *
set sRevion *
#====================================================================================

# MQL TO RETRIEVE DATA
set liBus [split [mql temp query bus $sType $sName $sRevion select id dump |] \n]

# PROCEDURE TO PRINT DATA
proc print {id} {
	puts "=============================="
	puts "= PRINT QUERY BUSINESS OBJECT="
	puts "=============================="
	foreach bus $id {
		puts "$bus"
	}
}

# PROCEDURE TO WRITE FILE MQL
proc putstr {str} {
	puts "=============================="
	set fp [open "del.tcl" w+]
	
	puts $fp "tcl;"
	puts $fp "mql set context user creator;"
	puts $fp "mql verbose on;"
	
 
	foreach obj $str {
		set id [lindex [split $obj |] end]
		puts $fp "mql del bus $id"
	}

	close $fp 
	return "=============================="
}

# PROCEDURE TO DELETE FILE DATA
proc deleteFile {} {
	set path [pwd]
	append path "/del.tcl"
	file delete -force $path
	#puts "$path"
}

puts [print $liBus]  

puts "Do you want to delete all? (yes or no or exit) :"
gets stdin argDelete

# LOOP TO ENSURE USER WANT TO DELETE ALL
while {$argDelete != "exit"} {
	if {$argDelete == "yes"} {
		puts [putstr $liBus]
		puts "====	IN PROCESS DELETE	===="
		
		mql run del.tcl;
		puts [deleteFile]
		puts "====	DELETE All DONE		===="

		set argDelete "exit"
	} elseif {$argDelete == "no"} {
		puts "======== OK NO DELETE ========"
		puts "Do you want to delete all? (yes or no or exit) :"
		gets stdin argDelete
	} else {
		puts "==== TYPO, MISSING COMMAND ==="
		puts "Do you want to delete all? (yes or no or exit) :"
		gets stdin argDelete
	}
}
puts "========================== FINISHED ========================="