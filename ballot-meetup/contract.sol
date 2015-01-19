contract Ballot {
  /// @notice Create new proposal with description `description`?
  function createProposal(string32 description) returns (uint id) {
    id = numProposals++;
    proposals[id].description = description;
  }
  /// @notice Vote for proposal `id`?
  function voteFor(uint id) {
    if (proposals[id].voted[msg.sender]) return;
    proposals[id].votesFor++;
  }
  /// @notice Vote against proposal `id`?
  function voteAgainst(uint id) {
    if (proposals[id].voted[msg.sender]) return;
    proposals[id].votesAgainst++;
  }
  function getNumProposals() constant returns (uint num) {
    return numProposals;
  }
  function getProposal(uint id) constant returns (string32 description, uint votesFor, uint votesAgainst) {
    description = proposals[id].description;
    votesFor = proposals[id].votesFor;
    votesAgainst = proposals[id].votesAgainst;
  }
  struct Proposal {
    string32 description;
    uint votesFor;
    uint votesAgainst;
    mapping(address => bool) voted;
  }
  uint numProposals;
  mapping(uint => Proposal) proposals;
}
