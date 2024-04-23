import 'package:bloc/bloc.dart';
part 'task_state.dart';




class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState());

  void addTask(String newTask) {
    List<String> updatedList = [...state.cars];
    updatedList.add(newTask);
    emit(TaskState(cars: updatedList));
  }

  void updateTask(int index, String updatedTask) {
    List<String> updatedList = [...state.cars];
    updatedList[index] = updatedTask;
    emit(TaskState(cars: updatedList));
  }

  void deleteTask(int index) {
    List<String> updatedList = [...state.cars];
    updatedList.removeAt(index);
    emit(TaskState(cars: updatedList));
  }
}