var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                     if (resultadoAutenticar.length == 1) {
                        res.json({
                            id: resultadoAutenticar[0].id_usuario,
                            email: resultadoAutenticar[0].email,
                            nome: resultadoAutenticar[0].nome
                        });

                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function quiz(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var id_usuario = req.body.id_usuarioServer; 
    var alternativa = req.body.alternativaServer;
    var fk_pergunta = req.body.fk_perguntaServer;
    var fk_personagem = req.body.fk_personagemServer;

    // Faça as validações dos valores
    if (resposta == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (alternativa == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (fk_pergunta == undefined) {
        res.status(400).send("Sua senha está undefined!");
    }else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.quiz(resposta, alternativa, fk_pergunta, fk_personagem)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    autenticar,
    quiz
}