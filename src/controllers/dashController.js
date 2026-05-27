var dashModel = require("../models/dashModel");

function kpiGeral(req, res) {
    dashModel.kpiGeral()
        .then((resultado) => {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).json([]);
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar os dados KPI: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function dashGeral(req, res) {
    dashModel.dashGeral()
        .then((resultado) => {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).json([]);
            }
        }).catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar os dados Gerais: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

// Corrigido para receber via params e sem duplicar a chamada do Model
function dashEspc(req, res) {
    var fk_usuarios = req.params.idUsuarioServer; // Recupera o ID vindo da URL

    if (fk_usuarios == undefined || fk_usuarios == "") {
        res.status(400).json({ erro: "Seu id está undefined ou vazio!" });
    } else {
        dashModel.dashEspc(fk_usuarios)
            .then(function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(204).json([]);
                }
            })
            .catch(function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao buscar dados específicos! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

module.exports = {
    kpiGeral,
    dashEspc,
    dashGeral
}