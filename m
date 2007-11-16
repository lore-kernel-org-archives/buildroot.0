From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 16 Nov 2007 04:48:54 -0800
Subject: [Buildroot] [buildroot 0001594]: Portage bump, sandbox fix
Message-ID: <2138d78b98ca7df4f1c0b3cdc3e9fe1c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1594 
====================================================================== 
Reported By:                aron
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1594
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-16-2007 03:01 PST
Last Modified:              11-16-2007 04:48 PST
====================================================================== 
Summary:                    Portage bump, sandbox fix
Description: 
This patch bumps portage and makes buildroot use a standard gentoo mirror
for sandbox. 
====================================================================== 

---------------------------------------------------------------------- 
 aron - 11-16-07 03:23  
---------------------------------------------------------------------- 
For some reason, the .19 patch fails now. Taking the easy route going for
.9 instead. This make portage build fine. 
Hence don't bother with the first patch, only use the second one. 

---------------------------------------------------------------------- 
 vanokuten - 11-16-07 04:48  
---------------------------------------------------------------------- 
fixed in 20436 rev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-16-07 03:01  aron           New Issue                                    
11-16-07 03:01  aron           Status                   new => assigned     
11-16-07 03:01  aron           Assigned To               => buildroot       
11-16-07 03:01  aron           File Added: portage_sandbox.patch                
   
11-16-07 03:01  aron           Issue Monitored: aron                        
11-16-07 03:21  aron           File Added: portage_sandbox_2.patch              
     
11-16-07 03:23  aron           Note Added: 0002936                          
11-16-07 04:48  vanokuten      Status                   assigned => closed  
11-16-07 04:48  vanokuten      Note Added: 0002937                          
======================================================================
