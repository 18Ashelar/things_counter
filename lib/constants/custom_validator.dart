class CustomValidator {
  dynamic isEmpty(String value) {
    if (value.isEmpty) {
      return "Field should not be empty";
    }
    return null;
  }


}
