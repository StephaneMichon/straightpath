# setup_memory.ps1 - Installation automatique du Système de Mémoire Claude

Write-Host ""
Write-Host "Installation du Systeme de Memoire Claude" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Verifier qu'on est dans le bon dossier
$currentPath = Get-Location
Write-Host "Dossier actuel: $currentPath" -ForegroundColor Yellow

# Creer la structure des dossiers
Write-Host "`nCreation de la structure des dossiers..." -ForegroundColor Yellow

$folders = @(
    "memory",
    "memory\scripts",
    "memory\config", 
    "memory\src",
    "memory\src\core",
    "memory\src\extractors",
    "memory\src\classifiers",
    "memory\src\storage",
    "memory\api",
    "memory\data",
    "memory\data\extracted",
    "memory\data\compressed",
    "memory\tests",
    "docs\memory-system",
    "docs\memory-system\active",
    "docs\memory-system\archived",
    "docs\memory-system\compliance",
    "docs\memory-system\reports",
    ".github\workflows"
)

foreach ($folder in $folders) {
    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Force -Path $folder | Out-Null
        Write-Host "  Cree: $folder" -ForegroundColor Green
    }
}

# Creer les fichiers __init__.py
Write-Host "`nCreation des fichiers __init__.py..." -ForegroundColor Yellow

$initFiles = @(
    "memory\__init__.py",
    "memory\src\__init__.py",
    "memory\src\core\__init__.py",
    "memory\src\extractors\__init__.py",
    "memory\src\classifiers\__init__.py",
    "memory\src\storage\__init__.py",
    "memory\api\__init__.py"
)

foreach ($file in $initFiles) {
    if (!(Test-Path $file)) {
        New-Item -ItemType File -Force -Path $file | Out-Null
        Write-Host "  Cree: $file" -ForegroundColor Green
    }
}

# Aller dans le dossier memory
Set-Location memory

# Creer l'environnement virtuel Python
Write-Host "`nCreation de l'environnement virtuel Python..." -ForegroundColor Yellow

if (!(Test-Path "venv")) {
    python -m venv venv
    Write-Host "  Environnement virtuel cree" -ForegroundColor Green
}

# Creer requirements.txt
Write-Host "`nCreation du fichier requirements.txt..." -ForegroundColor Yellow

@"
fastapi==0.108.0
uvicorn[standard]==0.25.0
supabase==2.3.0
python-dotenv==1.0.0
rich==13.7.0
"@ | Out-File -FilePath "requirements.txt" -Encoding UTF8

Write-Host "  requirements.txt cree" -ForegroundColor Green

# Creer le fichier .env
Write-Host "`nCreation du fichier de configuration .env..." -ForegroundColor Yellow

@"
# Configuration Supabase
SUPABASE_URL=https://braidgotcntsycjquhbe.supabase.co
SUPABASE_ANON_KEY=VOTRE_ANON_KEY_ICI
SUPABASE_SERVICE_KEY=VOTRE_SERVICE_KEY_ICI

# Configuration API
API_HOST=0.0.0.0
API_PORT=3001
"@ | Out-File -FilePath "config\.env" -Encoding UTF8

Write-Host "  Fichier .env cree" -ForegroundColor Green

# Retourner au dossier principal
Set-Location ..

Write-Host "`n" -NoNewline
Write-Host "===== INSTALLATION TERMINEE =====" -ForegroundColor Green
Write-Host "`nPROCHAINES ETAPES:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Allez dans le dossier memory:" -ForegroundColor White
Write-Host "   cd memory" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Activez l'environnement virtuel:" -ForegroundColor White
Write-Host "   .\venv\Scripts\activate" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Installez les dependances:" -ForegroundColor White
Write-Host "   pip install -r requirements.txt" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Configurez vos cles Supabase:" -ForegroundColor White
Write-Host "   notepad config\.env" -ForegroundColor Gray
Write-Host ""