CREATE DATABASE exTheOffice;
USE exTheOffice;

CREATE TABLE usuarios (
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45) UNIQUE,
senha VARCHAR(45)
);

CREATE TABLE personagem (
id_personagem INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(255),
imagem VARCHAR(45)
);

CREATE TABLE pergunta (
id_pergunta INT PRIMARY KEY AUTO_INCREMENT,
pergunta VARCHAR(100)
);

CREATE TABLE resposta (
id_resposta INT PRIMARY KEY AUTO_INCREMENT,
resposta VARCHAR(45),
alternativa CHAR(1),
fk_pergunta INT,
fk_personagem INT,
CONSTRAINT ctFkPergunta FOREIGN KEY (fk_pergunta) REFERENCES pergunta(id_pergunta),
CONSTRAINT ctFkPersonagem FOREIGN KEY (fk_personagem) REFERENCES personagem(id_personagem)
);

CREATE TABLE resultado (
id_resultado INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(255),
titulo VARCHAR(45),
fk_usuario INT,
fk_personagem INT,
CONSTRAINT ctFkUser FOREIGN KEY (fk_usuario) REFERENCES usuarios(id_usuario),
FOREIGN KEY (fk_personagem) REFERENCES personagem(id_personagem)
);

INSERT INTO usuarios (nome, email, senha) VALUES 
('Emanuelly', 'emanuelly@email.com', 'Emanu123'),
('Alyce', 'alyce@email.com', 'Alyce123'),
('Victor', 'victor@email.com', 'Victor123');

INSERT INTO personagem (nome, descricao, imagem) VALUES
('Jim Halpert', 'Entre 20 e 30 anos ao longo da série. Irônico, 
inteligente e observador, usa o humor para lidar com situações e é calmo e empático.',
 '/img/jim.png'),
('Michael Scott', 'Tem cerca de 40 anos. É imaturo, carente e extremamente
 engraçado, busca aprovação o tempo todo, mas também demonstra bom coração e lealdade.', 
 '/img/michael scott.png'),
('Pam Beesly', 'Também entre 20 e 30 anos. Gentil, 
sensível e artística, começa insegura, mas evolui para alguém mais confiante e independente.', 
'/img/pam.png'),
('Dwight Schrute', 'Por volta dos 30-40 anos. Intenso, 
competitivo e excêntrico, extremamente dedicado ao trabalho e segue regras de forma rígida.', 
'/img/dwight.png'),
('Ryan Howard', 'Entre 20 e 30 anos.
 Ambicioso e manipulador, busca sucesso rápido, mas demonstra imaturidade e inconsistência.', 
'/img/ryan.png'),
('Kelly Kapoor', 'Entre 
20 e 30 anos. Extrovertida, dramática e falante, valoriza muito relacionamentos e atenção.',
'/img/kelly.png'),
('Stanley Hudson', 'Por volta dos 50 anos.
Sarcástico, direto e desinteressado, prefere evitar envolvimento e valoriza sua rotina.',
'/img/stanley.png'),
('Phyllis Vance', 'Por volta dos 40-50 anos.
Calma, gentil e discreta, mas às vezes surpreende com um lado mais assertivo.', 
'/img/phyllis'),
('Angela Martin', 'Entre 30 e 40 anos. Rígida,
 crítica e conservadora, valoriza regras e organização, com personalidade reservada.',
'/img/angela.png'),
('Kevin Malone', 'Entre 30 e 40 anos. Ingênuo, lento e bem-humorado, traz leveza com seu jeito simples.',
'/img/kevin.png'),
('Oscar Martinez', 'Entre 30 e 40 anos. Inteligente, racional e analítico, costuma ser a voz lógica do escritório',
'/img/oscar.png'),
('Andy Bernard', 'Entre 30 e 40 anos. Carente, competitivo e emocional, busca aceitação e gosta de demonstrar talentos.',
'/img/andy.png'),
('Meredith Palmer','Entre 40 e 50 anos. Descontraída, impulsiva e excêntrica, conhecida por seu comportamento imprevisível e engraçado.',
'/img/quizMeredith.png');


INSERT INTO pergunta (pergunta) VALUES 
('Em uma reunião de brainstorming para um novo projeto, qual é a sua postura principal?'),
('Como você lida com prazos apertados e pressão da diretoria?'),
('Qual a sua reação ao receber um feedback construtivo (crítica) do seu supervisor?'),
('O que você mais valoriza em um ambiente de trabalho?'),
('Qual é a sua forma preferida de interagir com os colegas durante as pausas?');

INSERT INTO resposta (resposta, alternativa, fk_pergunta, fk_personagem) VALUES
('Tento manter o ambiente leve e divertido', 'A', 1, 1),
('Questiono a viabilidade e riscos', 'B', 1, 2),
('Observo e opino no momento certo', 'C', 1, 3),
('Sigo protocolos e foco no essencial', 'D', 1, 4),
('Prefiro não me envolver muito', 'E', 1, 5),
('Crio um clima de união e amizade', 'A', 2, 1),
('Exijo dedicação total e foco', 'B', 2, 2),
('Organizo tudo com calma', 'C', 2, 3),
('Mantenho meu ritmo normal', 'D', 2, 4),
('Faço o mínimo necessário', 'E', 2, 5),
('Fico preocupado com a opinião pessoal', 'A', 3, 1),
('Analiso e corrijo com rigor', 'B', 3, 2),
('Aceito e reflito para melhorar', 'C', 3, 3),
('Confio no meu próprio método', 'D', 3, 4),
('Evito e mudo de assunto', 'E', 3, 5),
('Reconhecimento e atenção social', 'A', 4, 1),
('Hierarquia e disciplina', 'B', 4, 2),
('Ambiente equilibrado e estável', 'C', 4, 3),
('Eficiência e privacidade', 'D', 4, 4),
('Liberdade e pouca cobrança', 'E', 4, 5),
('Converso e faço todos rirem', 'A', 5, 1),
('Observo e penso em produtividade', 'B', 5, 2),
('Ajudo e escuto os outros', 'C', 5, 3),
('Prefiro ficar sozinho', 'D', 5, 4),
('Busco distrações', 'E', 5, 5);

INSERT INTO resultado (titulo, descricao, fk_personagem) VALUES
('O Agregador Emocional',
'Sua motivação é a aceitação. Você vê o trabalho como um espaço de relações e busca estar no centro das interações, muitas vezes misturando o pessoal com o profissional.',
1),
('O Sentinela da Eficiência',
'Para você, o trabalho é uma missão. Valoriza autoridade, organização e proteção dos recursos, agindo com intensidade e foco nos resultados.',
2),
('A Base Sustentadora',
'Você mantém o equilíbrio do ambiente com empatia e organização. Prefere apoiar nos bastidores, mas possui grande resiliência e estabilidade emocional.',
3),
('O Profissional Pragmático',
'Você tem alto potencial e age com eficiência. Evita excessos e usa o humor ou o distanciamento como forma de lidar com situações burocráticas.',
4),
('O Espírito Desprendido',
'Para você, o trabalho é apenas um meio. Mantém uma postura leve diante das pressões e segue suas próprias regras com autonomia.',
5);