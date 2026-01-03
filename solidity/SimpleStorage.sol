// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // stating our version

/// @notice `
/// bool hadFavoriteNumber = false;
/// uint256 favoriteNumber = 88;
/// int256 favoriteNumber2 = -88;
///
/// string favoriteNumberInText = "88";
/// string은 text에 특화된 bytes 객체임 so can easily converted to bytes obj
///
/// address myaddress = 0xF28158c515a16397255ad2A1A3082aB3aB54c9ee;
/// bytes32 favoriteBytes = "cat";
/// `
contract SimpleStorage {
    // basic types: boolean, uint, int, address, bytes
    // basically same as unint256 a
    // public 키워드를 달면 getter를 자동으로 만들어준다함.. default는 internal이고 이외에 external, private 존재
    uint256 myFavoriteNumber; // gets initialized to 0 if no value is given

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // new 키워드 없이 constructor 호출은 좀 생소하군
    Person public pat = Person({favoriteNumber: 7, name: "Pat"});

    // 지금은 dynamic array 이고 대괄호 안에 size를 지정하면 static array
    Person[] public listOfPeople;

    // 일반적인 key-value pair 같지만... 훨씬 원시적이고 단편적인 lookup 이라고 한다.. 그래서 clear, length, has 뭐 이런거 다 없다
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // view: 상태를 읽을 뿐인 함수에 다는 키워드, pure: 상태 반환하는 것이 아닌 순수 `값`을 반환 할때
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    /**
      view, pure 키워드로 선언된 함수는 블록체인의 상태를 변경하지 않고 
      단순히 읽기 작업만 수행하므로 트랜잭션을 일으키지 않기 때문에 
      가스 fee 를 소모하지 않는다 
      *view example*  
    */
    function retrievePure() public pure returns (uint256) {
        return 7;
    }

    // memory 키워드와 calldata 키워드는 둘다 임시변수이지만 간단한 차이점은 memory mutable 하지만 calldata는 immutable 하다는 것...
    // storage 는 상태변수가 저장되는 영역인데 일반적인 객체지향 언어의 클래스 필드처럼 선언된 (ex. 위의 myFavoriteNumber변수) 변수가 상태 변수
    // !! primitive 타입의 변수에게는 이런 키워드가 필요없다 .. 오로지 reference 타입에만 필요...
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(
            Person({favoriteNumber: _favoriteNumber, name: _name})
        );
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
