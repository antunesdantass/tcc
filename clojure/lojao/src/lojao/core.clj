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

(defmulti goto-choice (fn [products cart choice] choice))
(defmethod goto-choice "1" [ products cart _ ] 
  (def updated-products (create-product products))
  (println (main-presentation))
  (goto-choice updated-products cart (read-line)))
(defmethod goto-choice "2" [ products cart _ ] 
  (def updated-cart (sell-product products cart))
  (println (main-presentation))
  (goto-choice products updated-cart (read-line)))
(defmethod goto-choice "3" [ products cart _ ] (checkout))
(defmethod goto-choice "4" [ products cart _ ] (System/exit 0))
(defmethod goto-choice :default [ products _ ] 
  (println (main-presentation))
  (goto-choice products (read-line)))

(defn app [products cart]
  (println (main-presentation))
  (goto-choice products cart (read-line)))

(defn -main
  [& args]
  (app (list) 0))
