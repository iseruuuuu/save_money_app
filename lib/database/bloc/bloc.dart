import 'package:save_money_app/database/provider/privider.dart';
import 'package:save_money_app/model/money.dart';

import 'package:rxdart/rxdart.dart';

class Bloc {
  final _controller = BehaviorSubject<List<Money>>();

  Stream<List<Money>> get todoStream => _controller.stream;

  getMoneys() async {
    _controller.sink.add(await Provider.db.getAllMoney());
  }

  blocs() {
    getMoneys();
  }

  dispose() {
    _controller.close();
  }

  create(Money money) {
    money.assignUUID();
    Provider.db.createMoney(money);
    getMoneys();
  }

  update(Money money) {
    Provider.db.updateMoney(money);
    getMoneys();
  }

  delete(String id) {
    Provider.db.deleteMoney(id);
    getMoneys();
  }

  allDelete() {
    Provider.db.deleteAllTodo();
    getMoneys();
  }
}
