//Motto of this smart contract is to provide Genuine Fertilizers to the buyers.

pragma solidity ^0.4.26;

contract FertilizerAuthenticity
{
    string[] Fertilizer_Companies;
    string Fertilizer_Name;
    bool  public exists;
    string extract;
    address public owner;
    bool public deleted;
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
        for(uint i=0;i<Fertilizer_Companies.length;i++){
            extract = Fertilizer_Companies[i];
            if(keccak256(extract) == keccak256(Fertilizer_Name)){
                    exists = true;
                    break;
            }
            else{
                exists = false;
                
            }
                
        }
        
    }
//Function will delete the company from array.
    function Delete_Company()public OnlyOwner{
        for(uint i=0;i<Fertilizer_Companies.length;i++)
        {
            if(keccak256(Fertilizer_Companies[i]) == keccak256(Fertilizer_Name)){
                for(uint j = i;j<Fertilizer_Companies.length-1;j++){
                    Fertilizer_Companies[j] = Fertilizer_Companies[j+1];
                    
                }
                delete Fertilizer_Companies[Fertilizer_Companies.length-1];
                Fertilizer_Companies.length--;
                deleted = true;
                break;
            }
            else
            {
                deleted = false;
            }
            
        }
    }
         
}
     
    
    
    
