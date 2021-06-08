function Delete_Company()public OnlyOwner{
           
        deleted = ': Not_Found';
        for(uint i=0;i<Fertilizer_Companies.length;i++){
            
            if(keccak256(Fertilizer_Companies[i]) == keccak256(Fertilizer_Name)){
                
                Fertilizer_Companies[i] = Fertilizer_Companies[Fertilizer_Companies.length-1];
                Fertilizer_Companies.length--;
                deleted = ": Company Found..! and discarded";
                break; 
                   
            }
                
        }
    }
