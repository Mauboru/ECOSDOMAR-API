const { admin } = require('../firebase');

async function verificarUsuario(req, res, next) {
    try {
        const token = req.headers.authorization;
        if (!token) {
            return res.status(401).json({
                erro: 'Token não informado'
            });
        }
        const idToken = token.replace('Bearer ', '');
        const usuario = await admin
            .auth()
            .verifyIdToken(idToken);
        req.usuario = usuario;
        next();

    } catch (error) {
        return res.status(401).json({
            erro: 'Usuário não autorizado'
        });
    }
}

module.exports = verificarUsuario;