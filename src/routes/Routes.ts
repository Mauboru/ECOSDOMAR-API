import { Router } from 'express';
import usuarioRoutes from './usuarioRoutes';
import authRoutes from './authRoutes';
import registrosRoutes from './registrosRoutes';

const router = Router();

router.use('/usuarios', usuarioRoutes);
router.use('/auth', authRoutes);
router.use('/registros', registrosRoutes);

export default router;