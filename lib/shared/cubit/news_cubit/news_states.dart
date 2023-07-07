abstract class newsStates {}

class newsInitialStates extends newsStates {}

class newsBottomNevStates extends newsStates {}

class newsBusinessSuccessState extends newsStates {}

class newsBusinessLoadingState extends newsStates {}

class newsBusinessErrorState extends newsStates {
  String error;

  newsBusinessErrorState(this.error);
}

class newsSportsLoadingState extends newsStates {}

class newsSportsSuccessState extends newsStates {}

class newsSportsErrorState extends newsStates {
  String error;

  newsSportsErrorState(this.error);
}

class newsScienceLoadingState extends newsStates {}

class newsScienceSuccessState extends newsStates {}

class newsScienceErrorState extends newsStates {
  String error;

  newsScienceErrorState(this.error);
}

class newsSearchLoadingState extends newsStates {}

class newsSearchSuccessState extends newsStates {}

class newsSearchErrorState extends newsStates {
  String error;

  newsSearchErrorState(this.error);
}
