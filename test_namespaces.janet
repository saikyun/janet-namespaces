(import ./namespaces :as ns)
(import ./add :as a :fresh true)
(def cns (ns/ns :cool.namespace))

(defn use-regular-add
  [a b]
  (a/add nil a b))

(defn use-ns-add
  [a b]
  (:add cns a b))

(use-regular-add 1 2)
(use-ns-add 1 2)












(comment
 # might be that with putting the env somewhere "global" (like the ns/ns)
 # one can use ref instead
 (put (fiber/getenv (fiber/current)) 'lule @{:ref @[(fn [a b] (+ a b))]})
 (var lule nil)
 (lule 1 3)
 
 (filter |(= $ 'cool.namespace) (keys (fiber/getenv (fiber/current))))
 
 (((fiber/getenv (fiber/current)) 'lule) 1 2))

