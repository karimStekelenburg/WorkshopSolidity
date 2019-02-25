pragma solidity ^0.5.0;

contract Bakery {

  address[] allCookies;
  mapping(string => address[]) private flavorToCookieMap;

  function createCookie(string memory flavor) public returns(address newContract) {
    Cookie c = new Cookie(flavor);
    allCookies.push(address(c));
    flavorToCookieMap[flavor].push(address(c));
    return address(c);
  }
  
  function getCookiesWithFlavor(string memory flavor) public view returns (address[] memory _cookieAddresses) {
      return flavorToCookieMap[flavor];
  }

  function getCookieCount() public view returns(uint _cookieCount) {
    return allCookies.length;
  }

  
}


contract Cookie {
  string flavor;
    
  constructor(string memory _flavor) public {
    flavor = _flavor;
  }


  function getFlavor() public view returns (string memory _flavor) {
    return flavor;
  }    
}