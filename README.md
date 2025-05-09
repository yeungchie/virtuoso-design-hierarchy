# virtuoso-design-hierarchy

## 项目依赖

+ [skill-loader](https://github.com/yeungchie/skill-loader "https://github.com/yeungchie/skill-loader")

## 命名空间

`ycDesignHier`

## 快速使用

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
