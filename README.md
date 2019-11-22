**Delprosessen egenfinansiering består av en databasetrigger og en ag16 jobb**

1. Triggeren definert i **Trigger_agltransact.sql** setter inn alle nye rader i agltransact som oppfyller kriterier for kostnadsrader på valgte klienter i tabellen dfo_egenfinansiering. Rader settes inn med status 0 for ubehandlet.
2. AG16-jobben defiert i **ATSEF.ag16** behandler alle nye entries i dfo_egenfinansiering siden sist kjøring. Rad-statusen settes til 2 for ferdig når de er ferdig behandlet og et evt bilag for egenifnansiering er bestilt bokført med GL07.
<<<<<<< HEAD
3. Test-schema og test-data er laget i filen **TestDataAndSchema_dfo_egenfinansiering.sql** for tabellen dfo_egenfinansiering slik at ag16-jobben kan testes kjapt etter drop og opprettelse av tabellen.
=======
>>>>>>> 935596b79a36f14ff6649be1709b0004f4f40c81
---

## Oppsett av løsningen

1. **Trigger_agltransact.sql** legges inn i SQL server management studio, pass på at basen matcher basen den settes inn i.
2. **ATSEF.ag16** legges inn i UBW vha appen til Thomas.
3. Husk å opprett "Oppsett verdier" i UBW for firmaene som skal benytte seg av triggeren. Navn: EGENFIN_TRIGGER_CLIENT Firma:BT (settes i text1)
<<<<<<< HEAD
4. Husk at relasjon på konto må eksistere. 
5. Testdata for ag16-jobben legges direkte inn i SSMS. Viktig at konteringsinfo stemmer overens med prosjektnummere og ressurser i UBW. 
=======
>>>>>>> 935596b79a36f14ff6649be1709b0004f4f40c81
