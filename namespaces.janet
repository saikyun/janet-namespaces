(defmacro defonce
  "Define a value once."
  [name & more]
  (when (nil? (dyn name))
    ~(def ,name ,;more)))

(def ns @{})

(defn clear-table
  [t]
  (loop [k :keys t]
    (put t k nil))
  t)

(defmacro export
  "First time is run, define a table. All times after, clears the table and redefines it."
  [name & more]
  (import ./namespaces :as hopefully_this_wont_bother_anyone_ns)
  ~(if (nil? (hopefully_this_wont_bother_anyone_ns/ns ,name))
     (put hopefully_this_wont_bother_anyone_ns/ns ,name ,;more)
     (do (hopefully_this_wont_bother_anyone_ns/clear-table (hopefully_this_wont_bother_anyone_ns/ns ,name))
         (merge-into (hopefully_this_wont_bother_anyone_ns/ns ,name) ,;more))))
