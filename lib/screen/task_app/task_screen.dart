import 'package:bloc_practise_app/screen/task_app/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  final nameController = TextEditingController();
  final updateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<TaskCubit, TaskState>(// Use BlocBuilder
          builder: (context, state) {
        return state.cars.isNotEmpty
            ? ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3)),
                      child: Center(
                        child: ListTile(
                          leading: Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          title: Text(state.cars[index]),
                          subtitle: const Text('Description'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          updateController.text =
                                              state.cars[index]; // Pre-fill
                                          return AlertDialog(
                                            title: const Text('Update data'),
                                            content: TextField(
                                              controller: updateController,
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child:
                                                      const Text('Cancel')),
                                              TextButton(
                                                  onPressed: () {
                                                    if (updateController
                                                        .text.isNotEmpty) {
                                                      BlocProvider.of<
                                                                  TaskCubit>(
                                                              context)
                                                          .updateTask(
                                                              index,
                                                              updateController
                                                                  .text);
                                                      Navigator.pop(context);
                                                      updateController
                                                          .clear();
                                                    }
                                                  },
                                                  child:
                                                      const Text('Update')),
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<TaskCubit>(context)
                                        .deleteTask(index);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
            : const Center(child: Text('No Data'));
      }),
      floatingActionButton: FloatingActionButton(

          onPressed: () {
            if (nameController.text.isNotEmpty) {
              // Access the Cubit and call addTask
              context.read<TaskCubit>().addTask(nameController.text);
              Navigator.pop(context);
              nameController.clear(); // Clear input field
            }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
