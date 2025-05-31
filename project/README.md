---
id: lms-assurance-readme
title: LMS Assurance – Cahier des charges central
description: Source de vérité pour le projet LMS Assurance, guide pour OpenAI Codex et tous les contributeurs.
author: [Ton Nom]
created_at: 2025-05-27
modified_at: 2025-05-27
version: 1.0.0
status: active
access_rights: [admin, dev, ai]
tags: [central, guide, structure]
---

# LMS Assurance – Cahier des charges central

Ce document centralise la vision, la structure, les conventions et la table des matières du projet LMS Assurance.  
Il sert de référence unique pour OpenAI Codex et tous les contributeurs humains.

## Table des modules

| Module                  | Description                                             | Documentation                | Statut    |
|-------------------------|--------------------------------------------------------|------------------------------|-----------|
| User Management         | Gestion utilisateurs, rôles, accès                     | [user_management.md](docs/modules/user_management.md) | En cours  |
| Exam Engine             | Examens, certifications, outils intégrés               | [exam_engine.md](docs/modules/exam/exam_engine.md)   | En cours  |
| Microlearning           | Quiz quotidiens, mini-leçons, notifications            | [microlearning.md](docs/modules/microlearning.md)    | À faire   |
| Social Learning         | Groupes d’étude, mentorat, forums                      | [social_learning.md](docs/modules/social_learning.md)| À faire   |
| Search Engine           | Recherche globale, filtres, suggestions IA             | [search_engine.md](docs/modules/search_engine.md)    | À faire   |
| Personalization         | Parcours adaptatif, recommandations IA                 | [personalization.md](docs/modules/personalization.md)| À faire   |
| Accessibility           | Inclusivité, accessibilité, lecture audio              | [accessibility.md](docs/modules/accessibility.md)    | À faire   |
| Feedback                | Emoji, sondages, feedback instantané                   | [feedback.md](docs/modules/feedback.md)              | À faire   |
| Support                 | Chat IA/humain, prise de rendez-vous                   | [support.md](docs/modules/support.md)                | À faire   |
| Marketplace             | Modules complémentaires, simulateurs                   | [marketplace.md](docs/modules/marketplace.md)        | À faire   |
| ...                     | ...                                                    | ...                          | ...       |

## Conventions de nommage

- Snake_case pour les fichiers : `exam_engine.md`
- CamelCase pour les fonctions/classes : `assignUserToCourse`
- Kebab-case pour les dossiers : `user-management`
- Préfixe de module pour chaque fichier/fonction spécifique : `exam_calculator.js`
- Suffixe de langue pour les fichiers de traduction : `dashboard.en.json`
- Documentation par module dans `/docs/modules/`

## Rappels IA et bonnes pratiques

Voir [AI_REMINDERS.md](AI_REMINDERS.md)

## Métadonnées obligatoires

Chaque fichier doit commencer par un bloc YAML de métadonnées (voir exemple ci-dessous).
