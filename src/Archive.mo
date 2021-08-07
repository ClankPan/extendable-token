/**

//TODO need a way to retreive the correct transfer request if it has been overwritten

 */
import ExtCore "./Core";
import Result "mo:base/Result";


module ExtArchive = {
  
  public type Date = Nat64;
  public type TransactionId = Nat;
  public type MintingEvent = {
    minter : ExtCore.User;
    to : ExtCore.User;
    token : ExtCore.TokenIdentifier;
    amount : ExtCore.Balance;
    memo : ExtCore.Memo;
  };
  public type Transaction = {
    txid : TransactionId;
    data : { #transfer: ExtCore.TransferRequest; #mint: MintingEvent; };
    date : Date;
  };


  public type TransactionRequest = {
    filter : {
      #txid : TransactionId;
      #user : ExtCore.User;
      #date : (Date, Date); //from - to
      #page : (Nat, Nat); // all per page - page
      #all;
    };
    token : ExtCore.TokenIdentifier;
  };
  
  public type ValidActor = actor {
    transactions : query (request : TransactionRequest) -> async Result.Result<[Transaction], ExtCore.CommonError>;
  };
};