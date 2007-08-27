From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 27 Aug 2007 02:04:22 -0700
Subject: [Buildroot] [buildroot 0001474]: toolchain build, arch x86_64 ,
	variant core2 does not build
Message-ID: <8b02a216b22bbab2480799b99a7c154c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1474 
====================================================================== 
Reported By:                myopiate
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1474
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-27-2007 02:04 PDT
Last Modified:              08-27-2007 02:04 PDT
====================================================================== 
Summary:                    toolchain build, arch x86_64 , variant core2 does
not build
Description: 
Problem:
Configuration for the x86_64 architecture with core2 variant stops on
build.

Cause:
gcc-4.2.1 does not accept --with-tune=core2.  Toolchain build dies.

Workaround:
Attached patch works around the problem by using --with-tune=generic.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-27-07 02:04  myopiate       New Issue                                    
08-27-07 02:04  myopiate       Status                   new => assigned     
08-27-07 02:04  myopiate       Assigned To               => buildroot       
08-27-07 02:04  myopiate       File Added: core2-generic.patch                  
 
======================================================================
