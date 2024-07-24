import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_task/cubits/form_cubit/states.dart';

class FormCubit extends Cubit<FormDataState> {
  FormCubit() : super(FormInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitForm({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String comments,
  }) async {
    emit(FormLoading());
    try {
      await _firestore.collection('form_data').add({
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'comments': comments,
      });
      emit(FormSuccess());
    } catch (e) {
      emit(FormFailure(e.toString()));
    }
  }
}