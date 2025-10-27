const client = require('./connection.js');

function getDepartamento(){
    return client.from('departamento').select('*', { count: 'exact' });
}

function getMunicipio(){
    return client.from('municipio').select('*', { count: 'exact' });
}

function getMunicipioByDepartamento(departamentoId){
    return client.from('municipio').select('*', { count: 'exact' }).eq('departamento_id', departamentoId);
}

async function query(text, params) {
    const res = await client.from(text).select('*', { count: 'exact' }).match(params);
    return res;
}

module.exports = {
    getDepartamento,
    getMunicipio,
    getMunicipioByDepartamento,
    query
};
