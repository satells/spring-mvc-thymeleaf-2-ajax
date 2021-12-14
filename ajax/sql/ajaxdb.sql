select * from promocoes;


DROP TABLE IF EXISTS promocoes;

DROP TABLE IF EXISTS categorias;






CREATE TABLE categorias (
  id bigserial not null ,
  titulo varchar(255) not null,
  PRIMARY KEY (id),
  UNIQUE (titulo)
);





CREATE TABLE promocoes (
  id bigserial not null,
  descricao varchar(255),
  data_cadastro timestamp,
  total_likes int DEFAULT 0,
  link_imagem varchar(255),
  link_promocao varchar(255) not null,
  preco_promocao decimal(19,2) not null,
  site_promocao varchar(255) not null,
  titulo varchar(255) not null,
  categoria_fk bigint not null,
  PRIMARY KEY (id),
  FOREIGN KEY (categoria_fk) REFERENCES categorias(id)
);


INSERT INTO categorias (titulo) VALUES ('Informatica');
INSERT INTO categorias (titulo) VALUES ('Cursos');
INSERT INTO categorias (titulo) VALUES ('Eletrodomésticos');
INSERT INTO categorias (titulo) VALUES ('Eletronicos');
INSERT INTO categorias (titulo) VALUES ('Livros');
INSERT INTO categorias (titulo) VALUES ('Móveis');
INSERT INTO categorias (titulo) VALUES ('Cama, Mesa e Banho');






insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (14,'','2021-12-10 09:58:32.7',0,'//staticmobly.akamaized.net/p/Mobly-SofC3A1-3-Lugares-RetrC3A1til-Lubeck-Plush-Suede-Grafite-2785-489967-1-product.jpg','https://www.mobly.com.br/sofa-3-lugares-retratil-lubeck-plush-suede-grafite-769984.html#a=3|p=1|pn=1|t=Categoria|c=177|b=1|s=0',872.99,'Mobly','Sofá 3 Lugares Retrátil Lubeck Plush Suede Grafite',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (15,'','2021-12-10 09:58:50.568',0,'//staticmobly.akamaized.net/p/Artefamol-Guarda-Roupa-Closet-Modulado-Barcelona-DemoliC3A7C3A3o-8175-429174-1-product.jpg','https://www.mobly.com.br/guardaroupa-closet-modulado-barcelona-demolicao-471924.html#a=3|p=9|pn=1|t=Categoria|c=201|b=1|s=0',562.59,'Mobly','Guarda-Roupa Closet Modulado Barcelona Demolição',3);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (16,'','2021-12-10 09:59:07.173',0,'//staticmobly.akamaized.net/p/Mobly-Cadeira-Gamer-Legends-Preta-e-Vermelha-5733-858274-1-product.jpg','https://www.mobly.com.br/cadeira-gamer-legends-preta-e-vermelha-472858.html#a=3|p=3|pn=1|t=Categoria|c=197|b=1|s=0',1018.49,'Mobly','Cadeira Gamer Legends Preta e Vermelha',6);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (17,'','2021-12-10 09:59:21.771',0,'//staticmobly.akamaized.net/p/Linea-Estante-Home-para-TV-65-Polegadas-Eldorado-AvelC3A3-Preto-9795-382875-1-product.jpg','https://www.mobly.com.br/estante-home-para-tv-65-polegadas-eldorado-avela-preto-578283.html#a=3|p=5|pn=1|t=Categoria|c=2322|b=1|s=0',1228.98,'Mobly','Estante Home para TV 65 Polegadas Eldorado Avelã Preto',6);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (18,'','2021-12-10 09:59:34.379',0,'//staticmobly.akamaized.net/p/Keva-SofC3A1-Cama-2-Lugares-Casal-GC3A9nova-Cinza-Escuro-1476-026355-1-product.jpg','https://www.mobly.com.br/sofacama-2-lugares-casal-genova-cinza-escuro-553620.html#a=3|p=1|pn=1|t=Categoria|c=176|b=1|s=0',3152.49,'Mobly','Sofá-Cama 2 Lugares Casal Génova Cinza Escuro',6);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (19,'','2021-12-10 09:59:49.42',0,'//staticmobly.akamaized.net/p/Mobillare-Conjunto-com-2-Cadeiras-de-Jantar-Esmeralda-II-Imbuia-e-Off-White-3382-192067-1-product.jpg',' https://www.mobly.com.br/conjunto-com-2-cadeiras-de-jantar-esmeralda-ii-imbuia-e-off-white-760291.html#a=3|p=2|pn=1|t=Categoria|c=214|b=1|s=0',1537.44,'Mobly','Conjunto com 2 Cadeiras de Jantar Esmeralda II Imbuia e Off White',6);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (20,'','2021-12-10 09:59:59.003',0,'//staticmobly.akamaized.net/p/Mobly-5BOUTLET5D-Poltrona-Lord-Azul-0700-084287-1-product.jpg','https://www.mobly.com.br/outlet-poltrona-lord-azul-782480.html#a=3|p=5|pn=1|t=campanha-20210629-3o6kkkv|b=1|s=0|pdp-saldao',378.29,'Mobly','[OUTLET] Poltrona Lord Azul',6);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (21,'','2021-12-10 10:01:27.662',0,'https://assets.nuuvem.com/image/upload/v1/products/557dbaf869702d0a9cb06200/sharing_images/p1irnjejpj5cqf0jadyl.jpg','https://www.nuuvem.com/item/lego-harry-potter-years-1-4',5.98,'nuuvem','LEGO Harry Potter: Years 1- 4 - PC - Compre na Nuuvem',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (22,'','2021-12-10 10:01:49.146',0,'https://assets.nuuvem.com/image/upload/v1/products/59b82ad2efd2f07dc0000324/sharing_images/ttkdo4ftuzwfahwthmzj.jpg','https://www.nuuvem.com/item/project-cars-2-deluxe-edition',37.48,'nuuvem','Project CARS 2 - Deluxe Edition - PC - Compre na Nuuvem',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (23,'','2021-12-10 10:02:07.785',0,'https://assets.nuuvem.com/image/upload/v1/products/585165f9f372802afb003524/sharing_images/jjqujujqgqy91qkxh0wm.jpg','https://www.nuuvem.com/item/automobilista',11.99,'nuuvem','Automobilista - PC - Compre na Nuuvem',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (24,'','2021-12-10 10:02:18.697',0,'https://assets.nuuvem.com/image/upload/v1/products/557dbb7669702d0a9c3a9900/sharing_images/ixnkhzui12ucqym82tdv.jpg','https://www.nuuvem.com/item/lego-harry-potter-years-5-7',5.98,'nuuvem','LEGO Harry Potter Years 5-7 - PC - Compre na Nuuvem',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (25,'','2021-12-10 10:03:05.862',0,'https://assets.nuuvem.com/image/upload/v1/products/5fa57a8fa3f8b15b314950d6/sharing_images/uqvqcithnshiwakylmo3.jpg','https://www.nuuvem.com/item/starbound',24.99,'nuuvem','Starbound - PC - Compre na Nuuvem',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (26,'','2021-12-10 10:03:21.27',0,'https://assets.nuuvem.com/image/upload/v1/products/59f33df4efd2f069990002ea/sharing_images/r08vn51mslyjfsueem2c.jpg','https://www.nuuvem.com/item/long-dark',65.99,'nuuvem','The Long Dark - PC - Compre na Nuuvem',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (27,'','2021-12-10 10:03:34.709',0,'https://assets.nuuvem.com/image/upload/v1/products/5894b5c62162483df8000114/sharing_images/ocrynitl5blmilspelal.jpg','https://www.nuuvem.com/item/naruto-shippuden-ultimate-ninja-storm-4-road-boruto',122.16,'nuuvem','NARUTO SHIPPUDEN: Ultimate Ninja STORM 4 - Road to Boruto - PC - Compre na Nuuvem',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (28,'','2021-12-10 10:03:56.138',0,'https://assets.nuuvem.com/image/upload/v1/products/5a15b7b28810246a69000015/sharing_images/ekroxmgrcxqfkdzuwk5a.jpg','https://www.nuuvem.com/bundle/darkest-dungeon-ancestral-edition',94.99,'nuuvem','Darkest Dungeon: Ancestral Edition - PC - Compre na Nuuvem',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (29,'','2021-12-10 10:07:34.907',0,'https://i5.walmartimages.com/asr/c9bfabaf-79af-4319-bb7c-46064370d3ab_1.7efb9da436598898205b75453a26e13a.jpeg','https://www.walmart.com/ip/Power-Wheels-Jeep-Wrangler-Willys-Black-Ride-On-12V-Vehicle/597002719?athbdg=L1700',199.99,'Walmart.com','Power Wheels Jeep Wrangler Willys Black Ride On 12V Vehicle',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (30,'','2021-12-10 10:07:50.868',0,'https://i5.walmartimages.com/asr/3eb7d28c-a1ae-40c4-9801-628f0faefa49.4fdbf027afbaa486bb9bf1b7f1a47174.jpeg','https://www.walmart.com/ip/Instant-Pot-Vortex-10-Quart-7-in-1-Air-Fryer-Oven-with-built-in-Smart-Cooking-Programs-Digital-Touchscreen-Easy-to-Clean-Basket/302336264?athbdg=L1800',79.88,'Walmart.com','Instant Pot  Vortex 10 Quart 7-in-1 Air Fryer Oven with built-in Smart Cooking Programs',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (31,'','2021-12-10 10:08:07.348',0,'https://i5.walmartimages.com/asr/0d0951bc-5b78-4dbc-9949-3d9bd3191176.0da75c4243fbe294e3c3e19846591c3e.jpeg','https://www.walmart.com/ip/AT-T-iPhone-12-64GB-Blue/340875298',18.87,'Walmart.com','AT&T iPhone 12 64GB Blue',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (32,'','2021-12-10 10:08:29.076',0,'https://i5.walmartimages.com/asr/dc18bb86-3118-4289-9fbd-cd800db7921d.a660444fec2eef7675ca3acd79cf97f5.jpeg','https://www.walmart.com/ip/Firefly-Outdoor-Gear-Finn-the-Shark-Kid-s-Camping-Combo-One-Room-Tent-Sleeping-Bag-Lantern/395228724',49.99,'Walmart.com','Firefly! Outdoor Gear Finn the Shark Kids Camping Combo (One-Room Tent, Sleeping Bag, Lantern)',2);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (33,'','2021-12-10 10:08:51.913',0,'https://i5.walmartimages.com/asr/e8a818ee-e83a-4687-9067-837977cb5977.932ab44577e21cd1d526fbc2be37d80a.jpeg','https://www.walmart.com/ip/Nintendo-Switch-with-Neon-Blue-Neon-Red-Joy-Con-12-Month-Individual-Membership-Online-Carrying-Case/498089523?athbdg=L1800',299.88,'Walmart.com','Nintendo Switch™ with Neon Blue & Neon Red Joy-Con + 12 Month Individual Membership Online + Carrying Case',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (34,'','2021-12-10 10:09:03.187',0,'https://i5.walmartimages.com/asr/723aef3b-6782-4bdf-a60a-56ed8144ac7c.f3f3938bd1964cdca486917be04f829b.jpeg','https://www.walmart.com/ip/Maxkare-Set-of-2-Mesh-Zero-Gravity-Lounger-Chair-Patio-Chair-Folding-Recliners-with-Adjustable-Pillows-and-Cup-Holder-Trays-Lawn-Chair-Black/940467139?athbdg=L1800',89.99,'Walmart.com','Maxkare Set of 2 Mesh Zero Gravity Lounger Chair Patio Chair Folding Recliners with Adjustable Pillows',2);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (35,'','2021-12-10 10:09:22.372',0,'https://i5.walmartimages.com/asr/cdc5ea12-a214-4601-a971-f4f692231685.03d49a2a3f4fb25f04d4c2250be7ddc2.jpeg','https://www.walmart.com/ip/SAMSUNG-55-Class-4K-Crystal-UHD-2160P-LED-Smart-TV-with-HDR-UN55TU7000/415975527?athbdg=L1800',398.55,'Walmart.com','SAMSUNG 55'' Class 4K Crystal UHD (2160P) LED Smart TV with HDR UN55TU7000',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (36,'','2021-12-10 10:09:51.192',0,'https://i5.walmartimages.com/asr/458487d5-63ef-41c7-8bf9-d26d3ddf8e0e.9a353322210cd82aaed762a8b9047f53.jpeg','https://www.walmart.com/ip/Samsung-Chromebook-4-11-6-Intel-Celeron-N4020-4GB-RAM-32GB-SSD-Chrome-OS-Platinum-Titan-XE310XBA/153097702?athbdg=L1800',129.35,'Walmart.com','Samsung Chromebook 4 11.6'', Intel Celeron N4020, 4GB RAM, 32GB SSD, Chrome OS, Platinum Titan, XE310XBA',1);
insert into promocoes (id,descricao,data_cadastro,total_likes,link_imagem,link_promocao,preco_promocao,site_promocao,titulo,categoria_fk) values (37,'','2021-12-10 10:10:12.083',0,'https://i5.walmartimages.com/asr/ac2819ad-f7fe-4c29-b0d5-fdaa56e7bcb2_1.6794840976d84af9d724e8498dd15864.jpeg','https://www.walmart.com/ip/VTech-Sit-to-Stand-Learn-and-Discover-Table-Activity-Toy-for-Infants-and-Toddlers/24934988?athbdg=L1800',19.99,'Walmart.com','VTech Sit-to-Stand Learn and Discover Table, Activity Toy for Infants and Toddlers',1);
