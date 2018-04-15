# flask-restplus-production-skeleton

## Run application
```bash
conda env create -f environment.yml
```
```bash
source activate flask-restplus-production-skeleton
```
```bash
python app/run_app.py [Options]
```

## Docker
```bash
docker build --build-arg port=PORT -t flask-restplus-production-skeleton -f Dockerfile .
```
```bash
docker run -d -p PORT:PORT flask-restplus-production-skeleton --host 0.0.0.0 --port PORT
```
