From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:07 -0800
Subject: [Buildroot] [buildroot 0000219]: pciutils runs `uname` to detect
	target OS and fails on Internix
Message-ID: <8afb2780d558b05c9efc7cccc890674e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=219 
====================================================================== 
Reported By:                kk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   219
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-08-2005 05:35 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    pciutils runs `uname` to detect target OS and fails
on Internix
Description: 
When the pciutils package is selected, buildroot's make stops with
"The PCI library currently supports only Linux, AIX, FreeBSD and NetBSD"
when configuring pciutils.

I am building for a Linux target. The host is Interix, but this should not
matter at all.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-29-05 00:28  
---------------------------------------------------------------------- 
patched pciutils to assume Linux is always the target 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-08-05 05:35  kk             New Issue                                    
08-28-05 01:11  vapier         Summary                  buildroot: Configure
problem when building pciutils => pciutils runs `uname` to detect target OS and
fails on Internix
09-29-05 00:28  vapier         Note Added: 0000585                          
09-29-05 00:28  vapier         Status                   assigned => closed  
09-29-05 00:28  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
