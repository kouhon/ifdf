import 'package:flutter/material.dart';
import 'package:ifdf/models/todo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Widget withDependencies({required BuildContext context}) {
    return ChangeNotifierProvider(
      create: (_context) => HomeScreenModel(
        todoProvider: Provider.of(context)
      ),
      child: const HomeScreen._(),
    )
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<HomeScreenModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SQLite'
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: model.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = model.todoList[index];
          return InkWell(
            onTap: () {
              _showEditTodoDialog(
                context: context,
                editingTodo: todo
              );
            },
            child: Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.name,
                    ),
                    Text(
                      DateFormat('yyyy/MM/dd HH:mm').format(
                        DateTime.parse(todo.createdAt),
                      );
                    )
                  ],
                ),
                subtitle: todo.imagePath.isNotEmpty
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: size.width * .8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Base64Helper.imageFromBase64String(
                        todo.imagePath
                      ),
                    ),
                  ),
                )
                    : null,
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop();
                                model.deleteTodo(todo.id);
                              },
                              child: const Center(
                                child: Text('削除'),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context: context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditTodoDialog({
    required BuildContext context,
    required Todo editingTodo}
  ) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<HomeScreenModel>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              children: [
                SimpleDialogOption(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            autofocus: true,
                            initialValue: '',
                            onChanged: model.onNameChange,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,)
                      if (model.base64ImageStrint.isNotEmpty)
                        SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Base64Helper.imageFromBase64String(
                              model.base64ImageString
                            ),
                          ),
                        ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          RoundedButton(
                            title: '画像を追加する',
                            onPressed: () async {
                              await model.selectImage();
                              setState(() {});
                            }
                          ),
                          const SizedBox(width: 10,)
                          RoundedButton(
                            title: '投稿する',
                            onPressed: () {
                              Navigator.of(context).pop();
                              model.addTodo();
                            }
                          )
                        ],
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                )
              ],
            );
          },
        );
      }
    );
  }
}
