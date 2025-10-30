const client = require('./connection.js');

function getDepartamento(){
    return client.from('departamento').select('id, nombre', { count: 'exact' });
}

function getMunicipio(){
    return client.from('municipio').select('id, nombre, departamento_id', { count: 'exact' });
}

function getMunicipioByDepartamento(departamentoId){
    return client.from('municipio').select('id, nombre', { count: 'exact' }).eq('departamento_id', departamentoId);
}

function getLocalidadesByMunicipio(municipioId) {
  return client
    .from('municipio_localidad')
    .select('localidad(*)', { count: 'exact' })
    .eq('municipio_id', municipioId);
}

async function query(text, params) {
    const res = await client.from(text).select('*', { count: 'exact' }).match(params);
    return res;
}

module.exports = {
    getDepartamento,
    getMunicipio,
    getMunicipioByDepartamento,
    getLocalidadesByMunicipio,
    query
};
