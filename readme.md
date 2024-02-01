# Abstraction & Encapsulation in Dart

This repository contains a Dart implementation showcasing the concepts of abstraction and encapsulation using a simple class structure. Additionally, it demonstrates polymorphism through method overloading and overriding, as well as the use of mixins for achieving multiple inheritance.

## Person Class

The `Person` class serves as an example of abstraction and encapsulation. It includes private attributes (`_name`, `_gender`, `_height`, `_weight`) and provides getter methods to access these attributes. The `setData` method allows for setting individual attributes with optional parameters.

```dart
abstract class Person {
  String? _name;
  String? _gender;
  num? _height;
  num? _weight;

  String? getName() => _name;
  String? getGender() => _gender;
  num? getWeight() => _weight;
  num? getHeight() => _height;

  void setData({String? name, String? gender, num? height, num? weight}) {
    if (name != null) _name = name;
    if (gender != null) _gender = gender;
    if (height != null) _height = height;
    if (weight != null) _weight = weight;
  }
}
```

## Parent Class

The `Parent` class extends the `Person` class and demonstrates polymorphism through method overloading. Dart doesn't support true method overloading, but it can be achieved using optional parameters (unnamed and named). The class defines two methods: `brewOptionalUnnamed` and `brewOptionalNamed`.

```dart
class Parent extends Person {
  void brewOptionalUnnamed(String a, [String? b, String? c]) {
    print("$a ${b ?? ''} ${c ?? ''}");
  }

  void brewOptionalNamed(String a, {String? b, String? c}) {
    print("$a ${b ?? ''} ${c ?? ''}");
  }
}
```

## Mixins (ParentA, ParentB) and Child Class

Two mixins (`ParentA` and `ParentB`) are defined, showcasing the use of mixins for achieving multiple inheritance. These mixins provide a `gaming` method with default values.

```dart
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
```

## Main Function

The `main` function demonstrates the usage of the created classes. An instance of the `Child` class is created, and its data is set using the `setData` method. Various methods are then called to showcase the implemented functionality.

```dart
void main() {
  Child obj = Child();

  obj.setData(name: "Krishna");

  print(
      '''${obj.getName()} love to play ${obj.gaming()}\n${obj.getName()} also love to drink''');
  obj.brewOptionalUnnamed("coffee", "water");
  print("and");
  obj.brewOptionalNamed("tea", b: "water", c: "sugar");
}
```
