import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class RandomWordsState extends State<RandomWords>
{
  final List<WordPair> suggestion = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> saved = Set<WordPair>();

  Widget buildSuggestion()
  {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i) 
      {
        if(i.isOdd)
          return Divider();
        
        final index = i ~/ 2;
        if(index >= suggestion.length)
          suggestion.addAll(generateWordPairs().take(10));
        return buildRow(suggestion[index]);
      }
    );
  }
  void pushSaved()
  {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext contex){
          final Iterable<ListTile> tiles = saved.map(
            (WordPair pair){
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
            .divideTiles(
              context: contex,
              tiles: tiles,
            )
            .toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }
      )
    );
  }
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),onPressed: pushSaved),
        ],
      ),
      body: buildSuggestion(),
    );
  }
  Widget buildRow(WordPair pair)
  {
    final bool alreadySaved = saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
         if(alreadySaved)
          saved.remove(pair);
        else
          saved.add(pair); 
        });
      },
    );
  }
}
class RandomWords extends StatefulWidget
{
  @override
  RandomWordsState createState() => RandomWordsState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}