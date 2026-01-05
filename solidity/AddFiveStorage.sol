// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

/* solidity 에서 상속은 extends 키워드가 아닌 is 키워드를 사용 */
contract AddFiveStorage is SimpleStorage {
    function sayHello() public pure returns (string memory) {
        return "Hello from the other side!";
    }

    // overrides
    // virtual override
    // 부모 Contract의 메서드가 자식 Contract에서 override 될 수 있도록 허용하려면 virtual 키워드를 붙여야 하고 (안붙이면 컴파일 타임 에러)
    // 부모 Contract의 메서드를 자식 Contract에서 override 할 때는 override 키워드를 붙여야 한다
    function store(uint256 _favoriteNumber) public override {
        // 부모의 모든 필드(상태) 및 메서드를 상속받으므로 접근 가능
        myFavoriteNumber = _favoriteNumber + 5;
    }
}
