import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
      routes: {
        '/books': (context) => BooksShelfPage(title: 'Книжная полка'),
        '/serials': (context) => SerialsShelfPage(title: 'Сериальная полка'),
        '/films': (context) => FilmsShelfPage(title: 'Фильмовая полка'),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'iRemember'
        ),
      ),
      body: Column(
      children: [
        RaisedButton(
            child: Text('Книги'),
            onPressed: () {
          Navigator.pushNamed(context, '/books');
        }
        ),
        RaisedButton(
          child: Text('Сериалы'),
            onPressed: () {
          Navigator.pushNamed(context, '/serials');
        }
        ),
        RaisedButton(
          child: Text('Фильмы'),
            onPressed: () {
          Navigator.pushNamed(context, '/films');
        }
        ),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
      )
    );
  }
}

class ShelfPage extends StatelessWidget {
  final String title;
  ShelfPage({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(this.title),
      ),
      body: Center(
        child: ItemsList()
      ),
    );
  }
}

class BooksShelfPage extends ShelfPage {
  BooksShelfPage({title}): super(title: title);


}

class SerialsShelfPage extends ShelfPage {
  SerialsShelfPage({title}): super(title: title);
}

class FilmsShelfPage extends ShelfPage {
  FilmsShelfPage({title}): super(title: title);
}

class Item {
  const Item({this.name});
  final String name;
}

class ItemsList extends StatefulWidget {

  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  List<Item> _itemsList = [Item(name: 'kek'), Item(name: 'lol')];

  void addItem(Item item) {
    _itemsList.add(item);
  }

  Widget getTile(Item item) {
    return ListTile(
      title: Text(
        item.name
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      ListView.builder(
          itemCount: _itemsList.length,
          itemBuilder: (BuildContext context, int index) {
            return getTile(_itemsList[index]);
          }
      ),
    );
  }
}



