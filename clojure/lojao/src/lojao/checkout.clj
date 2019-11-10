(ns lojao.checkout)

(defmulti describeProduct (fn [products] products))
(defmethod describeProduct [] [_]
  (println ""))
(defmethod describeProduct :default [products]
  (def product (first products))
  (printf "   %s (%s). %s \n" (.name product) (.category product) (.price product))
  (describeProduct (rest products)))

(defn checkout [products total]
  (println "= = = = Impressao de Balanco = = = =")
  (describeProduct products)
  (printf "Total arrecadado em vendas: R$ %.2f" total))