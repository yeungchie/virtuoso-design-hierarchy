;--------------------------
; Program  : virtuoso-design-hierarchy(printself.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")

defmethod(printself ((obj Node))
    lsprintf("%s:{%s/%s/%s}"
        className(obj)
        obj~>lib
        obj~>cell
        obj~>view
    )
)

defmethod(printself ((obj Tree))
    lsprintf("%s:{%s/%s/%s}"
        className(obj)
        obj~>lib
        obj~>cell
        obj~>view
    )
)

defmethod(printself ((obj Item))
    lsprintf("%s:{%s/%s/%s}"
        className(obj)
        obj~>lib
        obj~>cell
        obj~>view
    )
)

unuseNamespace("ycDesignHier")
; END
