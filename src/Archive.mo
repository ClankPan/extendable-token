/**

//TODO need a way to retreive the correct transfer request if it has been overwritten

 */
import ExtCore "./Core";
import Result "mo:base/Result";


module ExtArchive = {
  
  public type Date = Nat64;
  public type TransactionId = Nat;
  public type MintingEvent = {
    minter : User;
    to : User;
    token : TokenIdentifier;
    amount : Balance;
    memo : Memo;
  };
  public type Transaction = {
    txid : TransactionId;
    data : { #ExtCore.TransferRequest; #MintingEvent; };
    date : Date;
  };


  public type TransactionRequest = {
    filter : {
      #txid : TransactionId;
      #user : ExtCore.User;
      #date : (Date, Date); //from - to
      #page : (Nat, Nat); // all per page - page
      #all;
    }
    token : TokenIdentifier;
  };
  
  public type ValidActor = actor {
  add : shared (request : TransferRequest) -> TransactionId;
  transactions : query (request : TransactionsRequest) -> async Result.Result<[Transaction], ExtCore.CommonError>;
  };
};