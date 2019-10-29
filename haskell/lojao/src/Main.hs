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
    executionLoop []
  
  executionLoop :: [Product] -> IO()
  executionLoop products = do
    putStrLn initial_menu
    option <- getLine
    runTask products (read option :: Integer)

  runTask :: [Product] -> Integer -> IO ()
  runTask products 1 = executionLoop (createProduct products)
  runTask products 2 = sell
  runTask products 3 = checkout
  runTask products 4 = putStrLn ""
  runTask products _ = executionLoop products
