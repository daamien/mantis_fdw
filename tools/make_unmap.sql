
SELECT
          'DROP FOREIGN TABLE :local_schema.'
            || quote_ident( c.relname ) ||';'
FROM
            pg_class     c,
            pg_attribute a,
            pg_type      t,
            pg_namespace n
WHERE
            a.attnum > 0
            AND a.attrelid = c.oid
            AND a.atttypid = t.oid
            AND n.oid = c.relnamespace
            AND c.relkind in ('r', 'v')
            AND n.nspname <> 'pg_catalog'
            AND n.nspname <> 'information_schema'
            AND n.nspname !~ '^pg_toast'
            AND pg_catalog.pg_table_is_visible(c.oid)
GROUP BY c.relname, n.nspname
ORDER BY c.relname;

