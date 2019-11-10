'use strict';

const readLine = require('readline-sync');

const procurarProdutoPorNome = (produtosCadastrados, nome) => {
  return produtosCadastrados.find(produto => produto.nome === nome);
};

const sale = (produtosCadastrados, totalArrecadado) => { 
  console.log("= = = = Venda de Produtos = = = = ");
  const nomeDoProduto = readLine.question("Digite o nome do produto: ");
  const produto = procurarProdutoPorNome(produtosCadastrados, nomeDoProduto);
  if (produto) {
    console.log(`${produto.nome} (${produto.tipo}). ${produto.preco}`);
    const quantidade = parseInt(readLine.question("Digite a quantidade que deseja vender: "));
    totalArrecadado = quantidade * produto.preco + totalArrecadado;
    console.log(`==> Total arrecadado: R$ ${totalArrecadado}`);
  } else {
    console.log(`${nomeDoProduto} não cadastrado(a) no sistema`);
  }
  const venderDeNovo = readLine.question("Deseja vender outro produto? ");
  
  return venderDeNovo === "Sim" ? sale(produtosCadastrados, totalArrecadado) : totalArrecadado;
};

export default sale;