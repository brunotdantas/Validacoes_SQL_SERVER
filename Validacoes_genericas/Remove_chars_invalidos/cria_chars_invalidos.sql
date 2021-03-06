---------------------------------------------------------------------------------
-- Função     : FN_REMOVECHARINVALIDO([STRING])
-- Autor     : Bruno Dantas
-- Data          : 11/12/2017
-- Obj          : Remover caracteres especiais para correto fluxo de integração
--                 de diversas interfaces
---------------------------------------------------------------------------------

-- CRIA ESTRUTURA PARA SER USADA NO REPLACE DA FUNCAO FN_REMOVECHARINVALIDO([AQUI_TEXTO])
create  table char_invalidos (
     id int IDENTITY(1,1) PRIMARY KEY ,
     cod_ascii int default '',
     charac varchar(255) default '',
     description     varchar(255) default '',
     valor_replace varchar(255) default '',
     CONSTRAINT UV1_ UNIQUE (charac,cod_ascii)
)
GO

-- ALIMENTA TABELA
BEGIN TRAN
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (1,'''','single quote','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (33,'!','exclamation mark','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (34,'"','double quote','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (35,'#','number','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (36,'$','dollar','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (37,'%','percent','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (38,'&','ampersand','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (39,'','single quote','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (40,'(','left parenthesis','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (41,')','right parenthesis','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (42,'*','asterisk','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (43,'+','plus','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (44,',','comma','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (45,'-','minus','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (46,'.','period','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (47,'/','slash','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (58,':','colon','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (59,';','semicolon','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (60,'<','less than','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (61,'=','equality sign','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (62,'>','greater than','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (91,'[','left square bracket','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (92,'\','backslash','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (93,']','right square bracket','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (94,'^','caret / circumflex','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (95,'_','underscore','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (96,'`','grave / accent','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (123,'{','left curly bracket','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (124,'|','vertical bar','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (125,'}','right curly bracket','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (126,'~','tilde','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (159,'?','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (160,'','space','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (161,'¡','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (162,'¢','cent','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (163,'£','pound','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (164,'¤','currency sign','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (165,'¥','yen, yuan','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (166,'¦','broken bar','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (167,'§','section sign','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (168,'¨','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (169,'©','copyright','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (170,'ª','ordinal indicator','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (171,'«','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (172,'¬','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (173,'','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (174,'®','registered trademark','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (175,'¯','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (176,'°','degree','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (177,'±','plus-minus','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (178,'²','','2')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (179,'³','','3')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (180,'´','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (181,'µ','mu','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (182,'¶','pilcrow','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (183,'·','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (184,'¸','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (185,'¹','','1')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (186,'º','ordinal indicator','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (187,'»','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (188,'¼','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (189,'½','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (190,'¾','','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (191,'¿','inverted question mark','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (192,'À','','A')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (193,'Á','','A')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (194,'Â','','A')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (195,'Ã','','A')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (196,'Ä','','A')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (197,'Å','','A')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (198,'Æ','','A')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (199,'Ç','','C')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (200,'È','','E')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (201,'É','','E')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (202,'Ê','','E')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (203,'Ë','','E')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (204,'Ì','','I')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (205,'Í','','I')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (206,'Î','','I')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (207,'Ï','','I')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (208,'Ð','','D')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (209,'Ñ','','N')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (210,'Ò','','O')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (211,'Ó','','O')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (212,'Ô','','O')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (213,'Õ','','O')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (214,'Ö','','O')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (215,'×','multiplication sign','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (216,'Ø','','O')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (217,'Ù','','U')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (218,'Ú','','U')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (219,'Û','','U')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (220,'Ü','','U')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (221,'Ý','','Y')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (222,'Þ','','D')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (223,'ß','','B')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (224,'à','','a')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (225,'á','','a')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (226,'â','','a')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (227,'ã','','a')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (228,'ä','','a')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (229,'å','','a')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (230,'æ','','a')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (231,'ç','','c')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (232,'è','','e')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (233,'é','','e')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (234,'ê','','e')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (235,'ë','','e')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (236,'ì','','i')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (237,'í','','i')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (238,'î','','i')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (239,'ï','','i')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (240,'ð','','o')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (241,'ñ','','n')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (242,'ò','','o')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (243,'ó','','o')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (244,'ô','','o')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (245,'õ','','o')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (246,'ö','','o')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (247,'÷','obelus','')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (248,'ø','','o')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (249,'ù','','u')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (250,'ú','','u')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (251,'û','','u')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (252,'ü','','u')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (253,'ý','','y')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (254,'þ','','b')
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (255,'ÿ','','y')    
     INSERT INTO char_invalidos (cod_ascii, charac, description, valor_replace) VALUES (255,'Ἧ','','')    

COMMIT
go