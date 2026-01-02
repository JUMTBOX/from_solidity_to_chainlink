## The EVM can read and write to several places

```jsx
    function addPerson (string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person({ favoriteNumber: _favoriteNumber, name: _name }) );
    }
```

### Write & Read

- #### Memory
  - 외부 함수 호출 (external function call) 동안만 존재하는 임시 영역이다.
  - 가변한 작업용 복사본을 둘 때 주로 사용한다.
- #### Storage
  - 상태 변수가 저장되는 영역이고, contract가 살아있는 동안 유지된다. ( mutable )
- #### Calldata
  - 외부 호출로 들어온 함수 인자가 놓이는 특수 영역이며, 비영속적이며 불변하다. “대체로 memory처럼 동작”한다고 문서에 명시되어 있다.

**여기부터는 Solidity 문법 레벨의 `data location`이 아닌, EVM이 실행 중에 접근하는 데이터 영역(또는 버퍼)로 보면 된다.**

- #### Stack
- #### Transient Storage
- #### Code
- #### Returndata

### Write (not read)

- Logs

### Read (not write)

- Transaction data (& Blobhash)
- Chain Data
- Gas Data
- Program Counter
- (other)

## 그래서 언제 어떻게 쓰냐!

- 상태로 영구 보존해야한다 → `storage`
- 함수 내부에서 가공/수정해야 하는 임시 데이터 → `memory`
- 외부에서 들어온 큰 배열,문자열,struct를 읽기만 한다 → `calldata` (복사 방지 + read-only 강제)
