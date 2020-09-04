pragma solidity ^0.4.26;

contract FertilizerAuthenticity
{
    string[] public Fertilizer_Companies;
    string Fertilizer_Name;
    bool  public exists;
    string extract;
    int inp_count = 0;
    int com_count = 0;
    address owner;
    
    modifier OnlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    constructor() public{
        owner = msg.sender;
    }
    
    function add_Fertilizer_Company(string Company_Name) public OnlyOwner{

        Fertilizer_Companies.push(string(Company_Name));
        com_count++;
        
    }
    function Input_Company(string Company) public{
        Fertilizer_Name = Company;
    }
    function Compare_Fertilizer_Companies() public{
        inp_count = 0;
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
         
         
        
        
        
        
}
    
    
    
    
     
    
    
    
