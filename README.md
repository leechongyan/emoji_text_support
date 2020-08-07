# emoji_text_support

emoji_text_support is a flutter library for dealing with string of grapheme clusters, including emoji or special symbol in a textfield.

These helper functions aim to ensure that the textEditingController.selection and the text are updated correctly whenever there exists grapheme clusters in the string.

## Installation

In the ```dependencies:``` section of your ```pubspec.yaml```, add the following line:

```python
emoji_text_support: 1.0.0+2
```


## Usage

```dart
import 'package:emoji_text_support/emoji_text_support.dart';
```
There is only one main class to handle the textfield.

You do not need to initialize the class.

First, you need to have a TextEditingController.

```dart
// create a TextEditingController
final TextEditingController _textEditingController = TextEditingController();
```
Then, in your widget to select the emoji or remove the emoji, you can apply these commands to the onPressed callback.
```dart
// inside the callback function (onPressed)
// for adding the emoji
EmojiSupport.addEmoji(emoji: emoji, textEditingController: _textEditingController);

// for removing the emoji or any type of character
EmojiSupport.backspace(textEditingController: _textEditingController);

```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
