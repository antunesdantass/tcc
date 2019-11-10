(ns lojao.product)

(deftype Product [name price category])

(defn new-product [products]
  (println "Digite o nome do produto: ")
  (def name (read-line))
  (println "Digite o preço unitário do produto: ")
  (def price (read-line))
  (println "Digite o tipo do produto:" )
  (def category (read-line))
  (def created-product (Product. name (Double/parseDouble price) category))
  (println "")
  (printf "%s cadastrado com sucesso." name)
  (println "\n")
  (println "Deseja cadastrar outro produto? ")
  (def choice (read-line))
  (def new-products (conj products created-product))
  (if (= choice "Sim") (new-product new-products) new-products))

(defn create-product [products]
  (println "= = = = Cadastro de Produtos = = = =")
  (new-product products))