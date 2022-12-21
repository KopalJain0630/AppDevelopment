import 'package:flutter/foundation.dart';

class ReadItem {
  final String? title;
  final String? type;
  final String? categories;
  final String? writer;
  ReadItem(
      {@required this.title,
      @required this.type,
      @required this.categories,
      @required this.writer});
}

class Read with ChangeNotifier {
  Map<String, ReadItem> _items = {};
  Map<String, ReadItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get totalMaterials {
    var total = 0;
    _items.forEach((key, value) {
      total++;
    });
    return total;
  }

  void addItem(String title, String type, String category, String writer) {
    if (_items.containsKey(title)) {
      _items.update(
          title,
          (existingReadItem) => ReadItem(
              title: title, type: type, categories: category, writer: writer));
    } else {
      _items.putIfAbsent(
          title,
          () => ReadItem(
              title: title, type: type, categories: category, writer: writer));
    }
    notifyListeners();
  }

  void removeItem(String resourcetitle) {
    _items.remove(resourcetitle);
    notifyListeners();
  }

  void removeSingleItem(String resourcetitle) {
    if (_items.containsKey(resourcetitle)) {
      return;
    } else
      _items.remove(resourcetitle);
    notifyListeners();
  }
}
