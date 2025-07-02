FROM python:3.13.5-alpine3.22

# Define o diretorio de trabalho dentro do container
WORKDIR /app

# Copia o arquivo requirements.txt para dentro do container e 
# instala as dependências do projeto
# Usamos --no-cache-dir para evitar o cache do pip, reduzindo o tamanho
# da imagem e melhorando a performance
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do codigo da aplicacao para o diretorio de trabalho
COPY . .

#Expões a porta que a aplicação FastAPI ira rodar
# (padrao eh 8080)
#EXPOSE 8000

# Comando para rodar a aplicação usando uvicorn
# O host 0.0.0.0 permite que a aplicação seja acessível
# externamente ao container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
