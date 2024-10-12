import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.onChanged,
    required this.hintText,
  });

  final void Function(String) onChanged;

  final String hintText;

  @override
  SearchBarWidgetState createState() => SearchBarWidgetState();
}

class SearchBarWidgetState extends State<SearchBarWidget> {
  ///
  late TextEditingController _textEditingController;

  ///
  ValueNotifier<bool> isSelectedValueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(
            18.0,
          ),
        ),
        child: ValueListenableBuilder<bool>(
          valueListenable: isSelectedValueNotifier,
          builder: (BuildContext context, bool isSelected, Widget? child) {
            return TextField(
              onTap: () {
                ///
                isSelectedValueNotifier.value = true;
              },
              onChanged: widget.onChanged,
              controller: _textEditingController,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.search,

              ///
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,

                /// [İpucu Metni]
                hintText: widget.hintText,

                /// [Ön ek İkon]
                prefixIcon: const Icon(
                  Icons.search,
                ),

                /// [Son ek İkon]
                suffixIcon: isSelected
                    ? IconButton(
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.cancel,
                        ),
                        onPressed: () {
                          /// [Temizle]
                          _textEditingController.clear();

                          /// Metin [Değiştirildiğinde]
                          widget.onChanged(_textEditingController.text);

                          /// Fokuslanmayı [Kapat/Gizle]
                          final FocusScopeNode currentScope =
                              FocusScope.of(context);
                          if (!currentScope.hasPrimaryFocus &&
                              currentScope.hasFocus) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          }

                          ///
                          isSelectedValueNotifier.value = false;
                        },
                      )
                    : null,

                ///
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 40,
                  minWidth: 75,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
