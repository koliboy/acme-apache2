#remove check

import sys,os

basidir = sys.argv[1] #/sdk-srvar/apache2/usr/conf/sites
domainslist = []  #["test.com","1.test.com"]


try:
      subDomain =  sys.argv[2].split(",")
      for sub in subDomain:
           domainslist.append(sub)
except Exception:
       None

if not domainslist:
        raise ValueError(f"ERROR:{basidir}:not found files somating Wrong")
      
      
      
domains_conf = [] #["test.com.ssl.conf","1.test.com.ssl.conf"]

for d1 in domainslist:
       domains_conf.append(d1+".ssl.conf") 

all_files = []
paths_files = []
for root, dirs, files in os.walk(basidir):
       f = []    
       if files:
           for c in files: 
                 if c in domains_conf:
                     all_files.append(c)
                     f.append(c)
           if f:
             paths_files.append([f,[root]])
          

if all_files:      
 for check in domains_conf:
      if not check in all_files:
           None   
           raise ValueError(f"ERROR:{basidir}:not found file--> {check}")
else:
      raise ValueError(f"ERROR:{basidir}:not founds file--> {domains_conf}") 