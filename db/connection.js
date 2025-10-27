const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPERBASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('Las variables de entorno SUPERBASE_URL y SUPABASE_KEY son requeridas');
}

const supabase = createClient(supabaseUrl, supabaseKey);

module.exports = supabase;