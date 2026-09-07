const { createDefaultPreset } = require("ts-jest");

const tsJestTransformCfg = createDefaultPreset().transform;

/** @type {import("jest").Config} **/
module.exports = {
  testEnvironment: "node",
  transform: {
    ...tsJestTransformCfg,
  },
  // Mock de módulos que usam ESM puro (import.meta.url) e não podem ser transformados
  moduleNameMapper: {
    '^expo-server-sdk$': '<rootDir>/src/tests/__mocks__/expo-server-sdk.ts',
  },
  testMatch: ['**/tests/**/*.test.ts'],
  testTimeout: 15000,
  collectCoverageFrom: [
    'src/controllers/**/*.ts',
    'src/services/**/*.ts',
    '!src/**/*.d.ts',
  ],
  coverageReporters: ['text', 'lcov', 'html'],
  coverageDirectory: 'coverage',
  verbose: true,
};