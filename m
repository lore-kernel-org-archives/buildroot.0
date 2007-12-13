From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Dec 2007 03:35:06 -0800
Subject: [Buildroot] [buildroot 0001749]: Haserl 0.9.21 don't compile
Message-ID: <c65a44d97b2d303f95e1bac742b7370a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1749 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1749
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             12-12-2007 19:45 PST
Last Modified:              12-13-2007 03:35 PST
====================================================================== 
Summary:                    Haserl 0.9.21 don't compile
Description: 
Same error of 0.9.20 (index function don't work in buildroot)
This patch change index to strchr
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-13-07 03:35  
---------------------------------------------------------------------- 
fixed in 20644 rev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-12-07 19:45  sushisan       New Issue                                    
12-12-07 19:45  sushisan       Status                   new => assigned     
12-12-07 19:45  sushisan       Assigned To               => buildroot       
12-12-07 19:45  sushisan       File Added: br2-haserl.patch                    
12-13-07 03:35  vanokuten      Status                   assigned => closed  
12-13-07 03:35  vanokuten      Note Added: 0003124                          
======================================================================
