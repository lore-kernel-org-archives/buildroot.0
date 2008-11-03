From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 2 Nov 2008 22:17:09 -0800
Subject: [Buildroot] [buildroot 0005834]: remove redundancy from mkdos
	makefile
Message-ID: <6dc76898fb9957f459c1136364db9f1f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=5834 
====================================================================== 
Reported By:                Chris David
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5834
Category:                   Other
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-29-2008 13:02 PDT
Last Modified:              11-02-2008 22:17 PST
====================================================================== 
Summary:                    remove redundancy from mkdos makefile
Description: 
When I changed the location of the mkdosfs binary at the top of the
makefile, the makefile breaks without this patch.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 11-02-08 22:17  
---------------------------------------------------------------------- 
thanks, fixed in r23907 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-29-08 13:02  Chris David    New Issue                                    
10-29-08 13:02  Chris David    Status                   new => assigned     
10-29-08 13:02  Chris David    Assigned To               => buildroot       
10-29-08 13:02  Chris David    File Added: mkdosfs.patch                    
11-02-08 22:17  jacmet         Status                   assigned => closed  
11-02-08 22:17  jacmet         Note Added: 0014904                          
======================================================================
