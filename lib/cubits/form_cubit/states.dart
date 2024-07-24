class FormDataState {}

class FormInitial extends FormDataState {}

class FormLoading extends FormDataState {}

class FormSuccess extends FormDataState {}

class FormFailure extends FormDataState {
  final String error;
  FormFailure(this.error);
}