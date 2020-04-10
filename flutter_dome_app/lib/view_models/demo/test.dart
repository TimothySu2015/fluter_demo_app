class Car
{

  String name;
  int Age;
  String brand;
  Car.setAge(this.name,this.Age);
  Car(this.name,[this.brand]);

  void show(){
    print('show');
  }

}

class CarA implements Car
{
  @override
  int Age;

  @override
  String brand;

  @override
  String name;

  @override
  void show() {
    // TODO: implement show
  }

}

class MainA
{
  MainA()
  {
    var _car=new Car('abc');
    new Car.setAge('adb',4);
  }
}