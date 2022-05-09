// Ž���(Greedy) ���� 3�� Ǯ��
// ��ó: �̰��� �ڵ��׽�Ʈ (�Ѻ��̵��, ������)

import Foundation

// 1��
/*
 // å 87p.g. ���� 3-1
 �Ž������� ������  500, 100, 50, 10. ���� ���Ѵ�� �����Ѵٰ� ����.
 ��, �Ž��� ��� �� �� N�� �׻� 10�� ���.
 �� ������ �Ž��� ����ϴ� ������ ���϶�.

 * point: ����ū ������ ȭ����� ���ϴ� ��.
 */

let coins: [Int] = [500, 100, 50, 10]

func sol(_ input: Int) -> [Int] {
  var array: [Int] = []
  var rem: Int = input
  
  for coin in coins {
    array.append(rem / coin)
    rem = rem % coin
  }
  
  return array
}


// 2��
/*
 // 3-2��: ū���� ��Ģ
 
 n: �迭�� ����, m: ���� Ƚ��, k: �ִ� �ݺ�Ƚ��
 n = array.count
 
 �迭�� ���Ҹ� m�� ���ؼ� ���� �� �ִ� ���� ū ���� ã�� ��
 �� ���Ҵ� �����ؼ� �ִ� k�� �ݺ��� �� �ִ�.
 
 ex. [4, 5, 6] m: 8, k: 3
 6 + 6 + 6 + 5 + 6 + 6 + 6 + 5
 */

func sol2(array: [Int], m: Int, k: Int) -> Int {
  var answer: Int = 0
  var count: Int = m
  
  var sortedArray = array.sorted()
  let firstNum = sortedArray.popLast()! // ���� ū ��
  let secondNum = sortedArray.popLast()! // �ι�°�� ū ��
  
  while count != 0 {
    for _ in 0..<k {
      if count == 0 {
        break
      }
      
      answer += firstNum
      count -= 1
    }
    
    if count == 0 {
      break
    }
    
    answer += secondNum
    count -= 1
  }
  
  return answer
}

func sol2_2(array: [Int], m: Int, k: Int) -> Int {
  var answer: Int = 0
  
  var sortedArray = array.sorted()
  let firstNum = sortedArray.popLast()!
  let secondNum = sortedArray.popLast()!
  
  var count = (m / (k + 1)) * k
  count += m % (k + 1)
  
  answer += count * firstNum
  answer += (m - count) * secondNum

  return answer
}


// 3��
/*
 // 96������ 3-3 ����: ���� ī�� ����
 �࿡�� ���� ���� ������ �̰�, �׵� �� ���� ū ���� ����.
 */

func sol3(metric: [[Int]])  -> Int {
  var array: [Int] = []
  
  for m in metric {
    array.append(m.min()!)
  }
  
  return array.max()!
}


func sol3_2(metric: [[Int]])  -> Int {
  var result: Int = 0
  
  for m in metric { // [1, 2, 3]
    result = max(result, m.min()!)
  }
  
  return result
}


// 4��
/*
 // 99 ������ 3-4��: 1�� �� ������
  N �� 1�� �� ������ ������ �� ������ �ݺ������� ����.
  1,2�� ������ �ּ� ���� Ƚ���� ���϶�.
 
  1: N  -1
  2: N / K
 */

func sol4(n: Int, k: Int) -> Int {
  var count: Int = 0
  var rem: Int = n
  
  while rem != 1 {
    if rem % k == 0 {
      rem = rem / k
    } else {
      rem -= 1
    }
    
    count += 1
  }
  
  return count
}
