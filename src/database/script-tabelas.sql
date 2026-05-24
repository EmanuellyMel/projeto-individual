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
descricao VARCHAR(500),
imagem VARCHAR(45)
);

CREATE TABLE quiz (
id_quiz INT PRIMARY KEY AUTO_INCREMENT,
fk_usuario INT,
CONSTRAINT ctFkUsuario FOREIGN KEY (fk_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE resposta_usuario(
id_resposta INT PRIMARY KEY AUTO_INCREMENT,
fk_quiz INT,
fk_personagem INT,
fk_usuarios INT,
resposta1 VARCHAR(100),
resposta2 VARCHAR(100),
resposta3 VARCHAR(100),
resposta4 VARCHAR(100),
resposta5 VARCHAR(100),
CONSTRAINT ctFkUsuarios FOREIGN KEY (fk_usuarios) REFERENCES usuarios(id_usuario),
CONSTRAINT ctFkPergunta FOREIGN KEY (fk_quiz) REFERENCES quiz(id_quiz),
CONSTRAINT ctFkPersonagem FOREIGN KEY (fk_personagem) REFERENCES personagem(id_personagem)
);

CREATE TABLE questao (
id_questao INT PRIMARY KEY AUTO_INCREMENT,
escrita_questao VARCHAR(255),
fk_quiz INT,
CONSTRAINT ctFkQuiz FOREIGN KEY (fk_quiz) REFERENCES quiz(id_quiz)
);

CREATE TABLE alternativa (
id_alternativa INT PRIMARY KEY AUTO_INCREMENT,
escrita_alternativa VARCHAR(255),
fk_questao INT,
CONSTRAINT ctFkQuestao FOREIGN KEY (fk_questao) REFERENCES questao(id_questao)
);	

INSERT INTO usuarios (nome, email, senha) VALUES 
('Emanuelly', 'emanuelly@email.com', 'Emanu123'),
('Alyce', 'alyce@email.com', 'Alyce123'),
('Victor', 'victor@email.com', 'Victor123');

INSERT INTO personagem (nome, descricao, imagem) VALUES
('Jim Halpert', 'Jim Halpert é um representante de vendas carismático e sarcástico na filial
de Scranton da Dunder Mifflin em The Office. Conhecido por seus olhares irônicos para a câmera, pegadinhas elaboradas
contra Dwight Schrute e seu romance com Pam Beesly, Jim representa a sensatez, embora muitas vezes demonstre desinteresse pelo trabalho.',
 '/img/jim.png'),
('Michael Scott', 'Michael Scott é o gerente regional da filial da Dunder Mifflin em Scranton,
conhecido por ser infantil, egocêntrico e pouco profissional. Apesar de suas atitudes 
constrangedoras e necessidade de atenção, ele é um vendedor talentoso e, no fundo, deseja ser amado e considera sua equipe uma "família".', 
 '/img/michael scott.png'),
('Pam Beesly', 'Também entre 20 e 30 anos. Gentil, 
sensível e artística, começa insegura, mas evolui para alguém mais confiante e independente.', 
'/img/pam.png'),
('Dwight Schrute', 'Dwight Schrute é um vendedor de alto desempenho na Dunder Mifflin,
conhecido por sua personalidade intensa, ingênua e obcecada por regras. Assistente do gerente regional, Dwight é leal 
a Michael Scott, administra uma fazenda de beterrabas e exibe comportamentos excêntricos, autoritários e focados em segurança.', 
'/img/dwight.png'),
('Ryan Howard', 'Ryan Howard é um funcionário da Dunder Mifflin conhecido por sua personalidade ambiciosa, preguiçosa e sarcástica. 
Inicialmente estagiário, Ryan tenta demonstrar superioridade intelectual e busca sucesso profissional rapidamente, mesmo tomando decisões impulsivas e imaturas.', 
'/img/ryan.png'),
('Kelly Kapoor', 'Kelly Kapoor é a representante de atendimento ao cliente da Dunder Mifflin,
conhecida por sua personalidade dramática, falante e obcecada por cultura pop. Vaidosa e emocional, Kelly adora fofocas, romances e atenção, 
especialmente em relação ao seu relacionamento conturbado com Ryan Howard.',
'/img/kelly.png'),
('Angela Martin', 'Angela Martin é a chefe do departamento de contabilidade da Dunder Mifflin,
conhecida por sua personalidade rígida, conservadora e extremamente crítica. Reservada e autoritária, Angela valoriza regras, organização e seus gatos, 
frequentemente demonstrando frieza e desaprovação com os colegas.',
'/img/angela.png'),
('Oscar Martinez', 'Oscar Martinez é um contador da Dunder Mifflin, conhecido por sua personalidade inteligente, racional e sarcástica.
Considerado um dos funcionários mais competentes do escritório, Oscar costuma corrigir os erros dos colegas e demonstra grande interesse por política, 
cultura e assuntos intelectuais.',
'/img/oscar.png'),
('Meredith Palmer','Meredith Palmer é uma funcionária da área de relações com fornecedores da Dunder Mifflin, conhecida por sua personalidade exagerada, 
irresponsável e descontraída. Meredith frequentemente apresenta comportamentos inadequados e excêntricos, mas também demonstra espontaneidade e sinceridade com os colegas.',
'/img/quizMeredith.png');

INSERT INTO questao (fk_quiz, escrita_questao) VALUES
(1, 'Qual é a sua forma preferida de interagir com os colegas durante as pausas?');

INSERT INTO alternativa (fk_questao, escrita_alternativa) VALUES 
(5, 'Procuro por qualquer distração que me afaste da monotonia das minhas obrigações.');
