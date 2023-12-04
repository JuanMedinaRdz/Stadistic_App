import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stadistic_app/models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metalica', votes: 1),
    Band(id: '2', name: 'Queen', votes: 5),
    Band(id: '3', name: 'Heroes del Silencio', votes: 3),
    Band(id: '4', name: 'Bon Jovi', votes: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BandNames',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 1, onPressed: addNewBand, child: const Icon(Icons.add)),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: ( direction ) {
        print('direction: $direction');
        print('id: ${band.id}');
        //TODO: Llamar el borrado en el server
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red ,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle(color: Colors.white))
        ) 


      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple[600],
          child: Text(band.name.substring(0, 2)),
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}'),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();

    if (Platform.isAndroid) {
      // Android 
     return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('New band name'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5,
                  textColor: Colors.deepPurple,
                  onPressed: () => addBandToList(textController.text),
                  child: const Text('Add')),
            ],
          );
        },
      );
    }

    showCupertinoDialog(
      context: context, 
      builder: ( _ ) {
        return CupertinoAlertDialog(
          title: const Text('New band name: '),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Add'),
              onPressed: () => addBandToList(textController.text), 
            )
          ],
        );
          
      }
      );
  }

  void addBandToList(String name) {
    print(name);

    if (name.length > 1) {
      // Podemos agregar
      this.bands.add( new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {
         
      });
    }


    Navigator.pop(context);
  }
}
