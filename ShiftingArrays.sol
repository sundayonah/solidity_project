// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ArrayRemoveByShifting {
    //[1,2,3,4,5,6] --remove(0) -->[2,3,4,5,6]
    //[1,2,3] --remove(1) -->[1,3]
    //[1,2,3,4,5,6] --remove(2) -->[1,2,4,5,6]

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");
        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        //[1,2,4,5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        //[]
        assert(arr.length == 0);
    }
}

contract ArrayReplaceFronEnd {
    uint[] public arr;

    //Deleting an element creates a gap in the array.
    //One trick to keep the array compact is to move the last element into the place to delete.

    function remove(uint index) public {
        //move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        //remove the last element
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        //[1,4,3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        //[1,4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
