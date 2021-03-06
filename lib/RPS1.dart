import 'dart:io';

import 'dart:math';

class RPS1 {
  static String _choice;
  static final _lst = {'r': 'rock', 's': 'scissors', 'p': 'paper'};

  RPS1([String choice]) {
    setChoice(choice);
  }

  String intialize() {
    if (_choice == null) {
      stdout.write('Enter your play (r/p/s) : ');
      setChoice(stdin.readLineSync());
    }
    return checkWhoWon();
  }

  static void setChoice(String choice) {
    _choice = _lst[choice];
  }

  String checkWhoWon() {
    var ai = aIPLAY();
    var str = ' the Ai played $ai';
    var conditions = ['You win ! ', 'You lose ! ', 'Its a Draw ! '];
    if (_choice == 'rock' && ai == 'paper' ||
        _choice == 'scissors' && ai == 'rock' ||
        _choice == 'paper' && ai == 'scissors') {
      return conditions[1] + str;
    } else if (_choice == ai) {
      return conditions[2] + str;
    } else {
      return conditions[0] + str;
    }
  }

  String aIPLAY() {
    var plays = ['r', 's', 'p'];
    var r = Random();
    return _lst[plays[r.nextInt(3)]];
  }
}
