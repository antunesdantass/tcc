module Main where
  import Sell
  import Checkout
  import System.Exit

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
    executionLoop [] 0
  
  executionLoop :: [Product] -> Float -> IO()
  executionLoop products total = do
    putStrLn initial_menu
    option <- getLine
    runTask products total (read option :: Int)

  createProduct :: String -> String -> String -> Product
  createProduct name price category = Product { name = name, price = (read price :: Float), category = category }

  findProductByName :: [String] -> String -> Int -> Int
  findProductByName [] _ _ = -1
  findProductByName products name index = if (head products) == name then index else findProductByName (tail products) name (index + 1)

  findProduct :: [Product] -> String -> Int
  findProduct products productName = findProductByName (map name products) productName 0

  printProducts :: [Product] -> IO ()
  printProducts [] = putStrLn ""
  printProducts products = do
    let product = head products
    putStrLn ("   " ++ (name product) ++ " (" ++ (category product) ++ "). R$ " ++ (show (price product)))
    printProducts (tail products)

  runTask :: [Product] -> Float -> Int -> IO ()
  runTask products total 1 = do
    putStrLn "Qual o nome do produto?"
    name <- getLine
    putStrLn "Digite o preço unitário do produto"
    price <- getLine
    putStrLn "Digite o tipo do produto"
    category <- getLine
    let product = createProduct name price category
    putStrLn "Deseja cadastrar outro produto?"
    choice <- getLine
    if (choice == "Sim") then runTask ([product] ++ products) total 1 else executionLoop ([product] ++ products) total

  runTask products total 2 = do
    putStrLn "= = = = Venda de Produtos = = = ="
    putStrLn "Digite o nome do produto:  "
    productName <- getLine
    let index = findProduct products productName
    if index == -1 then do
      putStrLn (productName ++ " não cadastrado(a) no sistema.")
      putStrLn "Deseja vender outro produto? "
      choice <- getLine
      if choice == "Sim" then runTask products total 2 else executionLoop products total
    else do
      let product = products!!index
      putStrLn ((name product) ++ " (" ++ (category product) ++ "). R$ " ++ (show (price product)))
      putStrLn "Digite a quantidade que deseja vender: "
      amountToSell <- getLine
      putStrLn ("Total arrecadado: R$ " ++ (show ((read amountToSell :: Float) * (price product) + total)))
      putStrLn "Deseja vender outro produto? "
      choice <- getLine
      if choice == "Sim" then runTask products ((read amountToSell :: Float) * (price product) + total) 2 else executionLoop products ((read amountToSell :: Float) * (price product) + total)
  runTask products total 3 = do
    putStrLn "= = = = Impressao de Balanco = = = ="
    putStrLn "Produtos Cadastrados:"
    printProducts products
    putStrLn ("Total arrecadado em vendas: R$ " ++ (show total))

  runTask _ _ 4 = exitSuccess
  runTask products total _ = executionLoop products total
