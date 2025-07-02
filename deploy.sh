#!/bin/bash

# 🚨 PASSO 1: Limpa dependências antigas
rm -rf node_modules
rm -f package-lock.json

# 📦 PASSO 2: Instala tudo de novo (com permissões novas)
npm install
chmod +x node_modules/.bin/*

# ✅ PASSO 3: Confirma que o script de build está correto
sed -i 's/"build": ".*"/"build": "vite build"/' package.json

# 💾 PASSO 4: Adiciona e faz commit
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
git add .
git commit -m "Fix: dependências e permissões resetadas - $TIMESTAMP"

# 🚀 PASSO 5: Faz push para o GitHub
git push
#!/bin/bash
echo "🔎 Fazendo git add..."
git add .

echo "📝 Criando commit com timestamp..."
git commit -m "Deploy automático - $(date "+%Y-%m-%d %H:%M:%S")"

echo "🚀 Fazendo push para o GitHub..."
git push

echo ""
echo "✅ Push finalizado!"
echo "✅ Agora vai na Vercel e clica em Deploy!"

