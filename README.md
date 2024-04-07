# virtuoso-design-hierarchy

## Requirements

+ skill-loader [ [GitHub](https://github.com/yeungchie/skill-loader "https://github.com/yeungchie/skill-loader") / [Gitee](https://gitee.com/yeungchie/skill-loader "https://gitee.com/yeungchie/skill-loader") ]

## Namespace

`ycDesignHier`

## Quick Start

### Craete Tree by CellView

```lisp
cvId = dbOpenCellViewByType("lib" "cell" "view")
tree = ycDesignHier::createTree(cvId)
; => Tree:{lib/cell/view}
```

### Dump Tree to File

```lisp
ycDesignHier::treeDump(tree "design_hierarchy.tree")
; => t
```

---
