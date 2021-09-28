import 'dart:async';
import 'package:allcareapp/model/AllServiceListResponseModel.dart';
import 'package:allcareapp/service/SampleService.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_service_event.dart';

part 'all_service_state.dart';

class AllServiceBloc extends Bloc<AllServiceEvent, AllServiceState> {
  AllServiceBloc() : super(InitialAllServiceState());

  @override
  Stream<AllServiceState> mapEventToState(AllServiceEvent event) async* {
    if (event is getAllService) {
      yield* _getAllService();
    }
    // TODO: Add your event logic
  }

  Stream<AllServiceState> _getAllService() async* {
    yield LoadingAllServiceState();
    SampleService sampleService = new SampleService();
    AllServiceResponse res = await sampleService.getBookingService();
    if(res.status.message == "Success") {
      yield LoadedAllServiceState(res.data);
    } else {
      yield ErrorAllServiceState();
    }
  }
}
