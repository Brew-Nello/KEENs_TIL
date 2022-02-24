# Enumeration (������)

## �������̶�
> An enumeration defines a common type for a group of related values   
> and enables you to work with those values in a type-safe way within your code.

: ���õ� ������ �̷���� �׷��� ���� Ÿ������ �����Ͽ� `type-safety`�� �����Ͽ� �ڵ带 �ۼ��� �� �ְ� ���ش�.

```swift
// enum ����
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// �޸�(,)�� ����� ���ٿ� ���� ���� �ִ�.
enum Planet {
    case mercury, venus, earch, mars, jupiter, saturn
}

// dot(.)�� ���� ���� ������ �� �ִ�.
let direction: CompassPoint = .south
```

- C�� Objective-C�� int����� �������� �����ϴ� �ݸ� swift������ case���� string, character integer, floating������ ����� �� �ִ�.
- �������� 1�� Ŭ������(first-class types)���� ����������Ƽ ���, �ʱ�ȭ ����, �ʱ⼱�� Ȯ���� �����ϴ�.

## �������� �� ���°�?
���� �ڵ��� ������ ���� ���� ����� �ڵ�, ȿ������ �ڵ� ��� �Ѵ�.
```
�������� ����ϸ�...
- �ڵ带 ���� ����ϰ� �ۼ��� �� �ִ�.
- �ڵ� �ۼ� �� �Ǽ��� �ٿ��ش�.
```
## �������� Ư¡
### 1) `switch` ������ ����
- switch���� �����Ͽ� ����ϸ� ����.
    - �ݵ�� �������� ��� case�� ������ �����ؾ� �Ѵ�.
```swift
switch direction {
    case .north:
        print("���� �������� ���ϰ� �ֽ��ϴ�.")
    case .south:
        print("���� �������� ���ϰ� �ֽ��ϴ�.")
    case .west:
        print("���� �������� ���ϰ� �ֽ��ϴ�.")
    case .east:
        print("���� �������� ���ϰ� �ֽ��ϴ�.")
}

// ���� ��� ���̽� ó���� ����ϴ°� �������� �ʴٸ� default�� �ۼ��� �� �ִ�.
let myPlanet: Planet = .earth

switch myPlanet {
    case .earth:
        print("���� �༺�� �����Դϴ�.")
    default:
        print("�ܰ� �༺�Դϴ�. �ݿ�")
}
```

### 2) ���� �� (Associated Values)
- �� `case`�� `custom type`�� �߰����� ������ ������ �� �ִ�.
- Alamofire�� ����� �� `let value`, `let error` �κ��� �������� ����
```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
```

### 3) ���ð� (RawValue)
- case�� raw���� ������ �� �ִ�.
- raw���� `String`, `Character`, `Integer`, `Float` �� ����� �� �ִ�.
    ��, �� ���ð��� ������ ���𿡼� �����ؾ� �Ѵ�. (�ߺ�X)
- �Ͻ��� �Ҵ��� �����ϴ�.
// RawValue�� �ʱ�ȭ�� �����ϴ�. -> �������� �ʴ� ������ �ʱ�ȭ�ϸ� `nil`�� �ȴ�.
```swift
enum Number: Int {
    case one = 1 // ��������� 1 ����
    case two // �Ͻ������� 2 �Ҵ�
    case three // �Ͻ������� 3 �Ҵ�
}

// RawValue�� �ʱ�ȭ
let myNumber = Number(rawValue: 2) // two
```

### 4) `RawValue`�� `Associated Value`�� ���̴�?
- `rawValue`�� ���� `case`�� ������� ������ �ٸ� `case`���� ���еǴ� ������ ���̴�.
- `associated value`�� Ư���� `case`�� ����Ǵ� Ÿ���̴�.
```
��,   
rawValue�� ��� ���� �ٸ��� �ٸ� case�� �ش�������, 
associated value�� ������ case ������ �ٸ� ���� ���� �� �ִ�.
```