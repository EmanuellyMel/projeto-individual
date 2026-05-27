var database = require("../database/config");

function kpiGeral(dadosDash) {

    var instrucaoSql = `SELECT personagem.nome as personagem, COUNT(resposta_usuario.fk_personagem) AS quantidade_identificacoes FROM resposta_usuario 
    JOIN personagem  ON resposta_usuario.fk_personagem = personagem.id_personagem GROUP BY resposta_usuario.fk_personagem, personagem.nome ORDER BY quantidade_identificacoes DESC
    LIMIT 1; `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function dashGeral(dadosDash) {

    var instrucaoSql = `SELECT personagem.nome as personagem, COUNT(resposta_usuario.fk_personagem) AS quantidade_identificacoes FROM resposta_usuario 
    JOIN personagem  ON resposta_usuario.fk_personagem = personagem.id_personagem GROUP BY resposta_usuario.fk_personagem, personagem.nome ORDER BY quantidade_identificacoes DESC`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function dashEspc(  
  fk_usuarios,
) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function quizCadastrar():",
    fk_usuarios,
  );
    var instrucaoSql = `SELECT personagem.nome AS personagem FROM resposta_usuario WHERE fk_usuario = '${fk_usuarios}';`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    kpiGeral,
    dashGeral,
    dashEspc
}
