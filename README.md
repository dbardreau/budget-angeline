# Budget Angéline

Tableau de bord de gestion du budget de Angéline, **hébergé en ligne sur GitHub Pages**
et sauvegardé dans une base de données **Supabase** (dans le cloud).

- 🌐 **Site en ligne** : gestion des revenus / dépenses, par année et par mois,
  graphiques, budget prévisionnel, catégories personnalisées, recherche d'opérations
  (libellé, catégorie, montant, mois) sur tous les comptes.
- 🔐 **Accès personnel** : une connexion (email + mot de passe) est requise pour
  consulter et modifier les données. Elles sont stockées dans Supabase et
  protégées (Row Level Security).
- ☁️ **Toujours en ligne** : indépendant du PC, les données vivent dans le cloud.

> Ce site est un **clone** de « Budget Foyer » : mêmes fonctionnalités et même
> aspect, mais avec toutes les bases **vides** (aucune donnée pré-remplie).

## 🚀 Déployer / mettre à jour le site

Le site est un **site statique** publié sur **GitHub Pages** depuis la branche `main` :

```bash
git add .
git commit -m "description du changement"
git push origin main
```

GitHub Pages reconstruit automatiquement le site (quelques dizaines de secondes).

## 🔑 Connexion

L'accès est protégé par **Supabase Auth** :
- Email : `angeline.bardreau@gmail.com`
- (mot de passe choisi à la création du compte)

En cas de « session expirée », il suffit de se reconnecter.

## ⚙️ Configuration (au premier déploiement)

Deux valeurs doivent être renseignées dans `app.js` (après avoir créé le projet Supabase) :

```js
const SB_URL = 'https://REMPLACER.supabase.co';     // → URL du projet Supabase
const SB_KEY = 'REMPLACER_PUBLISHABLE_KEY';          // → clé publishable (Settings → API Keys)
```

Et la table `kv` + les droits (Row Level Security) doivent être créés avec ce script SQL
(SQL Editor du tableau de bord Supabase) :

```sql
create table if not exists public.kv (
  k text primary key,
  v jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.kv enable row level security;
create policy "lecture_connecte" on public.kv for select to authenticated using (true);
create policy "ecriture_connecte" on public.kv for insert to authenticated with check (true);
create policy "maj_connecte" on public.kv for update to authenticated using (true) with check (true);
create policy "suppression_connecte" on public.kv for delete to authenticated using (true);
```

Puis créer un compte utilisateur (email + mot de passe) dans
**Authentication → Users → Add user**.

## Fichiers

| Fichier       | Rôle |
|---------------|------|
| `index.html`  | Structure, onglets, écran de connexion |
| `style.css`   | Thème sombre |
| `app.js`      | Logique, graphiques, saisie, connexion + stockage Supabase |
| `data.js`     | Données de base annuelles (volontairement **vide**) |
| `data-epargne.js` | Relevés du compte épargne (volontairement **vide**) |
