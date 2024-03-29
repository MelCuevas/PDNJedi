CREATE DATABASE DB_Jedi
GO
USE DB_Jedi
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Especies] ADD  CONSTRAINT [PK_Especies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miembros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[EspecieId] [int] NOT NULL,
	[PlanetaOrigenId] [int] NOT NULL,
	[SistemaId] [int] NULL,
	[RangoId] [int] NOT NULL,
	[NivelDeMidiciorianos] [int] NOT NULL,
	[Edad] [int] NOT NULL,
	[InstructorId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Miembros] ADD  CONSTRAINT [PK_Miembros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Miembros]  WITH CHECK ADD  CONSTRAINT [FK_Miembros_Especies] FOREIGN KEY([EspecieId])
REFERENCES [dbo].[Especies] ([Id])
GO
ALTER TABLE [dbo].[Miembros] CHECK CONSTRAINT [FK_Miembros_Especies]
GO
ALTER TABLE [dbo].[Miembros]  WITH CHECK ADD  CONSTRAINT [FK_Miembros_Miembros] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Miembros] ([Id])
GO
ALTER TABLE [dbo].[Miembros] CHECK CONSTRAINT [FK_Miembros_Miembros]
GO
ALTER TABLE [dbo].[Miembros]  WITH CHECK ADD  CONSTRAINT [FK_Miembros_Planetas_Origen] FOREIGN KEY([PlanetaOrigenId])
REFERENCES [dbo].[Planetas] ([Id])
GO
ALTER TABLE [dbo].[Miembros] CHECK CONSTRAINT [FK_Miembros_Planetas_Origen]
GO
ALTER TABLE [dbo].[Miembros]  WITH CHECK ADD  CONSTRAINT [FK_Miembros_Planetas_Sistema] FOREIGN KEY([SistemaId])
REFERENCES [dbo].[Planetas] ([Id])
GO
ALTER TABLE [dbo].[Miembros] CHECK CONSTRAINT [FK_Miembros_Planetas_Sistema]
GO
ALTER TABLE [dbo].[Miembros]  WITH CHECK ADD  CONSTRAINT [FK_Miembros_Rangos] FOREIGN KEY([RangoId])
REFERENCES [dbo].[Rangos] ([Id])
GO
ALTER TABLE [dbo].[Miembros] CHECK CONSTRAINT [FK_Miembros_Rangos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planetas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Planetas] ADD  CONSTRAINT [PK_Planetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rangos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rangos] ADD  CONSTRAINT [PK_Rangos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
