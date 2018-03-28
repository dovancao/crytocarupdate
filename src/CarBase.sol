pragma solidity ^0.4.0;

contract CarBase {

    uint carIdDigit = 6;
    uint carIdModulus = 10 ** carIdDigit;

    uint public constant NEWCARFEE = 0.01 ether;

    string[16] public constant MANUFACTURER = ["Toyota", "BMW", "Nissan",
                                        "Mercedes", "Huyndai", "Volk swagen",
                                        "Porche", "Kia","Land Rover",
                                        "Ferrari", "Ford", "Roll Royce",
                                        "Chewrolet","Audi","Bugatti","GM"];

    uint8[8] public constant YEAROFPRODUCTION = [1940,1950,1960,1970,1980,1990,2000,2010,2018];



    uint public constant COOLDOWNTIME = 1 hours;

    struct Car {
        string carManufacturer;
        string modelOfCar;
        uint8 yearOfProduction;
        address _owner;
        uint32 coolDownTimeUpgrade;         // thời gian cooldown mỗi lần upgrade
        uint32 coolDownTimeIndex;           // index của cooldown
        uint32 carId;
    }

    Car[] public cars;

    event NewCar(uint carId, string carManufacturer, string modelOfCar, uint yearOfProduction);

    mapping (address => uint) carOwnerCount;   // số car của mỗi owner
    mapping (uint => address) carIndexToOwner; // đưa vào id của car, trả về address của người sở hữu


    function generateCarManufacturer() internal view returns (string){
        //generate and return here
    }

    function generateModelOfCar(string _carManufacturer) internal view returns (string) {
        //generate and return here
        if(_carManufacturer ==
    }

    function generateCarId(string _carManufacturer) internal view returns (uint){
        uint rand = uint(keccak256(_str));
        return rand % carIdModulus;
    }

    function _createCar(string _carManufacturer, uint _carId) public payable {

    }

    


}
