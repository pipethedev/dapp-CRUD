// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract User {

    struct User {
        uint index,
        string name,
        uint age,
        bytes32 email
    }

    event CreateUser(
        address indexed userAddress,
        uint index, 
        string name,
        bytes32 email, 
        uint age,
    );

    event UpdateUser(
        address indexed userAddress, 
        uint index,
        string name,
        bytes32 email, 
        uint age
    );

    //store the data in the form of key-value pairs (users)
    mapping(address => User) private users;
    address[] private userIndex;

    function checkUser(address userAddress) public constant returns(bool isUser) {
        if(userIndex.length == 0) return false;

        return (userIndex[users[userAddress].index] == userAddress);
    }

    //Create a new user
    function addUser(
        address userAddress,
        string name,
        bytes32 userEmail,
        uint userAge,
    ) public returns (bool success){
        users[userAddress].name = name;
        users[userAddress].email = userEmail;
        users[userAddress].age = userAge;
        return true;
    }

    //Fetch user
    function fetchUser(address userAddress) constant returns(string name, bytes32 email, uint age){
        return (
            users[userAddress].name, 
            users[userAddress].email, 
            users[userAddress].age
        );
    }

    //count total number of users
    function count() public constant returns(uint count) {
        return userIndex.length;
    }

    //Update a user
    function updateUserEmail(
        address userAddress,
        bytes32 email
    ) public returns (bool success) {
        if(!isUser(userAddress)) return false)) throw;
        users[userAddress].email = email;
        return true;
    }

    function updateUserAge(address userAddress, uint age) public returns (bool success) {
        if(!isUser(userAddress)) return false)) throw;
        users[userAddress].age = age;
        return true;
    }

    function getUserByIndex(uint index) public constant returns(address userAddress){
        return userIndex[index];
    }

}