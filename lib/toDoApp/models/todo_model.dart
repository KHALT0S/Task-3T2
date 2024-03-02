class TodoModel {
  final String title;
  final String description;
  final bool isCompleted;
  final String isimportant;
  const TodoModel({
    required this.title,
    this.description = '',
    this.isCompleted = false,
    this.isimportant = 'normal',
  });

  TodoModel updateTodo(
      {String? title,
      String? description,
      bool? isCompleted,
      String? isImportant}) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isimportant: isimportant,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
