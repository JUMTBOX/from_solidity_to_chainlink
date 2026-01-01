// SPDX-License-Identifier: MIT 
pragma solidity 0.8.18;  // stating our version

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
    uint256 favoriteNumber; // gets initialized to 0 if no value is given
    // public 키워드를 달면 getter를 자동으로 만들어준다함.. default는 internal이고 이외에 external, private 존재

    function store (uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    // view: 상태를 읽을 뿐인 함수에 다는 키워드, pure: 상태 반환하는 것이 아닌 순수 `값`을 반환 할때
    function retrieve () public view returns(uint256) {
        return favoriteNumber;
    }

    /* view example */
    function retrievePure () public pure returns(uint256) {
        return 7;
    }
    /**
      view, pure 키워드로 선언된 함수는 블록체인의 상태를 변경하지 않고 
      단순히 읽기 작업만 수행하므로 트랜잭션을 일으키지 않기 때문에 
      가스 fee 를 소모하지 않는다 
     */
}