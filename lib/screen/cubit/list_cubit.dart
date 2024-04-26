import 'package:bloc/bloc.dart';


part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(const ListState());

  void addName(String newData){
    emit(ListState(names: [...state.names, newData]));
  }

  void deleteData(int index){
    List<String> updatedList = [...state.names];
    updatedList.removeAt(index);
    emit(ListState(names: updatedList));
  }


  void updateData(int index, String newData){
    List<String> updatedList = [...state.names];
    updatedList[index] = newData;
    emit(ListState(names: updatedList));
  }
}
