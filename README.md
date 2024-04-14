# virtuoso-design-hierarchy

[TOC]

## 项目依赖

+ skill-loader [ [GitHub](https://github.com/yeungchie/skill-loader "https://github.com/yeungchie/skill-loader") / [Gitee](https://gitee.com/yeungchie/skill-loader "https://gitee.com/yeungchie/skill-loader") ]

## 命名空间

`ycDesignHier`

## 快速入门

### 创建 Tree

```lisp
cvId = dbOpenCellViewByType("lib" "cell" "view")
tree = ycDesignHier::createTree(cvId)
; => Tree:{lib/cell/view}
```

### 导出 Tree 到文件

```lisp
ycDesignHier::treeDump(tree "design_hierarchy.tree")
; => t
```

原理图单元导出完整状态信息：

```lisp
ycDesignHier::treeDump(tree "design_hierarchy.tree" ?fullStatusInfo t)
; => t
```

---
