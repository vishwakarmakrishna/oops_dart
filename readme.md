# Dart Abstraction, Encapsulation, Polymorphism, and Mixins Example

## Abstraction & Encapsulation in Dart

The `Person` class represents the concept of a person and demonstrates abstraction and encapsulation.

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

- **Abstraction:** The class is marked as `abstract`, indicating that it cannot be instantiated directly. It defines the common attributes (`_name`, `_gender`, `_height`, `_weight`) and methods that represent the abstraction of a person.

- **Encapsulation:** The attributes are declared as private (`_name`, `_gender`, `_height`, `_weight`), and access to them is provided through getter methods. The `setData` method encapsulates the logic of setting individual attributes.

## Polymorphism in Dart

The `Parent` class extends `Person` and demonstrates polymorphism through method overloading.

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

- **Polymorphism:** Dart does not support true method overloading, but it allows achieving a form of polymorphism using optional parameters (unnamed and named). The `brewOptionalUnnamed` and `brewOptionalNamed` methods demonstrate this by accepting different sets of parameters.

## Mixins in Dart

Two mixins (`ParentA` and `ParentB`) are defined, showcasing the use of mixins for achieving multiple inheritance.

```dart
mixin ParentA on Parent {
  String? gaming({String? game = "csgo"}) => game;
}

mixin ParentB on Parent {
  String? gaming({String? game = "candy cush"}) => game;
}
```

- **Mixins:** Mixins are used to reuse code across multiple class hierarchies. Here, `ParentA` and `ParentB` provide a common method `gaming` with default values. These mixins are later used in the `Child` class.

## Child Class

The `Child` class extends `Parent` and includes both `ParentA` and `ParentB` mixins.

```dart
class Child extends Parent with ParentB, ParentA {
  @override
  String? gaming({String? game = "pubg"}) => game;
}
```

- **Multiple Inheritance:** The `Child` class showcases multiple inheritance by extending `Parent` and including mixins `ParentA` and `ParentB`. It overrides the `gaming` method, providing a specific implementation.

## Main Function

The `main` function demonstrates the usage of the created classes and methods.

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

- An instance of the `Child` class is created (`Child obj = Child()`).
- The `setData` method is used to set the name of the person.
- Various methods are called to showcase the polymorphic behavior and multiple inheritance.

Feel free to explore this Dart example to gain a deeper understanding of abstraction, encapsulation, polymorphism, and mixins in object-oriented programming.