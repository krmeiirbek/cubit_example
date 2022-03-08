import 'package:bloc/bloc.dart';
import 'package:cubit_example/model/data_model.dart';
import 'package:cubit_example/services/data_services.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.dataServices}) : super(AppInitial()){
    emit(AppWelcome());
  }
  final DataServices dataServices;
  late final List<DataModel> places;
  void getData() async {
    try{
      emit(AppLoading());
      places = await dataServices.getInfo();
      emit(AppLoaded(places));
    }catch(e){

    }
  }

  detailPage(DataModel dataModel){
    emit(AppDetail(dataModel));
  }

  goHome(){
    emit(AppLoaded(places));
  }
}
