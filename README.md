# Graph Algorithms

## Keys/notes

In graph text representations in this document:
`(x)` = node
`-*` = edges, where `*` represents direction or "arrowhead".


## References

[Graph Algorithms for Technical Interviews - Full Course](https://youtu.be/tWVWeAqZ0WU)

## Basics (high level)

### Graph

Q. What is a **graph**?
A. A _graph_ is a collection of nodes + edges (i.e. graph = nodes + edges).

A **graph** describes the relationship between "things". The **nodes** represent the "things" and the **edges** describe the "relationship" between the "things".

To put it another way, the **nodes** represent _cities_ and the **edges** represent the _roads_ _connecting_ the cities.

### Nodes
A **node** represents _data_ in a _graph_. Some use the term **vertex** in lieu of **node**; _vertext_ and _node_ are synonymous terms.

#### Neighbor node
A **neighbor node** is any node that is directly _accessible_ from any other node _through an edge_ (obeying any direction indicated).

For example, nodes `(b)` and `(c)` are _neighbor nodes_ to node `(a)` in the below _directed graph_ example; however, `(c)`'s only neighbor is `(e)` because of the given _direction_:
```
(a) -* (c)
 |      |
 *      *
(b) *- (e)
 |
 *
(d) *- (f)
```

### Edges
An **edge** is any connection between a pair of _nodes_.

In the following example, there is an "edge" between (a) and (b) and (b) and (c):

`(a) -* (b) -* (c)`
`(a) - (b) - (c)`

### Graph types (2 types)
#### Directed graph
Think of the direction as a _1-way street_. From `(a)`, I can traverse to `(b)` and `(c)`; however, I cannot traverse from `(b)` back to `(a)`, and I cannot traverse from `(c)` back to `(a)`.
##### Example
```
(a) -* (c)
 |      |
 *      *
(b) *- (e)
 |
 *
(d) *- (f)
```
#### Undirected graph
Think of the direction as a _2-way street_. From `(c)`, I can traverse to `(a)` and `(e)`; from `(a)`, I can traverse to `(b)` and `(c)`.
##### Example
```
(a) - (c)
 |     |
(b) - (e)
 |
(d) - (f)
```

## Traversing a graph

### Two algorithums
* Depth first
* Breadth first

#### Depth first algorithm
Uses a **_stack_**
```
(a) -* (c)
 |      |
 *      *
(b) *- (e)
 |
 *
(d) *- (f)
```

Traversal would proceed from a starting node (for example `(a)`, and traverse the nodes in the following order:
`(a)` -* `(b)` -* `(d)`
`(c)` -* `(e)` -* `(b)` -* `(d)`

Notice how the traversal starting with `(c)` winds up traversing `(b)` -* `(d)` yet again; this is normal due to the nature of the algorithm.
Notice also that node `(f)` is never reached; this also is normal due to the nature of the algorithm, and due to the lack of direction leading _to_ node `(f)`

#### Breadth first algorithm
Must use a **_queue_**
```
(a) -* (c)
 |      |
 *      *
(b) *- (e)
 |
 *
(d) *- (f)
```

Traversal would proceed from a starting node (for example `(a)`, and traverse the nodes in the following order:
`(a)` -* `(b)` -* `(c)`
?

NOTE: The order in which neighbor nodes are traversed (for example `(b)` and `(c)`) is insignificant.

### What's the difference?

They are the same in that both algorithms traverse the _whole_ graph; however, the _order_ in which the graph is traversed differs.
