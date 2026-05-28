var database = require("../database/config");

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function quiz(
  fk_usuarios,
  fk_personagem,
  resposta1,
  resposta2,
  resposta3,
  resposta4,
  resposta5,
) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function quizCadastrar():",
    fk_usuarios,
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
        INSERT INTO resposta_usuario (fk_quiz, fk_usuarios, fk_personagem, resposta1, resposta2, resposta3, resposta4, resposta5) VALUES 
        ( 1, '${fk_usuarios}', '${fk_personagem}','${resposta1}','${resposta2}', '${resposta3}', '${resposta4}', '${resposta5}');

    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarPorId(idQuiz) {
  console.log("ACESSEI O MODEL PARA BUSCAR PELO ID: ", idQuiz);

  var instrucaoSql = `SELECT * FROM resposta_usuario WHERE fk_quiz = ${idQuiz};`;
  
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
    

module.exports = {
  quiz,
  buscarPorId
};
