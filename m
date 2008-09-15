From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 15 Sep 2008 08:36:03 -0700
Subject: [Buildroot] [buildroot 0004984]: toolchain/patch-kernel.sh does not
	handle globbing properly
Message-ID: <d01ad4f3e01dca61083ae1b2bb22aaf3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4984 
====================================================================== 
Reported By:                haizaar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4984
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-15-2008 08:36 PDT
Last Modified:              09-15-2008 08:36 PDT
====================================================================== 
Summary:                    toolchain/patch-kernel.sh does not handle globbing
properly
Description: 
passing arguments that includes '*' (like `linux-\*patch\*) simply does not
work!

Attached patch to fix it.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-15-08 08:36  haizaar        New Issue                                    
09-15-08 08:36  haizaar        Status                   new => assigned     
09-15-08 08:36  haizaar        Assigned To               => buildroot       
09-15-08 08:36  haizaar        File Added: patch-kernel.sh-globbing.patch       
            
======================================================================
