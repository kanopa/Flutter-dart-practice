class Bike
{
  int cadence;
  int _speed = 10;
  int gear;

  int get speed => _speed;

  Bike(this.cadence, this.gear);

  @override
  String toString() => "Bike: $cadence mph";

  int applyBrake(int decrement) => _speed-=decrement;
  int speedUp(int increment) => _speed+=increment;
}

void main()
{
  var bike = Bike(2,1);
  print(bike);
  print("Bike speed now: ${bike._speed}");
  print("Bike speed update: ${bike.applyBrake(5)}");
  print("Bike speed update: ${bike.speedUp(25)}");
}