;--------------------------
; Program  : virtuoso-design-hierarchy(load.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
makeNamespace("ycDesignHier")
addToNamespace("ycDesignHier"
    mapcar('symbolToString '(
        Node Tree Item setTreeItems setItemTree setItemStatus
        makeInstGroups createTree createItems
        getTreeDepth getItemNumInst getTimeStamp treeDump
    ))
)

unuseNamespace("ycDesignHier")

ycLoad("src/class.il")
ycLoad("src/printself.il")
ycLoad("src/create.il")
ycLoad("src/getTreeDepth.il")
ycLoad("src/getItemNumInst.il")
ycLoad("src/makeInstGroups.il")
ycLoad("src/getTimeStamp.il")
ycLoad("src/treeDump.il")

; END
