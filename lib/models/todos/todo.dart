class Todo {
  const Todo({this.isCompleted = false, required this.name, id});

  final bool isCompleted;
  final String name;

  get id => null;

  static fromJson(decode) {}
}