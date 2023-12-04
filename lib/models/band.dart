//Las clases dentro de los modelos generalmente se tienen que llamar igual que la clase que vamos a utilizar.

class Band {
  
  String id;
  String name;
  int? votes;

   Band( {
    required this.id,
    required this.name, 
     this.votes,
  });
  
  factory Band.fromMap( Map<String, dynamic> obj) 
  => Band(
    id: obj['id'],
    name: obj['name'],
    votes: obj['votes']
  );


}