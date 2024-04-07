;--------------------------
; Program  : virtuoso-design-hierarchy(getItemNumInst.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")

procedure(getItemNumInst(item)
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

unuseNamespace("ycDesignHier")
; END
