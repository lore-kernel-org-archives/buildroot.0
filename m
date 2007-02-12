From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:08 -0800
Subject: [Buildroot] [buildroot 0000445]: [patch openntpd] Fix build,
	add init script
Message-ID: <fa60c5b1f395490b454885ffcf27376d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=445 
====================================================================== 
Reported By:                ktraum
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   445
Category:                   Other
Reproducibility:            N/A
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-26-2005 01:03 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    [patch openntpd] Fix build, add init script
Description: 
Fix build to use user "daemon" as privsep user (uses _ntp by default, which
doesn't exist).

Point "OPENNTPD_TARGET_BINARY" to real target binary, so install runs only
once.

Add init script.

Patch attached.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-26-05 01:03  ktraum         New Issue                                    
09-26-05 01:03  ktraum         Status                   new => assigned     
09-26-05 01:03  ktraum         Assigned To               => uClibc          
09-26-05 01:03  ktraum         File Added: openntpd.patch                    
09-26-05 05:23  ktraum         Issue Monitored: ktraum                      
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
