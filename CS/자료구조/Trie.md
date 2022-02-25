# Trie
```
���ڿ� �˻� ������ Ưȭ�� Ʈ�� ������ �ڷᱸ��. 
���ϴ� ���ڿ��� O(m) (m = ���ڿ��� ����) �ð����⵵�� ã�� �� �ִ�.
```

- struct Trie ���� Trie ������ �迭�� ������ �ش� Ű�� �´� �����ͷ� �̾����� ����.
- Trie�� �˻� �ĺ� ���ڿ��� �ϳ��� Ʈ���� ����, �ѹ��� �˻� O(m) ������ ���ڿ��� ���� ���θ� �˻� �����ϴ�.

## ����
- �׻� ù��° root ���� ��ĭ�̴�.
- Ʈ���� ��ü���� Ʈ���� ������ �迭�� ����� ����ŭ ������ �ϹǷ� �������⵵�� �ſ� Ŀ�� �� �ִ�.
- �������⵵ : O(key�� ����Ǽ� * ������ ũ�� * ��ü Ʈ���̿� �����ϴ� ��� ��)

## �ʼ�
1) ���� �� ������ ������ �־�� �Ѵ�.
```
- child (�ڽ� ��带 ��� �迭)
- isTerminal (� �ܾ��� �������� �ش��ϴ� ������� ���θ� ��Ÿ����.)
```
- ��带 Ž���ϴٰ� isTermial == true�̸� ���ݱ��� ��ģ��带 ������ ������ �ܾ �����Ѵٴ� ���̴�.
2) class�� �����ؾ� �Ѵ�.
- struct�� �ڱ� �ڽ��� Ÿ���� ���� ����.
-> ���(trie)�� child, isTerminal�� �����µ�, child�� trie ���̹Ƿ� �ڱ� �ڽ��� ������ �Ѵ�.

## Trie class ����
```swift
class  Trie {
    private var child: [Trie?] = Array(reapeating: nil, count: 26) // ���ĺ� ���� ��ŭ count
    private var isTerminla = false
}
```
- child[0] = a, child[1] = b .... �� �ǹ��Ѵ�.
- `child[0] == nil` : ������ ���ĺ� ���� ���ĺ����� a�� �� �� ����.
- `child[0] != nil` : ������ ���ĺ� �������� a�� �����ϸ� ����Ǿ� �ִ�.

## Trie�� �ܾ� ����
```swift
// �ܺο��� ���ϰ� ����ϱ� ���� �ۼ�
func insert(_ s: String) {
    let array: [Character] = Array(s)
    insertCharacter(array, 0)
}

// �Է¹��� s�� Character �迭�� �����, s�� ���� ��ŭ trie�� child�� �����Ͽ� ���ȣ���ϴ� �Լ�
private func insertCharacter(_ array: [Character], _ index: Int) {
    // ��� �ܾ Ž���ߴٸ� isTerminal�� true�� ����
    if array.count == index {
        self.isTerminal = true
        return
    }

    let charIndex = toNumber(array[index])

    if child[charIndex] == nil {
        child[charIndex] = Trie()
    }

    child[charIndex]?.insertCharacter(array, index + 1)
}

// subscript�� ����ϱ� ���� ���ڸ� 0-25 ������ ���ڷ� �ٲپ� �����ϴ� �Լ�
func toNumber(_ cha : Character ) -> Int {
    return Int(cha.asciiValue! - Character("a").asciiValue!)
}
```

## Ư�� �ܾ� ã��
```swift
// �ܺο��� ���ϰ� ����ϱ� ���� �ۼ�
func find(_ s: String) -> Bool {
    let array: [Character] = Array(s)
    return find(Character(array, 0))
}

// Ž���ϴٰ� Ư���ܾ ���ٸ� child[charIndex] == nil �̹Ƿ�, falase ����
// Ư�� �ܾ �� Ž�� �� isTerminal�� true�̸� �ش��Ѿ ã�ұ⿡ true ����
private func findCharacter(_ array: [Character], _ index: Int) -> Bool {
    if array.count == index {
        if isTerminal { return true }
        return false
    }

    let charIndex = toNumber(array[index])
    if child[charIndex] == nil { return false }

    return child[charIndex]!.findCharacter(array, index + 1)
}
```

## ����
- �˻� �ð��� ����ȴ�.
    - �������� ������ �䱸�ϴ� �������� O(m)�� �ð����⵵�� ����� ���� �� �ִ�.

## ����
- ���ڿ��� ���� �������ų� ��������� �޸𸮸� ���� �����Ѵ�.
    - ����: �� ����� child�� ���ĺ� ������ŭ�� �׻� ������ �ֱ� ����

## ����
- ���ϴ� prefix�� ���� �ܾ��� ���� ���� �ľ��ϱ�
- �ܾ��� �Է� ���� ����ϱ�

## ���� ��ũ
- [���ڿ��˻�Trie](https://jcsoohwancho.github.io/2019-11-03-%EB%AC%B8%EC%9E%90%EC%97%B4-%EA%B2%80%EC%83%89(2)-Trie/)