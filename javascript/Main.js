'use strict';
import checkout from './Checkout.js';
import sale from './Sale.js';
import product from './Product.js';

const readLine = require('readline-sync');

const main_presentation = () => "= = = = Bem-vindo(a) ao EconomizaP2 = = = = \n" +
  "Digite a opção desejada: \n" +
  "1 - Cadastrar um Produto \n" +
  "2 - Vender um Produto \n" + 
  "3 - Imprimir Balanço \n" +
  "4 - Sair \n";

const main = (produtosCadastrados, totalArrecadado) => {
  const opcao = readLine.question(main_presentation())
  switch (parseInt(opcao)) {
    case 1:
      main(product(produtosCadastrados), totalArrecadado);
      break;
    case 2:
      main(produtosCadastrados, sale(produtosCadastrados, totalArrecadado));
      break;
    case 3:
      checkout(produtosCadastrados, totalArrecadado);
      main(produtosCadastrados, totalArrecadado);
      break;
    case 4:
      process.exit();
    default:
      return main(produtosCadastrados);      
  };
};

main([], 0);