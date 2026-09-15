-- =====================================================
-- ECOSDOMAR — Migrations para tabelas dos protocolos
-- Execute este script no seu banco MySQL/MariaDB
-- =====================================================

-- Campos comuns a todos os protocolos:
--   pesquisador, local_pesquisa, ambiente, data_coleta, hora_inicio, hora_termino, user_id

-- -------------------------------------------------
-- 1. Carcinofauna
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `carcinofauna` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `especie` VARCHAR(255),
  `nomenclatura` VARCHAR(255),
  `descricao` TEXT NULL,
  `origem` VARCHAR(255),
  `quantidade` INT,
  `tamanho_toca_cm` DECIMAL(10,2),
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 2. Qualidade da Água
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `qualidade_agua` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `classe_conama` VARCHAR(100),
  `observacoes` VARCHAR(255) NULL,
  `presenca_odor` BOOLEAN,
  `temperatura_agua` DECIMAL(6,2),
  `turbidez` DECIMAL(10,3),
  `ph` DECIMAL(5,2),
  `salinidade` DECIMAL(10,3),
  `nitrito` DECIMAL(10,4),
  `amonia` DECIMAL(10,4),
  `oxigenio_dissolvido` DECIMAL(10,3),
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 3. Avifauna
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `avifauna` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `especie` VARCHAR(255),
  `nomenclatura` VARCHAR(255),
  `descricao` TEXT NULL,
  `vulnerabilidade` VARCHAR(5),
  `quantidade` INT,
  `vivos` INT,
  `mortos` INT,
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 4. Espécies Exóticas
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `especies_exoticas` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `especie` VARCHAR(255),
  `nomenclatura` VARCHAR(255),
  `descricao` TEXT NULL,
  `quantidade_mexilhoes` INT NULL,
  `quantidade_ostras` INT NULL,
  `quantidade_siri` INT NULL,
  `quantidade_total` INT,
  `vivos` INT,
  `mortos` INT,
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 5. Macrolixo Costeira
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `macrolixo_costeira` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `tipo` VARCHAR(255),
  `estacao` INT,
  `quantidade_bc` INT NULL,
  `quantidade_me` INT NULL,
  `quantidade_vi` INT NULL,
  `quantidade_pl` INT NULL,
  `quantidade_mp` INT NULL,
  `quantidade_pa` INT NULL,
  `quantidade_outros` INT NULL,
  `quantidade_total` INT,
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 5. Macrolixo Estuarina
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `macrolixo_estuario` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `tipo_pa` VARCHAR(255) NULL,
  `tipo_bc` VARCHAR(255) NULL,
  `tipo_me` VARCHAR(255) NULL,
  `tipo_vi` VARCHAR(255) NULL,
  `tipo_pl` VARCHAR(255) NULL,
  `tipo_mp` VARCHAR(255) NULL,
  `tipo_outro` VARCHAR(255) NULL,
  `quantidade_bc` INT NULL,
  `quantidade_me` INT NULL,
  `quantidade_vi` INT NULL,
  `quantidade_pl` INT NULL,
  `quantidade_mp` INT NULL,
  `quantidade_pa` INT NULL,
  `quantidade_outros` INT NULL,
  `quantidade_total` INT,
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 6. Vegetação
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `vegetacao` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `tipo` VARCHAR(255),
  `nomenclatura` VARCHAR(255),
  `descricao` TEXT NULL,
  `quantidade_mangue_vermelho` INT NULL,
  `quantidade_mague_preto` INT NULL,
  `quantidade_mague_branco` INT NULL,
  `quantidade_propagulos` INT NULL,
  `quantidade_total` INT,
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 7. Ictiofauna
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `ictiofauna` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `especie` VARCHAR(255),
  `descricao` TEXT NULL,
  `petrecho` VARCHAR(255),
  `tamanho_cm` DECIMAL(10,2),
  `peso` DECIMAL(10,2),
  `quantidade` INT,
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 8. Paisagem
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `paisagem` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `caracteristicas` TEXT NULL,
  `quantidade` INT,
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 9. Ar
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `ar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `observacoes` TEXT NULL,
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 10. Restinga
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `restinga` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `tipo` VARCHAR(255),
  `nomenclatura` VARCHAR(255),
  `animal` VARCHAR(255),
  `ecossistema` VARCHAR(255),
  `residuos_encontrados` TEXT,
  `quantidade` INT,
  `quantidade_residuos` INT,
  `tamanho_maior_cm` DECIMAL(10,2),
  `tamanho_menor_cm` DECIMAL(10,2),
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 5. Microplastico na água
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `microplastico_agua` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `tipo` VARCHAR(255),
  `descricao` TEXT NULL,
  `cor` VARCHAR(255) NULL,
  `codigo_coleta` VARCHAR(255),
  `codigo_fragmento` VARCHAR(255),
  `quantidade_fragmentos` INT,
  `comprimento` DECIMAL(10,2),
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- -------------------------------------------------
-- 5. Microplastico no sedimento
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS `microplastico_sedimento` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pesquisador` VARCHAR(255),
  `local_pesquisa` VARCHAR(255),
  `condicoes_climaticas` VARCHAR(255),
  `ambiente` VARCHAR(255),
  `data_coleta` DATE,
  `hora_inicio` TIME,
  `hora_termino` TIME,
  `tipo` VARCHAR(255),
  `descricao` TEXT NULL,
  `cor` VARCHAR(255) NULL,
  `codigo_coleta` VARCHAR(255),
  `tipo_por_quadrante` VARCHAR(255),
  `estacao` VARCHAR(255),
  `codigo_fragmento` VARCHAR(255),
  `quantidade_fragmentos` INT,
  `quantidade_pallets` INT NULL,
  `quantidade_bitucas` INT NULL,
  `comprimento` DECIMAL(10,2),
  `user_id` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;