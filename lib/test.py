import sys,os

domain = sys.argv[1]#test.com
subDomain = None #sys.argv[2]
basidir = sys.argv[2] #/sdk-srvar/apache2/usr/conf/sites
domainslist = []  #["test.com","1.test.com"]
domainslist.append(domain) 
try:
      subDomain =  sys.argv[3].split(",")
      for sub in subDomain:
           domainslist.append(sub)
except Exception:
       None
domains_conf = [] #["test.com.conf","1.test.com.conf","2.test.com.conf"]

for d1 in domainslist:
       domains_conf.append(d1+".conf") 

all_files = []
paths_files = []
for root, dirs, files in os.walk(basidir):
       f = []    
       if files:
           for c in files: 
                 if c in domains_conf:
                     all_files.append(c)
                     f.append(c)
           paths_files.append([f,[root]])
          

      
for check in domains_conf:
      if not check in all_files:
           None   
           raise ValueError(f"ERROR:{basidir}:not found file--> {check}")