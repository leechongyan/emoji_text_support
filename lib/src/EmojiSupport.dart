import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:characters/characters.dart';

class EmojiSupport{
  static void addEmoji({Emoji emoji, TextEditingController textEditingController}){
    String text = textEditingController.text;
    TextSelection textSelection = textEditingController.selection;
    String newText;
    final emojiLength = emoji.emoji.length;
    if(textSelection.start == -1){
      newText = emoji.emoji;
      textEditingController.text = newText;
      textEditingController.selection = textSelection.copyWith(
        baseOffset: emojiLength,
        extentOffset: emojiLength,
      );
    }else {
      newText = text.replaceRange(textSelection.start, textSelection.end, emoji.emoji);
      textEditingController.text = newText;
      textEditingController.selection = textSelection.copyWith(
        baseOffset: textSelection.start + emojiLength,
        extentOffset: textSelection.start + emojiLength,
      );
    }
  }

  static void backspace({TextEditingController textEditingController}){
    String text = textEditingController.text;
    TextSelection textSelection = textEditingController.selection;

    if(textSelection.start!=textSelection.end){
      // delete the range
      String newText = text.substring(0, textSelection.start)+text.substring(textSelection.end);
      textEditingController.text = newText;
      textEditingController.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
    }else{
      // find the last character len
      int len = text.substring(0, textSelection.start).characters.takeLast(1).toString().length;
      String newText = text.substring(0, textSelection.start).characters.skipLast(1).toString()+text.substring(textSelection.end);
      textEditingController.text = newText;
      textEditingController.selection = textSelection.copyWith(
        baseOffset: textSelection.start-len,
        extentOffset: textSelection.start-len,
      );
    }
  }
}