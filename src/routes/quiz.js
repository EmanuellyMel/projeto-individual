var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

//Recebendo os dados do html e direcionando para a função cadastrar de quizController.js
router.post("/quizCadastrar", function (req, res) {
    quizController.quiz(req, res);
})

router.post("/:id", function (req, res) {
    quizController.buscarPorId(req, res);
})


module.exports = router;