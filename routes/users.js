const express = require('express');
const router = express.Router();
const db = require('../db/query.js');


router.get('/getDepartamento', async (req, res, next) => {
  try {
    const { data, error } = await db.getDepartamento();
    if (error) {
      console.error('Supabase error:', error.message);
      return res.status(500).json({ error: 'Error fetching data from database' });
    }
    res.json(data);
  } catch (err) {
    console.error('Route handler error:', err.message);
    next(err);
  }
});

router.get('/getMunicipio', async (req, res, next) => {
  try {
    const { data, error } = await db.getMunicipio();
    if (error) {
      console.error('Supabase error:', error.message);
      return res.status(500).json({ error: 'Error fetching data from database' });
    }
    res.json(data);
  } catch (err) {
    console.error('Route handler error:', err.message);
    next(err);
  }
});

router.get('/getMunicipioByDepartamento/:departamentoId', async (req, res, next) => {
  const { departamentoId } = req.params;
  try {
    const { data, error } = await db.getMunicipioByDepartamento(departamentoId);
    if (error) {
      console.error('Supabase error:', error.message);
      return res.status(500).json({ error: 'Error fetching data from database' });
    }
    res.json(data);
  } catch (err) {
    console.error('Route handler error:', err.message);
    next(err);
  }
});

router.get('/getLocalidadesByMunicipio/:municipioId', async (req, res, next) => {
  const { municipioId } = req.params;
  try {
    const { data, error } = await db.getLocalidadesByMunicipio(municipioId);
    if (error) {
      console.error('Supabase error:', error.message);
      return res.status(500).json({ error: 'Error fetching data from database' });
    }
    res.json(data);
  } catch (err) {
    console.error('Route handler error:', err.message);
    next(err);
  }
});


module.exports = router;