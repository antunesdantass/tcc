(ns lojao.core
  (:gen-class))

(require 'lojao.product)
(require 'lojao.sell)
(require 'lojao.checkout)
(refer 'lojao.product)
(refer 'lojao.sell)
(refer 'lojao.checkout)

(defn main-presentation [] "= = = = Bem-vindo(a) ao EconomizaP2 = = = =
Digite a opção desejada:
1 - Cadastrar um Produto
2 - Vender um Produto
3 - Imprimir Balanço
4 - Sair

Opção:")

(defmulti goto-choice (fn [products choice] choice))
(defmethod goto-choice "1" [ products _ ] (create-product products))
(defmethod goto-choice "2" [ products _ ] (sell-product))
(defmethod goto-choice "3" [ products _ ] (checkout))
(defmethod goto-choice "4" [ products _ ] (System/exit 0))

(defn app [products]
  (println (main-presentation))
  (goto-choice products (read-line))
  (app products))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (app (list)))
