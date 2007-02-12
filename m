From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:41 -0800
Subject: [Buildroot] [buildroot 0000595]: OpenSSL build fails on
	linux-i386-i686
Message-ID: <8695d02d7e12d108ffe595dc972c96b2@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=595 
====================================================================== 
Reported By:                mjc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   595
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-11-2005 01:20 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    OpenSSL build fails on linux-i386-i686
Description: 
During configure of openssl
Configuring for linux-i386-i686
...

pick os/compiler from:
BC-16 BC-32 BS2000-OSD Cygwin Cygwin-pre1.3 DJGPP FreeBSD FreeBSD-alpha 
FreeBSD-elf FreeBSD-ia64 FreeBSD-sparc64 MPE/iX-gcc NetBSD-m68
NetBSD-sparc 
...
linux-i386-i686/cmov linux-ia64 linux-ia64-ecc linux-k6 linux-m68k
linux-mips 
...


linux-i386-i686 has "/cmov" appended. This is from the openssl.patch file
in
the package directory. I'm submitting a patch to the patch.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 12-29-05 03:19  
---------------------------------------------------------------------- 
nah, i broke the openssl.mk again

should be fixed now though 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-11-05 01:20  mjc            New Issue                                    
12-11-05 01:20  mjc            Status                   new => assigned     
12-11-05 01:20  mjc            Assigned To               => uClibc          
12-11-05 01:20  mjc            File Added: openssl-patch.patch                  
 
12-29-05 03:19  vapier         Note Added: 0000823                          
12-29-05 03:19  vapier         Status                   assigned => closed  
12-29-05 03:19  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
