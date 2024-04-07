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
            let((key)
                key = list(
                    inst~>libName
                    inst~>cellName
                    inst~>viewName
                )
                groups[key] = cons(inst groups[key])
            )
        )
        groups
    )
)

unuseNamespace("ycDesignHier")
; END
