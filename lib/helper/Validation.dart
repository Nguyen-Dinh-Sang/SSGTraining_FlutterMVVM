class Validation {
  static String validationPass(String pass) {
    if (pass == null) {
      return 'Password invalid';
    }

    if (pass.length < 6) {
      return 'Password require minimum 6 characters';
    }

    //không có lỗi
    return null;
  }

  static String validationEmail(String email) {
    if (email == null) {
      return 'Email invalid';
    }

    if (email.length < 6) {
      return 'Password require minimum 6 characters';
    }

    return null;
  }
}