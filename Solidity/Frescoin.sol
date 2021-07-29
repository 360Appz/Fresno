pragma solidity 0.8.4;

contract FresCoin {
    
    int connection;
    constructor() 
    {
        connection = 0;
    }
    
    //Gets the balance of coins
    function getConnection() view public returns(int)
    {
        return connection;
    }
    
     //Rent bike function
    function rentBike(int bike) public
    {
        connection = connection + bike;
    }
    
}

