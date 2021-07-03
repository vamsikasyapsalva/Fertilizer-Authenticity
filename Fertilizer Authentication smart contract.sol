//Motto of this smart contract is to provide Genuine Fertilizers to the buyers.

pragma solidity ^0.4.23;

contract FertilizerAuthenticity
{
    string[]  Fertilizer_Companies;
    string[] feedback;
    string Fertilizer_Name;
    string  public exists;
    address public owner;
    bool feed;
    string public deleted;
     
//Here the address of smart contract operator is compared with deployer address if they are same then operator can have access to 'add_Fertilizer_Company' and 'Delete_Company' functions. 
    modifier OnlyOwner{
        
        require(msg.sender == owner);
        _;
    }
//Constructer which intializes the address of the deployer who is considered as owner and had got access to add and delete comapnies from database.    
    constructor() public{
        
        owner = msg.sender;
    }
//Function that adds fertilizer companies in to array.   
    function add_Fertilizer_Company(string Company_Name) public OnlyOwner{

        Fertilizer_Companies.push(string(Company_Name));
        
    }
//Function which takes input as company and which is further used for comparision for existence or for deletion.   
    function Input_Company(string Company) public{
        
        Fertilizer_Name = Company;
    }
//Function which compares the Input_Company with each and every company by hash value.
    function Compare_Fertilizer_Companies() public{
        exists = ": Not_Found";
        for(uint i=0;i<Fertilizer_Companies.length;i++){
            if(keccak256(Fertilizer_Companies[i]) == keccak256(Fertilizer_Name)){
                
                exists = Fertilizer_Companies[i];
                break;
            }
                
        }
        
    }
    
    

    function Com_Feedback( bool fb) public{
            feed = fb;
            if(feed == false && keccak256(abi.encode(exists)) == keccak256(abi.encode( Fertilizer_Name))){
                feedback.push(Fertilizer_Name);
                
            }
    }

    mapping(string => uint) mapper;
    
//Function will delete the company from array.
   function Delete_Company()public OnlyOwner  {
           
        deleted = ': Not_Found';
        
        for(uint i=0; i<Fertilizer_Companies.length; i++) {
            uint count = 0;

            for(uint j=0; j<feedback.length; j++) {
            
                if( keccak256(abi.encode(Fertilizer_Companies[i])) == keccak256(abi.encode(feedback[j])) ) {
                    count += 1;
                }
            }
            mapper[Fertilizer_Companies[i]] = count;
        }
         
        for(uint x=0;x<Fertilizer_Companies.length;x++){
            
            if(mapper[Fertilizer_Companies[x]] > 1){
                
                Fertilizer_Companies[x] = Fertilizer_Companies[Fertilizer_Companies.length-1];
                Fertilizer_Companies.length--;
                deleted = ": Company Found..! and discarded";
                break; 
                   
            }
                
        }
    }
}
