From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 27 Feb 2008 18:16:16 -0800
Subject: [Buildroot] [buildroot 0001187]: PATCH: netplug package
Message-ID: <02f3ddafd9cbf1b6c744b35ea458dabc@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1187 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1187
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             01-31-2007 02:40 PST
Last Modified:              02-27-2008 18:16 PST
====================================================================== 
Summary:                    PATCH: netplug package
Description: 
netplug's Makefile uses strict build flag -Werror. because gcc 4.2 reports
some differ in signedness warnings the build failed. 

The attached patch remove '-Werror' flag
====================================================================== 

---------------------------------------------------------------------- 
 sjhill - 02-27-08 18:16  
---------------------------------------------------------------------- 
This is the same issue as Bug http://busybox.net/bugs/view.php?id=0001649. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-31-07 02:40  janlana        New Issue                                    
01-31-07 02:40  janlana        Status                   new => assigned     
01-31-07 02:40  janlana        Assigned To               => uClibc          
01-31-07 02:40  janlana        File Added: netplug_build.patch                  
 
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
02-27-08 18:16  sjhill         Status                   assigned => closed  
02-27-08 18:16  sjhill         Note Added: 0005474                          
======================================================================
