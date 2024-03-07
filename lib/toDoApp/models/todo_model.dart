class TodoModel {
  final String title;
  final String description;
  final bool isCompleted;
  final int isImportant;
  final DateTime editedDate;

  const TodoModel({
    required this.title,
    this.description = '',
    this.isCompleted = false,
    this.isImportant = 1,
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
      isImportant: this.isImportant,
      editedDate: DateTime.now(),
    );
  }
}
