import sys,os,re

domain = sys.argv[1]#test.com
subDomain = None #sys.argv[2]
basidir = sys.argv[2] #/sdk-srvar/apache2/usr/conf/sites
serverkey = sys.argv[3]
cert = sys.argv[4]
domainslist = []  #["test.com","1.test.com"]
domainslist.append(domain) 
try:
      subDomain =  sys.argv[5].split(",")
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
           if f:          
             paths_files.append([f,[root]])
          

def clip_blob(config_block): #without ssl file copy to new ssl_file
        pattern = r"<VirtualHost[^>]*>(.*?)</VirtualHost>"
        matches = re.findall(pattern, config_block, re.DOTALL)
        return matches[0]


def new_ssl_data(conf__this):
    new_ = f""" 
<VirtualHost *:443>
{conf__this}
SSLEngine on
SSLCertificateFile {cert}
SSLCertificateKeyFile {serverkey}

</VirtualHost>
"""
    return new_ 
      
for file,path in paths_files:
      p1  = path[0]  #/sdk-srvar/apache2/www/compliner/hello  
      for f1 in file:
           p2 = os.path.join(p1,f1)
           with open(p2,"r+b")  as conf_data :      
                  conf_is = clip_blob(conf_data.read().decode())
                  
                  f_new_ssl = os.path.splitext(f1)[0]+".ssl.conf" # test.com.conf to test.com.ssl.conf
                  p3 = os.path.join(p1,f_new_ssl)
                  with open(p3,"w+b")  as ss_conf_data :   
                     ss_conf_data.write(new_ssl_data(conf_is).encode())
                     
                     
                     