export default function Dashboard() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="text-center">
        <h1 className="text-4xl font-bold text-green-600 mb-4">
          🎉 Connexion réussie !
        </h1>
        <h2 className="text-2xl font-semibold text-gray-800 mb-2">
          Bienvenue sur StraightPath LMS
        </h2>
        <p className="text-gray-600">
          Votre authentification Supabase fonctionne parfaitement !
        </p>
      </div>
    </div>
  )
}