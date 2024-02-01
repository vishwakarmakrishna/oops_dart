// abstraction & encapsulation

abstract class Person {
  String? _name;
  String? _gender;
  num? _height;
  num? _weight;
  String? getName() => _name;
  String? getGender() => _gender;
  num? getWeight() => _weight;
  num? getHeight() => _height;

  setData({String? name, String? gender, num? height, num? weight}) {
    if (name != null) {
      _name = name;
    }
    if (gender != null) {
      _gender = gender;
    }
    if (height != null) {
      _height = height;
    }
    if (weight != null) {
      weight = _weight;
    }
  }
}

// polymorphism method over-loading & overrinding in dart
// true over-loading not supported but you can use optional (unnamed or named) parameters

class Parent extends Person {
  void brewOptionalUnnamed(String a, [String? b, String? c]) {
    // optional unnamed
    print("$a ${b ?? ''} ${c ?? ''}");
  }

  void brewOptionalNamed(String a, {String? b, String? c}) {
    // optional named
    print("$a ${b ?? ''} ${c ?? ''}");
  }
}

// mixin used for mutiple inheritance
mixin ParentA on Parent {
  String? gaming({String? game = "csgo"}) => game;
}
mixin ParentB on Parent {
  String? gaming({String? game = "candy cush"}) => game;
}

class Child extends Parent with ParentB, ParentA {
  @override
  String? gaming({String? game = "pubg"}) => game;
}

void main() {
  Child obj = Child();

  obj.setData(name: "Krishna");

  print(
      '''${obj.getName()} love to play ${obj.gaming()}\n${obj.getName()} also love to drink''');
  // optional unnamed
//   obj.brewOptionalUnnamed("coffee");
  obj.brewOptionalUnnamed("coffee", "water");
  print("and");
// optional named
//   obj.brewOptionalNamed("tea");
  obj.brewOptionalNamed("tea", b: "water", c: "sugar");
}
