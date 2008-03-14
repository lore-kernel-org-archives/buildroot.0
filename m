From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 14 Mar 2008 09:13:01 -0700
Subject: [Buildroot] [buildroot 0002604]: Unable to compile Buildroot
Message-ID: <4ab19dd6ca053decbfde434db1e41348@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2604 
====================================================================== 
Reported By:                Graol
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2604
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-14-2008 09:13 PDT
Last Modified:              03-14-2008 09:13 PDT
====================================================================== 
Summary:                    Unable to compile Buildroot
Description: 
Hi,

I'm running a virtual machine with Debian 32 bits installed (on a Xeon
core 2 server). I tried to install buildroot in x86_64 arch but I always
get the same error at last:

Unknown CPU given in --with-tune=core2.
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/usr/src/buildroot/toolchain_build_x86_64/gcc-4.2.1-initial'
make: ***
[/usr/src/buildroot/toolchain_build_x86_64/gcc-4.2.1-initial/.compiled]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-14-08 09:13  Graol          New Issue                                    
03-14-08 09:13  Graol          Status                   new => assigned     
03-14-08 09:13  Graol          Assigned To               => buildroot       
======================================================================
