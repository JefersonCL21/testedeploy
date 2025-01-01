# Imagem base (pode ser a versão que preferir do Python)
FROM python:3.9

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos para dentro do container
COPY . .

# Opcional: documentar a porta 8080 (Cloud Run usará automaticamente a variável $PORT)
EXPOSE 8080

# Comando para rodar a aplicação, agora lendo a porta a partir de $PORT
CMD ["sh", "-c", "streamlit run app.py --server.port=${PORT:-8080} --server.address=0.0.0.0"]

