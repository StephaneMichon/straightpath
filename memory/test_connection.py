import os
from dotenv import load_dotenv
from supabase import create_client

load_dotenv('config/.env')

def test_connection():
    print("\nTest de connexion Supabase...\n")
    
    url = os.getenv('SUPABASE_URL')
    key = os.getenv('SUPABASE_SERVICE_KEY')
    
    if not key or 'VOTRE_' in str(key):
        print("ERREUR: Remplacez les cles dans config\.env")
        print("1. Ouvrez memory\\config\\.env")
        print("2. Remplacez VOTRE_SERVICE_KEY_ICI par votre vraie cle")
        return False
    
    try:
        print("Connexion en cours...")
        client = create_client(url, key)
        result = client.table('claude_memories').select("count", count='exact').execute()
        print(f"SUCCES! Connexion reussie!")
        print(f"Table claude_memories: {result.count} enregistrements")
        return True
    except Exception as e:
        print(f"ERREUR: {e}")
        return False

if __name__ == "__main__":
    test_connection()