abstract class CustomException implements Exception {
  final String message;
  CustomException(this.message);
}

class GenericException extends CustomException {
  GenericException() : super('Ocorreu um erro inesperado. Tente novamente.');
}
