import { Request, Response } from 'express';

/**
 * Login fake — aceita qualquer e-mail/senha e retorna um token JWT simulado
 * com os dados do usuário embutidos no payload.
 * Quando o banco estiver configurado, este controller pode ser substituído
 * por verificação real de credenciais.
 */
export async function login(req: Request, res: Response) {
  const { email, password } = req.body as { email?: string; password?: string };

  if (!email || !password) {
    return res.status(400).json({ error: 'E-mail e senha são obrigatórios.' });
  }

  // Token fake: base64(header).base64(payload).base64(signature)
  const payload = {
    id: `user-${Buffer.from(email).toString('hex').slice(0, 8)}`,
    email,
    nome: email.split('@')[0],
    instituicao: '',
    iat: Math.floor(Date.now() / 1000),
    exp: Math.floor(Date.now() / 1000) + 60 * 60 * 24 * 7, // 7 dias
  };

  const fakeToken = [
    Buffer.from(JSON.stringify({ alg: 'none', typ: 'JWT' })).toString('base64url'),
    Buffer.from(JSON.stringify(payload)).toString('base64url'),
    'fake-sig',
  ].join('.');

  return res.json({ token: fakeToken, user: payload });
}

/**
 * Registro fake — retorna token igual ao login.
 */
export async function register(req: Request, res: Response) {
  const { email, password, nome, instituicao } = req.body as {
    email?: string;
    password?: string;
    nome?: string;
    instituicao?: string;
  };

  if (!email || !password) {
    return res.status(400).json({ error: 'E-mail e senha são obrigatórios.' });
  }

  const payload = {
    id: `user-${Buffer.from(email).toString('hex').slice(0, 8)}`,
    email,
    nome: nome ?? email.split('@')[0],
    instituicao: instituicao ?? '',
    iat: Math.floor(Date.now() / 1000),
    exp: Math.floor(Date.now() / 1000) + 60 * 60 * 24 * 7,
  };

  const fakeToken = [
    Buffer.from(JSON.stringify({ alg: 'none', typ: 'JWT' })).toString('base64url'),
    Buffer.from(JSON.stringify(payload)).toString('base64url'),
    'fake-sig',
  ].join('.');

  return res.status(201).json({ token: fakeToken, user: payload });
}

export function me(req: Request, res: Response) {
  // O middleware de auth injeta req.user quando o token existe
  const user = (req as Request & { user?: unknown }).user;
  if (!user) return res.status(401).json({ error: 'Não autenticado.' });
  return res.json({ user });
}
