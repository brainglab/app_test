enum TypeValidation {
  text,
  txtnum,
  txtnumWoSpaces,
  numbers,
  tinyint,
  bigint,
  boolean,
  coordinate,
  date,
  phone,
  url,
  varchar,
  datetime,
  ip,
  email,
  rut,
}

class Validation {
  //
  validate({
    required TypeValidation? type,
    required String? name,
    required String? value,
    required bool isRequired,
    int min = 3,
    int max = 255,
  }) {
    String pattern = r"^$";
    String message = "";

    switch (type) {
      case TypeValidation.text: // text and numbers
        pattern = r"^[A-Za-zÁÉÍÓÚáéíóúñÑ]+$";
        message = "$name debe ser solo texto";
        break;
      case TypeValidation.txtnum: // text and numbers
        pattern = r"^[A-Za-zÁÉÍÓÚáéíóúñÑ0-9]+$";
        message = "$name debe ser solo texto y números";
        break;
      case TypeValidation.txtnumWoSpaces: // text and numbers whitout spaces
        pattern = r"^[A-Za-zÁÉÍÓÚáéíóúñÑ0-9]+$";
        message = "$name debe ser solo texto y números sin espacios";
        break;
      case TypeValidation.numbers:
        pattern = r"^[0-9\.]+([.,][0-9]+)?$";
        message = "$name debe ser solo números";
        break;
      case TypeValidation.tinyint:
        pattern = r"^[A-Za-z0-9-]+$";
        message = "$name debe ser solo números";
        break;
      case TypeValidation.bigint:
        pattern = r"^[0-9\.]+([.,][0-9]+)?$";
        message = "$name debe ser solo números";
        break;
      case TypeValidation.boolean:
        pattern = r"^(true|false)$";
        message = "$name debe ser solo verdadero o falso";
        break;
      case TypeValidation.coordinate:
        pattern = r"^(\-?\d+(\.\d+)?)$";
        message = "$name debe ser coordenadas válidas";
        break;
      case TypeValidation.date:
        pattern = r"^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$";
        message = "$name debe ser una fecha válida";
        break;
      case TypeValidation.phone:
        pattern = r"^\+[0-9]+([.,][0-9]+)?$";
        message = "$name debe ser un número de teléfono válido";
        break;
      case TypeValidation.url:
        pattern = r"^(?:\w+:)?\/\/[^\/]+([^?#]+)$";
        message = "$name debe ser una URL válida";
        break;
      case TypeValidation.varchar: // text and numbers
        pattern = r"^[A-Za-zÁÉÍÓÚáéíóúñÑ0-9\s]+[^\']*$";
        message = "$name debe ser texto, números y caracteres especiales";
        break;
      case TypeValidation.datetime:
        pattern = r"^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$";
        message = "$name debe ser una fecha y hora válida";
        break;
      case TypeValidation.ip:
        pattern = r"^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$";
        message = "$name debe ser una IP válida";
        break;
      case TypeValidation.email:
        pattern = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
        message = "$name debe ser un email válido";
        break;
      case TypeValidation.rut:
        pattern = r"^[0-9]{5,12}([0-9]|k|K){1}$";
        message = "$name debe ser un RUT válido";
        break;
      default:
        pattern = r"^$";
        message = "$name no puede estar vacio";
        break;
    }

    //
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty && isRequired == false) {
      return null;
    } else if (value.isEmpty && isRequired == true) {
      return "$name no puede estar vacio";
    } else if (!regex.hasMatch(value)) {
      return message;
    } else if (value.length < min) {
      return "$name debe tener como mínimo $min caractéres";
    } else if (value.length > max) {
      return "$name debe tener como máximo $max caractéres";
    } else {
      return null;
    }
  }
}
