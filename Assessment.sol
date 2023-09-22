// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable public owner;
    // This is the owner of the contract. It's a payable address, which means it can receive Ether.

    uint256 private _balance;
    // This is the balance of the contract. It's private, so it can't be accessed outside of this contract.

    event Deposit(uint256 amount);
    // This event is emitted when a deposit is made.

    event Withdraw(uint256 amount);
    // This event is emitted when a withdrawal is made.

    modifier onlyOwner {
        require(msg.sender == owner, "You are not the owner of this account");
        // This modifier ensures that only the owner can call the function.
        _;
    }

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        // The owner of the contract is the one who deploys it.

        _balance = initBalance;
        // The initial balance of the contract is set in the constructor.
    }

    function balance() public view returns(uint256){
        return _balance;
        // This function returns the balance of the contract.
    }

    function deposit() public payable onlyOwner {
        uint _previousBalance = _balance;
        // The previous balance is stored before the deposit is made.

        // perform transaction
        _balance += msg.value;
        // The value sent with the transaction is added to the balance.

        // assert transaction completed successfully
        assert(_balance == _previousBalance + msg.value);
        // An assertion checks that the new balance is correct.

        // emit the event
        emit Deposit(msg.value);
        // The Deposit event is emitted.
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);
    // This is a custom error that is thrown when there is not enough balance to withdraw.

    function withdraw(uint256 _withdrawAmount) public onlyOwner {
        uint _previousBalance = _balance;
        // The previous balance is stored before the withdrawal is made.

        if (_balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: _balance,
                withdrawAmount: _withdrawAmount
            });
            // If there is not enough balance, the transaction is reverted with the InsufficientBalance error.
        }

        // withdraw the given amount
        _balance -= _withdrawAmount;
        // The withdrawal amount is subtracted from the balance.

        // assert the balance is correct
        assert(_balance == (_previousBalance - _withdrawAmount));
        // An assertion checks that the new balance is correct.

        // emit the event
        emit Withdraw(_withdrawAmount);
        // The Withdraw event is emitted.

        // transfer the amount to the owner
        owner.transfer(_withdrawAmount);
        // The withdrawal amount is transferred to the owner.
    }
}
