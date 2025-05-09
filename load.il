;--------------------------
; Program  : virtuoso-design-hierarchy(load.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
makeNamespace("ycDesignHier")
addToNamespace("ycDesignHier"
    mapcar('symbolToString '(
        ; class
        Node Tree Item setTreeItems setItemTree setItemStatus

        ; create
        createTree createItems makeInstGroups

        ; utils
        getTreeDepth getItemNumInst getTimeStamp treeDump
    ))
)
unuseNamespace("ycDesignHier")

ycLoad("src/class.il")
ycLoad("src/create.il")
ycLoad("src/utils.il")

; END
