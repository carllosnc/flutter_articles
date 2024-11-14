import 'package:flutter/material.dart';

extension StringExtension on String {
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  Text pageTitle() {
    return Text(
      toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 2,
      ),
    );
  }
}

extension ColumnExtension on Column {
  Column gap(double size) {
    final List<Widget> items = [];

    for (int i = 0; i < children.length; i++) {
      items.add(children[i]);

      if (i < children.length - 1) {
        items.add(SizedBox(
          key: Key("gap-$i"),
          height: size,
        ));
      }
    }

    return Column(
      children: items,
    );
  }
}

class Resources {
  //colors
  Color get primary => const Color(0xFF00A0FF);
  Color get secondary => const Color(0xFF09FF00);
  Color get tertiary => const Color(0xFFFF0000);

  //images
  String get logo => 'assets/images/logo.png';
  String get background => 'assets/images/background.png';
  String get texture => 'assets/images/texture.png';

  //common margins
  EdgeInsets get margin => const EdgeInsets.all(16);
  EdgeInsets get marginSmall => const EdgeInsets.all(8);
  EdgeInsets get marginMedium => const EdgeInsets.all(24);
  EdgeInsets get marginLarge => const EdgeInsets.all(32);
  EdgeInsets get marginXLarge => const EdgeInsets.all(64);

  //common paddings
  EdgeInsets get padding => const EdgeInsets.all(16);
  EdgeInsets get paddingSmall => const EdgeInsets.all(8);
  EdgeInsets get paddingMedium => const EdgeInsets.all(24);
  EdgeInsets get paddingLarge => const EdgeInsets.all(32);

  //common borderRadius
  BorderRadius get borderRadius => BorderRadius.circular(16);
  BorderRadius get borderRadiusSmall => BorderRadius.circular(8);
  BorderRadius get borderRadiusMedium => BorderRadius.circular(24);
  BorderRadius get borderRadiusLarge => BorderRadius.circular(32);
}

extension ResourcesExtension on BuildContext {
  Resources get resources => Resources();
}

extension CardExtension on Container {
  Container card({
    required String title,
    required String description,
    required String imageUrl,
    required void Function()? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            description,
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
              ),
              onPressed: () {},
              child: const Text('Action'),
            ),
          )
        ],
      ).gap(10),
    );
  }
}

extension StringToTextExtension on String {
  Text get text {
    return Text(
      this,
      style: const TextStyle(),
    );
  }
}

extension TextStyleExtension on Text {
  Text _baseText({
    String? data,
    TextStyle? style,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    TextAlign? textAlign,
    TextDirection? textDirection,
    int? maxLines,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
    TextScaler? textScaler,
  }) {
    return Text(
      data ?? this.data as String,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      maxLines: maxLines ?? this.maxLines,
      selectionColor: selectionColor ?? this.selectionColor,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      strutStyle: strutStyle ?? this.strutStyle,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textScaler: textScaler ?? this.textScaler,
      key: key,
      style: style ?? const TextStyle(),
    );
  }

  Text color(Color color) {
    return _baseText(
      style: style?.copyWith(color: color),
    );
  }

  Text get bold {
    return _baseText(
      style: style?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Text fontWeight(FontWeight weight) {
    return _baseText(
      style: style?.copyWith(fontWeight: weight),
    );
  }

  Text get italic {
    return _baseText(
      style: style?.copyWith(fontStyle: FontStyle.italic),
    );
  }

  Text fontSize(double size) {
    return _baseText(
      style: style?.copyWith(fontSize: size),
    );
  }

  Text height(double height) {
    return _baseText(
      style: style?.copyWith(height: height),
    );
  }

  Text get underline {
    return _baseText(
      style: style?.copyWith(decoration: TextDecoration.underline),
    );
  }

  Text get lineThrough {
    return _baseText(
      style: style?.copyWith(decoration: TextDecoration.lineThrough),
    );
  }

  Text get overline {
    return _baseText(
      style: style?.copyWith(decoration: TextDecoration.overline),
    );
  }

  Text get uppercase {
    return _baseText(
      data: data?.toUpperCase(),
      style: style?.copyWith(),
    );
  }

  Text get lowercase {
    return _baseText(
      data: data?.toLowerCase(),
      style: style?.copyWith(),
    );
  }

  Text get firstUpper {
    String firstLetter = data![0].toUpperCase();
    String rest = data!.substring(1);

    return _baseText(
      data: firstLetter + rest,
      style: style?.copyWith(),
    );
  }

  Text letterSpacing(double spacing) {
    return _baseText(
      style: style?.copyWith(letterSpacing: spacing),
    );
  }

  Text get ellipsis {
    return _baseText(
      style: style?.copyWith(overflow: TextOverflow.ellipsis),
    );
  }

  Text get fade {
    return _baseText(
      maxLines: 1,
      softWrap: false,
      style: style?.copyWith(overflow: TextOverflow.fade),
    );
  }

  Text get center {
    return _baseText(
      textAlign: TextAlign.center,
      style: style?.copyWith(),
    );
  }

  Text get right {
    return _baseText(
      textAlign: TextAlign.right,
      style: style?.copyWith(),
    );
  }

  Text get left {
    return _baseText(
      textAlign: TextAlign.left,
      style: style?.copyWith(),
    );
  }

  Text get justify {
    return _baseText(
      textAlign: TextAlign.justify,
      style: style?.copyWith(),
    );
  }

  Text background(Color color) {
    return _baseText(
      style: style?.copyWith(background: Paint()..color = color),
    );
  }
}
