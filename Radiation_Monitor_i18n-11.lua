-- Radiaton Monitor i18n Translations

class "i18n"
function i18n:translation(language)
  translation = {
    en = {
      ["Radiation"] = "Radiation", 
      ["24h average"] = "24h average", 
      ["24hour average"] = "24hour average", 
      ["Sensor"] = "Sensor", 
      ["Total sensors"] = "Total sensors", 
      ["Date"] = "Date", 
      ["Nearest maximum measurement and maximum average location"] = "Nearest maximum measurement and maximum average location", 
      ["Nearest maximum average location"] = "Nearest maximum average location",
      ["Nearest maximum measurement location"] = "Nearest maximum measurement location", 
      ["Max 24h average"] = "Max 24h average", 
      ["Max measurement"] = "Max measurement", 
      ["Average"] = "Average", 
      ["Capacity"] = "Capacity", 
      ["Refresh reactor list next interval"] = "Refresh reactor list next interval", 
      ["Reactor list will be refreshed next interval"] = "Reactor list will be refreshed next interval", 
      ["Status"] = "Status"}, 
    nl = {
      ["Radiation"] = "Straling", 
      ["24h average"] = "24u gemiddelde", 
      ["24hour average"] = "24-uurs gemiddelde", 
      ["Sensor"] = "Sensor", 
      ["Total sensors"] = "Aantal sensoren", 
      ["Date"] = "Datum", 
      ["Nearest maximum measurement and maximum average location"] = "Dichtstbijzijnde maximale meting en gemiddelde locatie", 
      ["Nearest maximum average location"] = "Dichtstbijzijnde maximale gemiddelde locatie",
      ["Nearest maximum measurement location"] = "Dichtstbijzijnde maximale meting locatie", 
      ["Max 24h average"] = "Max 24u gemidddelde", 
      ["Max measurement"] = "Max meting", 
      ["Average"] = "Gemiddeld", 
      ["Capacity"] = "Capaciteit", 
      ["Refresh reactor list next interval"] = "Reaktorlijst vernieuwen volgende interval", 
      ["Reactor list will be refreshed next interval"] = "Reactorlijst wordt volgende interval vernieuwd", 
      ["Status"] = "Status"}, 
    fr = {
      ["Radiation"] = "Radiation", 
      ["24h average"] = "Moyenne sur 24h", 
      ["24hour average"] = "Moyenne sur 24 heures", 
      ["Sensor"] = "Capteur", 
      ["Total sensors"] = "Nombre de Capteurs", 
      ["Date"] = "Date", 
      ["Nearest maximum measurement and maximum average location"] = "Emplacement le plus proche de la mesure maximale et de la moyenne maximale", 
      ["Nearest maximum average location"] = "Emplacement maximum moyen le plus proche",
      ["Nearest maximum measurement location"] = "Emplacement de la mesure maximale la plus proche",
      ["Max 24h average"] = "Moyenne maximale 24h", 
      ["Max measurement"] = "Mesure maximale", 
      ["Average"] = "Moyen", 
      ["Capacity"] = "Capacit??", 
      ["Refresh reactor list next interval"] = "Rafra??chir la liste des r??acteurs au prochain intervalle", 
      ["Reactor list will be refreshed next interval"] = "La liste des r??acteurs sera actualis??e au prochain intervalle", 
      ["Status"] = "Statut"},
    pl = {
      ["Radiation"] = "Promieniowanie", 
      ["24h average"] = "??rednia dobowa", 
      ["24hour average"] = "??rednia z 24 godzin", 
      ["Sensor"] = "Czujnik", 
      ["Total sensors"] = "Ca??kowita liczba czujnik??w", 
      ["Date"] = "Data", 
      ["Nearest maximum measurement and maximum average location"] = "Najbli??sza maksymalna pr??bka i ??rednia witryna", 
      ["Nearest maximum average location"] = "Najbli??sza maksymalna ??rednia witryna",
      ["Nearest maximum measurement location"] = "Najbli??sza maksymalna przyk??adowa witryna",
      ["Max 24h average"] = "Max ??rednia 24h", 
      ["Max measurement"] = "Maksymalny pomiar", 
      ["Average"] = "Przeci??tny",
      ["Capacity"] = "Pojemno????", 
      ["Refresh reactor list next interval"] = "Od??wie?? list?? reaktor??w nast??pny interwa??", 
      ["Reactor list will be refreshed next interval"] = "Lista reaktor??w zostanie od??wie??ona w nast??pnym interwale", 
      ["Status"] = "Status"},} 
  translation = translation[language] -- Shorten the table to only the current translation
  return translation
end

-- EOF