;--------------------------
; Program  : virtuoso-design-hierarchy(utils.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")


procedure(getTreeDepth(tree)  ; -> int
    unless(className(tree) == 'Tree
        ycError("argument #1 should be a %A object - %A" 'Tree className(tree))
    )
    let((depth(0))
        foreach(item tree~>items
            when(item~>tree && (item~>tree != 'unbound)
                depth = max(depth 1+getTreeDepth(item~>tree))
            )
        )
        depth
    )
)


procedure(getItemNumInst(item)  ; -> int
    unless(className(item) == 'Item
        ycError("argument #1 should be a %A object - %A" 'Item className(item))
    )
    let((sum(0))
        foreach(inst item~>insts
            sum += case(inst~>objType
                ("inst"
                    inst~>numInst
                )
                ("mosaic"
                    inst~>rows*inst~>columns
                )
                (t
                    ycWarn("unsupported object type - %A, increment one" inst~>objType)
                    1
                )
            )
        )
        sum
    )
)


procedure(getTimeStamp()  ; -> str
    let((tm)
        tm = timeToTm(stringToTime(getCurrentTime()))
        lsprintf("%02d-%02d-%02d %02d:%02d:%02d"
            tm~>tm_year+1900
            tm~>tm_mon+1
            tm~>tm_mday
            tm~>tm_hour
            tm~>tm_min
            tm~>tm_sec
        )
    )
)


procedure(treeDump(tree file \@key fullStatusInfo "gtg")  ; -> bool
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
