var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/total doadoa", function (req, res) {
  dashController.kpiGeral(req, res);
});

var dashController = require("../controllers/dashController");

router.get("/dadosDash", function (req, res) {
  dashController.dashGeral(req, res);
});

router.get("/dadosDash", function (req, res) {
  dashController.dashEspc(req, res);
});

module.exports = router;