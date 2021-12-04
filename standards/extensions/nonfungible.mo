//NFT
type MintRequest = {
  to : User;
  metadata : ?Text;
};
type Token_nonfungible = actor {
  bearer: shared query (token : TokenIdentifier) -> async Result<AccountIdentifier, CommonError>;

  mintNFT: shared (request : MintRequest) -> async ();
};
