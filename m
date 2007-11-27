From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 01:35:24 -0800
Subject: [Buildroot] [buildroot 0001609]: ipsec-tools should only emulate
	legacy functions when needed
Message-ID: <425e7f4766052a1f74642d31612d21c7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1609 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1609
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 01:35 PST
Last Modified:              11-27-2007 01:35 PST
====================================================================== 
Summary:                    ipsec-tools should only emulate legacy functions
when needed
Description: 
The ipsec-tools makefile adds some code to emulate legacy functions (bcopy,
bzero, index) when they're unavailable (e.g. new uClibcs). However, this
doesn't work well when they're enabled on uClibc or with external
glibc-based toolchains.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 01:35  ikonst         New Issue                                    
11-27-07 01:35  ikonst         Status                   new => assigned     
11-27-07 01:35  ikonst         Assigned To               => buildroot       
11-27-07 01:35  ikonst         File Added: ipsec-legacy-only-when-needed.patch  
                 
======================================================================
