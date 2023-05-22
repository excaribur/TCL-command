tcl;

mql set context user creator;
#mql verbose on;

#=================================================================
# add type here
set type(0) "Inbox Task"
set type(1) "Change Order"
set type(2) "Change Action"

#=================================================================

puts ""
puts "================ FIND ID BUSSINESS OBJECT ================"
puts ""

puts "ENTER BUSINESS OBJECT DATA"
puts ""
for { set index 0 }  { $index < [array size type] }  { incr index } {
   puts "PRESS $index : $type($index)"
}

#============== stdin input type
puts "TYPE:"
gets stdin Press;puts ""

#============== Ensure No input error
if {$Press >= [array size type] || $Press < 0} {
	puts "Out of range...Set to defualt value"
	set Press 0;puts ""
}

set sType $type($Press)
set sName *;puts ""
set sRevion *;puts ""

#========== MQL TO RETRIEVE DATA
set liBus [split [mql temp query bus $sType $sName $sRevion select id dump |] \n]; puts "MQL RETRIEVE DATA DONE.....!"

#========== PROCEDURE TO PRINT DATA
proc print {id} {
	puts "=============================="
	puts "= PRINT QUERY BUSINESS OBJECT="
	puts "=============================="
	foreach bus $id {
		puts "$bus"
	}
}

puts [print $liBus] 