def von_Neuman_gen(seed_number):
    #pour avoir une entree valide
    taille = len(str(seed_number))
    if taille%2 != 0:
        taille += 1
    
    number = seed_number
    already_seen = set()
    counter = 0
    
    while number not in already_seen:
      counter += 1
      already_seen.add(number)
      #Remplir avec des 0 pour avoir un carres de taille 2*n
      next = str(number * number) 
      if len(next)%2 != 0 :
          next = next.zfill(taille*2)
      number = int(str(number * number).zfill(taille)[taille//2:taille+taille//2])
      
      
    
    print("Graine :",seed_number,
    "Fin de generation :",counter,
    "Dernier nombre :",number)
       
    return already_seen