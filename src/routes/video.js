const express = require('express');
const router = express.Router();

const { db } = require('../firebase');


// ===============================
// LISTAR TODOS OS VÍDEOS
// ===============================

router.get('/', async (req, res) => {

    try {

        const snapshot = await db
            .collection('video')
            .get();

        const videos = snapshot.docs.map(doc => ({
            id: doc.id,
            ...doc.data()
        }));

        res.json(videos);

    } catch (error) {

        console.error(error);

        res.status(500).json({
            erro: 'Erro ao buscar vídeos'
        });
    }
});


// ===============================
// BUSCAR UM VÍDEO
// ===============================

router.get('/:id', async (req, res) => {

    try {

        const doc = await db
            .collection('video')
            .doc(req.params.id)
            .get();

        if (!doc.exists) {

            return res.status(404).json({
                erro: 'Vídeo não encontrado'
            });

        }

        res.json({
            id: doc.id,
            ...doc.data()
        });

    } catch (error) {

        console.error(error);

        res.status(500).json({
            erro: 'Erro ao buscar vídeo'
        });
    }
});


// ===============================
// CADASTRAR VÍDEO
// ===============================

router.post('/', async (req, res) => {

    try {

        const {
            titulo,
            categoria,
            url,
            pessoaSinal
        } = req.body;


        if (!titulo || !categoria || !url) {

            return res.status(400).json({
                erro: 'Título, categoria e URL são obrigatórios'
            });

        }


        const novoVideo = {

            titulo,
            categoria,
            url,
            pessoaSinal: pessoaSinal || '',
            criadoEm: new Date().toISOString()

        };


        const doc = await db
            .collection('video')
            .add(novoVideo);


        res.status(201).json({

            mensagem: 'Vídeo cadastrado com sucesso',

            id: doc.id,

            ...novoVideo

        });


    } catch (error) {

        console.error(error);

        res.status(500).json({
            erro: 'Erro ao cadastrar vídeo'
        });

    }

});


// ===============================
// EDITAR VÍDEO
// ===============================

router.put('/:id', async (req, res) => {

    try {

        const {
            titulo,
            categoria,
            url,
            pessoaSinal
        } = req.body;


        const videoRef = db
            .collection('video')
            .doc(req.params.id);


        const doc = await videoRef.get();


        if (!doc.exists) {

            return res.status(404).json({
                erro: 'Vídeo não encontrado'
            });

        }


        await videoRef.update({

            titulo,
            categoria,
            url,
            pessoaSinal

        });


        res.json({

            mensagem: 'Vídeo atualizado com sucesso'

        });


    } catch (error) {

        console.error(error);

        res.status(500).json({

            erro: 'Erro ao atualizar vídeo'

        });

    }

});


// ===============================
// EXCLUIR VÍDEO
// ===============================

router.delete('/:id', async (req, res) => {

    try {

        const videoRef = db
            .collection('video')
            .doc(req.params.id);


        const doc = await videoRef.get();


        if (!doc.exists) {

            return res.status(404).json({

                erro: 'Vídeo não encontrado'

            });

        }


        await videoRef.delete();


        res.json({

            mensagem: 'Vídeo excluído com sucesso'

        });


    } catch (error) {

        console.error(error);

        res.status(500).json({

            erro: 'Erro ao excluir vídeo'

        });

    }

});


module.exports = router;