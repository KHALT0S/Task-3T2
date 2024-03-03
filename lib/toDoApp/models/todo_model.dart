class TodoModel {
  final String title;
  final String description;
  final bool isCompleted;
  final String isImportant;
  final DateTime editedDate;

  const TodoModel({
    required this.title,
    this.description = '',
    this.isCompleted = false,
    this.isImportant = 'normal',
    required this.editedDate,
  });

  TodoModel updateTodo({
    String? title,
    String? description,
    bool? isCompleted,
    String? isImportant,
  }) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      isImportant: isImportant ?? this.isImportant,
      editedDate: DateTime.now(),
    );
  }
}
