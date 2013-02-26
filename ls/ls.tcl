# $ tclsh ls.tcl

proc ldelete { lyst elem } {
	set idx [lsearch $lyst $elem]
	return [lreplace $lyst $idx $idx]
}

proc list_files { dir } {
	set code [catch {
		set files [glob -directory $dir -tails -- * .*]
		set files [ldelete $files "."]
		set files [ldelete $files ".."]
		puts [join $files "\n"]
	} msg]
	if { $code } {
		puts $msg
	}
}

if { $argc == 0 } {
	list_files "."
} else {
	for { set i 0 } { $i < $argc } { incr i } {
		set dir [lindex $argv $i]
		puts "\[$dir\]"
		list_files $dir
		if { $i<($argc-1) } {
			puts ""
		}
	}
}
