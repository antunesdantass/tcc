module Main where
  import Sell
  import Checkout

  data Product = Product { name :: String, price :: Float, category :: String }

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

  createProduct :: String -> String -> String -> Product
  createProduct name price category = Product { name = name, price = (read price :: Float), category = category }

  runTask :: [Product] -> Integer -> IO ()
  runTask products 1 = do
    putStrLn "Qual o nome do produto?"
    name <- getLine
    putStrLn "Digite o preço unitário do produto"
    price <- getLine
    putStrLn "Digite o tipo do produto"
    category <- getLine
    let product = createProduct name price category
    putStrLn (name ++ " cadastrado com sucesso!")
    putStrLn "Deseja cadastrar outro produto?"
    choice <- getLine
    if (choice == "Sim") then runTask ([product] ++ products) 1 else executionLoop ([product] ++ products)

  runTask products 2 = sell
  runTask products 3 = checkout
  runTask products 4 = putStrLn ""
  runTask products _ = executionLoop products
