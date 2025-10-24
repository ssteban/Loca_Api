var express = require('express');
var router = express.Router();

router.get('/info-api', (req, res) => {
  res.json({
    nombre: 'LocaApi',
    descripcion: 'API RESTful para selección progresiva de ubicación geográfica en Colombia.',
    niveles: [
      'Departamento',
      'Ciudad',
      'Localidad',
      'Barrio'
    ],
    objetivo: 'Permitir que los usuarios seleccionen su ubicación de forma jerárquica, facilitando la personalización de servicios según su contexto geográfico.',
    endpoints: {
      departamentos: '/departamentos',
      ciudades: '/departamentos/:id/ciudades',
      localidades: '/ciudades/:id/localidades',
      barrios: '/localidades/:id/barrios'
    },
    estado: 'En desarrollo ',
    mensaje: '¡Bienvenido a LocaApi :)'
  });
});


router.get('/status', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date() });
});

module.exports = router;
