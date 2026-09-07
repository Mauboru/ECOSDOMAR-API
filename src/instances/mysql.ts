import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';

dotenv.config();

export const sequelize = new Sequelize(
    process.env.MYSQL_DB as string,
    process.env.MYSQL_USER as string,
    process.env.MYSQL_PASSWORD as string,
    {
        dialect: 'mysql',
        port: parseInt(process.env.MYSQL_PORT as string),
        host: process.env.MYSQL_HOST,
        pool: {
            max: 20,
            min: 2,
            acquire: 30000,
            idle: 10000,
        },
        retry: {
            max: 3,
            match: [/ECONNRESET/, /ETIMEDOUT/, /PROTOCOL_CONNECTION_LOST/, /ECONNREFUSED/, /Connection lost/i],
        },
        logging: false,
        dialectOptions: {
            charset: 'utf8mb4',
            connectTimeout: 30000,
        },
        define: {
            charset: 'utf8mb4',
            collate: 'utf8mb4_unicode_ci'
        }
    }
);