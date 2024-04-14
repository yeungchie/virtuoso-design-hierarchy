;--------------------------
; Program  : virtuoso-design-hierarchy(treeDump.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")

procedure(treeDump(tree file \@key fullStatusInfo "gtg")
    unless(className(tree) == 'Tree
        ycError("argument #1 should be a %A object - %A" 'Tree className(tree))
    )
    let((port dumper flag)
        unless(port = outfile(file "w")
            ycError("cannot access file - %A" file)
        )
        dumper = lambda((item \@optional width(0) "gx")
            fprintf(port
                strcat(lsprintf("%%%ds" width) "%s %s %s (%d)%s\n")
                "" item~>lib item~>cell item~>view getItemNumInst(item)
                case(item~>status
                    ("normal"
                        ""
                    )
                    ("unbound"
                        " *UNBOUND*"
                    )
                    ("lostsch"
                        if(fullStatusInfo
                            " *LOSTSCH*"
                            ""
                        )
                    )
                    (t
                        if(fullStatusInfo
                            " *UNKNOWN*"
                            ""
                        )
                    )
                )
            )
            foreach(x item~>tree~>items
                funcall(dumper x width+2)
            )
        )
        flag = car(errset(
            {
                fprintf(port  "          Design Hierarchy\n"                        )
                fprintf(port  "**************************************************\n")
                fprintf(port  "Library : %s\n" tree~>lib                            )
                fprintf(port  "Cell    : %s\n" tree~>cell                           )
                fprintf(port  "View    : %s\n" tree~>view                           )
                fprintf(port  "Type    : %s\n" tree~>cellView~>cellViewType         )
                fprintf(port  "Level   : %d\n" getTreeDepth(tree)                   )
                fprintf(port  "Time    : %s\n" getTimeStamp()                       )
                fprintf(port  "**************************************************\n")
                fprintf(port  "\n"                                                  )
                mapcar(dumper tree~>items)
                t
            }
            t
        ))
        close(port)
        flag
    )
)

unuseNamespace("ycDesignHier")
; END
