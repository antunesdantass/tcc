'use strict';
const readLine = require('readline-sync'); 

const inserirNome = produto => {
    const nome = readLine.question("Digite o nome do produto: ");
    return Object.assign({ nome }, produto);
  }

const inserirPreco = produto => {
  const preco = parseFloat(readLine.question("Digite o preço unitário do produto: "));
  return Object.assign({ preco }, produto);
}

const inserirCategoria = produto => {
  const tipo = readLine.question("Digite o tipo do produto: ");
  return Object.assign({ tipo }, produto);
}

const criarProduto = produtosCadastrados => {
  const novoProduto = inserirCategoria(inserirPreco(inserirNome(Object.assign({}))));
  console.log(`\n${novoProduto.nome} cadastrado com sucesso.\n`)
  const resposta = readLine.question("Deseja cadastrar outro produto? ");
  return resposta === "Sim" ? criarProduto([...produtosCadastrados, novoProduto])
                            : [...produtosCadastrados, novoProduto];
}

const produto = produtosCadastrados => {
  console.log("= = = = Cadastro de Produtos = = = ="); 
  
  return criarProduto(produtosCadastrados);
};

export default produto;