#!/usr/bin/tclsh


# for loop execution

set lComps [list Memory	Mouse "System Box"]

for { set i 0}  {$i < [llength $lComps]} {incr i} {
   puts "value of $i: [lindex $lComps $i]"
}