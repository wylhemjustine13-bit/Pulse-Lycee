-- Hiera Sociale — schéma initial PostgreSQL
-- À appliquer uniquement sur une base de test après revue.
-- Aucun mot de passe brut ni jeton d'invitation ne doit être stocké ici.

CREATE TABLE IF NOT EXISTS student_accounts (
  id UUID PRIMARY KEY,
  username VARCHAR(24) NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  status VARCHAR(16) NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'active', 'suspended', 'closed')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS account_invites (
  id UUID PRIMARY KEY,
  token_hash TEXT NOT NULL UNIQUE,
  created_by UUID,
  expires_at TIMESTAMPTZ NOT NULL,
  used_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT account_invites_creator_fk
    FOREIGN KEY (created_by) REFERENCES student_accounts(id)
    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS login_sessions (
  id UUID PRIMARY KEY,
  account_id UUID NOT NULL REFERENCES student_accounts(id) ON DELETE CASCADE,
  session_token_hash TEXT NOT NULL UNIQUE,
  expires_at TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  revoked_at TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS login_sessions_account_id_idx
  ON login_sessions(account_id);

CREATE INDEX IF NOT EXISTS login_sessions_expiry_idx
  ON login_sessions(expires_at);

-- Les jetons d'invitation et de session doivent être générés côté serveur
-- avec un générateur cryptographiquement sûr ; seule leur empreinte est stockée.
-- L'accès à ces tables doit être réservé au serveur, jamais au navigateur.
