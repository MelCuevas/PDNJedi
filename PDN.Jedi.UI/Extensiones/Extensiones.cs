// ---------------------------------------------------------------------------------- 
// Copyright (c) PDN
// Licensed under the MIT License
// ----------------------------------------------------------------------------------

namespace PDN.Jedi.UI.Extensiones;

public static class Extensiones
{
    /// <summary>
    /// Agrega los servicios de formulario y ADO NET context
    /// </summary>
    /// <param name="builder">Host builder</param>
    public static void AddCustomServices(this IHostBuilder builder)
    {
        builder.ConfigureServices(services =>
        {
            services.AddSingleton<AdoNetContext>();
            services.AddTransient<Form1>();
        });
    }

    /// <summary>
    /// Convierte el appsettings.json a un modelo y lo agrega como singleton
    /// </summary>
    /// <param name="builder">Host builder</param>
    /// <returns>Modelo con cadena de conexion</returns>
    public static AppSettings AddAppConfigurationWithSettings(this IHostBuilder builder)
    {
        var configuracion = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json")
            .AddEnvironmentVariables()
            .Build();

        var instance = new AppSettings();

        var value = configuracion.GetSection("AppSettings");

        value.Bind(instance);

        builder.ConfigureServices(services =>
        {
            services.AddSingleton(instance);
        });

        return instance;
    }
}