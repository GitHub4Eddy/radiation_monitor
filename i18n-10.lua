-- Radiaton Monitor i18n Translations

class "i18n"
function i18n:tranlation(language)
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
      ["24h average"] = "moyenne 24h", 
      ["24hour average"] = "Moyenne sur 24 heures", 
      ["Sensor"] = "Capteur", 
      ["Total sensors"] = "Nombre de Capteurs", 
      ["Date"] = "Date", 
      ["Nearest maximum measurement and maximum average location"] = "Échantillon maximal le plus proche et site moyen", 
      ["Nearest maximum average location"] = "Site moyen maximal le plus proche",
      ["Nearest maximum measurement location"] = "Site d'échantillonnage maximal le plus proche",
      ["Max 24h average"] = "Moyenne maximale 24h", 
      ["Max measurement"] = "Mesure maximale", 
      ["Average"] = "Moyen", 
      ["Capacity"] = "Capacité", 
      ["Refresh reactor list next interval"] = "Actualiser liste des réacteurs à l'intervalle suivant", 
      ["Reactor list will be refreshed next interval"] = "Liste des réacteurs sera actualisée au prochain intervalle", 
      ["Status"] = "Statut"}, 
    pl = {
      ["Radiation"] = "Promieniowanie", 
      ["24h average"] = "średnia dobowa", 
      ["24hour average"] = "średnia z 24 godzin", 
      ["Sensor"] = "Czujnik", 
      ["Total sensors"] = "Całkowita liczba czujników", 
      ["Date"] = "Data", 
      ["Nearest maximum measurement and maximum average location"] = "Najbliższa maksymalna próbka i średnia witryna", 
      ["Nearest maximum average location"] = "Najbliższa maksymalna średnia witryna",
      ["Nearest maximum measurement location"] = "Najbliższa maksymalna przykładowa witryna",
      ["Max 24h average"] = "Max średnia 24h", 
      ["Max measurement"] = "Maksymalny pomiar", 
      ["Average"] = "Przeciętny",
      ["Capacity"] = "Pojemność", 
      ["Refresh reactor list next interval"] = "Odśwież listę reaktorów następny interwał", 
      ["Reactor list will be refreshed next interval"] = "Lista reaktorów zostanie odświeżona w następnym interwale", 
      ["Status"] = "Status"},} 
  translation = translation[language] -- Shorten the table to only the current translation
  return translation
end

-- EOF