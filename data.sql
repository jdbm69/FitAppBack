CREATE DATABASE fitapp;

CREATE TABLE users (
    email VARCHAR (255) PRIMARY KEY NOT NULL,
    hasehd_password VARCHAR (255) NOT NULL,
    name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL
);

CREATE TABLE exercises (
    name VARCHAR (255) PRIMARY KEY NOT NULL,
    category VARCHAR (255) NOT NULL,
    name_english VARCHAR (255),
    category_english VARCHAR (255)
);

CREATE TABLE routines (
    id VARCHAR (255),
    user_email VARCHAR (255),
    date VARCHAR (300),
    exercise VARCHAR (255),
    repetitions INTEGER NOT NULL,
    weight INTEGER NOT NULL,
    type_of_weight VARCHAR (255) NOT NULL,
    num_of_serie INTEGER NOT NULL,
    exercise_english VARCHAR (255) NOT NULL,
    day VARCHAR (255) NOT NULL,
    day_eng VARCHAR (255) NOT NULL
);

/*Chest*/
INSERT INTO exercises (name, category, name_english, category_english)
VALUES 
('Press en banca con barra', 'Pecho', 'Barbell bench press', 'Chest'),
('Press en banco inclinado con barra', 'Pecho', 'Incline barbell bench press', 'Chest'),
('Press en banco declinado con barra', 'Pecho', 'Decline barbell bench press', 'Chest'),
('Press en banco con mancuerna', 'Pecho', 'Dumbell bench press', 'Chest'),
('Press en banco inclinado con mancuerna', 'Pecho', 'Incline dumbell bench press', 'Chest'),
('Press en banco declinado con mancuerna', 'Pecho', 'Decline dumbell bench press', 'Chest'),
('Aperturas en banco con mancuerna', 'Pecho', 'Dumbell fly', 'Chest'),
('Cruce en polea alta', 'Pecho', 'High cable crossover', 'Chest'),
('Cruce en polea baja', 'Pecho', 'Low cable crossover', 'Chest'),
('Apertura en maquina', 'Pecho', 'Chest flt machine', 'Chest'),
('Apertura en peck deck', 'Pecho', 'Peck deck fly', 'Chest'),
('Flexiones de pecho', 'Pecho', 'Push ups', 'Chest'),
('Press en hammer plano', 'Pecho', 'Hammer chest press', 'Chest'),
('Press en hammer inclinado', 'Pecho', 'Incline hammer chest press', 'Chest'),
('Press en hammer declinado', 'Pecho', 'Decline hammer chest press', 'Chest'),
('Pullover', 'Pecho', 'Pullover', 'Chest');

/*Legs*/
INSERT INTO exercises (name, category, name_english, category_english)
VALUES 
('Sentadilla libre con barra', 'Piernas', 'Barbell squat', 'Legs'),
('Sentadilla en maquina smith', 'Piernas', 'Smith machine squat', 'Legs'),
('Sentadilla sumo con mancuerna', 'Piernas', 'Dumbell sumo squat', 'Legs'),
('Sentadilla en maquina hack', 'Piernas', 'Hack machine squat', 'Legs'),
('Prensa', 'Piernas', 'Leg press', 'Legs'),
('Peso muerto con barra', 'Piernas', 'Barbell dead lift', 'Legs'),
('Peso muerto con mancuerna', 'Piernas', 'Dumbell dead lift', 'Legs'),
('Hip thrust con barra', 'Piernas', 'Barbell hip thrust', 'Legs'),
('Hip thrust en maquina', 'Piernas', 'Hip thrust machine', 'Legs'),
('Desplantes con mancuerna', 'Piernas', 'Dumbell lunges', 'Legs'),
('Desplantes con barra', 'Piernas', 'Barbell lunges', 'Legs'),
('Sentadilla bulgara', 'Piernas', 'Bulgarian split squat', 'Legs'),
('Extension de cuadricep', 'Piernas', 'Leg extension', 'Legs'),
('Curl femoral', 'Piernas', 'Leg curl', 'Legs'),
('Maquina aductores', 'Piernas', 'Adductors machine', 'Legs'),
('Maquina abductores', 'Piernas', 'Abductors machine', 'Legs'),
('Maquina de gemelos parado', 'Piernas', 'Stanfing calf machine', 'Legs'),
('Maquina de gemelos sentado', 'Piernas', 'Seated calf machine', 'Legs');

