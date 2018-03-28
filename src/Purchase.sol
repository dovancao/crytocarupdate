pragma solidity ^0.4.0;

contract Purchase {
    uint public value;
    address public addressOfAdminPurchase;
    address public buyer;
//    enum State { Created, Locked, Inactive }
//    State public state;

    function Purchase() internal{
        addressOfAdminPurchase = msg.sender;
        value = msg.value /2;
        require((2*value) == msg.value);
    }
    modifier onlyBuyer(){
        require(msg.sender == buyer);
        _;
    }
    modifier onlyAdmin(){
        require(msg.sender == addressOfAdminPurchase);
        _;
    }
//    modifier inState(State _state) {
//        require(state == _state);
//        _;
//    }
    event Aborted();
    event PurchaseConfirmed();
    event ItemReceived();

    function checkPurchase(address _address) onlyBuyer {
        if(msg.value < value){
            Aborted();
        }
        else if(msg.value >= value){
            msg.value -= value;
            addressOfAdminPurchase.transfer(value);
            PurchaseConfirmed();
            ItemReceived();
        }

    }
}
