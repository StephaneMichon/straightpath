'use client'

import { useState } from 'react'
import { supabase } from '@/lib/supabase'

export default function Home() {
  const [email, setEmail] = useState('')
  const [loading, setLoading] = useState(false)
  const [message, setMessage] = useState('')

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    
    const { error } = await supabase.auth.signInWithOtp({
      email,
      options: {
        emailRedirectTo: 'http://localhost:3000/dashboard'
      }
    })
    
    if (error) {
      setMessage('Erreur: ' + error.message)
    } else {
      setMessage('Lien de connexion envoyé à votre email!')
    }
    setLoading(false)
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="max-w-md w-full space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
            StraightPath LMS
          </h2>
          <p className="mt-2 text-center text-sm text-gray-600">
            Connexion à votre compte - Prototype Supabase
          </p>
          <p className="mt-1 text-center text-xs text-blue-600">
            → Migration Azure prévue prochaine session
          </p>
        </div>
        <form className="mt-8 space-y-6" onSubmit={handleLogin}>
          <div>
            <label htmlFor="email" className="sr-only">
              Email
            </label>
            <input
              id="email"
              name="email"
              type="email"
              required
              className="relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
              placeholder="Votre adresse email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
          </div>
          <div>
            <button
              type="submit"
              disabled={loading}
              className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50"
            >
              {loading ? 'Envoi...' : 'Se connecter avec Magic Link'}
            </button>
          </div>
          {message && (
            <div className={`text-center text-sm ${message.includes('Erreur') ? 'text-red-600' : 'text-green-600'}`}>
              {message}
            </div>
          )}
        </form>
        <div className="text-center text-xs text-gray-500">
          <p>Prototype Phase 1 - Combined Insurance (Chubb)</p>
          <p>Session 1: Supabase Auth fonctionnel ✅</p>
        </div>
      </div>
    </div>
  )
}