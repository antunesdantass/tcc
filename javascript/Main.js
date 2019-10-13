'use strict';
import checkout from './Checkout.js';
// import sale from './Sale.js';
// import product from './Product.js';

const readline = require('readline');

const readLine = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

const main_presentation = () => "= = = = Bem-vindo(a) ao EconomizaP2 = = = = \n" +
  "Digite a opção desejada: \n" +
  "1 - Cadastrar um Produto \n" +
  "2 - Vender um Produto \n" + 
  "3 - Imprimir Balanço \n" +
  "4 - Sair \n";

(main = () => {
  readLine.question(main_presentation(), output => {
    switch (parseInt(output)) {
      case 1:
        // product();
        break;
      case 2:
        // sale();
        break;
      case 3:
        checkout();
        break;
      case 4:
        process.exit();
      default:
        main();
    }
  });
})();