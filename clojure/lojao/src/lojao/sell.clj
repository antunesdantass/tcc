(ns lojao.sell)

(defmulti search-product-recursive (fn [products product-name index] (first products)))
(defmethod search-product-recursive nil [ _ _ _ ] -1)
(defmethod search-product-recursive :default [products product-name index]
  (if (= (.name (first products)) product-name) 
    index 
    (search-product-recursive products product-name (+ 1 index))))

(defn search-product [products product-name]
  (search-product-recursive products product-name 0))

(defmulti proceed-checkout (fn [ products name product total ] product))
(defmethod proceed-checkout nil [ _ name _ total ]
  (printf "%s não cadastrado(a) no sistema \n" name)
  total)
(defmethod proceed-checkout :default [products name product total]
  (printf "%s (%s). %s \n" (.name product) (.category product) (.price product))
  (println "Digite a quantidade que deseja vender: ")
  (def quantity (read-line))
  (def total-sold (* (Integer/parseInt quantity) (.price product)))
  (def total-sales (+ total-sold total))
  (printf "Total arrecadado: R$ %.2f \n" total-sales)
  total-sales)

(defn sell-product [products cart]
  (println "= = = = Venda de Produtos = = = =")
  (println "Digite o nome do produto: ")
  (def product-name (read-line))
  (def product-index (search-product products product-name))
  (def new-total (proceed-checkout products product-name (nth products product-index) cart))
  (println "Deseja vender outro produto? ")
  (def sell-another (read-line))
  (if (= "Sim" sell-another) (sell-product products new-total) new-total))