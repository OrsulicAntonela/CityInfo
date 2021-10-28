IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Cities] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL,
    CONSTRAINT [PK_Cities] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [PointOfInterest] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(50) NOT NULL,
    [CityId] int NOT NULL,
    CONSTRAINT [PK_PointOfInterest] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PointOfInterest_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [Cities] ([Id]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_PointOfInterest_CityId] ON [PointOfInterest] ([CityId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211028072537_CityInfoDBInitialMigration', N'2.1.14-servicing-32113');

GO

ALTER TABLE [PointOfInterest] ADD [Description] nvarchar(200) NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211028074939_CityInfoDBAddPoIDescription', N'2.1.14-servicing-32113');

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[Cities]'))
    SET IDENTITY_INSERT [Cities] ON;
INSERT INTO [Cities] ([Id], [Description], [Name])
VALUES (1, N'The one with that big park.', N'New York City');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[Cities]'))
    SET IDENTITY_INSERT [Cities] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[Cities]'))
    SET IDENTITY_INSERT [Cities] ON;
INSERT INTO [Cities] ([Id], [Description], [Name])
VALUES (2, N'The one with the cathedral that was never really finished.', N'Antwerp');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[Cities]'))
    SET IDENTITY_INSERT [Cities] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[Cities]'))
    SET IDENTITY_INSERT [Cities] ON;
INSERT INTO [Cities] ([Id], [Description], [Name])
VALUES (3, N'The one with that big tower.', N'Paris');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[Cities]'))
    SET IDENTITY_INSERT [Cities] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CityId', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[PointOfInterest]'))
    SET IDENTITY_INSERT [PointOfInterest] ON;
INSERT INTO [PointOfInterest] ([Id], [CityId], [Description], [Name])
VALUES (1, 1, N'The most visited urban park in the United States.', N'Central Park'),
(2, 1, N'A 102-story skyscraper located in Midtown Manhattan.', N'Empire State Building'),
(3, 2, N'A Gothic style cathedral, conceived by architects Jan and Pieter Appelmans.', N'Cathedral'),
(4, 2, N'The the finest example of railway architecture in Belgium.', N'Antwerp Central Station'),
(5, 3, N'A wrought iron lattice tower on the Champ de Mars, named after engineer Gustave Eiffel.', N'Eiffel Tower'),
(6, 3, N'The world''s largest museum.', N'The Louvre');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CityId', N'Description', N'Name') AND [object_id] = OBJECT_ID(N'[PointOfInterest]'))
    SET IDENTITY_INSERT [PointOfInterest] OFF;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211028082428_SampleData', N'2.1.14-servicing-32113');

GO

