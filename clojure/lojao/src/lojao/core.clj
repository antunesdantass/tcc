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

(defmulti goto-choice identity)
(defmethod goto-choice "1" [_] (create-product))
(defmethod goto-choice "2" [_] (sell-product))
(defmethod goto-choice "3" [_] (checkout))
(defmethod goto-choice "4" [_] (System/exit 0))

(defn app []
  (println (main-presentation))
  (goto-choice (read-line))
  (app))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (app))
