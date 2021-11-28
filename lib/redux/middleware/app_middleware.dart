import 'package:redux/redux.dart';
// import '../redux.dart';
import 'package:ifdf/redux/middleware/todos_middleware.dart';

List appMiddleware = [
  todosMiddleware,
].expand((element) => middleware).toList(growable: false);