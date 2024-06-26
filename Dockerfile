# Etapa de compilação
FROM node:14 AS builder

WORKDIR /app

# Instalação das dependências
COPY package*.json ./
RUN npm install

# Copia os arquivos do projeto
COPY . .

# Etapa de produção
FROM node:14-alpine

WORKDIR /app

# Copia os arquivos do build da etapa anterior
COPY --from=builder /app .

# Expor a porta do servidor de desenvolvimento do React Native
EXPOSE 8081

# Comando para iniciar o servidor de desenvolvimento
CMD ["npm", "start"]

