
# �ɼų��̶� ��������, �ɼųΰ��� unwrap�ϴ� ������� ������ �ִ°�
  <br>

  - �ɼų��� ������ ���� `nil` �� �� �ִٴ� ���� ǥ���ϴ� ���̴�.
  - �ݴ�� Optional�� �ƴ϶��(non-optional) �ش� ���� nil�� �� �� ������ �ǹ��Ѵ�.

  ```swift
  var name: String? // ? Ű���带 ���

  var age: Int // ������ ����
  var age = nil // ������ ����
  ```

  - Optional Ű���带 ������� �ʾҴٸ� ���� �Է��϶�� ������ �߻��ϰ�, ���Ŀ��� `nil`�� �������� �ϸ� ������ ������ �߻��Ѵ�.
  - `nil`�� ���� ���ɼ��� �ִ� ���� ������ �ܰ迡�� ������ �߻���Ű�� ������ unwrapping, binding ������ �ʿ��ϴ�.

    <details>
      <summary> 1) Optional Unwrapping </summary>
      <br>

      ```swift
      var number: Int? = 10

      if number {
      let double = number! + number! // forced unwrapping
      }
      ```

      - `!` Ű���带 ���� ������ ���� �����´�.
      - ���� if�� `nil` üũ�� ���� �ʰ� `!`�� ����Ѵٸ� ��Ÿ�� ������ �߻��� �� �����Ƿ�, `!` ����� �ִ��� ���ϴ°� ����.

    </details>

    <details>
      <summary> 2) Optional Binding </summary>
      <br>

      - ������ ���� ������ ������ �𸣴� ��Ȳ���� Optional�� �츮�� ����ؾ� ������ �� ���� �����ϰ� �����ϱ� ���ؼ� ����ϴ� ����� Optional Binding�̴�.
      - Optional Binding���� `if let`, `guard let` �� ������ �ִ�.
      <br>
      
      **[ if let ]**
      ```swift
      // if let
      var number: Int? = 10

      if let number = number {
      print("number is \(number)") // number�� ���� �ִ� ���
      } else { // number�� ���� ���� ���
      print("number does not exist.")
      }
      ```

      - `Optional`���� ���ο� ����� �ް�, if���� ��ȣ �ȿ����� `non-optional`���� ����Ѵ�.
      - ���� ����� ����� `non-optional` ���̱� ������ `!` Ű���带 ����� �ʿ䰡 ����.
      <br>
      
      **[ guard let ]**
      ```swift
      // guard let
      var number: Int? = 10

      guard let number = number else { return }
      ```

      - `Bool` Ÿ���� ������ `guard`���� ���۽�ų �� ������, �ɼų� ���ε� ���ҵ� �����ϴ�.
      - `guard` ���� �׻� `else` ������ �������, `else` ��� ���� �ڵ忡 �ڽź��� ���� �ڵ� ����� �����ϴ� �ڵ尡 �ݵ�� ���� �ȴ�.
      - �ڵ� ��� ���� �� `return, break, continue, throw` �� **����� ��ȯ ��ɾ**�� ����Ѵ�.

    </details>

    <details>
      <summary> 3) guard VS if let Ư¡ �� </summary>
      <br>

      **[ guard���� Ư¡ ]**
      - �ݵ�� ����� ��ȯ ��ɾ�'�� �־��־�� �Ѵ�.
      - �䱸���� ���� �ڵ带 if let ���� �ξ� �����ϰ� �б� ���� ������ �����ϴ�.
      - ���� ���׸� ó���ϰ� ���� �� ����. �� [����ó���� ����](https://dev200ok.blogspot.com/2020/03/swift-guard-let-if-let_24.html)
      - �Լ� ��ü���� optional�� ����� ����� �Լ��� ����� �� �ִ�.
      <br>
      
      **[ guard�� ���� ���� ���� ]**
      - ��� ��ȯ ��ɾ �� �� ���� ��Ȳ�̶�� ����� �Ұ����ϴ�.
      - �Լ�, �޼���, �ݺ��� �� Ư�� ��� ���ο� ��ġ���� �ʴ´ٸ� ����� ���ѵȴ�.
      <br>
      
      **[ if let�� Ư¡ ]**
      - ������ ���� 2������ ����� ���ϴ� �۾��� �����ϴ�.
      - ���� �����θ� ����� �����ϴ�.
      - else���� ������ �� �ִ�.
      - �ɼų� ���ε��� ����� �� ��� �ȿ����� ���� ����� �����ϴ�.
      <br>
      
      **[[ ���� ����ϸ� ������? ]](https://www.hackingwithswift.com/quick-start/understanding-swift/when-to-use-guard-let-rather-than-if-let)**
      - guard : ���� ���׸� ó���ϰ����� �� ����ϸ� ����.
      - if let : ������ ������ ������ ó���� �� ����ϸ� ����.

    </details>

    <details>
      <summary> 4) Coalescing Nil Values </summary>
      <br>

      ```swift
      var number: Int? = 10
      print(number ?? 0) // number�� nil�� ��� 0�� ��� ���
      ```

      - `Optional Int`Ÿ���� number�� ���� ����ִٸ� unwrapping�ϰ�, `nil`�� ��� default������ `??` �ڿ� ���� ���� ��ȯ�ϴ� operator �̴�.
    </details>