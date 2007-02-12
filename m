From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:10 -0800
Subject: [Buildroot] [buildroot 0000156]: Fail to compile the c++ toolchain
	for m68k
Message-ID: <52a70b1b7c432e3831d0ced9b1f93656@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=156 
====================================================================== 
Reported By:                flaget
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   156
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-14-2005 14:06 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Fail to compile the c++ toolchain for m68k
Description: 
I want to build a root filesystem for an mvme162 board.
When I build busybox it work well but when i want to compile buildroot it
generate an error when i add support for c++.

====================================================================== 

---------------------------------------------------------------------- 
 acmay - 03-14-05 18:17  
---------------------------------------------------------------------- 
dupe of http://busybox.net/bugs/view.php?id=051
enable LFS and it will work
or hack the configure script 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-14-05 14:06  flaget         New Issue                                    
03-14-05 14:06  flaget         File Added: log                              
03-14-05 14:44  flaget         Issue Monitored: flaget                      
03-14-05 14:44  flaget         Issue End Monitor: flaget                    
03-14-05 18:17  acmay          Note Added: 0000087                          
03-16-05 12:11  andersen       Status                   new => assigned     
03-16-05 12:11  andersen       Assigned To               => uClibc          
01-23-06 11:00  prpplague      Status                   assigned => closed  
01-23-06 11:00  prpplague      Resolution               open => won't fix   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
