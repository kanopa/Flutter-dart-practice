import 'dart:math';

abstract class Shape
{
  num get area;
}
class Circle implements Shape
{
  final num radius;
  Circle(this.radius);

  num get area => pi*pow(radius,2);
}

class Square implements Shape
{
  final num side;
  Square(this.side);
  num get area => pow(side,2);
}
Shape shapeFactory(String type,int value)
{
  if(type == "circle")
    return Circle(value);
  else if(type == "square")
    return Square(value);
  throw "You written shit";
}
/*class CircleTry implements Circle
{
  num area;
  num radius;
}*/
void main()
{
  //final circle = Circle(2);
  //print("Area circle result: ${circle.area}");
  //final square = Square(4);
  //print("Area square result: ${square.area}");
  final circle = shapeFactory("circle", 2);
  print("Area circle result: ${circle.area}");
  final square = shapeFactory('square', 4);
  print("Area square result: ${square.area}");
  //final sth = shapeFactory("box", 5);
  //print("Area square result: ${sth.area}");
}