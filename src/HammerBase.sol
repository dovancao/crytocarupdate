pragma solidity ^0.4.0;
import "./Purchase.sol";

contract HammerBase {
    address public owner;
    address public constant ADDRESSOFADMIN;
    uint[3] public constant  NEWHAMMERFEE = [0.05 ether, 0.02 ether, 0.08 ether];
    uint hammerIdDigit = 6;
    uint hammerIdModulus =  10 ** hammerIdDigit;

    string[3] public constant TYPE = ["Silver", "Copper", "Gold"];

    struct Hammer {
        uint16 idHammer;
        string hammerType ;
    }
    Hammer[] public hammers;

    function generateIdHammer(string _typeOfHammer) internal views returns (string){
        uint rand = uint(keccak256(_typeOfHammer));
        uint16 newHammerId = rand % hammerIdModulus;
        if (_typeOfHammer == "Silver"){
            return newHammerId - newHammerId % hammerIdModulus + 34;
        }
        else if(_typeOfHammer == "Copper"){
            return newHammerId - newHammerId % hammerIdModulus + 54;
        }
        else if(_typeOfHammer == "Gold"){
            return newHammerId - newHammerId % hammerIdModulus + 98;
        }
    }
    hammers.push(generateIdHammer(TYPE[0]),TYPE[0]);
    hammers.push(generateIdHammer(TYPE[1]),TYPE[1]);
    hammers.push(generateIdHammer(TYPE[2]),TYPE[2]);

    function buyHammer( string _typeOfHammer) public payable {
        buyer = owner;
        addressOfAdminPurchase = ADDRESSOFADMIN;

        if (_typeOfHammer == "Silver"){
            value = NEWHAMMERFEE[0];

            _checkPurchase(buyer);
        }
        else if(_typeOfHammer == "Copper"){
            value = NEWHAMMERFEE[1];

            _checkPurchase(buyer);
        }
        else if(_typeOfHammer == "Gold"){
            value = NEWHAMMERFEE[2];

            _checkPurchase(buyer);

        }

    }
}

