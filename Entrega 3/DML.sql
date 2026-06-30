USE ClinicaVeterinaria;

INSERT INTO Cliente (cpf, nome, telefone, email) VALUES
('12345678901','João da Silva','11987654321','joao@gmail.com'),
('23456789012','Maria Oliveira','11987654322','maria@gmail.com'),
('34567890123','Carlos Souza','11987654323','carlos@gmail.com'),
('45678901234','Ana Lima','11987654324','ana@gmail.com'),
('56789012345','Pedro Santos','11987654325','pedro@gmail.com'),
('67890123456','Fernanda Costa','11987654326','fernanda@gmail.com'),
('78901234567','Lucas Ferreira','11987654327','lucas@gmail.com'),
('89012345678','Juliana Rocha','11987654328','juliana@gmail.com'),
('90123456789','Ricardo Gomes','11987654329','ricardo@gmail.com'),
('01234567890','Patrícia Mendes','11987654330','patricia@gmail.com');

INSERT INTO Casa (id, rua, numero, bairro, cpf_cliente_FK) VALUES
(1,'Rua das Flores','120','Centro','12345678901'),
(2,'Av. Brasil','250','Jardim América','23456789012'),
(3,'Rua Paraná','89','Vila Nova','34567890123'),
(4,'Rua das Palmeiras','350','Centro','45678901234'),
(5,'Rua Goiás','45','Boa Vista','56789012345'),
(6,'Rua Amazonas','300','Industrial','67890123456'),
(7,'Rua São Paulo','150','Jardim','78901234567'),
(8,'Rua Bahia','210','Centro','89012345678'),
(9,'Rua Minas Gerais','500','Bela Vista','90123456789'),
(10,'Rua Rio Grande','99','Alvorada','01234567890');

INSERT INTO Animal (id_animal, nome_animal, porte, especie, cpf_cliente_FK) VALUES
(1,'Thor','Grande','Cachorro','12345678901'),
(2,'Mel','Pequeno','Cachorro','23456789012'),
(3,'Luna','Pequeno','Gato','34567890123'),
(4,'Bob','Médio','Cachorro','45678901234'),
(5,'Nina','Pequeno','Gato','56789012345'),
(6,'Max','Grande','Cachorro','67890123456'),
(7,'Fred','Pequeno','Coelho','78901234567'),
(8,'Mimi','Pequeno','Gato','89012345678'),
(9,'Pandora','Médio','Cachorro','90123456789'),
(10,'Rex','Grande','Cachorro','01234567890');

INSERT INTO Produto (id_produto, nome, preco, categoria, validade) VALUES
(1,'Ração Premium Cães',189.90,'Alimento','2027-08-20'),
(2,'Ração Premium Gatos',159.90,'Alimento','2027-09-15'),
(3,'Vermífugo Canino',49.90,'Medicamento','2028-01-10'),
(4,'Antipulgas',89.90,'Medicamento','2028-02-15'),
(5,'Coleira Ajustável',35.50,'Suprimento','2030-01-01'),
(6,'Brinquedo Mordedor',24.90,'Suprimento','2030-01-01'),
(7,'Shampoo Pet',42.00,'Higiene','2028-12-20'),
(8,'Areia Sanitária',58.90,'Higiene','2029-05-10'),
(9,'Comedouro Inox',39.90,'Suprimento','2035-01-01'),
(10,'Tapete Higiênico',74.90,'Higiene','2029-08-12');

INSERT INTO Compra (id_compra, data, forma_pagamento, valor_total, cpf_cliente_FK) VALUES
(1,'2026-06-01','PIX',189.90,'12345678901'),
(2,'2026-06-02','Cartão',159.90,'23456789012'),
(3,'2026-06-03','Dinheiro',49.90,'34567890123'),
(4,'2026-06-04','PIX',89.90,'45678901234'),
(5,'2026-06-05','Cartão',35.50,'56789012345'),
(6,'2026-06-06','PIX',24.90,'67890123456'),
(7,'2026-06-07','Débito',42.00,'78901234567'),
(8,'2026-06-08','PIX',58.90,'89012345678'),
(9,'2026-06-09','Cartão',39.90,'90123456789'),
(10,'2026-06-10','Dinheiro',74.90,'01234567890');

INSERT INTO Item_Compra (id_item, quantidade, preco_unitario, id_compra_FK, id_produto_FK) VALUES
(1,1,189.90,1,1),
(2,1,159.90,2,2),
(3,1,49.90,3,3),
(4,1,89.90,4,4),
(5,1,35.50,5,5),
(6,1,24.90,6,6),
(7,1,42.00,7,7),
(8,1,58.90,8,8),
(9,1,39.90,9,9),
(10,1,74.90,10,10);
