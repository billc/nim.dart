import 'dart:html';

void main() {
  querySelectorAll('li.trooper')
    ..forEach((t) => t.onClick.listen(shoot));
}

void shoot(Event e) {
  print('You clicked trooper ${e.target.id}');
  
  // Retrieve the parent ul and remove all successive elements inclusively
  Element t = e.currentTarget as Element;
  Element row = t.parent;
  row.children.removeWhere((e) => int.parse(e.id) >= int.parse(t.id));
  
  // Are there more stormtroopers to kill?
  Element active_player = querySelector('#active-player');
  
  if (querySelectorAll('li.trooper').isNotEmpty) {
    // Change Player
    active_player.text = active_player.text == "Player One's Turn" ? "Player Two's Turn" : "Player One's Turn";
  }
  else {
    active_player.text = active_player.text == "Player One's Turn" ? "Player One Won!!!" : "Player Two Won!!!"; 
  }
  
}