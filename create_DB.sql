CREATE TABLE public.anunciante (
    id_anunciante INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senhahash VARCHAR(30) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_anunciante)
);

CREATE TABLE public.anuncio (
    id_anuncio INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao VARCHAR(800) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    datahora DATETIME NOT NULL,
    cep VARCHAR(9) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    id_categoria INT,
    id_anunciante INT,
    PRIMARY KEY (id_anuncio),
    INDEX (id_categoria),
    INDEX (id_anunciante),
    FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria),
    FOREIGN KEY (id_anunciante) REFERENCES public.anunciante(id_anunciante)
);

CREATE TABLE public.foto (
    id_anuncio INT NOT NULL,
    arq_foto VARCHAR(255) NOT NULL,
    INDEX (id_anuncio),
    FOREIGN KEY (id_anuncio) REFERENCES public.anuncio(id_anuncio)
);

CREATE TABLE public.categoria (
    id_categoria INT NOT NULL,
    nome VARCHAR(250) NOT NULL,
    descricao VARCHAR(800) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE public.interesse (
    id_interesse INT NOT NULL,
    mensagem VARCHAR(800) NOT NULL,
    datahora DATETIME NOT NULL,
    contato VARCHAR(50) NOT NULL,
    id_anuncio INT NOT NULL,
    PRIMARY KEY (id_interesse),
    INDEX (id_anuncio),
    FOREIGN KEY (id_anuncio) REFERENCES public.anuncio(id_anuncio)
);
