class TaxiCounter {
  double distance;
  double tariffEconomy = 250;
  double tariffStandard = 200;
  double tariffPremium = 150;
  double threshold1 = 10;
  double threshold2 = 20;
  double coefficientEconomy = 1;
  double coefficientStandard = 2;
  double coefficientPremium = 3;

  TaxiCounter(this.distance);

  double calculateFare() {
    double fare;
    if (distance <= threshold1) {
      fare = distance * tariffEconomy * coefficientEconomy;
    } else if (threshold1 < distance && distance <= threshold2) {
      fare = (threshold1 * tariffEconomy * coefficientEconomy) +
          ((distance - threshold1) * tariffStandard * coefficientStandard);
    } else {
      fare = (threshold1 * tariffEconomy * coefficientEconomy) +
          ((threshold2 - threshold1) * tariffStandard * coefficientStandard) +
          ((distance - threshold2) * tariffPremium * coefficientPremium);
    }

    return fare;
  }
}

void main() {
  double totalDistance = 25; // Пример расстояния в километрах
  var taxiCounter = TaxiCounter(totalDistance);
  var totalFare = taxiCounter.calculateFare();

  print("Пройденное расстояние: ${totalDistance} км");
  print("Итоговая стоимость поездки: ${totalFare} тенге");
}