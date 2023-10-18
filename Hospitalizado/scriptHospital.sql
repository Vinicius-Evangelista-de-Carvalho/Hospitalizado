CREATE TABLE `convenio` (
  `id` integer PRIMARY KEY,
  `name` integer,
  `cnpj` varchar(255),
  `carencia` timestamp
);

CREATE TABLE `patients` (
  `id` integer PRIMARY KEY,
  `name` integer,
  `bday` varchar(255),
  `address` varchar(255),
  `phone` varchar(255),
  `email` varchar(255),
  `CPF` varchar(255),
  `RG` varchar(255),
  `conv_id` integer COMMENT 'Número do convênio',
  `created_at` timestamp
);

CREATE TABLE `consulta` (
  `id` integer PRIMARY KEY,
  `title` varchar(255),
  `body` text COMMENT 'Content of the post',
  `patient_id` integer,
  `status` varchar(255),
  `date` varcha,
  `medic_id` integer,
  `medic_name` integer,
  `medic_specialty` integer,
  `value` varchar(255),
  `conv_id` integer,
  `created_at` timestamp
);

CREATE TABLE `medico` (
  `id` integer PRIMARY KEY,
  `name` integer,
  `type` integer,
  `specialty` integer,
  `created_at` timestamp
);

CREATE TABLE `multi_specialty` (
  `id` integer PRIMARY KEY,
  `pediatria` varchar(255),
  `clinica_geral` varchar(255),
  `gastroenterologia` varchar(255),
  `dernatologia` varchar(255)
);

CREATE TABLE `mdctype` (
  `id` integer PRIMARY KEY,
  `generalista` varchar(255),
  `especialista` varchar(255),
  `residente` varchar(255)
);

CREATE TABLE `receita` (
  `id` integer PRIMARY KEY,
  `medic_id` integer,
  `medicamentos` varchar(255),
  `quantidade` varchar(255),
  `instructions` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `internacao` (
  `id` integer PRIMARY KEY,
  `medic_id` integer,
  `patient_id` integer,
  `nurse_id` integer,
  `room_id` integer,
  `data_entrada` varchar(255),
  `data_prev_alta` varchar(255),
  `data_alta` varchar(255),
  `procedimento` varchar(255)
);

CREATE TABLE `enfermeiro` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `CPF` varchar(255),
  `CRE` varchar(255)
);

CREATE TABLE `quarto` (
  `id` integer PRIMARY KEY,
  `numero` varchar(255),
  `tipo` integer
);

CREATE TABLE `tipo_quarto` (
  `id` integer PRIMARY KEY,
  `descricao` varchar(255),
  `valor_diaria` varchar(255)
);

CREATE TABLE `consulta_patients` (
  `consulta_patient_id` integer,
  `patients_id` integer,
  PRIMARY KEY (`consulta_patient_id`, `patients_id`)
);

ALTER TABLE `consulta_patients` ADD FOREIGN KEY (`consulta_patient_id`) REFERENCES `consulta` (`patient_id`);

