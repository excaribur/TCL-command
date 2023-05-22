set sSplit [split "potato,mango,apple" ","]
puts $sSplit
puts "Print out in while loop"
set i 0
while {$i < [llength $sSplit]} {
	puts "$i = [lindex  $sSplit $i]"
	incr i
}