import 'package:authorization/aith_repo.dart';
import 'package:authorization/model/auth_model_code.dart';
import 'package:authorization/model/auth_model_phone.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo repo;

  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<SendPhoneEvent>((event, emit) async {
      try {
        final model = await repo.sendPhone(phoneNumber: event.phoneNumber);
        emit(
          AuthSucces(model: model),
        );
      } catch (e) {
        emit(AuthError(errorMasseges: e.toString()));
      }
    });

    on<SendCodeEvent>(
      (event, emit) async {
        try {
          final model = await repo.sendCode(code: event.code);
          emit(
            AuthCodeSucces(model: model),
          );
        } catch (e) {
          emit(AuthError(errorMasseges: e.toString()));
        }
      },
    );
  }
}
