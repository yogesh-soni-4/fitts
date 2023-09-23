late Map<String, dynamic> dataa = {
  'Weight': '-',
  "BP": '-',
  "Ex": '-',
};

DateTime selected_date = DateTime.now();

late DateTime selected_index;

class Item {
  final int b;
  final int x;
  final int w;

  Item({required this.b, required this.x, required this.w});
}

Item items = Item(b: 0, x: 0, w: 0);
