```
janet
(import ./test_namespaces :prefix "")
(use-regular-add 1 2)
#=> 3
(use-ns-add 1 2)
#=> 3

### Modify add.janet, eg like so:
### (defn add [_ a b] (+ a b a b))

 ### imagine that the next line is `load-file`
(import ./add :fresh true)

(use-regular-add 1 2)
#=> 3
(use-ns-add 1 2)
#=> 6            ## the result changed! :)
```
