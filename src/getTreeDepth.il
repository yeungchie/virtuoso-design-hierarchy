;--------------------------
; Program  : virtuoso-design-hierarchy(getTreeDepth.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")

procedure(getTreeDepth(tree)
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

unuseNamespace("ycDesignHier")
; END
