class Student {

  final int id;
  final String name;
  final String course;
  int? year;

  Student({
    required this.id,
    required this.name,
    required this.course,
    this.year
  });

}