FROM python:3.9-slim

RUN apt-get update && \
    apt-get install -y stress-ng iperf3 sysbench && \
    rm -rf /var/lib/apt/lists/*
RUN pip install psutil

COPY main.py /app/stress_test.py

WORKDIR /app

EXPOSE 5201

CMD ["python", "/app/stress_test.py"]
