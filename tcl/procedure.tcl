puts "Procedures or Procs in tcl"

set addLast "@gmail.com"
set sSplit [split "potato,mango,apple" ","]

proc modifier {data addLast} {
	return [join [list $data $addLast] ""]
}

set i 0
while {$i < [llength $sSplit]} {
	puts "$i = [lindex  $sSplit $i]" 
	set data [lindex  $sSplit $i]
	set arr($i) [modifier $data $addLast] 
	incr i
}
for { set index 0 }  { $index < [array size arr] }  { incr index } {
   puts "arr($index) : $arr($index)"
   set arrForeach($index) [modifier $data "@esp-group.asia"] 
}

puts ""
puts {foreach name $sSplit}
foreach name $sSplit {
	puts "$name"
}
puts ""
puts {foreach {newName} [array names arrForeach]}
foreach {newName} [array names arrForeach] {
	puts "$newName"
}
puts ""
puts {foreach {key value} [array get arrForeach]}
foreach {key value} [array get arrForeach] {
	puts "key:$key and value:$value"
}