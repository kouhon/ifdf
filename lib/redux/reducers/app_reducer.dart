import 'package:ifdf/redux/middleware/todos_middleware.dart';
import 'package:ifdf/redux/reducers/todos_reducer.dart';
import 'package:redux/redux.dart';

final Reducer<AppState> appReducer = combineReducers<AppState>(
  [
    todosReducer,
  ],
);