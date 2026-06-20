TRUNCATE TABLE public.culturas_por_estados, public.culturas, public.estados RESTART IDENTITY;

-- Adicionar informações das culturas
INSERT INTO public.culturas 
(nome, nome_cientifico, epoca_plantio, tempo_colheita, produtividade_media, imagem, descricao) 
VALUES
('Cana-de-açúcar','Saccharum officinarum','janeiro-março / agosto-novembro','12-18 meses','77.753 kg/ha',NULL,'Gramínea tropical cultivada para produção de açúcar e etanol, amplamente cultivada no Centro-Sul e Nordeste do Brasil.'),
('Laranja','Citrus sinensis','fevereiro-abril / agosto-dezembro','36 meses (primeira produção)','29.000 kg/ha',NULL,'Fruta cítrica de grande importância econômica, o Brasil é o maior produtor mundial, com destaque para São Paulo.'),
('Milho','Zea mays','setembro-novembro / janeiro-fevereiro','90-150 dias','6.220 kg/ha',NULL,'Cereal versátil utilizado na alimentação humana, animal e produção de biocombustíveis.'),
('Café Conilon','Coffea canephora','outubro-dezembro','24-36 meses (primeira produção)','3.234 kg/ha',NULL,'Espécie de café de alta produtividade e resistência ao calor, cultivada principalmente no Espírito Santo e Rondônia.'),
('Soja','Glycine max','outubro-dezembro','90-140 dias','3.712 kg/ha',NULL,'Leguminosa oleaginosa e proteica, principal commodity agrícola do Brasil.'),
('Algodão','Gossypium hirsutum','dezembro-janeiro','150-180 dias','1.969 kg/ha (pluma)',NULL,'Planta têxtil de grande importância industrial, cultivada principalmente no Cerrado do Mato Grosso e Bahia.'),
('Trigo','Triticum aestivum','abril-junho','90-130 dias','2.974 kg/ha',NULL,'Cereal utilizado na produção de farinha para pães e massas.'),
('Café Arábica','Coffea arabica','outubro-dezembro','24-36 meses (primeira produção)','1.770 kg/ha',NULL,'Espécie de café de maior qualidade e valor de mercado, predominante em Minas Gerais, São Paulo e Espírito Santo.'),
('Feijão','Phaseolus vulgaris','setembro-novembro / janeiro-fevereiro / maio-junho','60-90 dias','1.189 kg/ha',NULL,'Leguminosa base da alimentação brasileira, rica em proteínas e ferro.'),
('Tomate','Solanum lycopersicum','janeiro-março / junho-agosto','90-120 dias','72.500 kg/ha',NULL,'Hortaliça de alto consumo no Brasil.'),
('Arroz','Oryza sativa','setembro-dezembro','90-150 dias','7.299 kg/ha',NULL,'Cereal essencial na dieta brasileira.'),
('Maçã','Malus domestica','junho-agosto','36-48 meses (primeira produção)','34.000 kg/ha',NULL,'Fruta de clima temperado cultivada principalmente em SC e RS.'),
('Cacau','Theobroma cacao','março-maio / setembro-outubro','36-60 meses (primeira produção)','700 kg/ha',NULL,'Cultura tropical perene utilizada na produção de chocolate.'),
('Alho','Allium sativum','março-junho','90-150 dias','15.000 kg/ha',NULL,'Bulbo amplamente utilizado na culinária e com propriedades medicinais.'),
('Dendê','Elaeis guineensis','janeiro-março','36-48 meses (primeira produção)','23.000 kg/ha',NULL,'Palmeira oleaginosa tropical cultivada principalmente no Pará.'),
('Açaí','Euterpe oleracea','março-maio','36-48 meses (primeira produção)','6.000 kg/ha',NULL,'Palmeira nativa da Amazônia de alto valor nutricional.'),
('Pimenta-do-reino','Piper nigrum','outubro-dezembro','18-36 meses (primeira produção)','5.000 kg/ha',NULL,'Especiaria de alto valor comercial.'),
('Amendoim','Arachis hypogaea','setembro-novembro','90-150 dias','4.850 kg/ha',NULL,'Leguminosa oleaginosa de ciclo curto amplamente cultivada no Brasil.'),
('Girassol','Helianthus annuus','setembro-novembro / janeiro-março','90-130 dias','1.986 kg/ha',NULL,'Planta oleaginosa de ciclo anual cultivada principalmente no Centro-Oeste e Sul.');

-- Adicionar informações dos estados
INSERT INTO public.estados 
(nome, sigla, clima) 
VALUES
('São Paulo','SP','Tropical úmido no interior e subtropical ao sul; verões quentes e chuvosos, invernos secos e amenos; temperatura média 18°C-24°C.'),
('Mato Grosso','MT','Equatorial ao norte e tropical no centro-sul; altas temperaturas, chuvas no verão e inverno seco; média 24°C-26°C.'),
('Paraná','PR','Subtropical ao sul e tropical úmido ao norte; estações definidas e geadas ocasionais; média 16°C-22°C.'),
('Minas Gerais','MG','Tropical predominante com variações de altitude; verões chuvosos e invernos secos; média 18°C-24°C.'),
('Goiás','GO','Tropical semiúmido do Cerrado; verão quente e chuvoso, inverno seco; média 20°C-26°C.'),
('Rio Grande do Sul','RS','Subtropical úmido; quatro estações bem definidas, geadas frequentes; média 14°C-20°C.'),
('Mato Grosso do Sul','MS','Tropical ao norte e subtropical ao sul; verões quentes e úmidos, invernos secos; média 20°C-26°C.'),
('Bahia','BA','Tropical semiárido no interior e tropical úmido no litoral; grande variação pluviométrica; média 22°C-28°C.'),
('Santa Catarina','SC','Subtropical úmido; invernos rigorosos e verões amenos; média 13°C-20°C.'),
('Pará','PA','Equatorial úmido; quente e úmido o ano inteiro, alta pluviosidade; média 25°C-27°C.'),
('Espírito Santo','ES','Tropical úmido no litoral e tropical de altitude nas serras; média 22°C-24°C no litoral e ~18°C nas serras.');

-- Relacionar as culturas aos estados
INSERT INTO public.culturas_por_estados
(id_estado, id_cultura) 
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 8),
(1, 18),
(2, 5),
(2, 3),
(2, 6),
(2, 19),
(3, 5),
(3, 3),
(3, 7),
(3, 1),
(4, 8),
(4, 5),
(4, 9),
(4, 1),
(4, 4),
(5, 5),
(5, 3),
(5, 1),
(5, 10),
(5, 19),
(6, 5),
(6, 11),
(6, 7),
(6, 12),
(7, 5),
(7, 3),
(7, 1),
(7, 18),
(8, 5),
(8, 6),
(8, 3),
(8, 13),
(8, 4),
(9, 12),
(9, 5),
(9, 3),
(9, 14),
(10, 15),
(10, 13),
(10, 16),
(10, 17),
(11, 4),
(11, 8),
(11, 1),
(11, 17),
(11, 13);