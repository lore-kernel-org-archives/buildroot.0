From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:58 -0800
Subject: [Buildroot] [buildroot 0000500]: unable to override
	UCLIBC_CONFIG_FILE
Message-ID: <504334c3cdd4c058451c068fa45c9ce5@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=500 
====================================================================== 
Reported By:                wskish
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   500
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-21-2005 22:11 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    unable to override UCLIBC_CONFIG_FILE
Description: 
uclibc.mk has a problem that prevents overriding of the
UCLIBC_CONFIG_FILE.

Line 7 of toolchain/uClibc.mk is 

ifndef $(UCLIBC_CONFIG_FILE)

(which results in variable expansion) instead of

ifndef UCLIBC_CONFIG_FILE


====================================================================== 

---------------------------------------------------------------------- 
 vapier - 10-22-05 02:04  
---------------------------------------------------------------------- 
dupe of Bug 499 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-21-05 22:11  wskish         New Issue                                    
10-21-05 22:11  wskish         Status                   new => assigned     
10-21-05 22:11  wskish         Assigned To               => uClibc          
10-22-05 02:04  vapier         Note Added: 0000638                          
10-22-05 02:04  vapier         Status                   assigned => closed  
10-22-05 02:04  vapier         Resolution               open => duplicate   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
