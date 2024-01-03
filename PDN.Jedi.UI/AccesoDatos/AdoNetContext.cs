// ---------------------------------------------------------------------------------- 
// Copyright (c) PDN
// Licensed under the MIT License
// ----------------------------------------------------------------------------------

namespace PDN.Jedi.UI.AccesoDatos;

public class AdoNetContext
{
    private readonly AppSettings appSettings;

    public AdoNetContext(AppSettings appSettings)
    {
        this.appSettings = appSettings;
    }

    public async Task<List<Reporte>> GetReporteAsync()
    {
        List<Reporte> result = new();
        using SqlConnection sqlConnection = new SqlConnection(appSettings.cadenaDeConexion);
        using SqlCommand command = sqlConnection.CreateCommand();

        command.CommandText = @"SELECT
m.Nombre,
IIF(m.RangoId=5 or m.RangoId=6, 'SI', 'NO') as [RangoMaestro],
IIF(p.Nombre is null, 'TEMPLO', p.Nombre) AS [SistemaEstelar]
FROM Miembros m
LEFT JOIN Planetas p ON p.Id=m.SistemaId
WHERE m.RangoId >= 5
ORDER BY m.Nombre ASC";

        await sqlConnection.OpenAsync();
        using SqlDataReader reader = await command.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(new Reporte
            {
                Nombre = reader.GetString(0),
                RangoMaestro = reader.GetString(1),
                SistemaEstelar = reader.GetString(2),
            });
        }

        return result;
    }
}