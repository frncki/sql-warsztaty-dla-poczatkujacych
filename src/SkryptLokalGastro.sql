CREATE TABLE [dbo].[Administracja](
        [Id] [int] PRIMARY KEY NOT NULL,
        [CzySledzenieKuriera] [bit] NOT NULL,
        [CzyRezerwacja] [bit] NOT NULL
)
 
CREATE TABLE [dbo].[Cena](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [Rodzaj] [nchar](50) NULL,
        [Cena] [decimal] NOT NULL,
        [CzyPodstawowa] [bit] NOT NULL,
        [ProduktId] [int] NOT NULL,
        [Kod] [nvarchar](32) NOT NULL
)
 
CREATE TABLE [dbo].[Dzien_Tygodnia](
        [Id] [int] PRIMARY KEY NOT NULL,
        [Nazwa] [nvarchar](100) NOT NULL,
        [Kod] [nvarchar](100) NOT NULL
)
 
CREATE TABLE [dbo].[LG_Godziny](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [Kod] [nvarchar](100) NULL,
        [CzasStart] [time](7) NOT NULL,
        [CzasStop] [time](7) NOT NULL,
        [ProfilLGId] [int] NOT NULL,
        [DzienTygodniaId] [int] NOT NULL,
        [CzySpecjalne] [bit] NOT NULL,
        [DataUtworzenia] [datetime] NOT NULL,
        [CzyDzienPracujacy] [bit] NOT NULL,
        [RodzajZamowieniaId] [int] NOT NULL
)
 
CREATE TABLE [dbo].[Menu](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [ProfilLGId] [int] NOT NULL,
        [Nazwa] [nvarchar](100) NOT NULL,
        [Opis] [nvarchar](300) NULL,
        [CzyWidoczne] [bit] NOT NULL
)
 
CREATE TABLE [dbo].[Menu_Godziny](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [CzasStart] [datetime] NOT NULL,
        [CzasStop] [datetime] NOT NULL,
        [MenuId] [int] NOT NULL,
        [DzienTygodniaId] [int] NOT NULL
)
 
CREATE TABLE [dbo].[Produkt](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [CzyZablokowany] [bit] NOT NULL,
        [Nazwa] [nvarchar](100) NOT NULL,
        [Kod] [nvarchar](100) NOT NULL,
        [DostepnaIlosc] [int] NOT NULL,
        [Opis] [nvarchar](300) NOT NULL,
        [FotoUrl] [nvarchar](100) NOT NULL,
        [CzasRealizacji] [int] NOT NULL,
        [ProfilLGId] [int] NOT NULL
)
 
CREATE TABLE [dbo].[Produkt_Grupa](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [Nazwa] [nvarchar](50) NOT NULL,
        [Opis] [nvarchar](200) NULL,
        [Kod] [nvarchar](50) NULL,
        [FotoUrl] [nvarchar](100) NOT NULL
)
 
CREATE TABLE [dbo].[ProduktGrupa_Menu](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [MenuId] [int] NOT NULL,
        [ProduktGrupaId] [int] NOT NULL
)
 
CREATE TABLE [dbo].[Profil_LG](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [Nazwa] [nvarchar](100) NOT NULL,
        [DodatkoweInformacje] [nvarchar](500) NOT NULL,
        [MinimalnaWartoscZamowienia] [decimal] NOT NULL,
        [CzyDostawa] [int] NOT NULL,
        [Telefon] [nvarchar](50) NULL,
        [Opis] [nvarchar](300) NULL,
        [ZasiegDostawy] [decimal] NULL,
        [FotoUrl] [nvarchar](100) NOT NULL,
        [UzytkownikId] [int] NULL,
        [KosztDostawy] [decimal] NULL,
        [SredniCzasRealizacji] [decimal] NOT NULL,
        [AdministracjaId] [int] NOT NULL,
        [RezerwacjaCzas] [int] NULL,
        [RezerwacjaProcentDostepnosci] [int] NULL,
        [StanKasy] [decimal] NOT NULL
)
 
CREATE TABLE [dbo].[Promocja](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [Nazwa] [nvarchar](200) NOT NULL,
        [Kod] [nvarchar](100) NOT NULL,
        [CzyZablokowana] [bit] NOT NULL,
        [CzasStart] [datetime] NOT NULL,
        [CzasStop] [datetime] NOT NULL,
        [ProfilLGId] [int] NOT NULL,
        [Opis] [nvarchar](300) NULL,
        [Kwota] [decimal] NULL,
        [Procent] [decimal] NULL,
        [CzyCalyLokal] [bit] NOT NULL,
        [CzyWLokalu] [bit] NOT NULL,
        [FotoUrl] [nvarchar](100) NOT NULL
)
 
CREATE TABLE [dbo].[Promocja_DzienTygodnia](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [DzienTygodniaId] [int] NULL,
        [PromocjaId] [int] NULL,
        [CzasStart] [datetime] NULL,
        [CzasStop] [datetime] NULL
)
 
CREATE TABLE [dbo].[Promocja_Menu](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [PromocjaId] [int] NOT NULL,
        [MenuId] [int] NOT NULL
)
 
CREATE TABLE [dbo].[Promocja_Produkt](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [PromocjaId] [int] NOT NULL,
        [ProduktId] [int] NOT NULL
)
 
CREATE TABLE [dbo].[Promocja_ProduktGrupa](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [PromocjaId] [int] NOT NULL,
        [ProduktGrupaId] [int] NOT NULL
)
 
CREATE TABLE [dbo].[Slownik_RodzajZamowienia](
        [Id] [int] PRIMARY KEY NOT NULL,
        [Kod] [nvarchar](100) NOT NULL,
        [Nazwa] [nvarchar](100) NOT NULL,
        [CzyZablokowany] [bit] NOT NULL
)
 
