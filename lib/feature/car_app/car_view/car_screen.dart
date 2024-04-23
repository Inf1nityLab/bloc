import 'package:bloc_practise_app/feature/car_app/cubit/car_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  TextEditingController updateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CarCubit, CarState>(builder: (context, state) {
        return state.cars.isNotEmpty
            ? ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3)),
                      child: Center(
                        child: ListTile(
                          leading: Text('${index + 1}'),
                          title: Text(state.cars[index]),
                          subtitle: const Text('descriptin'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () => context
                                      .read<CarCubit>()
                                      .deleteData(index),
                                  icon: const Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          updateController.text =
                                          state.cars[index];
                                          return AlertDialog(
                                            title: Text('Update'),
                                            content: TextField(
                                              controller: updateController,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  if (updateController
                                                      .text.isNotEmpty) {
                                                    BlocProvider.of<CarCubit>(
                                                            context)
                                                        .update(
                                                            index,
                                                            updateController
                                                                .text);
                                                    Navigator.pop(context);
                                                    updateController.clear();
                                                  }
                                                },
                                                child: const Text('Update'),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(Icons.edit)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
            : const Center(
                child: Text('No data'),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text('add data'),
              content: TextField(
                controller: nameController,
              ),
              actions: [
                TextButton(onPressed: ()=> Navigator.pop(context), child: Text('Cancel')),
                TextButton(onPressed: (){
                  if(nameController.text.isNotEmpty){
                    BlocProvider.of<CarCubit>(context).addData(nameController.text);
                    Navigator.pop(context);
                    nameController.clear();
                  }
                }, child: Text('Add')),
              ],
            );
          });
        },
      ),
    );
  }
}
