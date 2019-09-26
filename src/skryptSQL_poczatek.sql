CREATE TABLE  Administracja (
[Id] [int] Primary Key NOT NULL,
[CzySledzenieKuriera] [bit] NOT NULL,
[CzyRezerwacja] [bit] NOT NULL
)

CREATE TABLE  Cena (
[Id] [int] Primary Key IDENTITY(1, 1) NOT NULL,
[Rodzaj] [nchar](50) NOT NULL,
[CzyPodstawowa] [bit] NOT NULL,
[ProduktId] [int] NOT NULL,
[Kod] [nvarchar](30) NOT NULL
)

CREATE TABLE DzienTygodnia (
[Id] [int] Primary Key NOt NULL,
[Nazwa] [nvarchar](100) NOT NULL,
[Kod] [nvarchar](100) NOT NULL,
)

CREATE TABLE LG_Godziny (
[Id] [int] Primary Key NOt NULL,
[Kod] [nvarchar](100),
[CzasStart] [time] NOT NULL,
[CzasStop] [time] NOT NULL,
[ProfilLGId] [time] NOT NULL,
[DzienTygodniaId] [int] NOT NULL,
[CzySpecjalne] [bit] NOT NULL,
[DataUtworzenia] [datetime] NOT NULL,
[CzyDzienPracujacy] [bit] NOT NULL,
[RodzajZamowieniaId] [int] NOT NULL
)

CREATE TABLE Menu (
[Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
[ProfilLGId] [int] NOT NULL,
[Nazwa] [nvarchar](100) NOT NULL,
[Opis] [nvarchar](300) NULL,
[CzyWidoczne] [bit] NOT NULL,
)