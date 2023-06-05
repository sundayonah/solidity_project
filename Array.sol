// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Array {
    //Several ways to initialize on array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    //fixed sized array, all elements initialize to 0.
    uint[10] public myFixedSizedArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    //solidity can return the entire array.
    //But this function should be avoided for arrays that can grow indefinitely in Length.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        //Append to Array
        arr.push(i);
    }

    function pop() public {
        ///removing the last element from array
        arr.pop();
    }

    function getLength() public view returns (uint) {
        //getting the length of array.
        return arr.length;
    }

    function remove(uint index) public {
        //Delete does not Change the array Length.
        //It resets the value at index to its default value, in this case 0.
        delete arr[index];
    }

    // function examples() external pure {
    //     uint[] memory a = new uint[](5);
    // }
}
