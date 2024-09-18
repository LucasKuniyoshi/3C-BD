-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 18/09/2024 às 11:43
-- Versão do servidor: 9.0.1
-- Versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `Atv1`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `codCidade` bigint UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `siglaEstado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `codClasse` bigint UNSIGNED NOT NULL,
  `sigla` varchar(12) DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCliente` bigint UNSIGNED NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `codCidade` int NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `dataCadastro` date DEFAULT '2024-09-17',
  `cep` varchar(8) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteFisico`
--

CREATE TABLE `clienteFisico` (
  `codCliente` int DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `rg` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteJuridico`
--

CREATE TABLE `clienteJuridico` (
  `codCliente` int DEFAULT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `codDepartamento` bigint UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `descricaoFuncional` varchar(80) DEFAULT NULL,
  `localizacao` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `siglaEstado` varchar(2) DEFAULT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codFornecedor` int DEFAULT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemPedido`
--

CREATE TABLE `itemPedido` (
  `codPedido` int DEFAULT NULL,
  `codProduto` int DEFAULT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemVenda`
--

CREATE TABLE `itemVenda` (
  `codVenda` int DEFAULT NULL,
  `codProduto` int DEFAULT NULL,
  `numeroLote` int DEFAULT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `codPedido` bigint UNSIGNED NOT NULL,
  `dataRealizacao` date DEFAULT '2024-09-18',
  `dataEntrega` date DEFAULT NULL,
  `codFornecedor` int DEFAULT NULL,
  `valor` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codProduto` bigint UNSIGNED NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `unidadeMedida` char(2) DEFAULT NULL,
  `embalagem` varchar(15) DEFAULT 'Fardo',
  `codClasse` int DEFAULT NULL,
  `precoVenda` decimal(14,2) DEFAULT NULL,
  `estoqueMinimo` decimal(14,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtoLote`
--

CREATE TABLE `produtoLote` (
  `codProduto` int DEFAULT NULL,
  `numeroLote` int DEFAULT NULL,
  `quantidadeAdquirida` decimal(14,2) DEFAULT NULL,
  `quantidadeVendida` decimal(14,2) DEFAULT NULL,
  `precoCusto` decimal(14,2) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `codVenda` int DEFAULT NULL,
  `codCliente` int DEFAULT NULL,
  `codVendedor` int DEFAULT NULL,
  `dataVenda` date DEFAULT '2024-09-18',
  `enderecoEntrega` varchar(60) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `codVendedor` bigint UNSIGNED NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `telefone` char(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL,
  `dataContratacao` date DEFAULT '2024-09-17',
  `codDepartamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD UNIQUE KEY `codCidade` (`codCidade`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD UNIQUE KEY `codClasse` (`codClasse`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD UNIQUE KEY `codCliente` (`codCliente`);

--
-- Índices de tabela `clienteFisico`
--
ALTER TABLE `clienteFisico`
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `ie` (`ie`),
  ADD UNIQUE KEY `cgc` (`cgc`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`);

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD UNIQUE KEY `codDepartamento` (`codDepartamento`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `ie` (`ie`),
  ADD UNIQUE KEY `cgc` (`cgc`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD UNIQUE KEY `codPedido` (`codPedido`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD UNIQUE KEY `codProduto` (`codProduto`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD UNIQUE KEY `codVendedor` (`codVendedor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `codCidade` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `codClasse` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codCliente` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `codDepartamento` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codPedido` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codProduto` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `codVendedor` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
