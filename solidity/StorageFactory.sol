// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage as Sim} from "./SimpleStorage.sol";

contract StorageFactory {
    /* Contract 타입의 필드(상태)가 public으로 선언되어 있을 때 배포 이후 getter 함수를 호출하면 return 타입은 address(Contract의 주소)임 */
    Sim[] listOfSimpleStorageAddresses; // 근데 visibility 키워드가 명시되지 않으면 기본은 internal

    function createSimpleStorageContract() public {
        /**
         * 구조체를 instantiate 할 때 new 키워드 없이 하길래 안쓰는 줄 알았더니 새 Contract를 instantiate 할 때는 필요...
         * 그런데 이미 체인에 배포되어있는 Contract를 의미할 때는 new 키워드 띠고 파라미터로 해당 계약의 주소를 전달하며 일반 함수 호출처럼 사용한다고 함 : SimpleStorage(existing_address);
         * 메모리 동적 배열/bytes 할당에도 사용: new T[](len), new bytes(len)
         * */
        Sim newSimpleStorageContractVar = new Sim();
        listOfSimpleStorageAddresses.push(newSimpleStorageContractVar);
    }

    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumber
    ) public {
        // Address
        // ABI ( Application Binary Interface )
        Sim mySimpleStorage = Sim(
            listOfSimpleStorageAddresses[_simpleStorageIndex]
        );

        mySimpleStorage.store(_newSimpleStorageNumber);
    }
}
