From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 07:41:08 -0700
Subject: [Buildroot] [buildroot 0002604]: Unable to compile Buildroot
Message-ID: <d5c3ef991e4d9bf4c4d24b7e3c124f62@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              03-25-2008 07:41 PDT
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

---------------------------------------------------------------------- 
 Graol - 03-14-08 09:21  
---------------------------------------------------------------------- 
gcc version is 4.2.1
multilib is disabled 

---------------------------------------------------------------------- 
 Graol - 03-25-08 07:41  
---------------------------------------------------------------------- 
I reinstalled the official 64 bits Debian distrib, then updated the kernel
to 2.6.24.3 version. I still have the same error message (Unknown CPU). 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-14-08 09:13  Graol          New Issue                                    
03-14-08 09:13  Graol          Status                   new => assigned     
03-14-08 09:13  Graol          Assigned To               => buildroot       
03-14-08 09:13  Graol          Issue Monitored: Graol                       
03-14-08 09:21  Graol          Note Added: 0005774                          
03-25-08 07:41  Graol          Note Added: 0005894                          
======================================================================
