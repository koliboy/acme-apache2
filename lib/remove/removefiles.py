import sys,os,tempfile

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
          




      
for file,path in paths_files:
      p1  = path[0]  #/sdk-srvar/apache2/www/compliner/hello  
      for f1 in file:
           p2 = os.path.join(p1,f1)
           os.remove(p2)
           #Waring pse next updat tempfile.mkdtemp() to copy after delte when not del file back copy same path 
           
           
           
           