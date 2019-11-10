'use strict';

export default function checkout(produtosCadastrados, totalArrecadado) { 
  console.log("= = = = Impressao de Balanco = = = =");
  console.log("Produtos Cadastrados:")
  produtosCadastrados.forEach(produto => {
    console.log(`   ${produto.nome} (${produto.tipo}). ${produto.preco}`);
  });
  console.log("Total arrecadado em vendas: R$ ", totalArrecadado)
}