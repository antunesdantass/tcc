-- module Product (
--   createProduct,
--   Product
-- ) where

--   data Product = Product { name :: String,
--                             price :: Float,
--                             category :: String }

--   createProduct :: [IO Product] -> [IO Product]
--   createProduct products = do
--     product <- ioCreation
--     return (addProduct product products)
--     -- putStrLn "Deseja cadastrar outro produto?"
--     -- choice <- getLine
--     -- productsNew <- ([product] ++ products)
--     -- productsNew
--     -- if (createAnother choice) then createProduct newList
--     -- else newList
--     -- newList

--   addProduct :: Product -> [IO Product] -> [Product]
--   addProduct product [] = [product]
--   addProduct product products = do
--     cabeca <- head products
--     return ([product] ++ (addProduct cabeca (tail products)))

--   add :: Product -> [Product] -> [Product]
--   add product [] = [product]
--   add product products = [product] ++ (add (head products) (tail products)) 

--   ioCreation :: IO Product
--   ioCreation = do
--     putStrLn "Qual o nome do produto?"
--     name <- getLine
--     putStrLn "Digite o preço unitário do produto"
--     price <- getLine
--     putStrLn "Digite o tipo do produto"
--     category <- getLine
--     printSuccess name
--     return (createNewProduct name (read price :: Float) category)
  
--   printSuccess :: String -> IO ()
--   printSuccess productName = putStrLn (productName ++ " cadastrado com sucesso!")

--   createAnother :: String -> Bool
--   createAnother "Sim" = True
--   createAnother _ = False

--   createNewProduct :: String -> Float -> String -> Product
--   createNewProduct name price category = Product { name = name, price = price, category = category }