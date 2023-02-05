import '../../models/payment_types_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypesModel>> getAllPaymentTypes();
}
