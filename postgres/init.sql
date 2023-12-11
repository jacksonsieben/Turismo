-- public.tb_person definition

-- Drop table

-- CREATE DATABASE db_turismo;

-- DROP TABLE public.tb_person;

CREATE TABLE public.tb_person (
	tipo int2 NULL,
	created_at timestamp(6) NULL,
	nascimento timestamp(6) NULL,
	updated_at timestamp(6) NULL,
	id uuid NOT NULL,
	cpf varchar(255) NULL,
	email varchar(255) NULL,
	nome varchar(255) NULL,
	senha varchar(255) NULL,
	CONSTRAINT tb_person_pkey PRIMARY KEY (id),
	CONSTRAINT tb_person_tipo_check CHECK (((tipo >= 0) AND (tipo <= 1)))
);


-- public.tb_booking definition

-- Drop table

-- DROP TABLE public.tb_booking;

CREATE table public.tb_booking (
	created_at timestamp(6) NULL,
	data_final timestamp(6) NULL,
	data_inicial timestamp(6) NULL,
	updated_at timestamp(6) NULL,
	agencia_id uuid NOT NULL,
	cliente_id uuid NOT NULL,
	id uuid NOT NULL,
	CONSTRAINT tb_booking_pkey PRIMARY KEY (id),
	CONSTRAINT fk7k9ra8bf6k67tdsclt5mkts7y FOREIGN KEY (cliente_id) REFERENCES public.tb_person(id),
	CONSTRAINT fkie7jk7imgbpwjkscsslpr69bt FOREIGN KEY (agencia_id) REFERENCES public.tb_person(id)
);


-- public.tb_payment definition

-- Drop table

-- DROP TABLE public.tb_payment;

CREATE TABLE public.tb_payment (
	valor float8 NOT NULL,
	created_at timestamp(6) NULL,
	data_pagamento timestamp(6) NULL,
	updated_at timestamp(6) NULL,
	id uuid NOT NULL,
	reserva_id uuid NULL,
	CONSTRAINT tb_payment_pkey PRIMARY KEY (id),
	CONSTRAINT tb_payment_reserva_id_key UNIQUE (reserva_id),
	CONSTRAINT fkfvvau4mhntrprrtttpaa2mwtw FOREIGN KEY (reserva_id) REFERENCES public.tb_booking(id)
);


-- public.tb_tour definition

-- Drop table

-- DROP TABLE public.tb_tour;

CREATE table public.tb_tour (
	preco float8 NOT NULL,
	created_at timestamp(6) NULL,
	updated_at timestamp(6) NULL,
	agencia_id uuid NOT NULL,
	id uuid NOT NULL,
	destino varchar(255) NULL,
	itinerario varchar(255) NULL,
	imagem varchar(255) NULL,
	CONSTRAINT tb_tour_pkey PRIMARY KEY (id),
	CONSTRAINT fk8ky81da5jctdkm0kvr5sugvj5 FOREIGN KEY (agencia_id) REFERENCES public.tb_person(id)
);


-- public.booking_tour definition

-- Drop table

-- DROP TABLE public.booking_tour;

CREATE table public.booking_tour (
	passeio_id uuid NOT NULL,
	reserva_id uuid NOT NULL,
	CONSTRAINT fk1emh7w9019tke1hnlrjvh5m10 FOREIGN KEY (passeio_id) REFERENCES public.tb_booking(id),
	CONSTRAINT fknt8wocubjfck9pinvbajfx62i FOREIGN KEY (reserva_id) REFERENCES public.tb_tour(id)
);

