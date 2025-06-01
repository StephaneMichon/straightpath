import os
from dotenv import load_dotenv
import requests

load_dotenv('config/.env')

def test_debug():
    print("=== TEST DEBUG ===\n")
    
    # 1. Vérifier les variables
    url = os.getenv('SUPABASE_URL')
    print(f"URL chargée: '{url}'")
    print(f"Longueur URL: {len(url) if url else 0}")
    
    # 2. Tester la connexion directement
    if url:
        try:
            print(f"\nTest de connexion à: {url}")
            response = requests.get(f"{url}/rest/v1/", timeout=5)
            print(f"Code de réponse: {response.status_code}")
        except Exception as e:
            print(f"Erreur de connexion: {e}")
    
    # 3. Tester avec une URL connue
    try:
        print("\nTest Google (pour vérifier internet):")
        response = requests.get("https://www.google.com", timeout=5)
        print(f"Google accessible: {response.status_code}")
    except Exception as e:
        print(f"Pas de connexion internet?: {e}")

if __name__ == "__main__":
    test_debug()