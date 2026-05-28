var quizCadastrar = require("../models/quizModel");

function quiz(req, res) {
  // Crie uma variável que vá recuperar os valores do arquiv  o cadastro.html
  var fk_usuarios = req.body.idUsuarioServer;
  var fk_personagem = req.body.idPersonagemServer;
  var resposta1 = req.body.resposta1Server;
  var resposta2 = req.body.resposta2Server;
  var resposta3 = req.body.resposta3Server;
  var resposta4 = req.body.resposta4Server;
  var resposta5 = req.body.resposta5Server;

  // Faça as validações dos valores
  if (fk_usuarios == undefined) {
    res.status(400).send("Seu id está undefined!");
  } else if (fk_personagem == undefined) {
    res.status(400).send("Seu personagem está undefined!");
  } else if (resposta1 == undefined) {
    res.status(400).send("Sua resposta está undefined!");
  } else if (resposta2 == undefined) {
    res.status(400).send("Sua resposta está undefined!");
  } else if (resposta3 == undefined) {
    res.status(400).send("Sua resposta está undefined!");
  } else if (resposta4 == undefined) {
    res.status(400).send("Sua resposta está undefined!");
  } else if (resposta5 == undefined) {
    res.status(400).send("Sua resposta está undefined!");
  } else {
    // Passe os valores como parâmetro e vá para o arquivo quizModel.js
    quizCadastrar.quiz(
        fk_usuarios,
        fk_personagem,
        resposta1,
        resposta2,
        resposta3,
        resposta4,
        resposta5
      )
      .then(function (resultado) {
        res.json(resultado);
      })
      .catch(function (erro) {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro das respostas! Erro: ",
          erro.sqlMessage,
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

function buscarPorId(req, res){
  var idQuiz =req.params.id;

  return quizModel.buscarPorId(idQuiz)
  .then(function (resultado) {
        res.json(resultado);
      })
      .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
  quiz,
  buscarPorId,
};
