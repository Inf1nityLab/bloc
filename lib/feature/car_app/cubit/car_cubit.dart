import 'package:bloc/bloc.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(const CarState());

  void deleteData(int index) {
    List<String> updateList = [...state.cars];
    updateList.removeAt(index);

    emit(CarState(cars: updateList));
  }

  void update(int index, String newData) {
    List<String> updateList = [...state.cars];
    updateList[index] = newData;
    emit(CarState(cars: updateList));
  }


  void addData(String newData){
    emit(CarState(cars: [...state.cars, newData]));
  }
}


