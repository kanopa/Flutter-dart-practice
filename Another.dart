String scream(int length) => "A${"a"*length}h!";

void main()
{
  final values = [1,5,10];
  for(var length in values)
  {
    print(scream(length));
  }
  values.map(scream).forEach(print);
}