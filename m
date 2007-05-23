From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 23 May 2007 08:27:37 -0700
Subject: [Buildroot] [buildroot 0001365]: ncftp: strip binarys
Message-ID: <5331395ab737740094024669bcf2d4cd@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1365 
====================================================================== 
Reported By:                razzor
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1365
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-23-2007 08:18 PDT
Last Modified:              05-23-2007 08:27 PDT
====================================================================== 
Summary:                    ncftp: strip binarys
Description: 
Strip binarys with correct strip (from http://busybox.net/bugs/view.php?id=1355)
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 05-23-07 08:27  
---------------------------------------------------------------------- 
Why is this needed? The ncftp makefile alreay strips the executables as
part of the build.

E.G.
file bin/ncftp
bin/ncftp: ELF 64-bit LSB executable, AMD x86-64, version 1 (SYSV), for
GNU/Linux 2.6.0, dynamically linked (uses shared libs), for GNU/Linux
2.6.0, stripped 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-23-07 08:18  razzor         New Issue                                    
05-23-07 08:18  razzor         Status                   new => assigned     
05-23-07 08:18  razzor         Assigned To               => buildroot       
05-23-07 08:18  razzor         File Added: 0001-ncftp-strip-binarys.txt         
          
05-23-07 08:27  jacmet         Note Added: 0002396                          
======================================================================
