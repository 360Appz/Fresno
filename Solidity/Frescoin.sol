pragma solidity 0.8.4;

contract FresCoin {
    
    int connection;
    constructor() 
    {
        connection = 0;
    }
    
    //Counts the connection time
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

