;--------------------------
; Program  : virtuoso-design-hierarchy(create.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")

procedure(createTree(cvId \@key depth current(0) _treeMem(makeTable("" nil)) "dgxo")
    when(depth && (!fixp(depth) || (depth < 0))
        ycError("argument for key ?depth should be a fixnum and >= 0 - %A" depth)
    )
    _treeMem[cvId] = _treeMem[cvId] || Tree(
        ?cellView cvId
        ?items createItems(
            cvId
            ?depth depth
            ?current current
            ?_treeMem _treeMem
        )
    )
)

procedure(createItems(cvId \@key depth current(0) _treeMem(makeTable("" nil)) "dgxo")
    when(depth && (!fixp(depth) || (depth < 0))
        ycError("argument for key ?depth should be a fixnum and >= 0 - %A" depth)
    )
    let((groups)
        groups = makeInstGroups(cvId)
        foreach(mapcar lcv groups~>?
            let((insts master status item)
                insts  = groups[lcv]
                master = car(insts)~>master
                status = master && "normal" || "unbound"
                item = Item(
                    ?master master
                    ?status status
                    ?insts  insts
                )
                when((status != "unbound") && (!depth || (current < depth))
                    when(master~>cellViewType == "schematicSymbol"
                        nth(2 lcv) := "schematic"
                    )
                    if(apply('ddGetObj lcv) && (master = apply('dbOpenCellViewByType lcv))
                        setItemTree(item
                            createTree(
                                master
                                ?depth depth
                                ?current current+1
                                ?_treeMem _treeMem
                            )
                        )
                        setItemStatus(item "lostsch")
                    )
                )
                item
            )
        )
    )
)

unuseNamespace("ycDesignHier")
; END
