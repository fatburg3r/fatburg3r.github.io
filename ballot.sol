// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ballot {

    // not taking any personal data, only calculate overall data
    uint256 totalVoters; // number of total voters
    uint256 totalAge;
    uint256 avgAge;
    bytes32 displayString; // display voting status

    struct Candidate
    {
        bytes32 name;
        uint256 voteCount;
    }

    mapping(uint => Candidate) public allCandidates;

    constructor()
    {        
        // Candidate storage candidate1 = Candidate("john", 0);
        // candidate1.name = "John";
        // candidate1.voteCount = 0;

        // Candidate storage candidate2 = Candidate("john", 0);
        // candidate2.name = "Adam";
        // candidate2.voteCount = 0;
        allCandidates[0].name = "John";
        allCandidates[0].voteCount = 0;

        allCandidates[1].name = "Adam";
        allCandidates[1].voteCount = 0;
    }

    function voting(uint256 age, bytes32 vote) public
    {
        totalAge += age;
        if(age >= 18)
        {
            if(vote == "John")
            {
                allCandidates[0].voteCount++;
            }
            else if(vote == "Adam")
            {
                allCandidates[1].voteCount++;
            }
            totalVoters++;
            displayString = "Eligible to vote";
        }
        
        else 
        {
            displayString = "Ineligible to vote";
        }
    }

    // calculate age demographic
    function calculate() public
    {
        avgAge = totalAge/totalVoters;
    }
}