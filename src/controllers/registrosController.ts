import { Request, Response } from 'express';
import { sequelize } from '../instances/mysql';
import { QueryTypes } from 'sequelize';

// Tabelas permitidas (whitelist de segurança)
const ALLOWED_TABLES = new Set([
  'carcinofauna',
  'qualidade_agua',
  'avifauna',
  'especies_exoticas',
  'macrolixo_costeira',
  'macrolixo_estuario',
  'vegetacao',
  'ictiofauna',
  'paisagem',
  'ar',
  'restinga',
  'microplastico_agua',
  'microplastico_sedimento'
]);

function isAllowed(table: string): boolean {
  return ALLOWED_TABLES.has(table);
}

function getParam(param: string | string[]): string {
  return Array.isArray(param) ? param[0] ?? '' : param;
}

/** GET /api/registros/:tabela */
export async function listar(req: Request, res: Response): Promise<Response> {
  const tabela = getParam(req.params['tabela'] ?? '');
  if (!isAllowed(tabela)) return res.status(400).json({ error: 'Tabela não permitida.' });

  try {
    const rows = await sequelize.query(
      `SELECT * FROM \`${tabela}\` ORDER BY data_coleta DESC LIMIT 1000`,
      { type: QueryTypes.SELECT },
    );
    return res.json(rows);
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: 'Erro ao consultar registros.' });
  }
}

/** POST /api/registros/:tabela */
export async function criar(req: Request, res: Response): Promise<Response> {
  const tabela = getParam(req.params['tabela'] ?? '');
  if (!isAllowed(tabela)) return res.status(400).json({ error: 'Tabela não permitida.' });

  const body = req.body as Record<string, unknown>;
  const keys = Object.keys(body);
  if (keys.length === 0) return res.status(400).json({ error: 'Corpo da requisição vazio.' });

  const cols = keys.map((k) => `\`${k}\``).join(', ');
  const placeholders = keys.map(() => '?').join(', ');
  const values = keys.map((k) => body[k]);

  try {
    const [result] = await sequelize.query(
      `INSERT INTO \`${tabela}\` (${cols}) VALUES (${placeholders})`,
      { replacements: values, type: QueryTypes.INSERT },
    );
    return res.status(201).json({ id: result, message: 'Registro criado.' });
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: 'Erro ao criar registro.' });
  }
}

/** PUT /api/registros/:tabela/:id */
export async function atualizar(req: Request, res: Response): Promise<Response> {
  const tabela = getParam(req.params['tabela'] ?? '');
  const id = getParam(req.params['id'] ?? '');
  if (!isAllowed(tabela)) return res.status(400).json({ error: 'Tabela não permitida.' });

  const body = req.body as Record<string, unknown>;
  const keys = Object.keys(body);
  if (keys.length === 0) return res.status(400).json({ error: 'Corpo da requisição vazio.' });

  const setClause = keys.map((k) => `\`${k}\` = ?`).join(', ');
  const values = [...keys.map((k) => body[k]), id];

  try {
    await sequelize.query(
      `UPDATE \`${tabela}\` SET ${setClause} WHERE id = ?`,
      { replacements: values, type: QueryTypes.UPDATE },
    );
    return res.json({ message: 'Registro atualizado.' });
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: 'Erro ao atualizar registro.' });
  }
}

/** DELETE /api/registros/:tabela/:id */
export async function remover(req: Request, res: Response): Promise<Response> {
  const tabela = getParam(req.params['tabela'] ?? '');
  const id = getParam(req.params['id'] ?? '');
  if (!isAllowed(tabela)) return res.status(400).json({ error: 'Tabela não permitida.' });

  try {
    await sequelize.query(
      `DELETE FROM \`${tabela}\` WHERE id = ?`,
      { replacements: [id], type: QueryTypes.DELETE },
    );
    return res.json({ message: 'Registro excluído.' });
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: 'Erro ao excluir registro.' });
  }
}
