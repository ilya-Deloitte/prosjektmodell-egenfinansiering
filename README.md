## Delprosessen egenfinansiering består av en databasetrigger og en ag16 jobb

1. Triggeren på agltransact er definert i **dfo_trigger_bott_ef.sql** setter inn alle nye rader i agltransact som oppfyller kriterier for kostnadsrader på valgte klienter i tabellen dfo_egenfinansiering. Rader settes inn med status 0 for ubehandlet.
2. AG16-jobben definert i **ATSEF.ag16** behandler alle nye entries i den egendefinerte tabellen dfo_egenfinansiering siden sist kjøring. Rad-statusen settes til 2 for ferdig når de er ferdig behandlet og et evt bilag for egenifnansiering er bestilt bokført med GL07.
3. Ende til ende test-data for delprosessen er lagt inn i Test/TestInput_agltransact.sql, denne inserter rett i hovedboken og tester derfor både triggeren og egenfinansieringsjobben.
---

## Oppsett av løsningen
Løsningen kan settes opp i nytt miljø med Install/SetupScript.sql i SSMS.
Det som opprettes og konfigureres i scriptet er: 
1. Kontorelasjonen Q30 for å bestemme hvilke kontoer som skal ha egenfinansiering
2. Bilagsart P1 som benyttes av egenfinansieringsbilaget 
3. Opprette egendefinert tabell dfo_egenfinansiering
4. Ag16 jobben ATSEF **ATSEF.ag16**
5. Meny punkter
6. Egne rapporter, parametere
7. Fast rapport
8. Trigger **dfo_trigger_bott_ef.sql**