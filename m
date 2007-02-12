From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:28 -0800
Subject: [Buildroot] [buildroot 0000851]: toolchain/kernel-headers: Use
	LINUX_HEADERS_VERSION instead of LINUX_VERSION
Message-ID: <b55a662ac0f325bb77a515a523dbcb56@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=851 
====================================================================== 
Reported By:                jacmet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   851
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-26-2006 05:15 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    toolchain/kernel-headers: Use LINUX_HEADERS_VERSION
instead of LINUX_VERSION
Description: 
Use LINUX_HEADERS_VERSION instead of LINUX_VERSION as that variable is
used
for the actual kernel version used which might be different than the
headers
version.

E.G. LINUX_VERSION is set in the target/device/* files. If this version
doesn't match the selected kernel headers version the patches won't be
applied.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 04-28-06 12:41  
---------------------------------------------------------------------- 
Thanks. Fixed in r14953. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-26-06 05:15  jacmet         New Issue                                    
04-26-06 05:16  jacmet         Status                   new => assigned     
04-26-06 05:16  jacmet         Assigned To               => uClibc          
04-26-06 05:16  jacmet         File Added:
kernel-headers-LINUX_HEADERS_VERSION.patch                    
04-28-06 12:41  jacmet         Status                   assigned => closed  
04-28-06 12:41  jacmet         Note Added: 0001335                          
04-28-06 12:41  jacmet         Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
