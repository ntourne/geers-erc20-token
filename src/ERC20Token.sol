pragma solidity ^0.5.7;

contract ERC20Token {
    using SafeMath for uint256;
    uint256 public totalSupply;
    string public name;
    uint8 public decimals;
    string public symbol;
    uint256 public maxBalanceAllowed;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    function balanceOf(address _owner) public view returns (uint256 balance) {
        // TODO

        return 0;
    }

    function transfer(address _recipient, uint256 _value) public {
        require(balances[msg.sender] >= _value && _value > 0);

        // TODO

        emit Transfer(msg.sender, _recipient, _value);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public {
        // TODO
        emit Transfer(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public {
        // TODO
    }

    function allowance(address _spender, address _owner)
        public
        view
        returns (uint256 balance)
    {
        return allowed[_owner][_spender];
    }

    function setMaxBalanceAllowed(uint256 _maxBalanceAllowed) public {
        // TODO
    }

    modifier isOwner() {
        if (msg.sender != owner) {
            throw;
        }

        _; // continue executing rest of method body
    }

    // Event which is triggered to log all transfers to this contract's event log
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // Event which is triggered whenever an owner approves a new allowance for a spender.
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
}

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0);
        uint256 c = a / b;

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}
