#!/usr/bin/wish


#########

text .text -relief raised -bg yellow -undo 1 -yscrollcommand {.scroll set}
scrollbar .scroll -command {.text yview}
grid .text -row 0 -column 0 -sticky news
grid .scroll -row 0 -column 1 -sticky ns

proc loadFile {} {
    set file [tk_getOpenFile -initialfile text]
    .text delete 1.0 end;	# delete content in .text
    set f [open $file];		# read $file into $f
    .text insert end [read $f];	# 
    close $f

    .text edit modified 0
}

## button load file
button .load -text LOADFILE -command loadFile
grid .load -row 1 -column 0 -sticky ew

proc deleteLine {} {
    # .text delete 5.0 5.end 5.end
    # .text delete 5.0 6.0;	# delete a line
    # .text delete insert "insert + 2 lines"
    # .text delete insert "insert + 2 chars"
    # .text delete insert "insert + 2 indices"

}

## button delete 
button .delete -text DELETE -command deleteLine
grid .delete -row 2 -column 0 -sticky ew

.text mark set first 5.7
.text mark gravity first left

proc tagHandle {} {
    .text tag add line2 2.0 2.end
    puts [.text tag ranges line2]
}
proc tagShow {} {
    puts [.text tag ranges line2]
}

proc forAllMatches {w pattern script} {
    set countList [list]
    set startList [$w search -all -regexp -count countList $pattern 1.0 end]
    foreach first $startList count $countList {
	$w mark set first $first
	$w mark set last [$w index "$first + $count chars"]
	uplevel 1 $script
    }
}

proc doSearch {} {
    forAllMatches .text p {
	puts "[.text index first]---->[.text index last]"
    }
}

proc doChange {} {
    forAllMatches .text row {
	.text tag add big first last
    }
    .text tag configure big -background "blue" -font {30} -relief raised
    .text tag bind big <Enter> {
	.text tag configure big -background "red" -font {60}
    }
    .text tag bind big <Leave> {
	.text tag configure big -background "blue" -font {30} -relief raised
    }
}
    
button .taghandle -text handle1 -command tagHandle
grid .taghandle -row 3 -column 0 -sticky ew

button .tagshow -text handle2 -command doChange
grid .tagshow -row 4 -column 0 -sticky ew

proc undoText {tw} {
    catch {$tw edit undo}
}
proc redoText {tw} {
    catch {$tw edit redo}
}
proc separatorText {tw} {
    catch {$tw edit separator}
}
proc resetText {tw} {
    catch {$tw edit reset}
}

proc dataModified {tw} {
    if {[$tw edit modified]} {
	.undo configure -state normal
	.redo configure -state normal
    } else {
	.undo configure -state disabled
	.undo configure -state disabled
    }
}



frame .toolbar
button .undo -text undo -command {undoText .text}
button .redo -text redo -command {redoText .text}
button .separ -text sepStack -command {separatorText .text}
button .reset -text resetUndo -command {resetText .text}

bind .text <<Modified>> {
    dataModified .text
}

pack .undo -in .toolbar -side left
pack .redo -in .toolbar -side left
pack .separ -in .toolbar -side left
pack .reset -in .toolbar -side left
grid .toolbar -row 5 -column 0 -sticky ew

toplevel .shareText
.text peer create .shareText.text -relief raised -bg green -yscrollcommand ".scroll2 set" -undo 1
scrollbar .scroll2 -command ".shareText.text yview"

pack .shareText.text -in .shareText 

proc cutText {w} {
    catch {tk_textCut $w}
}
proc copyText {w} {
    catch {tk_textCopy $w}
}
proc pasteText {w} {
    catch {tk_textPaste $w}
}

button .cut -text cut -command {cutText .text}
button .copy -text copy -command {copyText .text}
button .paste -text paste -command {pasteText .text}

pack .cut -in .toolbar -side right
pack .copy -in .toolbar -side right
pack .paste -in .toolbar -side right
