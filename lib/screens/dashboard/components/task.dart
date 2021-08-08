class Task {
  final int id;
  final String title, time, category, color1;

  Task(
      {required this.id,
      required this.title,
      required this.time,
      required this.category,
      required this.color1});
}

List<Task> task = [
  Task(
      id: 1,
      title: "Menyapu Rumah",
      time: "06:30 - 06:31",
      category: "Home",
      color1: "0xFFDA1E37"),
  Task(
      id: 1,
      title: "Membuat Donat",
      time: "06:31 - 07:30",
      category: "Home",
      color1: "0xFF0EAD69"),
  Task(
      id: 1,
      title: "Berjualan Donat",
      time: "07:30 - 16:30",
      category: "Work",
      color1: "0xFF0EAD69"),
  Task(
      id: 1,
      title: "berjualan Mie Ayam",
      time: "16:30 - 22:00",
      category: "Work",
      color1: "0xFFFF9505"),
];