ALTER TABLE `consulta_patients` ADD FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`);


CREATE TABLE `patients_convenio` (
  `patients_name` integer,
  `convenio_name` integer,
  PRIMARY KEY (`patients_name`, `convenio_name`)
);

ALTER TABLE `patients_convenio` ADD FOREIGN KEY (`patients_name`) REFERENCES `patients` (`name`);

ALTER TABLE `patients_convenio` ADD FOREIGN KEY (`convenio_name`) REFERENCES `convenio` (`name`);


ALTER TABLE `patients` ADD FOREIGN KEY (`conv_id`) REFERENCES `convenio` (`id`);

CREATE TABLE `patients_consulta` (
  `patients_conv_id` integer,
  `consulta_conv_id` integer,
  PRIMARY KEY (`patients_conv_id`, `consulta_conv_id`)
);

ALTER TABLE `patients_consulta` ADD FOREIGN KEY (`patients_conv_id`) REFERENCES `patients` (`conv_id`);

ALTER TABLE `patients_consulta` ADD FOREIGN KEY (`consulta_conv_id`) REFERENCES `consulta` (`conv_id`);


CREATE TABLE `medico_consulta` (
  `medico_id` integer,
  `consulta_medic_id` integer,
  PRIMARY KEY (`medico_id`, `consulta_medic_id`)
);

ALTER TABLE `medico_consulta` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

ALTER TABLE `medico_consulta` ADD FOREIGN KEY (`consulta_medic_id`) REFERENCES `consulta` (`medic_id`);


CREATE TABLE `consulta_medico` (
  `consulta_medic_name` integer,
  `medico_name` integer,
  PRIMARY KEY (`consulta_medic_name`, `medico_name`)
);

ALTER TABLE `consulta_medico` ADD FOREIGN KEY (`consulta_medic_name`) REFERENCES `consulta` (`medic_name`);

ALTER TABLE `consulta_medico` ADD FOREIGN KEY (`medico_name`) REFERENCES `medico` (`name`);


CREATE TABLE `medico_multi_specialty` (
  `medico_specialty` integer,
  `multi_specialty_id` integer,
  PRIMARY KEY (`medico_specialty`, `multi_specialty_id`)
);

ALTER TABLE `medico_multi_specialty` ADD FOREIGN KEY (`medico_specialty`) REFERENCES `medico` (`specialty`);

ALTER TABLE `medico_multi_specialty` ADD FOREIGN KEY (`multi_specialty_id`) REFERENCES `multi_specialty` (`id`);


ALTER TABLE `medico` ADD FOREIGN KEY (`type`) REFERENCES `mdctype` (`id`);

CREATE TABLE `consulta_medico(1)` (
  `consulta_medic_specialty` integer,
  `medico_specialty` integer,
  PRIMARY KEY (`consulta_medic_specialty`, `medico_specialty`)
);

ALTER TABLE `consulta_medico(1)` ADD FOREIGN KEY (`consulta_medic_specialty`) REFERENCES `consulta` (`medic_specialty`);

ALTER TABLE `consulta_medico(1)` ADD FOREIGN KEY (`medico_specialty`) REFERENCES `medico` (`specialty`);


CREATE TABLE `medico_receita` (
  `medico_id` integer,
  `receita_medic_id` integer,
  PRIMARY KEY (`medico_id`, `receita_medic_id`)
);

ALTER TABLE `medico_receita` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

ALTER TABLE `medico_receita` ADD FOREIGN KEY (`receita_medic_id`) REFERENCES `receita` (`medic_id`);


CREATE TABLE `patients_internacao` (
  `patients_id` integer,
  `internacao_patient_id` integer,
  PRIMARY KEY (`patients_id`, `internacao_patient_id`)
);

ALTER TABLE `patients_internacao` ADD FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`);

ALTER TABLE `patients_internacao` ADD FOREIGN KEY (`internacao_patient_id`) REFERENCES `internacao` (`patient_id`);


CREATE TABLE `medico_internacao` (
  `medico_id` integer,
  `internacao_medic_id` integer,
  PRIMARY KEY (`medico_id`, `internacao_medic_id`)
);

ALTER TABLE `medico_internacao` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

ALTER TABLE `medico_internacao` ADD FOREIGN KEY (`internacao_medic_id`) REFERENCES `internacao` (`medic_id`);


CREATE TABLE `enfermeiro_internacao` (
  `enfermeiro_id` integer,
  `internacao_nurse_id` integer,
  PRIMARY KEY (`enfermeiro_id`, `internacao_nurse_id`)
);

ALTER TABLE `enfermeiro_internacao` ADD FOREIGN KEY (`enfermeiro_id`) REFERENCES `enfermeiro` (`id`);

ALTER TABLE `enfermeiro_internacao` ADD FOREIGN KEY (`internacao_nurse_id`) REFERENCES `internacao` (`nurse_id`);


ALTER TABLE `internacao` ADD FOREIGN KEY (`room_id`) REFERENCES `quarto` (`id`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`tipo`) REFERENCES `tipo_quarto` (`id`);
