const PORT = process.env.PORT ?? 8000;
const express = require('express');
const pool = require('./db');
const cors = require('cors');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { v4: uuidv4 } = require('uuid');

const app = express();
app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.send('hello world');
});

//signup
app.post('/signup', async (req, res) => {
    const { email, password, name, lastName } = req.body;
    const salt = bcrypt.genSaltSync(10);
    const hashedPassword = bcrypt.hashSync(password, salt);

    try {
        const signUp = await pool.query(`INSERT INTO users (email, hashed_password, name, last_name) VALUES($1, $2, $3, $4)`, [email, hashedPassword, name, lastName]);
        const token = jwt.sign({ email }, 'secret', { expiresIn: '1hr' });
        res.json({ email,token });
    } catch (err) {
        console.error(err);
        if (err) {
            res.json({ detail: err.detail });
        }
    }
});

//login
app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    try {
        const users = await pool.query(`SELECT * FROM users WHERE email = $1`, [email]);

        if (!users.rows.length) return res.json({ detail: 'User not found' });

        const success = await bcrypt.compare(password, users.rows[0].hashed_password);
        const token = jwt.sign({ email }, 'secret', { expiresIn: '1hr' });

        if (success) {
            res.json({ 'email' : users.rows[0].email, token });
        } else {
            res.json({ detail: 'Wrong password' });
        }
    } catch (err) {
        console.error(err);
    }
});

//get name
app.get('/name/:userEmail', async (req, res) => {
    const { userEmail } = req.params;

    try {
        const name = await pool.query('SELECT name FROM users WHERE email = $1', [userEmail]);
        res.json(Object.values(name.rows[0]).toString());
    } catch (err) {
        console.error(err);
    }
});

//get last name
app.get('/lastName/:userEmail', async (req, res) => {
    const { userEmail } = req.params;

    try {
        const Lastname = await pool.query('SELECT last_name FROM users WHERE email = $1', [userEmail]);
        res.json(Object.values(Lastname.rows[0]).toString());
    } catch (err) {
        console.error(err);
    }
});

//list of exercises
app.get('/list', async (req, res) => {

    try {
        const list = await pool.query('SELECT * from exercises');
        res.json(list.rows);
    } catch (err) {
        console.error(err);
    }
});

//get routine
app.get('/routine/:date/:userEmail', async (req, res) => {
    const { userEmail, date } = req.params;

    try {
        const routines = await pool.query('SELECT * FROM routines WHERE user_email = $1 AND num_of_serie = 1 AND date = $2', [userEmail, date]);
        res.json(routines.rows);
    } catch (err) {
        console.error(err);
    }
});

//get records
app.get('/records/:userEmail', async (req, res) => {
    const { userEmail } = req.params;

    try {
        const routines = await pool.query('SELECT * FROM routines WHERE user_email = $1 AND num_of_serie = 1', [userEmail]);
        res.json(routines.rows);
    } catch (err) {
        console.error(err);
    }
});

//get specific routine
app.get('/specificroutine/:id', async (req, res) => {
    const { id } = req.params;

    try {
        const routine = await pool.query('SELECT * FROM routines WHERE id = $1 ORDER BY num_of_serie', [id]);
        res.json(routine.rows);
    } catch (err) {
        console.error(err);
    }
});

//add routine
app.post('/routine', async (req, res) => {
    const { user_email, date, exercise, repetitions, weight, type_of_weight, num_of_serie, exercise_english, day, day_eng } = req.body;
    const id = uuidv4();

    try {
        const newRoutine = await pool.query(`INSERT INTO routines(id, user_email, date, exercise, repetitions, weight, type_of_weight, num_of_serie, exercise_english, day, day_eng) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)`,
            [id, user_email, date, exercise, repetitions, weight, type_of_weight, num_of_serie, exercise_english, day, day_eng]);
        res.json(newRoutine);
    } catch (err) {
        console.error(err);
    }
});

//add new serie
app.post('/serie', async (req, res) => {
    const { id, user_email, date, exercise, repetitions, weight, type_of_weight, num_of_serie, exercise_english, day, day_eng } = req.body;

    try {
        const newRoutine = await pool.query(`INSERT INTO routines(id, user_email, date, exercise, repetitions, weight, type_of_weight, num_of_serie, exercise_english, day, day_eng) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)`,
            [id, user_email, date, exercise, repetitions, weight, type_of_weight, num_of_serie, exercise_english, day, day_eng]);
        res.json(newRoutine);
    } catch (err) {
        console.error(err);
    }
});

//delete a routine
app.delete('/routine/:id', async (req, res) => {
    const { id } = req.params;

    try {
        const deletedRoutine = await pool.query(`DELETE FROM routines WHERE id = $1`, [id]);
        res.json(deletedRoutine);
    } catch (err) {
        console.error(err);
    }
});

//delete a serie
app.delete('/routine/:id/:num_of_serie', async (req, res) => {
    const { id, num_of_serie } = req.params;

    try {
        const deletedRoutine = await pool.query(`DELETE FROM routines WHERE id = $1 AND num_of_serie = $2`, [id, num_of_serie]);
        res.json(deletedRoutine);
    } catch (err) {
        console.error(err);
    }
});

//edit a serie
app.put('/editroutine/:id/:num_of_serie', async (req, res) => {
    const { id, num_of_serie,  } = req.params;
    const { repetitions, weight, type_of_weight, user_email } = req.body;

    try {
        const updatedSerie = await pool.query(`UPDATE routines SET user_email = $1, repetitions = $2, weight = $3, type_of_weight = $4 WHERE id = $5 AND num_of_serie = $6`,
            [user_email, repetitions, weight, type_of_weight, id, num_of_serie]);
        res.json(updatedSerie);
    } catch (err) {
        console.error(err);
    }
});

//get specific progress
app.get('/progress/:name/:userEmail', async (req, res) => {
    const { name, userEmail } = req.params;

    try {
        const progress = await pool.query(`SELECT * FROM routines WHERE exercise = $1 AND user_email = $2`, [name, userEmail]);
        res.json(progress.rows);
    } catch (err) {
        console.error(err);
    }
});

app.listen(PORT, () => {
    console.log('Listening on port ' + PORT);
});