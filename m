From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 25 Feb 2008 12:52:04 -0800
Subject: [Buildroot] [buildroot 0002334]: Openssl fails to compile
Message-ID: <5bcc5d4992aa11971b3286c0c0b9973a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2334 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2334
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-25-2008 05:50 PST
Last Modified:              02-25-2008 12:52 PST
====================================================================== 
Summary:                    Openssl fails to compile
Description: 
openssl fails to compile for mipsel targets with mips32 as processor model
and software floating point emulation enabled by default. I am using
OABI.
This bug might be related to bug 0001899
The version i am trying to compile is the current svn version 21110

====================================================================== 

---------------------------------------------------------------------- 
 KHAksnes - 02-25-08 12:52  
---------------------------------------------------------------------- 
-mfloat-abi is as far as I can see an ARM only option for GCC. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-25-08 05:50  KHAksnes       New Issue                                    
02-25-08 05:50  KHAksnes       Status                   new => assigned     
02-25-08 05:50  KHAksnes       Assigned To               => buildroot       
02-25-08 12:52  KHAksnes       Note Added: 0005294                          
======================================================================
