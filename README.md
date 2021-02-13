# namespaces in janet

Trying to create a way to reload files without having to reload files depending on that file.
What I'm doing is creating a global namespace table, then I'm putting things (e.g. functions) into that table.
Then I call functions on that table. (e.g. `(:func (global-ns-table :namespace) args)`)
If I change a file and reload it, it mutates the global table, putting new functions in.
Since calls to the namespace are using the global table, they will get new "references". This means that code using the namespace won't have to be reloaded.

## example usage

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
