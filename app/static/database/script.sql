PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE campeoes (
            id_campeao integer,
            nome_campeao text,
            origem_campeao text,
            classe_campeao text,
            primary key(id_campeao, nome_campeao)
        );
INSERT INTO campeoes VALUES(1,'Ahri', 'Ionia', 'Mago');
INSERT INTO campeoes VALUES(2,'Amumu', 'Shurima', 'Tanque');
INSERT INTO campeoes VALUES(3,'Braun', 'Freljord', 'Tanque');
INSERT INTO campeoes VALUES(4,'Ezreal', 'Piltover', 'Atirador');
INSERT INTO campeoes VALUES(5,'Heimmerdinger', 'Piltover', 'Mago');
INSERT INTO campeoes VALUES(6,'Ivern', 'Ionia', 'Suporte');
INSERT INTO campeoes VALUES(7,'Jinx', 'Zaun', 'Atirador');
INSERT INTO campeoes VALUES(8,'Kindred', 'Runeterra', 'Atirador');
INSERT INTO campeoes VALUES(9,'Lulu', 'Bandópolis', 'Suporte');
INSERT INTO campeoes VALUES(10,'Mordekaiser', 'Noxus', 'Lutador');

CREATE TABLE lanes (
                id_lane integer,
                nome_lane text,
                primary key(id_lane)
        );

INSERT INTO lanes VALUES(1,'Top');
INSERT INTO lanes VALUES(2,'Jungle');
INSERT INTO lanes VALUES(3,'Middle');
INSERT INTO lanes VALUES(4,'Bottom');

CREATE TABLE runas (
                id_runa integer,
                tipo_runa text,
                nome_runa text,
                primary key(id_runa)
        );

INSERT INTO runas VALUES(1, 'Precisão', 'Pressione o Ataque');
INSERT INTO runas VALUES(2, 'Precisão', 'Ritimo Fatal');
INSERT INTO runas VALUES(3, 'Precisão', 'Agilidade nos Pés');
INSERT INTO runas VALUES(4, 'Precisão', 'Conquistador');
INSERT INTO runas VALUES(5, 'Dominação', 'Eletrocutar');
INSERT INTO runas VALUES(6, 'Dominação', 'Predador');
INSERT INTO runas VALUES(7, 'Dominação', 'Colheita Sombria');
INSERT INTO runas VALUES(8, 'Dominação', 'Chuva de Lâminas');
INSERT INTO runas VALUES(9, 'Feitiçaria', 'Invocar Aery');
INSERT INTO runas VALUES(10, 'Feitiçaria', 'Cometa Arcano');
INSERT INTO runas VALUES(11, 'Feitiçaria', 'Ímpeto Gradual');
INSERT INTO runas VALUES(12, 'Determinação', 'Aperto dos Mortos Vivos');
INSERT INTO runas VALUES(13, 'Determinação', 'Pós Choque');
INSERT INTO runas VALUES(14, 'Determinação', 'Protetor');
INSERT INTO runas VALUES(15, 'Inspiração', 'Aprimoramento Glacial');
INSERT INTO runas VALUES(16, 'Inspiração', ' Livro de Feitiços Deslacrado');
INSERT INTO runas VALUES(17, 'Inspiração', 'Primeiro Atque');


CREATE TABLE campeao_lane_runa (

                id_sort integer,
                nome_campeao text,
                id_lane integer,
                id_runa integer,
                PRIMARY KEY(id_sort)
                FOREIGN KEY(nome_campeao) REFERENCES campeoes(nome_campeao),
                FOREIGN KEY(id_lane) REFERENCES lanes(id_lane),
                FOREIGN KEY(id_runa) REFERENCES runas(id_runa)
            );

INSERT INTO campeao_lane_runa VALUES(1, 'Ahri', 2, 13);
INSERT INTO campeao_lane_runa VALUES(2, 'Amumu', 3, 5);
INSERT INTO campeao_lane_runa VALUES(3, 'Braun', 4, 13);
INSERT INTO campeao_lane_runa VALUES(4, 'Ezreal', 4, 17);
INSERT INTO campeao_lane_runa VALUES(5, 'Heimmerdinger', 3, 10);
INSERT INTO campeao_lane_runa VALUES(6, 'Ivern', 2, 9);
INSERT INTO campeao_lane_runa VALUES(7, 'Jinx', 4, 2);
INSERT INTO campeao_lane_runa VALUES(8, 'Kindred', 2, 1);
INSERT INTO campeao_lane_runa VALUES(9, 'Lulu', 4, 9);
INSERT INTO campeao_lane_runa VALUES(10, 'Mordekaiser', 1, 4);


COMMIT;
