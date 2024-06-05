//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

error Raffle_NotEnoughEthSent();

/**@title A sample Raffle Contract
 * @author Patrick Collins
 * @notice This contract is for creating a sample raffle contract
 * @dev This implements the Chainlink VRF Version 2
 */
contract Raffle {
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    /** External Functions */
    function getentranceFee() external view returns (uint256) {
        return i_entranceFee;
    }

    /** Public Functions */
    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle_NotEnoughEthSent();
        }

        s_players.push(payable(msg.sender));
    }

    function pickWinner() public {}
}
