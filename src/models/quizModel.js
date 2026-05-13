var database = require("../database/config");

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function quizCadastrar(
  id_usuario,
  fk_personagem,
  resposta1,
  resposta2,
  resposta3,
  resposta4,
  resposta5,
) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function quizCadastrar():",
    id_usuario,
    fk_personagem,
    resposta1,
    resposta2,
    resposta3,
    resposta4,
    resposta5,
  );

  // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
  //  e na ordem de inserção dos dados.
  var instrucaoSql = `
        // FAZER AQ O INSERT DA TABELA "RESPOSTA_USUARIO"(TEM Q CRIAR), USANDO AS VARIAVEIS DO CONTROLLER
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  quizCadastrar,
};
