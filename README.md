# RDF Portal Composer

## What is this

Web user interface for constructing SPARQL query with the [RDF-config](https://github.com/dbcls/rdf-config).

## Usage

```
git clone https://github.com/dbcls/rdf-config.git
git clone https://github.com/ktym/rdfportal-composer.git
cd rdfportal-composer
export RDFCONFIG_PREFIX="../"
export RDFPORTAL_COMPOSER_PORT="8080"
puma -C puma.rb 2>&1 &
```

Open `http://localhost:8080`

## Author

* Toshiaki Katayama (DBCLS)

Developed at the [BioHackathon 2025](https://2025.biohackathon.org/)

