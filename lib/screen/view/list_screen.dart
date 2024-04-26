import 'package:bloc_practise_app/screen/cubit/list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  TextEditingController addController = TextEditingController();
  TextEditingController updateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListCubit, ListState>(builder: (context, state){
        return ListView.builder(itemCount: state.names.length,itemBuilder: (context, index){
          return Padding(padding: const EdgeInsets.all(20),
          child: Container(
            height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3)
              ),
              child: Center(
                child: ListTile(
                  leading: Text('$index'),
                  title: Text(state.names[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: const Text('Do you really wanna delete this data?'),

                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: const Text('Cancel')),
                              TextButton(onPressed: (){
                                BlocProvider.of<ListCubit>(context).deleteData(index);
                                Navigator.pop(context);

                              }, child: const Text('Yes')),
                            ],
                          );
                        });
                      }, icon: const Icon(Icons.delete)),
                      IconButton(onPressed: (){
                        showDialog(context: context, builder: (context){
                          updateController.text = state.names[index];
                          return AlertDialog(
                            title: const Text('update data data'),
                            content: TextField(
                              controller: updateController,
                            ),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: const Text('Cancel')),
                              TextButton(onPressed: (){
                                if(updateController.text.isNotEmpty){
                                  BlocProvider.of<ListCubit>(context).updateData(index, updateController.text);
                                  Navigator.pop(context);
                                  updateController.clear();
                                }
                              }, child: const Text('Add data')),
                            ],
                          );
                        });
                      }, icon: const Icon(Icons.edit)),
                    ],
                  ),
                ),
              ),
          ),);
        });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: const Text('add data'),
              content: TextField(
                controller: addController,
              ),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text('Cancel')),
                TextButton(onPressed: (){
                  if(addController.text.isNotEmpty){
                    BlocProvider.of<ListCubit>(context).addName(addController.text);
                    Navigator.pop(context);
                    addController.clear();
                  }
                }, child: const Text('Add data')),
              ],
            );
          });
        },
      ),
    );
  }
}
