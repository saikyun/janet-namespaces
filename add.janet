(import ./namespaces :as ns)

(defn add [_ a b] (+ a b a b))

(ns/export :cool.namespace @{:add add})

