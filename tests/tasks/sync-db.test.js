const syncDB = require("../../tasks/sync-db");

describe('Pruebas en Sync-DB', () => {
    test('Debe de sincronizar la base de datos 2 veces', async () => {
        // 1. Preparación
        // 2. Estímulo
        // 3. Observar el comportamiento

        syncDB();
        const times = syncDB();
        console.log('Se llamó sync-db -->', times);

        expect(times).toBe(2);

    });
});
