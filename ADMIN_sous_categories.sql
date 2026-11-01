-- ═══════════════════════════════════════════════════════════════
-- SOUS-CATEGORIES + REGLES  —  pour le site Budget Angéline
-- Reconstruites à l'identique depuis les données du site « Budget Foyer ».
-- À exécuter dans Supabase : projet budget-angeline → SQL Editor
-- ═══════════════════════════════════════════════════════════════

insert into public.kv (k, v) values
('subcats', '{
  "Vie quotidienne":["Alimentation","Animaux domestiques","Bien-être et soins (coiffeur, parfums…)","Bricolage et jardinage","Electronique et informatique","Equipements sportifs et artistiques","Livres, CD/DVD, bijoux, jouets…","Mobilier, électroménager, décoration…","Vêtements et accessoires","Vie quotidienne","Vie Quotidienne - Autres"],
  "Logement":["Eau","Energie (électricité, gaz, fuel, chauffage…)","Loyers, Charges"],
  "Auto & Moto":["Assurances (Auto/Moto)","Carburant","Financement","Parking"],
  "Voyages & Transports":["Assurances (Auto/Moto)","Carburant","Contraventions","Entretien - Réparation","Financement","Hébergement (hôtels, camping…)","Location de véhicules","Parking","Péages","Transports longue distance (avions, trains…)","Transports quotidiens (métro, bus…)"],
  "Santé":["Complémentaires santé","Médecins et frais médicaux","Optique, audition…","Pharmacie et laboratoire","Remboursements frais de santé"],
  "Abonnements & téléphonie":["Multimedia à domicile (TV, internet, téléphonie…)","Téléphonie (fixe et mobile)"],
  "Éducation & Famille":["Argent de poche","Education & Famille - Autres","Etudes (formation, fournitures, cantines…)"],
  "Cadeaux et solidarité":["Dons et Cadeaux"],
  "Loisirs et sorties":["Club / association (sport, hobby, art…)","Divertissement - culture (ciné, théâtre, concerts…)","Restaurants, bars, discothèques…"],
  "Dépenses d''épargne":["Dépenses d''épargne - Autres","Epargne bancaire (Livret A, PEL…)"],
  "Virements émis":[],
  "Chèques":[],
  "Retraits cash":[],
  "Services financiers & professionnels":["Frais bancaires et de gestion (dont agios)","Services professionnels (avocats, notaires, comptabilité…)"],
  "Impôts et taxes":[],
  "Mouvements internes débiteurs":["Virements émis de comptes à comptes"],
  "Opérations bancaires":["Chèques","Dépenses d''épargne - Autres","Epargne bancaire (Livret A, PEL…)","Retraits cash","Virements émis"],
  "Autre":["Frais bancaires et de gestion (dont agios)","Services professionnels (avocats, notaires, comptabilité…)"],
  "Non catégorisé":["Non catégorisé"],
  "Salaire":["Salaire fixe","Salaire variable"],
  "Aides sociales":["Allocations familiales"],
  "Autre revenu":["Remboursement de frais / offres BoursoBank"]
}'::jsonb),
('sub_remap', '{"cheques":"Opérations bancaires","parking":"Voyages & Transports","carburant":"Voyages & Transports","financement":"Voyages & Transports","retraits cash":"Opérations bancaires","virements emis":"Opérations bancaires","assurances (auto/moto)":"Voyages & Transports"}'::jsonb)
on conflict (k) do update set v = excluded.v, updated_at = now();
