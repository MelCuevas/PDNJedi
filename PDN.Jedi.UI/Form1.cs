// ---------------------------------------------------------------------------------- 
// Copyright (c) PDN
// Licensed under the MIT License
// ----------------------------------------------------------------------------------

namespace PDN.Jedi.UI;

public partial class Form1 : Form
{
    private readonly AdoNetContext adoNetContext;

    public Form1(AdoNetContext adoNetContext)
    {
        InitializeComponent();

        this.adoNetContext = adoNetContext;
    }

    /// <summary>
    /// Carga el formulario y obtiene los datos con ADO NET para cargar el data grid
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private async void Form1_Load(object sender, EventArgs e)
    {
        var data = await adoNetContext.GetReporteAsync();

        dataTable.DataSource = data;
    }
}