CREATE TABLE [dbo].[Uzytkownik](
        [Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
        [Imie] [nvarchar](100) NOT NULL,
        [Nazwisko] [nvarchar](100) NOT NULL,
        [Email] [nchar](50) NOT NULL,
        [Telefon] [nvarchar](50) NOT NULL,
        [FotoUrl] [nvarchar](100) NOT NULL,
        [CzyZablokowany] [int] NOT NULL,
        [PracodawcaLG] [int] NULL,
        [RolaId] [int] NOT NULL
)
 
CREATE TABLE [dbo].[UzytkownikRola](
        [Id] [int] PRIMARY KEY NOT NULL,
        [Nazwa] [nvarchar](30) NOT NULL,
        [Kod] [nvarchar](30) NOT NULL,
)

ALTER TABLE Cena
ADD CONSTRAINT [FK_Cena_Produkt]
FOREIGN KEY (ProduktId)
REFERENCES Produkt(Id)

ALTER TABLE LG_Godziny
ADD CONSTRAINT [FK_LG_Godziny_Dzien_Tygodnia]
FOREIGN KEY (DzienTygodniaId)
REFERENCES Dzien_Tygodnia(Id)

ALTER TABLE LG_Godziny
ADD CONSTRAINT [FK_LG_Godziny_Profil_LG]
FOREIGN KEY (ProfilLGId)
REFERENCES Profil_LG(Id)

--|Wiązanie obowiązujących godzin z konkretnym rodzajem zamówienia|--
ALTER TABLE [dbo].[LG_Godziny]  WITH CHECK ADD  CONSTRAINT [FK_LG_Godziny_Slownik_RodzajZamowienia] FOREIGN KEY([RodzajZamowieniaId])
REFERENCES [dbo].[Slownik_RodzajZamowienia] ([Id])
GO
--|Wiązanie Menu z lokalem gastronomicznym|--
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Profil_LG] FOREIGN KEY([ProfilLGId])
REFERENCES [dbo].[Profil_LG] ([Id])
GO
--|Wiązanie godzin obowiązywania danego menu z konkretnym dniem tygodnia|--
ALTER TABLE [dbo].[Menu_Godziny]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Godziny_Dzien_Tygodnia] FOREIGN KEY([DzienTygodniaId])
REFERENCES [dbo].[Dzien_Tygodnia] ([Id])
GO
--|Wiązanie godzin obowiązywania menu z konkretnym menu|--
ALTER TABLE [dbo].[Menu_Godziny]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Godziny_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
--|Wiązanie produktów z konkretnym lokalem gastronomicznym|--
ALTER TABLE [dbo].[Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Produkt_Profil_LG] FOREIGN KEY([ProfilLGId])
REFERENCES [dbo].[Profil_LG] ([Id])
GO
--|Wiązanie grupy produktów z konkretnym menu - wiele do wielu - tabela pośrednia|--
ALTER TABLE [dbo].[ProduktGrupa_Menu]  WITH CHECK ADD  CONSTRAINT [FK_ProduktGrupa_Menu_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
--|Wiązanie takie jak wyżej dla grupy menu - wiele do wielu - tabela pośrednia|--
ALTER TABLE [dbo].[ProduktGrupa_Menu]  WITH CHECK ADD  CONSTRAINT [FK_ProduktGrupa_Menu_Produkt_Grupa] FOREIGN KEY([ProduktGrupaId])
REFERENCES [dbo].[Produkt_Grupa] ([Id])
GO
--|Wiązanie lokalu gastronomicznego z danymi administracyjnymi|--
ALTER TABLE [dbo].[Profil_LG]  WITH CHECK ADD  CONSTRAINT [FK_Profil_LG_Administracja] FOREIGN KEY([AdministracjaId])
REFERENCES [dbo].[Administracja] ([Id])
GO
--|Wiązanie lokalu gastronomicznego z użytkownikami systemu|--
ALTER TABLE [dbo].[Profil_LG]  WITH CHECK ADD  CONSTRAINT [FK_Profil_LG_Uzytkownik] FOREIGN KEY([UzytkownikId])
REFERENCES [dbo].[Uzytkownik] ([Id])
GO
--|Wiązanie promocja z lokalem gastronomicznym|--
ALTER TABLE [dbo].[Promocja]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_Profil_LG] FOREIGN KEY([ProfilLGId])
REFERENCES [dbo].[Profil_LG] ([Id])
GO
--|Wiązanie typu promocji Dzien Tygodnia z dniem tygodnia (słownikiem)|--
ALTER TABLE [dbo].[Promocja_DzienTygodnia]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_DzienTygodnia_Dzien_Tygodnia] FOREIGN KEY([DzienTygodniaId])
REFERENCES [dbo].[Dzien_Tygodnia] ([Id])
GO
--|Wiązanie typu promocji Dzien Tygodnia z Promocją|--
ALTER TABLE [dbo].[Promocja_DzienTygodnia]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_DzienTygodnia_Promocja] FOREIGN KEY([PromocjaId])
REFERENCES [dbo].[Promocja] ([Id])
GO
--|Wiązanie typu promocji Menu z konkretnym Menu|--
ALTER TABLE [dbo].[Promocja_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_Menu_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
--|Wiązanie typu promocji Menu z Promocją|--
ALTER TABLE [dbo].[Promocja_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_Menu_Promocja] FOREIGN KEY([PromocjaId])
REFERENCES [dbo].[Promocja] ([Id])
GO
--|Wiązanie typu promocji Produkt z konkretnym Produktem|--
ALTER TABLE [dbo].[Promocja_Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_Produkt_Produkt] FOREIGN KEY([ProduktId])
REFERENCES [dbo].[Produkt] ([Id])
GO
--|Wiązanie typu promocji Produkt z Promocją|--
ALTER TABLE [dbo].[Promocja_Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_Produkt_Promocja] FOREIGN KEY([PromocjaId])
REFERENCES [dbo].[Promocja] ([Id])
GO
--|Wiązanie typu promocji Grupa Produktów z Grupą produktów|--
ALTER TABLE [dbo].[Promocja_ProduktGrupa]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_ProduktGrupa_Produkt_Grupa] FOREIGN KEY([ProduktGrupaId])
REFERENCES [dbo].[Produkt_Grupa] ([Id])
GO
--|Wiązanie typu promocji Grupa Produktów z Promocją|--
ALTER TABLE [dbo].[Promocja_ProduktGrupa]  WITH CHECK ADD  CONSTRAINT [FK_Promocja_ProduktGrupa_Promocja] FOREIGN KEY([PromocjaId])
REFERENCES [dbo].[Promocja] ([Id])
GO
--|Wiązanie Użytkownika z lokalem gastronomicznym w celu ustalenia pracodawcy|--
ALTER TABLE [dbo].[Uzytkownik]  WITH CHECK ADD  CONSTRAINT [FK_Uzytkownik_Profil_LG] FOREIGN KEY([PracodawcaLG])
REFERENCES [dbo].[Profil_LG] ([Id])
GO
--|Wiązanie Użytkownika z rolą, którą pełni|--
ALTER TABLE [dbo].[Uzytkownik]  WITH CHECK ADD  CONSTRAINT [FK_Uzytkownik_UzytkownikRola] FOREIGN KEY([RolaId])
REFERENCES [dbo].[UzytkownikRola] ([Id])
GO

