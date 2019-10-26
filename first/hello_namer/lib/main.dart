import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class RandomWordsState extends State<RandomWords>
{
  final suggestion = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18.0);

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
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: buildSuggestion(),
    );
  }
  Widget buildRow(WordPair pair)
  {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
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
      home: RandomWords(),
    );
  }
}