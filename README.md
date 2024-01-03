# Prueba técnica PDN

![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white) ![C# Badge](https://img.shields.io/badge/C%23-512BD4?logo=csharp&logoColor=fff&style=for-the-badge) ![Microsoft SQL Server Badge](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?logo=microsoftsqlserver&logoColor=fff&style=for-the-badge)

### 👩‍💻 Melissa Cuevas - DotNet Developer

| Características     | Supported |
| :------------------ | --------- |
| .NET 8.0            | ✅        |
| C# 12               | ✅        |
| SQL Server          | ✅        |
| Entity Framework    | ✅        |
| Javascript / JQuery | ✅        |
| CSS / Bootstrap     | ✅        |
| MVC                 | ✅        |
| Windows Forms       | ✅        |

## Instrucciones

> 💡 La base de datos esta hosteada en Azure SQL, no es necesario tomar ninguna acción relacionada a la base de datos. Los scripts se encuentran adjuntados en éste repositorio.

1. Clonar el proyecto en tu computadora
2. Usar Visual Studio 2022 y abrir la solución `PDN.Jedi`
3. El proyecto de inicio debe estar por default en `PDN.Jedi.UI`
4. Ejecutar el proyecto

### Que se incluye como buenas prácticas?

- Adaptación de Azure cloud computing (Azure SQL)
- ADO NET para ejecución de consulta SQL
- Seguimiento a buenas prácticas y estándares como SOLID principles.
- XML tags para documentación de métodos de bajo nivel

### Consulta ejecutada para obtener el reporte JEDI:

```sql
SELECT
m.Nombre,
IIF(m.RangoId=5 or m.RangoId=6, 'SI', 'NO') as [RangoMaestro],
IIF(p.Nombre is null, 'TEMPLO', p.Nombre) AS [SistemaEstelar]
FROM Miembros m
LEFT JOIN Planetas p ON p.Id=m.SistemaId
WHERE m.RangoId >= 5
ORDER BY m.Nombre ASC
```