INSERT INTO exercises (name, category, name_english, category_english)
VALUES 
('Remo con barra', 'Espalda', 'Barbell row', 'Back'),
('Remo con mancuerna', 'Espalda', 'Dumbell row', 'Back'),
('Dominadas', 'Espalda', 'Pull ups', 'Back'),
('Jalon al pecho polea alta', 'Espalda', 'Pull down', 'Back'),
('Remo en maquina horizontal', 'Espalda', 'Seated row', 'Back'),
('Pull over', 'Espalda', 'Pull over', 'Back'),
('Remo con barra T', 'Espalda', 'T-bar row', 'Back'),
('Remo con mancuerna en banco', 'Espalda', 'Chest-suported row', 'Back'),
('Hiperextensiones', 'Espalda', 'Hyperextensions', 'Back'),
('Remo en polea baja', 'Espalda', 'Low pulley row', 'Back'),
('Remo en maquina hammer', 'Espalda', 'Hammer row', 'Back'),
('Jalones en maquina hammer', 'Espalda', 'Hammer pull downs', 'Back');

INSERT INTO exercises (name, category, name_english, category_english)
VALUES 
('Press militar con barra', 'Hombros', 'Barbell military press', 'Shoulders'),
('Press militar con mancuerna', 'Hombros', 'Dumbell military press', 'Shoulders'),
('Press arnold', 'Hombros', 'Arnold press', 'Shoulders'),
('Elevaciones laterales con mancuerna', 'Hombros', 'Dumbell lateral raise', 'Shoulders'),
('Elevaciones laterales en maquina', 'Hombros', 'Machine lateral raise', 'Shoulders'),
('Elevaciones laterales en polea baja', 'Hombros', 'Cable lateral raise', 'Shoulders'),
('Eleveaciones frontales con mancuerna ', 'Hombros', 'Dumbell front raise', 'Shoulders'),
('Eleveaciones frontales en polea baja', 'Hombros', 'Cable front raise', 'Shoulders'),
('Eleveaciones frontales con barra', 'Hombros', 'Barbell front raise', 'Shoulders'),
('Jalon a la cara', 'Hombros', 'Face pull', 'Shoulders'),
('Elevaciones posteriores con mancuerna', 'Hombros', 'Dumbell rear delt raise', 'Shoulders'),
('Elevaciones posteriores en maquina', 'Hombros', 'Machine rear delt raise', 'Shoulders'),
('Elevaciones posteriores con cable', 'Hombros', 'Cable rear delt raise', 'Shoulders'),
('Encogimiento de hombro', 'Hombros', 'Shoulder shrugs', 'Shoulders'),
('Remo al menton', 'Hombros', 'Chin row', 'Shoulders');

INSERT INTO exercises (name, category, name_english, category_english)
VALUES 
('Curl de bicep con mancuerna', 'Brazos', 'Dumbell bicep curl', 'Arms'),
('Curl de bicep con barra', 'Brazos', 'Barbell bicep curl', 'Arms'),
('Curl de bicep en polea baja', 'Brazos', 'Cable bicep curl', 'Arms'),
('Curl predicador', 'Brazos', 'Preacher curl', 'Arms'),
('Curl martillo', 'Brazos', 'Hammer curl', 'Arms'),
('Curl inclinado con mancuerna', 'Brazos', 'Incline dumbell curl', 'Arms'),
('Curl concentrado', 'Brazos', 'Concentrate curl', 'Arms'),
('Flexiones diamante', 'Brazos', 'Diamond push ups', 'Arms'),
('Press en banco plano cerrado', 'Brazos', 'Close bench press', 'Arms'),
('Fondos', 'Brazos', 'Dips', 'Arms'),
('Press frances', 'Brazos', 'French press', 'Arms'),
('Extensiones en polea alta', 'Brazos', 'Cable tricep extensions', 'Arms'),
('Rompecraneos', 'Brazos', 'Skull crushers', 'Arms'),
('Patada de tricep', 'Brazos', 'Tricep kickbacks', 'Arms'),
('Extensiones en maquina predicador', 'Brazos', 'Preacher tricep extensions', 'Arms'),
('Extensiones con mancuerna', 'Brazos', 'Dumbell tricep extensions', 'Arms');