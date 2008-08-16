From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 16 Aug 2008 12:15:11 -0700
Subject: [Buildroot] [buildroot 0004524]: Missing \ in Makefile.autotools.in
	makes fontconfig fail to compile
Message-ID: <cba8591198fe2003fa83de80233561f8@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=4524 
====================================================================== 
Reported By:                antialize
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4524
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-08-2008 01:31 PDT
Last Modified:              08-16-2008 12:15 PDT
====================================================================== 
Summary:                    Missing \ in Makefile.autotools.in makes fontconfig
fail to compile
Description: 
There is a missing \ in Makefile.autotools.in that affects fontconfig, and
possible alot of other not to configure.

I have attached a patch that fixes the issue, and also cleans up the
fontconfig.mk

(Rev 23070)
====================================================================== 

---------------------------------------------------------------------- 
 antialize - 08-08-08 01:33  
---------------------------------------------------------------------- 
This is a dup of,
0004474 and 0004454 

---------------------------------------------------------------------- 
 jacmet - 08-16-08 12:15  
---------------------------------------------------------------------- 
Thanks, fixed in r23089 / r23093 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-08 01:31  antialize      New Issue                                    
08-08-08 01:31  antialize      Status                   new => assigned     
08-08-08 01:31  antialize      Assigned To               => buildroot       
08-08-08 01:31  antialize      File Added: fix.patch                        
08-08-08 01:33  antialize      Note Added: 0010334                          
08-08-08 01:34  antialize      Issue Monitored: antialize                    
08-16-08 12:15  jacmet         Status                   assigned => closed  
08-16-08 12:15  jacmet         Note Added: 0010514                          
======================================================================
