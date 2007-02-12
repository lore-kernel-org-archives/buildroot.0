From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:54 -0800
Subject: [Buildroot] [buildroot 0000471]: gdb 6.3 does not build on arm
Message-ID: <a624da42a6aee6350f795813ad9eec45@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=471 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   471
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-05-2005 13:29 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    gdb 6.3 does not build on arm
Description: 
GDB 6.3 does not currently build on ARM with compiler gcc 3.4.2
due to casting problems in iwmmx.c. 6.2.1 builds fine.

Possibly do not offer 6.3 as default on ARM?

====================================================================== 

---------------------------------------------------------------------- 
 psm - 10-05-05 13:49  
---------------------------------------------------------------------- 
not a good idea, it builds w/ gcc-3.4.4 

---------------------------------------------------------------------- 
 bjdooks - 10-05-05 14:28  
---------------------------------------------------------------------- 
Sorry, mis-read the compilation, and realised that it
was a problem with the host machine's last debian
upgrade taking the host compiler to 4.0.1, which was
causing gdb 6.3 to fail when building the local client. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-05-05 13:29  bjdooks        New Issue                                    
10-05-05 13:29  bjdooks        Status                   new => assigned     
10-05-05 13:29  bjdooks        Assigned To               => uClibc          
10-05-05 13:49  psm            Note Added: 0000600                          
10-05-05 14:28  bjdooks        Note Added: 0000603                          
11-29-06 05:06  bernhardf      Status                   assigned => closed  
11-29-06 05:06  bernhardf      Resolution               open => no change
required
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
