import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import './models/associations';
import router from './routes/Routes';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.get('/', (_req, res) => {
  res.json({ message: 'ECOSDOMAR API rodando!' });
});

app.use('/api', router);

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});