
void main(){
  emitNumbers().listen((value){
    print('Stream value: $value');
  });
}

Stream<int> emitNumbers() async*{
  final initialValues = [1, 2, 3, 4, 5];
  
  for(int i in initialValues){
    i *=2; //i = i * 2  
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}