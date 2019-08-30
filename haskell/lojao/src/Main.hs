module Main where
  
  import Product
  import Sell
  import Checkout

  initial_menu = "= = = = Bem-vindo(a) ao EconomizaP2 = = = = \n" ++
    "Digite a opção desejada: \n" ++
    "1 - Cadastrar um Produto \n" ++
    "2 - Vender um Produto \n" ++
    "3 - Imprimir Balanço \n" ++
    "4 - Sair \n" ++
    "\n" ++
    "Opção: \n"

  main :: IO ()
  main = do
    putStrLn initial_menu
    option <- getLine
    runTask (read option :: Integer)

  runTask :: Integer -> IO ()
  runTask 1 = createProduct
  runTask 2 = sell
  runTask 3 = checkout
  runTask 4 = putStrLn ""
  runTask _ = main
