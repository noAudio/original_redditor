import 'dart:html';
import 'comments.dart';

void main() {
  var app = App();

  app;
}

class App {
  var textarea = querySelector('#txt-area') as TextAreaElement;
  var errorParagraph = querySelector('.error-msg') as ParagraphElement;
  String? errorMessage;

  App() {
    run();
  }

  void run() {
    textarea.addEventListener('input', compareMessage);
  }

  void compareMessage(Event event) {
    var comment = textarea.value as String;
    if (comment != '' && comment.length >= 3) {
      for (var message in comments) {
        if (message.length > comment.length &&
            message.substring(0, comment.length).contains(comment)) {
          errorParagraph.text =
              "'$message' has already been posted ${numberOfComments[comments.indexWhere((element) => element == message)]} times in this thread.";
        }
      }
    } else {
      errorParagraph.text = '';
    }
  }
}
