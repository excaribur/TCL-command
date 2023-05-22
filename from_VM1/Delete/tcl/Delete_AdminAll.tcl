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
#set sType ESP*
set sName ESP*
set s_type_Name type_ESP*
set liAdmin [list role prog form command menu table relation policy type attribute group]

#set sRevion *
#====================================================================================

# MQL TO RETRIEVE DATA
#set liBus [split [mql temp query bus $sType $sName $sRevion select id dump |] \n]
#set $admin [split [mql list $item $Name select id dump |] "\n"] 


# PROCEDURE TO PRINT DATA AND WRITE IN FILE
proc print {key arrAllObject} {
	puts "=============================="
	puts "= PRINT QUERY BUSINESS OBJECT="
	puts "=============================="
	
	set fp [open "delAdmin.tcl" w+]
	
	puts $fp "tcl;"
	puts $fp "mql set context user creator;"
	puts $fp "mql verbose on;"
	
	upvar $arrAllObject arr 
	foreach admin_type $key {
		set inArr [split $arr($admin_type) " "]
		foreach id $inArr {	
			set objId [string trim [lindex [split $id |] 0]]
			if {[string compare $objId ""] != 0 || [string compare $objId "\n"] != 0} {
				if {[string compare $admin_type table] == 0} {
					set command "$admin_type $objId system"
				} else {
					set command "$admin_type $objId"
				}
				puts "$command"
				puts $fp "mql del $command"
			}
		}
	}
	close $fp 	
}

# PROCEDURE TO QUERY ADMIN OBJECT 
proc addArray {liAdmin Name1 Name2} {
	puts "====	ADD ARRAY	===="
	foreach admin_type $liAdmin {
		if {[string compare $admin_type table] == 0} {
			set arrAllObject($admin_type) [split [mql list $admin_type system $Name1 select name id dump |] "\n"] 
		} elseif {[string compare $admin_type menu] == 0} {
			set arrAllObject($admin_type) "[split [mql list $admin_type $Name1 select name id dump |] "\n"]\n[split [mql list $admin_type $Name2 select name id dump |] "\n"]" 		
		} else {
			set arrAllObject($admin_type) [split [mql list $admin_type $Name1 select name id dump |] "\n"] 	
		}
	}
	puts [print $liAdmin arrAllObject]
}

# PROCEDURE TO DELETE FILE DATA
proc deleteFile {} {
	set path [pwd]
	append path "/delAdmin.tcl"
	file delete -force $path
	#puts "$path"
}

puts [addArray $liAdmin $sName $s_type_Name] 

puts "Do you want to delete all? (yes or no or exit) :"
gets stdin argDelete

# LOOP TO ENSURE USER WANT TO DELETE ALL
while {$argDelete != "exit"} {
	if {$argDelete == "yes"} {
		puts "====	IN PROCESS DELETE	===="
		mql run delAdmin.tcl;
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

