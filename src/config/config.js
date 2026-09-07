const dotenv = require("dotenv");
const path = require("path");

const rootEnv = path.resolve(__dirname, "../../.env");
const srcEnv = path.resolve(__dirname, "../.env");
const cwdEnv = path.resolve(process.cwd(), ".env");
dotenv.config({ path: rootEnv });
dotenv.config({ path: srcEnv });
dotenv.config({ path: cwdEnv });

module.exports = {
  development: {
    username: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DB,
    host: process.env.MYSQL_HOST,
    port: process.env.MYSQL_PORT,
    dialect: "mysql"
  },
  test: {
    username: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: "gymia_test",
    host: process.env.MYSQL_HOST,
    port: process.env.MYSQL_PORT,
    dialect: "mysql",
    logging: false
  },
  production: {
    username: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DB,
    host: process.env.MYSQL_HOST,
    port: process.env.MYSQL_PORT,
    dialect: "mysql"
  }
};