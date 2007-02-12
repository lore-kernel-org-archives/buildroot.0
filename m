From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:13 -0800
Subject: [Buildroot] [buildroot 0001056]: new package: xc
Message-ID: <a8b01134aa86b6e1228ff17c000dbf09@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1056 
====================================================================== 
Reported By:                agaffney
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1056
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-27-2006 17:18 PDT
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    new package: xc
Description: 
Attached is a patch to add support for xc, "the unix dialout program". It
was originally designed to be like minicom and access modems, but it's
also very handy for connecting to a serial console. I'm using it with
buildroot to create a root filesystem for an embedded board I'm turning
into a serial console server.

This is the first package I've tried to add. I used wget as a base. It
works for me, but I'm not sure how technically correct it is :P
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-27-06 17:18  agaffney       New Issue                                    
09-27-06 17:18  agaffney       Status                   new => assigned     
09-27-06 17:18  agaffney       Assigned To               => uClibc          
09-27-06 17:18  agaffney       File Added: xc.diff                          
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