--UZUPELNIANIE DANYMI
--|Tworzenie rol uzytkownikow|--

INSERT INTO UzytkownikRola
VALUES (1,'Administrator Lokalu','Admin'),
(2, N'Kurier', 'Courier'),
(3, N'Lokal Gastronomiczny', 'Lg'),
(4, N'Personel Lokalu', 'LgStaff'),
(5, N'Administrator Systemu', 'SystemAdmin'),
(6, N'Uzytkownik', 'User'),
(7, N'Kelner', 'Waiter')

--|Dodanie testowego użytkownika systemu|--
INSERT INTO dbo.Uzytkownik
VALUES ('Adam', N'Właściciel', 'adam@wlasciciel.com', '123456789', 'http://serwer.zdjecie123.jpg', 0, null, 5)
GO
--|Dodanie informacji administracyjnych o lokalu|--
INSERT INTO dbo.Administracja
VALUES (1,1,1)
GO
--|Dodanie nowego testowego lokalu gastronomicznego|--
INSERT INTO dbo.Profil_LG
VALUES (N'At Home Restaurant', 'Lokal gastronomiczny', 20, 1, '123456789', N'Rodzinna restauracja dla małych i tych większych, jednym słowem - dla wszystkich!', 10, 'http://serwer.zdjecie123.jpg', (select Id from dbo.Uzytkownik where Nazwisko = N'Właściciel'), 5, 45, 1, 90, 50, 10000)
GO
--|Wypełnienie tabeli słownikowej - Dni Tygodnia|--
INSERT INTO dbo.Dzien_Tygodnia(Id, Nazwa, Kod) VALUES
(1, N'Poniedziałek', 'Monday'), (2, N'Wtorek', 'Tuesday'),(3, N'Środa', 'Wednesday'),(4, N'Czwartek', 'Thursday'),(5, N'Piątek', 'Friday'),(6, N'Sobota', 'Saturday'),(7, N'Niedziela', 'Sunday')
GO
--|Wypełnienie tabeli słownikowej - Rodzaje Zamówień|--
INSERT INTO dbo.Slownik_RodzajZamowienia(Id, Kod, Nazwa, CzyZablokowany) VALUES
(1, 'IN_LG', N'Na miejscu', 0), (2, 'PREORDER', N'Pre-Order', 0),(3, 'DELIVERY', N'Dostawa', 0),(4, 'TAKEAWAY', N'Na wynos', 0)
GO
--|Wypełnienie tabeli Menu przykładowymi rodzajami menu|--
INSERT INTO dbo.Menu
VALUES ((select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'Poranne', N'Menu poranne/śniadaniowe', 1)
GO
--|Wypełnienie tabeli LG_Godziny przykładowymi godzinami otwarcia lokalu|--
--|Poniedziałek|--
INSERT INTO dbo.LG_Godziny
VALUES ('mn1', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Monday'), 0, GETDATE(), 1, 1)
INSERT INTO dbo.LG_Godziny
VALUES ('mn2', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Monday'), 0, GETDATE(), 1, 2)
INSERT INTO dbo.LG_Godziny
VALUES ('mn3', '12:00:00.0000000', '20:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Monday'), 0, GETDATE(), 1, 3)
INSERT INTO dbo.LG_Godziny
VALUES ('mn4', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Monday'), 0, GETDATE(), 1, 4)
GO
--|Wypełnienie tabeli Menu_Godziny przykładowymi godzinami obowiązywania danego menu w poszczególnych dniach|--
INSERT INTO dbo.Menu_Godziny
VALUES ('2015-12-21 10:00:00.000', '2015-12-21 13:00:00.000', 1, 1), ('2015-12-21 10:00:00.000', '2015-12-21 13:00:00.000', 1, 2), ('2015-12-21 10:00:00.000', '2015-12-21 13:00:00.000', 1, 3), ('2015-12-21 10:00:00.000', '2015-12-21 13:00:00.000', 1, 4), ('2015-12-21 10:00:00.000', '2015-12-21 13:00:00.000', 1, 5), ('2015-12-21 12:00:00.000', '2015-12-21 13:00:00.000', 1, 6), ('2015-12-21 12:00:00.000', '2015-12-21 13:00:00.000', 1, 7)
GO
--|Dodanie przykładowych grup produktów do tabeli Produkt_Grupa|--
INSERT INTO dbo.Produkt_Grupa
VALUES (N'Sałatki', N'Różne rodzaje sałatek', 'salad', 'http://serwer.zdjecieSalatka.jpg'), (N'Dodatki', N'Dodatki do dań', 'addition', 'http://serwer.zdjecieDodatki.jpg'), (N'Zupy', N'Różne rodzaj zup domowych', 'soup', 'http://serwer.zdjecieZupa.jpg'), (N'Dania główne', N'Zestawy obiadowe', 'mainDish', 'http://serwer.zdjecieDanieGlowne.jpg'), (N'Śniadania', N'Zestawy śniadaniowe', 'breakfast', 'http://serwer.zdjecieSniadanie.jpg'), (N'Kanapki', N'Świeże kanapki i tosty', 'sandwich', 'http://serwer.zdjecieKanapka.jpg')
GO
--|Przypisanie grup produktów dla poszczególnych menu|--
--|Menu poranne|--
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = 'Poranne'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Sałatki'))
GO
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = 'Poranne'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Śniadania'))
GO
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = 'Poranne'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Kanapki'))
GO
--|Dodanie testowych produktów do tabeli Produkt|--
--|Kategoria Sałatki|--
INSERT INTO dbo.Produkt
VALUES (0, N'Sałatka z kurczakiem', 'salad', 100, N'Świeża sałatka z kurczakiem i dodatkami', 'http://serwer.zdjecieSalatka1.jpg', 15, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
--|Dodanie cen/opcji cenowych dla poszczególnych produktów w tabeli Cena|--
--|Kategoria Sałatki|--
INSERT INTO dbo.Cena
VALUES (N'Mała', 10, 0, (select Id from dbo.Produkt where Nazwa = N'Sałatka z kurczakiem'), 'salad1')
GO
INSERT INTO dbo.Cena
VALUES (N'Duża', 18, 0, (select Id from dbo.Produkt where Nazwa = N'Sałatka z kurczakiem'), 'salad2')
GO
--|Dodanie nowych testowych promocji do tabeli Promocja|--
--|Promocja - Dzień Tygodnia|--
INSERT INTO dbo.Promocja
VALUES (N'Poniedziałki stałego klienta', 'promotion1', 0, '2015-12-21 15:00:00.000', '2016-02-01 17:00:00.000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'20% zniżki w poniedziałki (15:00-17:00) dla osób posiadajacych kartę stałego klienta', null, 20, 1, 1, 'http://serwer.zdjeciePromocja1.jpg')
GO
 
--|Wypełnienie tabeli Menu przykładowymi rodzajami menu|--
INSERT INTO dbo.Menu
VALUES ((select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'Popołudniowe', N'Menu popołudniowe/lunch/brunch', 1)
INSERT INTO dbo.Menu
VALUES ((select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'Wieczorne', N'Menu wieczorne/kolacja', 1)
--|Wypełnienie tabeli LG_Godziny przykładowymi godzinami otwarcia lokalu|--
--|Wtorek|--
INSERT INTO dbo.LG_Godziny
VALUES ('tu1', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Tuesday'), 0, GETDATE(), 1, 1)
INSERT INTO dbo.LG_Godziny
VALUES ('tu2', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Tuesday'), 0, GETDATE(), 1, 2)
INSERT INTO dbo.LG_Godziny
VALUES ('tu3', '12:00:00.0000000', '20:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Tuesday'), 0, GETDATE(), 1, 3)
INSERT INTO dbo.LG_Godziny
VALUES ('tu4', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Tuesday'), 0, GETDATE(), 1, 4)
GO
--|Środa|--
INSERT INTO dbo.LG_Godziny
VALUES ('we1', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Wednesday'), 0, GETDATE(), 1, 1)
INSERT INTO dbo.LG_Godziny
VALUES ('we2', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Wednesday'), 0, GETDATE(), 1, 2)
INSERT INTO dbo.LG_Godziny
VALUES ('we3', '12:00:00.0000000', '20:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Wednesday'), 0, GETDATE(), 1, 3)
INSERT INTO dbo.LG_Godziny
VALUES ('we4', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Wednesday'), 0, GETDATE(), 1, 4)
GO
--|Czwartek|--
INSERT INTO dbo.LG_Godziny
VALUES ('th1', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Thursday'), 0, GETDATE(), 1, 1)
INSERT INTO dbo.LG_Godziny
VALUES ('th2', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Thursday'), 0, GETDATE(), 1, 2)
INSERT INTO dbo.LG_Godziny
VALUES ('th3', '12:00:00.0000000', '20:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Thursday'), 0, GETDATE(), 1, 3)
INSERT INTO dbo.LG_Godziny
VALUES ('th4', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Thursday'), 0, GETDATE(), 1, 4)
GO
--|Piątek|--
INSERT INTO dbo.LG_Godziny
VALUES ('fr1', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Friday'), 0, GETDATE(), 1, 1)
INSERT INTO dbo.LG_Godziny
VALUES ('fr2', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Friday'), 0, GETDATE(), 1, 2)
INSERT INTO dbo.LG_Godziny
VALUES ('fr3', '12:00:00.0000000', '20:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Friday'), 0, GETDATE(), 1, 3)
INSERT INTO dbo.LG_Godziny
VALUES ('fr4', '10:00:00.0000000', '22:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Friday'), 0, GETDATE(), 1, 4)
GO
--|Sobota|--
INSERT INTO dbo.LG_Godziny
VALUES ('sa1', '12:00:00.0000000', '21:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Saturday'), 0, GETDATE(), 1, 1)
INSERT INTO dbo.LG_Godziny
VALUES ('sa2', '12:00:00.0000000', '21:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Saturday'), 0, GETDATE(), 1, 2)
INSERT INTO dbo.LG_Godziny
VALUES ('sa3', '12:00:00.0000000', '20:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Saturday'), 0, GETDATE(), 1, 3)
INSERT INTO dbo.LG_Godziny
VALUES ('sa4', '12:00:00.0000000', '21:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Saturday'), 0, GETDATE(), 1, 4)
GO
--|Niedziela|--
INSERT INTO dbo.LG_Godziny
VALUES ('su1', '12:00:00.0000000', '21:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Sunday'), 0, GETDATE(), 1, 1)
INSERT INTO dbo.LG_Godziny
VALUES ('su2', '12:00:00.0000000', '21:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Sunday'), 0, GETDATE(), 1, 2)
INSERT INTO dbo.LG_Godziny
VALUES ('su3', '12:00:00.0000000', '20:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Sunday'), 0, GETDATE(), 1, 3)
INSERT INTO dbo.LG_Godziny
VALUES ('su4', '12:00:00.0000000', '21:00:00.0000000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), (select Id from dbo.Dzien_Tygodnia where Kod = 'Sunday'), 0, GETDATE(), 1, 4)
GO
--|Wypełnienie tabeli Menu_Godziny przykładowymi godzinami obowiązywania danego menu w poszczególnych dniach|--
INSERT INTO dbo.Menu_Godziny
VALUES ('2015-12-21 13:00:00.000', '2015-12-21 17:00:00.000', 2, 1), ('2015-12-21 13:00:00.000', '2015-12-21 17:00:00.000', 2, 2), ('2015-12-21 13:00:00.000', '2015-12-21 17:00:00.000', 2, 3), ('2015-12-21 13:00:00.000', '2015-12-21 17:00:00.000', 2, 4), ('2015-12-21 13:00:00.000', '2015-12-21 17:00:00.000', 2, 5), ('2015-12-21 13:00:00.000', '2015-12-21 17:00:00.000', 2, 6), ('2015-12-21 13:00:00.000', '2015-12-21 17:00:00.000', 2, 7)
GO
INSERT INTO dbo.Menu_Godziny
VALUES ('2015-12-21 17:00:00.000', '2015-12-21 22:00:00.000', 3, 1), ('2015-12-21 17:00:00.000', '2015-12-21 22:00:00.000', 3, 2), ('2015-12-21 17:00:00.000', '2015-12-21 22:00:00.000', 3, 3), ('2015-12-21 17:00:00.000', '2015-12-21 22:00:00.000', 3, 4), ('2015-12-21 17:00:00.000', '2015-12-21 22:00:00.000', 3, 5), ('2015-12-21 17:00:00.000', '2015-12-21 21:00:00.000', 3, 6), ('2015-12-21 17:00:00.000', '2015-12-21 21:00:00.000', 3, 7)
GO
--|Przypisanie grup produktów dla poszczególnych menu|--
--|Menu popołudniowe|--
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = N'Popołudniowe'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Sałatki'))
GO
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = N'Popołudniowe'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Dodatki'))
GO
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = N'Popołudniowe'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Kanapki'))
GO
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = N'Popołudniowe'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Zupy'))
GO
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = N'Popołudniowe'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Dania główne'))
GO
--|Menu wieczorne|--
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = 'Wieczorne'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Sałatki'))
GO
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = 'Wieczorne'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Dania główne'))
GO
INSERT INTO dbo.ProduktGrupa_Menu
VALUES ((select Id from dbo.Menu where Nazwa = 'Wieczorne'), (select Id from dbo.Produkt_Grupa where Nazwa = N'Dodatki'))
GO
--|Dodanie testowych produktów do tabeli Produkt|--
--|Kategoria Sałatki|--
 
INSERT INTO dbo.Produkt
VALUES (0, N'Sałatka z tuńczykiem', 'salad', 100, N'Świeża sałatka z tuńczykiem i dodatkami', 'http://serwer.zdjecieSalatka2.jpg', 20, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Sałatka z łososiem', 'salad', 100, N'Świeża sałatka z łososiem i dodatkami', 'http://serwer.zdjecieSalatka3.jpg', 20, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Sałatka z serem feta', 'salad', 100, N'Świeża sałatka bez dodatku mięsa', 'http://serwer.zdjecieSalatka4.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
--|Kategoria Zupy|--
INSERT INTO dbo.Produkt
VALUES (0, N'Zupa pomidorowa', 'soup', 100, N'Domowa zupa pomidorowa z makaronem', 'http://serwer.zdjecieZupa1.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Zupa ogórkowa', 'soup', 100, N'Domowa zupa ogórkowa', 'http://serwer.zdjecieZupa2.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Zupa pieczarkowa', 'soup', 100, N'Domowa zupa pieczarkowa', 'http://serwer.zdjecieZupa3.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Żurek', 'soup', 100, N'Żurek z kiełbasa i jajkiem', 'http://serwer.zdjecieZupa4.jpg', 15, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
--|Kategoria Dania Główne|--
INSERT INTO dbo.Produkt
VALUES (0, N'Kotlet schabowy', 'mainDish', 100, N'Świeży kotlet ze schabu (dodatki opcjonalnie)', 'http://serwer.zdjecieDanie1.jpg', 20, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Kotlet z piersi kurczaka', 'mainDish', 100, N'Świeży kotlet z piersi kurczaka (dodatki opcjonalnie)', 'http://serwer.zdjecieDanie2.jpg', 20, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Spaghetti carbonara', 'mainDish', 100, N'Włoski makaron - Spaghetti carbonara', 'http://serwer.zdjecieDanie3.jpg', 25, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Spaghetti bolognese', 'mainDish', 100, N'Włoski makaron - Spaghetti bolognese', 'http://serwer.zdjecieDanie4.jpg', 25, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Grillowany łosoś', 'mainDish', 100, N'Świeży grillowany łosoś z cytryną (dodatki opcjonalnie)', 'http://serwer.zdjecieDanie5.jpg', 25, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Placek po węgiersku', 'mainDish', 100, N'Domowy placek z dodatkiem wołowiny', 'http://serwer.zdjecieDanie6.jpg', 25, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
--|Kategoria Dodatki|--
INSERT INTO dbo.Produkt
VALUES (0, N'Frytki', 'addition', 100, N'Podłużne frytki smażone na oleju', 'http://serwer.zdjecieDodatek1.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Ziemniaki gotowane', 'addition', 100, N'Porcja domowych gotowanych ziemniaków', 'http://serwer.zdjecieDodatek2.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Ziemniaki opiekane', 'addition', 100, N'Porcja opiekanych ziemniaków', 'http://serwer.zdjecieDodatek3.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Makaron biały', 'addition', 100, N'Tradycyjny biały gotowany makaron', 'http://serwer.zdjecieDodatek4.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Makaron razowy', 'addition', 100, N'Makaron ciemny razowy', 'http://serwer.zdjecieDodatek5.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Buraki smażone', 'addition', 100, N'Domowa sałatka ze świeżych buraków', 'http://serwer.zdjecieDodatek6.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Marchewka z groszkiem', 'addition', 100, N'Domowa sałatka z gotowaną marchewką i groszkiem', 'http://serwer.zdjecieDodatek7.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
--|Kategoria śniadania|--
INSERT INTO dbo.Produkt
VALUES (0, N'Jajecznica z boczkiem', 'breakfast', 100, N'Jajecznica przygotowana z dwóch jajek, smażona z boczkiem', 'http://serwer.zdjecieSniadanie1.jpg', 15, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Jajecznica z kiełbasą', 'breakfast', 100, N'Jajecznica przygotowana z dwóch jajek, smażona z kiełbasą', 'http://serwer.zdjecieSniadanie2.jpg', 15, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Tosty z szynką', 'breakfast', 100, N'Dwa tosty z szynką i serem, sos do wyboru', 'http://serwer.zdjecieSniadanie3.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Tosty z serem', 'breakfast', 100, N'Dwa tosty z serem, sos do wyboru', 'http://serwer.zdjecieSniadanie4.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Płatki owsiane', 'breakfast', 100, N'Miska 300ml naturalnych płatków owsianych', 'http://serwer.zdjecieSniadanie5.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Zupa mleczna', 'breakfast', 100, N'Zupa mleczna podawana w misce o pojemności 300ml', 'http://serwer.zdjecieSniadanie6.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
--|Kategoria Kanapki/Tosty|--
INSERT INTO dbo.Produkt
VALUES (0, N'Tosty z szynką i pieczarkami', 'sandwich', 100, N'Dwa tosty z szynką, serem i pieczarkami, sos do wyboru', 'http://serwer.zdjecieKanapka1.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Tosty z serem i pieczarkami', 'sandwich', 100, N'Dwa tosty z serem i pieczarkami, sos do wyboru', 'http://serwer.zdjecieKanapka2.jpg', 10, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Kanapka z kurczakiem', 'sandwich', 100, N'Kanapka/sandwich w kształcie trójkąta z kurczakiem i dodatkami', 'http://serwer.zdjecieKanapka3.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Kanapka z łososiem', 'sandwich', 100, N'Kanapka/sandwich w kształcie trójkąta z łososiem i dodatkami', 'http://serwer.zdjecieKanapka4.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Kanapka z szynką', 'sandwich', 100, N'Kanapka/sandwich w kształcie trójkąta z szynką i dodatkami', 'http://serwer.zdjecieKanapka5.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
INSERT INTO dbo.Produkt
VALUES (0, N'Kanapka z serem feta', 'sandwich', 100, N'Kanapka/sandwich w kształcie trójkąta z serem feta i dodatkami, bez dodatku mięsa', 'http://serwer.zdjecieKanapka6.jpg', 5, (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'))
GO
--|Dodanie cen/opcji cenowych dla poszczególnych produktów w tabeli Cena|--
--|Kategoria Sałatki|--
 
INSERT INTO dbo.Cena
VALUES (N'Mała', 11, 0, (select Id from dbo.Produkt where Nazwa = N'Sałatka z tuńczykiem'), 'salad3')
GO
INSERT INTO dbo.Cena
VALUES (N'Duża', 20, 0, (select Id from dbo.Produkt where Nazwa = N'Sałatka z tuńczykiem'), 'salad4')
GO
INSERT INTO dbo.Cena
VALUES (N'Mała', 12, 0, (select Id from dbo.Produkt where Nazwa = N'Sałatka z łososiem'), 'salad5')
GO
INSERT INTO dbo.Cena
VALUES (N'Duża', 22, 0, (select Id from dbo.Produkt where Nazwa = N'Sałatka z łososiem'), 'salad6')
GO
INSERT INTO dbo.Cena
VALUES (N'Mała', 10, 0, (select Id from dbo.Produkt where Nazwa = N'Sałatka z serem feta'), 'salad7')
GO
INSERT INTO dbo.Cena
VALUES (N'Duża', 16, 0, (select Id from dbo.Produkt where Nazwa = N'Sałatka z serem feta'), 'salad8')
GO
--|Kategoria Zupy|--
INSERT INTO dbo.Cena
VALUES (null, 6, 1, (select Id from dbo.Produkt where Nazwa = N'Zupa pomidorowa'), 'soup1')
GO
INSERT INTO dbo.Cena
VALUES (null, 6, 1, (select Id from dbo.Produkt where Nazwa = N'Zupa ogórkowa'), 'soup2')
GO
INSERT INTO dbo.Cena
VALUES (null, 6, 1, (select Id from dbo.Produkt where Nazwa = N'Zupa pieczarkowa'), 'soup3')
GO
INSERT INTO dbo.Cena
VALUES (null, 10, 1, (select Id from dbo.Produkt where Nazwa = N'Żurek'), 'soup4')
GO
--|Kategoria Dania Główne|--
INSERT INTO dbo.Cena
VALUES (null, 16, 1, (select Id from dbo.Produkt where Nazwa = N'Kotlet schabowy'), 'mainDish1')
GO
INSERT INTO dbo.Cena
VALUES (null, 18, 1, (select Id from dbo.Produkt where Nazwa = N'Kotlet z piersi kurczaka'), 'mainDish2')
GO
INSERT INTO dbo.Cena
VALUES (null, 20, 1, (select Id from dbo.Produkt where Nazwa = N'Spaghetti carbonara'), 'mainDish3')
GO
INSERT INTO dbo.Cena
VALUES (null, 20, 1, (select Id from dbo.Produkt where Nazwa = N'Spaghetti bolognese'), 'mainDish4')
GO
INSERT INTO dbo.Cena
VALUES (null, 26, 1, (select Id from dbo.Produkt where Nazwa = N'Grillowany łosoś'), 'mainDish5')
GO
INSERT INTO dbo.Cena
VALUES (null, 23, 1, (select Id from dbo.Produkt where Nazwa = N'Placek po węgiersku'), 'mainDish6')
GO
--|Kategoria Dodatki|--
INSERT INTO dbo.Cena
VALUES (N'Małe', 6, 0, (select Id from dbo.Produkt where Nazwa = N'Frytki'), 'addition1')
GO
INSERT INTO dbo.Cena
VALUES (N'Duże', 7, 0, (select Id from dbo.Produkt where Nazwa = N'Frytki'), 'addition2')
GO
INSERT INTO dbo.Cena
VALUES (null, 5, 1, (select Id from dbo.Produkt where Nazwa = N'Ziemniaki gotowane'), 'addition3')
GO
INSERT INTO dbo.Cena
VALUES (null, 7, 1, (select Id from dbo.Produkt where Nazwa = N'Ziemniaki opiekane'), 'addition4')
GO
INSERT INTO dbo.Cena
VALUES (null, 6, 1, (select Id from dbo.Produkt where Nazwa = N'Makaron biały'), 'addition5')
GO
INSERT INTO dbo.Cena
VALUES (null, 8, 1, (select Id from dbo.Produkt where Nazwa = N'Makaron razowy'), 'addition6')
GO
INSERT INTO dbo.Cena
VALUES (null, 7, 1, (select Id from dbo.Produkt where Nazwa = N'Buraki smażone'), 'addition7')
GO
INSERT INTO dbo.Cena
VALUES (null, 6, 1, (select Id from dbo.Produkt where Nazwa = N'Marchewka z groszkiem'), 'addition8')
GO
--|Kategoria Śniadania|--
INSERT INTO dbo.Cena
VALUES (null, 14, 1, (select Id from dbo.Produkt where Nazwa = N'Jajecznica z boczkiem'), 'breakfast1')
GO
INSERT INTO dbo.Cena
VALUES (null, 12, 1, (select Id from dbo.Produkt where Nazwa = N'Jajecznica z kiełbasą'), 'breakfast2')
GO
INSERT INTO dbo.Cena
VALUES (null, 10, 1, (select Id from dbo.Produkt where Nazwa = N'Tosty z szynką'), 'breakfast3')
GO
INSERT INTO dbo.Cena
VALUES (null, 10, 1, (select Id from dbo.Produkt where Nazwa = N'Tosty z serem'), 'breakfast4')
GO
INSERT INTO dbo.Cena
VALUES (null, 8, 1, (select Id from dbo.Produkt where Nazwa = N'Płatki owsiane'), 'breakfast5')
GO
INSERT INTO dbo.Cena
VALUES (null, 7, 1, (select Id from dbo.Produkt where Nazwa = N'Zupa mleczna'), 'breakfast6')
GO
--|Kategoria Kanapki/Tosty|--
INSERT INTO dbo.Cena
VALUES (null, 13, 1, (select Id from dbo.Produkt where Nazwa = N'Tosty z szynką i pieczarkami'), 'sandwich1')
GO
INSERT INTO dbo.Cena
VALUES (null, 11, 1, (select Id from dbo.Produkt where Nazwa = N'Tosty z serem i pieczarkami'), 'sandwich2')
GO
INSERT INTO dbo.Cena
VALUES (null, 10, 1, (select Id from dbo.Produkt where Nazwa = N'Kanapka z kurczakiem'), 'sandwich3')
GO
INSERT INTO dbo.Cena
VALUES (null, 11, 1, (select Id from dbo.Produkt where Nazwa = N'Kanapka z łososiem'), 'sandwich4')
GO
INSERT INTO dbo.Cena
VALUES (null, 9, 1, (select Id from dbo.Produkt where Nazwa = N'Kanapka z szynką'), 'sandwich5')
GO
INSERT INTO dbo.Cena
VALUES (null, 8, 1, (select Id from dbo.Produkt where Nazwa = N'Kanapka z serem feta'), 'sandwich6')
GO
--|Dodanie nowych testowych promocji do tabeli Promocja|--
--|Promocja - Dzień Tygodnia|--
INSERT INTO dbo.Promocja
VALUES (N'Damskie czwartki', 'promotion2', 0, '2015-12-21 19:00:00.000', '2016-02-15 22:00:00.000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'10zł zniżki w czwartki (19:00-22:00) dla każdej kobiety składającej zamówienie o wartości powyżej 30zł', 10, null, 1, 1, 'http://serwer.zdjeciePromocja2.jpg')
GO
--|Promocja - Menu|--
INSERT INTO dbo.Promocja
VALUES (N'Świąteczna oferta', 'promotion3', 0, '2015-12-27 14:00:00.000', '2015-12-31 16:00:00.000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'10% zniżki w dn. 27-31.12.2015 (14:00-16:00) dla wszystkich klientów wybierających jedną z pozycji z menu popołudniowego', null, 10, 1, 1, 'http://serwer.zdjeciePromocja3.jpg')
GO
INSERT INTO dbo.Promocja
VALUES (N'Powitaj nowy rok razem z nami', 'promotion4', 0, '2016-01-01 14:00:00.000', '2016-01-01 17:00:00.000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'10% zniżki w Nowy Rok (14:00-17:00) dla wszystkich klientów wybierających jedną z pozycji z menu popołudniowego', null, 10, 0, 0, 'http://serwer.zdjeciePromocja4.jpg')
GO
--|Promocja - Produkt|--
INSERT INTO dbo.Promocja
VALUES (N'Bądź fit i zajadaj z nami', 'promotion5', 0, '2016-01-01 12:00:00.000', '2016-03-01 15:00:00.000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'5% zniżki w styczniu i lutym (12:00-15:00) dla wszystkich klientów wybierających jedną naszych sałatek (Duża z kurczakiem, lub serem feta)', null, 5, 1, 1, 'http://serwer.zdjeciePromocja5.jpg')
GO
INSERT INTO dbo.Promocja
VALUES (N'Wpadnij do nas i ogrzej się posiłkiem', 'promotion6', 0, '2016-01-01 14:00:00.000', '2016-03-01 17:00:00.000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'Przyjdź na żurek z jajkiem w styczniu i lutym w godz. 14:00-17:00, a otrzymasz 2zł rabatu na każdą z nich', 2, null, 1, 1, 'http://serwer.zdjeciePromocja6.jpg')
GO
--|Promocja - Grupa Produktów|--
INSERT INTO dbo.Promocja
VALUES (N'Swojsko i na temat', 'promotion7', 0, '2015-12-21 13:00:00.000', '2015-12-31 15:00:00.000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'5% zniżki w okresie świąteczno-noworocznym (13:00-15:00) dla wszystkich klientów na zestawy obiadowe tj. Dania Główne z naszego menu (tylko w dostawie)', null, 5, 0, 0, 'http://serwer.zdjeciePromocja7.jpg')
GO
INSERT INTO dbo.Promocja
VALUES (N'Brunch, lunch? Tylko u nas', 'promotion8', 0, '2016-01-04 13:00:00.000', '2016-01-31 14:00:00.000', (select Id from dbo.Profil_LG where Nazwa = N'At Home Restaurant'), N'Przez cały styczeń w godz. 13:00-14:00 wszystkie pozycje z kategorii świeże kanapki i tosty minus 50%', null, 50, 1, 1, 'http://serwer.zdjeciePromocja8.jpg')
GO
--|Dodanie nowych testowych promocji do tabeli Promocja_DzienTygodnia|--
INSERT INTO dbo.Promocja_DzienTygodnia
VALUES ((select Id from dbo.Dzien_Tygodnia where Kod = N'Monday'), (select Id from dbo.Promocja where Kod = N'promotion1'), '2015-12-21 15:00:00.000', '2016-02-01 17:00:00.000')
GO
INSERT INTO dbo.Promocja_DzienTygodnia
VALUES ((select Id from dbo.Dzien_Tygodnia where Kod = N'Thursday'), (select Id from dbo.Promocja where Kod = N'promotion2'), '2015-12-21 19:00:00.000', '2016-02-15 22:00:00.000')
GO
--|Dodanie nowych testowych promocji do tabeli Promocja_Menu|--
INSERT INTO dbo.Promocja_Menu
VALUES ((select Id from dbo.Promocja where Kod = N'promotion3'), (select Id from dbo.Menu where Nazwa = N'Popołudniowe'))
GO
INSERT INTO dbo.Promocja_Menu
VALUES ((select Id from dbo.Promocja where Kod = N'promotion4'), (select Id from dbo.Menu where Nazwa = N'Popołudniowe'))
GO
--|Dodanie nowych testowych promocji do tabeli Promocja_Produkt|--
INSERT INTO dbo.Promocja_Produkt
VALUES ((select Id from dbo.Promocja where Kod = N'promotion5'), (select Id from dbo.Produkt where Nazwa = N'Sałatka z kurczakiem'))
GO
INSERT INTO dbo.Promocja_Produkt
VALUES ((select Id from dbo.Promocja where Kod = N'promotion5'), (select Id from dbo.Produkt where Nazwa = N'Sałatka z serem feta'))
GO
INSERT INTO dbo.Promocja_Produkt
VALUES ((select Id from dbo.Promocja where Kod = N'promotion6'), (select Id from dbo.Produkt where Nazwa = N'Żurek'))
GO
--|Dodanie nowych testowych promocji do tabeli Promocja_ProduktGrupa|--
INSERT INTO dbo.Promocja_ProduktGrupa
VALUES ((select Id from dbo.Promocja where Kod = N'promotion7'), (select Id from dbo.Produkt_Grupa where Kod = N'mainDish'))
GO
INSERT INTO dbo.Promocja_ProduktGrupa
VALUES ((select Id from dbo.Promocja where Kod = N'promotion8'), (select Id from dbo.Produkt_Grupa where Kod = N'sandwich'))
GO

----------------

SELECT * FROM Produkt

SELECT * FROM Produkt WHERE Kod = 'mainDish'

SELECT p.Nazwa AS [Nazwa Produktu], DostepnaIlosc
FROM Produkt AS p
WHERE Kod = 'mainDish'

SELECT * FROM Produkt WHERE Nazwa LIKE '%zupa%'

SELECT * FROM Produkt WHERE Nazwa LIKE '_o%'

SELECT * FROM Produkt WHERE Nazwa LIKE '[smb]%'

SELECT * FROM Produkt WHERE Nazwa LIKE '[a-k]%'

SELECT * FROM Produkt WHERE Nazwa NOT LIKE '[c-z]%'

SELECT * FROM Promocja WHERE Procent IS NOT NULL

SELECT * FROM Produkt WHERE Kod = 'salad' OR Kod = 'sandwich'

SELECT * FROM Produkt WHERE Kod IN ('salad', 'sandwich')

SELECT * FROM Produkt WHERE Kod = 'sandwich' AND CzasRealizacji = 5

SELECT * FROM Produkt WHERE Kod = (SELECT Kod FROM Produkt_Grupa WHERE Id = 3)

SELECT * FROM Promocja WHERE CzasStart BETWEEN '2015-12-20' AND '2015-12-28' ORDER BY CzasStart ASC

SELECT * FROM Promocja WHERE DATEDIFF(day, CzasStart, CzasStop) > 30

SELECT Count(Id) FROM Produkt

SELECT Count(Id) AS IleProduktow FROM Produkt

SELECT AVG(CENA) AS Srednia FROM Cena

SELECT MAX(Cena) FROM Cena

SELECT Min(Cena) FROM Cena

SELECT p.Nazwa, pm.PromocjaId, pm.MenuId FROM Promocja p
INNER JOIN Promocja_Menu pm ON p.Id = pm.PromocjaId

SELECT p.Nazwa, pm.PromocjaId, pm.MenuId FROM Promocja p
LEFT JOIN Promocja_Menu pm ON p.Id = pm.PromocjaId

SELECT p.Nazwa, pm.PromocjaId, pm.MenuId FROM Promocja p
RIGHT JOIN Promocja_Menu pm ON p.Id = pm.PromocjaId

SELECT p.Nazwa, pm.MenuId, m.Nazwa FROM Promocja p
INNER JOIN Promocja_Menu pm ON p.Id = pm.PromocjaId
INNER JOIN Menu As m ON pm.MenuId = m.Id