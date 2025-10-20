-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/10/2025 às 19:12
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `viacep`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `ceps`
--

CREATE TABLE `ceps` (
  `id_cep` int(11) NOT NULL,
  `cep` char(9) NOT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `ddd` char(2) DEFAULT NULL,
  `id_cidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ceps`
--

INSERT INTO `ceps` (`id_cep`, `cep`, `logradouro`, `complemento`, `bairro`, `ddd`, `id_cidade`) VALUES
(1, '18040-040', 'Rua Atanázio Soares', 'até 999/1000', 'Vila Carol', '15', 1),
(2, '18040-050', 'Rua Doutor Américo Figueiredo', NULL, 'Vila Santa Rita', '15', 1),
(3, '18040-060', 'Rua Capitão Benedito Pereira', NULL, 'Jardim São Paulo', '15', 1),
(4, '18040-070', 'Rua José de Almeida', NULL, 'Centro', '15', 1),
(5, '18040-080', 'Rua da Penha', NULL, 'Centro', '15', 1),
(6, '13020-000', 'Avenida Francisco Glicério', NULL, 'Centro', '19', 2),
(7, '13025-000', 'Rua Barreto Leme', NULL, 'Cambuí', '19', 2),
(8, '13026-000', 'Rua Sampainho', NULL, 'Botafogo', '19', 2),
(9, '13030-000', 'Rua Padre Almeida', NULL, 'Cambuí', '19', 2),
(10, '13031-000', 'Rua Antônio Lapa', NULL, 'Cambuí', '19', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidades`
--

CREATE TABLE `cidades` (
  `id_cidade` int(11) NOT NULL,
  `nome_cidade` varchar(255) NOT NULL,
  `codigo_ibge` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cidades`
--

INSERT INTO `cidades` (`id_cidade`, `nome_cidade`, `codigo_ibge`, `id_estado`) VALUES
(1, 'Sorocaba', 3552205, 1),
(2, 'Campinas', 3509502, 1),
(3, 'São Paulo', 3550308, 1),
(4, 'Santos', 3548500, 1),
(5, 'Jundiaí', 3525904, 1),
(6, 'Rio de Janeiro', 3304557, 2),
(7, 'Niterói', 3303302, 2),
(8, 'Campos dos Goytacazes', 3301009, 2),
(9, 'Petrópolis', 3303906, 2),
(10, 'Volta Redonda', 3306305, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estados`
--

CREATE TABLE `estados` (
  `id_estado` int(11) NOT NULL,
  `nome_estado` varchar(255) NOT NULL,
  `uf` char(2) NOT NULL,
  `regiao` varchar(100) DEFAULT NULL,
  `codigo_ibge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estados`
--

INSERT INTO `estados` (`id_estado`, `nome_estado`, `uf`, `regiao`, `codigo_ibge`) VALUES
(1, 'São Paulo', 'SP', 'Sudeste', 35),
(2, 'Rio de Janeiro', 'RJ', 'Sudeste', 33),
(3, 'Minas Gerais', 'MG', 'Sudeste', 31),
(4, 'Paraná', 'PR', 'Sul', 41),
(5, 'Bahia', 'BA', 'Nordeste', 29);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ceps`
--
ALTER TABLE `ceps`
  ADD PRIMARY KEY (`id_cep`),
  ADD KEY `id_cidade` (`id_cidade`);

--
-- Índices de tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id_cidade`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Índices de tabela `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ceps`
--
ALTER TABLE `ceps`
  MODIFY `id_cep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id_cidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `ceps`
--
ALTER TABLE `ceps`
  ADD CONSTRAINT `ceps_ibfk_1` FOREIGN KEY (`id_cidade`) REFERENCES `cidades` (`id_cidade`);

--
-- Restrições para tabelas `cidades`
--
ALTER TABLE `cidades`
  ADD CONSTRAINT `cidades_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
