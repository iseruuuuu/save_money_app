import 'package:save_money_app/database/provider/providers.dart';
import 'package:save_money_app/model/money.dart';

import 'package:rxdart/rxdart.dart';

class Bloc {
  final _controller = BehaviorSubject<List<Money>>();

  Stream<List<Money>> get todoStream => _controller.stream;

  getMoneys() async {
    _controller.sink.add(await Providers.db.getAllMoney());
  }

  blocs() {
    getMoneys();
  }

  dispose() {
    _controller.close();
  }

  create(Money money) {
    money.assignUUID();
    Providers.db.createMoney(money);
    getMoneys();
  }

  update(Money money) {
    Providers.db.updateMoney(money);
    getMoneys();
  }

  delete(String id) {
    Providers.db.deleteMoney(id);
    getMoneys();
  }

  allDelete() {
    Providers.db.deleteAllTodo();
    getMoneys();
  }
}
