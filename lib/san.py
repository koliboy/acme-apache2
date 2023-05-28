import sys
sub = []
temp_dir = sys.argv[2]
try:
      subfind =  sys.argv[1].split(",")
      for df in subfind:
           sub.append(df)
except Exception:
         None
alt_names = """
[req]
req_extensions = v3_req

[v3_req]
subjectAltName = @alt_names

[alt_names]
"""
for k, v in enumerate(sub,start=1):
    alt_names +=f"\nDNS.{k} = {v}"   
    


with open(temp_dir,"w+b") as save:
              save.write(alt_names.encode())   
 
  
   