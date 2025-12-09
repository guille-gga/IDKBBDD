# csvkit

CSV de los ejemplos:

```csv
id,song,artist
0,Familiar Frontiers,G Jones
1,Which Way,G Jones
2,Perpetual Bloom,G Jones
3,ALL4U,Saka
4,Choke,Beastboi
5,R.A.V.E.,EPROM & G Jones
6,Dominate (Eprom Remix),Space Laces
7,Solina,EPROM
8,Llamando,Camoufly
9,Is it real?,Flume & JPEGMAFIA
```

## csvlook

### Basico

```bash
/tmp/csvtest ❯ csvlook test.csv
| id | song                   | artist            |
| -- | ---------------------- | ----------------- |
|  0 | Familiar Frontiers     | G Jones           |
|  1 | Which Way              | G Jones           |
|  2 | Perpetual Bloom        | G Jones           |
|  3 | ALL4U                  | Saka              |
|  4 | Choke                  | Beastboi          |
|  5 | R.A.V.E.               | EPROM & G Jones   |
|  6 | Dominate (Eprom Remix) | Space Laces       |
|  7 | Solina                 | EPROM             |
|  8 | Llamando               | Camoufly          |
|  9 | Is it real?            | Flume & JPEGMAFIA |
```

### Limitar filas

```bash
/tmp/csvtest ✗ csvlook --max-rows 2 test.csv
|    id | song               | artist  |
| ----- | ------------------ | ------- |
| False | Familiar Frontiers | G Jones |
|  True | Which Way          | G Jones |
```

### Evitar inferencia de datos

```bash
/tmp/csvtest ❯ csvlook --max-rows 2 test.csv --no-inference
| id | song               | artist  |
| -- | ------------------ | ------- |
| 0  | Familiar Frontiers | G Jones |
| 1  | Which Way          | G Jones |
```

### Limitar columnas

```bash
/tmp/csvtest ❯ csvlook --max-columns 2 test.csv
| id | song                   | ... |
| -- | ---------------------- | --- |
|  0 | Familiar Frontiers     | ... |
|  1 | Which Way              | ... |
|  2 | Perpetual Bloom        | ... |
|  3 | ALL4U                  | ... |
|  4 | Choke                  | ... |
|  5 | R.A.V.E.               | ... |
|  6 | Dominate (Eprom Remix) | ... |
|  7 | Solina                 | ... |
|  8 | Llamando               | ... |
|  9 | Is it real?            | ... |
```

## csvcut

### Extraer columnas

```bash
/tmp/csvtest ❯ csvcut -c song,artist test.csv | csvlook
| song                   | artist            |
| ---------------------- | ----------------- |
| Familiar Frontiers     | G Jones           |
| Which Way              | G Jones           |
| Perpetual Bloom        | G Jones           |
| ALL4U                  | Saka              |
| Choke                  | Beastboi          |
| R.A.V.E.               | EPROM & G Jones   |
| Dominate (Eprom Remix) | Space Laces       |
| Solina                 | EPROM             |
| Llamando               | Camoufly          |
| Is it real?            | Flume & JPEGMAFIA |
```

### Excluir columnas

```bash
/tmp/csvtest ❯ csvcut -C id test.csv | csvlook
| song                   | artist            |
| ---------------------- | ----------------- |
| Familiar Frontiers     | G Jones           |
| Which Way              | G Jones           |
| Perpetual Bloom        | G Jones           |
| ALL4U                  | Saka              |
| Choke                  | Beastboi          |
| R.A.V.E.               | EPROM & G Jones   |
| Dominate (Eprom Remix) | Space Laces       |
| Solina                 | EPROM             |
| Llamando               | Camoufly          |
| Is it real?            | Flume & JPEGMAFIA |
```

## csvsort
### Ordenar por columna

```bash
/tmp/csvtest ❯ csvsort -c artist test.csv | csvlook
| id | song                   | artist            |
| -- | ---------------------- | ----------------- |
|  4 | Choke                  | Beastboi          |
|  8 | Llamando               | Camoufly          |
|  7 | Solina                 | EPROM             |
|  5 | R.A.V.E.               | EPROM & G Jones   |
|  9 | Is it real?            | Flume & JPEGMAFIA |
|  0 | Familiar Frontiers     | G Jones           |
|  1 | Which Way              | G Jones           |
|  2 | Perpetual Bloom        | G Jones           |
|  3 | ALL4U                  | Saka              |
|  6 | Dominate (Eprom Remix) | Space Laces       |
```

## csvformat

### Cambiar delimitador

```bash
/tmp/csvtest ❯ csvformat -D ";" test.csv
id;song;artist
0;Familiar Frontiers;G Jones
1;Which Way;G Jones
2;Perpetual Bloom;G Jones
3;ALL4U;Saka
4;Choke;Beastboi
5;R.A.V.E.;EPROM & G Jones
6;Dominate (Eprom Remix);Space Laces
7;Solina;EPROM
8;Llamando;Camoufly
9;Is it real?;Flume & JPEGMAFIA
```

## csvgrep

### Coincidencia exacta

```bash
/tmp/csvtest ❯ csvgrep -c artist -m EPROM test.csv
id,song,artist
5,R.A.V.E.,EPROM & G Jones
7,Solina,EPROM
```

### Expresion regular

```bash
/tmp/csvtest ❯ csvgrep -c song -r "^F" test.csv | csvlook
|    id | song               | artist  |
| ----- | ------------------ | ------- |
| False | Familiar Frontiers | G Jones |
```

## csvsql

### Crear schema

```bash
/tmp/csvtest ❯ csvsql test.csv
CREATE TABLE test (
	id DECIMAL NOT NULL,
	song VARCHAR NOT NULL,
	artist VARCHAR NOT NULL
);
```

### Queries

```bash
/tmp/csvtest ❯ csvsql --query "SELECT * FROM test" test.csv | csvlook
| id | song                   | artist            |
| -- | ---------------------- | ----------------- |
|  0 | Familiar Frontiers     | G Jones           |
|  1 | Which Way              | G Jones           |
|  2 | Perpetual Bloom        | G Jones           |
|  3 | ALL4U                  | Saka              |
|  4 | Choke                  | Beastboi          |
|  5 | R.A.V.E.               | EPROM & G Jones   |
|  6 | Dominate (Eprom Remix) | Space Laces       |
|  7 | Solina                 | EPROM             |
|  8 | Llamando               | Camoufly          |
|  9 | Is it real?            | Flume & JPEGMAFIA |
```

```bash
/tmp/csvtest ❯ csvsql --query "SELECT * FROM test WHERE artist = 'G Jones'" test.csv | csvlook
| id | song               | artist  |
| -- | ------------------ | ------- |
|  0 | Familiar Frontiers | G Jones |
|  1 | Which Way          | G Jones |
|  2 | Perpetual Bloom    | G Jones |
```