;--------------------------
; Program  : virtuoso-design-hierarchy(class.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")


procedure(Tree(\@key cellView items "dl")  ; -> Tree
    cellView = cellView || car(car(items)~>insts)~>cellView

    makeInstance('Tree
        ?cellView   cellView
        ?items      items
        ?lib        cellView~>libName
        ?cell       cellView~>cellName
        ?view       cellView~>viewName
    )
)


procedure(Item(\@key tree master insts status "gglt")  ; -> Item
    if(master
        unless(master~>objType == "cellView"
            ycError("argument #2 should be a cellView object - %A" master~>objType)
        )
        master = car(insts)
    )
    
    makeInstance('Item
        ?master master
        ?status status
        ?insts  insts
        ?lib    master~>libName
        ?cell   master~>cellName
        ?view   master~>viewName
        ?tree   tree
    )
)


defclass(Node ()
    (
        (lib  \@initarg lib )
        (cell \@initarg cell)
        (view \@initarg view)
    )
)


defclass(Tree (Node)
    (
        (cellView
            \@initarg cellView
        )
        (items
            \@initarg items
            \@writer  setTreeItems
        )
    )
)


defclass(Item (Node)
    (
        (tree
            \@initarg tree
            \@writer  setItemTree
        )
        (insts
            \@initarg insts
        )
        (master
            \@initarg master
        )
        (status
            \@initarg status
            \@writer  setItemStatus
        )
    )
)


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
