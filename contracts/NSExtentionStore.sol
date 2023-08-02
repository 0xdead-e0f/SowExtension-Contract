// SPDX-License-Identifier:MIT
pragma solidity =0.8.19;
import "@openzeppelin/contracts/access/Ownable.sol";

contract NSExtentionStore is Ownable {
    mapping(bytes32=>uint8) private extensionData;
    constructor() Ownable() {
        extensionData[keccak256(bytes("eth"))] = 1;
        extensionData[keccak256(bytes("ens"))] = 1;
        extensionData[keccak256(bytes("bnb"))] = 2;
        extensionData[keccak256(bytes("crypto"))] = 3;
        extensionData[keccak256(bytes("x"))] = 3;
        extensionData[keccak256(bytes("polygon"))] = 3;
        extensionData[keccak256(bytes("zil"))] = 3;
        extensionData[keccak256(bytes("nft"))] = 3;
        extensionData[keccak256(bytes("wallet"))] = 3;
        extensionData[keccak256(bytes("dao"))] = 3;
        extensionData[keccak256(bytes("blockchain"))] = 3;
        extensionData[keccak256(bytes("bitcoin"))] = 3;
        extensionData[keccak256(bytes("bit"))] = 4;
        extensionData[keccak256(bytes("zk"))] = 5;
        extensionData[keccak256(bytes("osmo"))] = 6;
        extensionData[keccak256(bytes("stars"))] = 7;
        extensionData[keccak256(bytes("sol"))] = 8;
        extensionData[keccak256(bytes("sui"))] = 9;
        extensionData[keccak256(bytes("apt"))] = 10;
    }

    function getExtension(string memory _ext) public view returns (uint8) {
        uint256 length = bytes(_ext).length;
        require(length > 0 && length < 20, "Extension could not be empty and less than 20 characters");
        return extensionData[keccak256(bytes(_ext))];
    }

    function setExtension(string memory _ext, uint8 _nsIndex, bool overwrite) public onlyOwner returns (bool) {
        uint256 length = bytes(_ext).length;
        require(length > 0 && length < 20, "Extension could not be empty and less than 20 characters");

        bytes32 hash = keccak256(bytes(_ext));
        if(overwrite || extensionData[hash] == 0) {
            extensionData[hash] = _nsIndex;
            return true;
        }
        return false;
    }

}