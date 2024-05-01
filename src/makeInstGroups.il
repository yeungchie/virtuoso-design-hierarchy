;--------------------------
; Program  : virtuoso-design-hierarchy(makeInstGroups.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")

procedure(makeInstGroups(cvId "d")
    let((groups)
        groups = makeTable("InstanceTable" nil)
        foreach(inst cvId~>instances
            groups[inst~>master] = cons(inst groups[inst~>master])
        )
        groups
    )
)

unuseNamespace("ycDesignHier")
; END
