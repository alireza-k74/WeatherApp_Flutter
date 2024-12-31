import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/theme_data.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(AppTheme.lightTheme)) {
    on<ToggleTheme>((event, emit) {
      final isLightTheme = state.themeData == AppTheme.lightTheme;
      emit(ThemeState(isLightTheme ? AppTheme.darkTheme : AppTheme.lightTheme));
    });
  }
}
