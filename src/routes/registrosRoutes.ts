import { Router } from 'express';
import * as registrosController from '../controllers/registrosController';

const router = Router();

// GET    /api/registros/:tabela
router.get('/:tabela', registrosController.listar);
// POST   /api/registros/:tabela
router.post('/:tabela', registrosController.criar);
// PUT    /api/registros/:tabela/:id
router.put('/:tabela/:id', registrosController.atualizar);
// DELETE /api/registros/:tabela/:id
router.delete('/:tabela/:id', registrosController.remover);

export default router;
