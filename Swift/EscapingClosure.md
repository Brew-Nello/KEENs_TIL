# Escaping Closure

### Escaping Closure ��?
- Ŭ������ �Լ��� ���ڷ� ���މ��� ��, �Լ��� ������ ����� �� ����Ǵ� Ŭ�����̴�.
```swift
class ViewModel {
    var completionHandler: (() -> Void)? = nil

    func fetchData(completion: @escaping () -> Void) {
        completionHandler = completion
    }
}
```
> �������
1. Ŭ������ fetchData() �Լ��� completion ���ڷ� ���޵ȴ�.
2. Ŭ���� completion�� conpletionHandler ������ ����ȴ�.
3. fetchData() �Լ��� ���� ��ȯ�ϰ� ����ȴ�.
4. Ŭ���� completion�� ���� ������� �ʾҴ�.
(completion�� �Լ��� ������ ����Ǳ� ���� ������� �ʱ� ������  
�Լ� �ۿ��� ����Ǵ� Ŭ�����̴�.)


### Non-Escaping Closure ��?
- �ݴ�� �Լ��� ������ ����Ǳ� ���� ����Ǵ� Ŭ�����̴�.

```swift
func runClosure(closure: () -> Void) {
    closure()
}
```
> �������
1. Ŭ������ `runClosure()` �Լ��� `closure` ���ڷ� ���޵ȴ�.
2. �Լ� ���� `closure()` �� ����ȴ�.
3.  `runClosure()` �Լ��� ���� ��ȯ�ϰ� �����Ѵ�.

</br>

## ����
escaping closure�� ���δ� �񵿱�� ����Ǵ� `HTTP ��û CompletionHandler` �� �ִ�.
``` swift
func makeRequest(_ completion: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
  URLSession.shared.dataTask(with: URL(string: "http://somesite.com")!) { data, response, error in
    if let error = error {
      completion(.failure(error))
    } else if let data = data, let response = response {
      completion(.success((data, response)))
    }
  }
}
```
- `makeRequest()` �Լ����� ����Ǵ� `completion` Ŭ������ �Լ� ���� �߿� ��� ������� �ʰ�, URL ��û�� ���� �� �񵿱�� ������ �ȴ�.
- Ŭ�����ε� ������ `completion`�� Ÿ�Կ� `@escaping` �� �ٿ��� `escaping closure` ��� ���� ������־�� �Ѵ�.

</br>

## Q. `@escaping` Ű���尡 ������ ������ escaping���θ� ����ؾ� �ұ�?
### NO!
- `@escaping` �� �پ��־ `non-escaping closure`�� ���ڷ� ���� �� �ִ�.
```swift
func runClosure(closure: @escaping () -> Void) {
    closure() // closure�� non-escaping ������ @escaping ����� ����
}
```

</br>

- ������ �ݴ�� `escaping closure` �� `@escaping` Ű���� ���� ����� �Ұ�
``` swift
class ViewModel {
    var completionhandler: (() -> Void)? = nil
    
    func fetchData(completion: () -> Void) { // @escaping �������� ������ ���� �߻�
        completionhandler = completion
    }
}
```

## Q. `@escaping`�� ����ϸ� escaping�� non-escaping�� ��� ����� �� �ִٸ� �� ������ ����ϴ°�?
- �����Ϸ��� �����ս��� ����ȭ �����̴�.
- non-escaping�� 
    - �����Ϸ��� Ŭ������ ������ ���� ����Ǵ��� �˰� �ִ�.
    ��- ���� Ŭ�������� ����ϴ� Ư�� ��ü�� ���� `retain, release` ���� ó���� ������ ��ü�� `life-cycle`�� ȿ�������� ���� �����ϴ�.
- escaping��
    - �Լ� �ۿ��� ����Ǳ� ������ Ŭ������ �Լ� �ۿ����� ������ ����Ǵ� ���� �����ϱ� ����,  
    Ŭ�������� ����ϴ� ��ü�� ���� �߰����� `reference cycle`�� ��������� �Ѵ�.
- �̷��� ������ Swift������ �ʿ��� ���� `escaping closure`�� ����ϵ��� �����صξ���.