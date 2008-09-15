From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 15 Sep 2008 08:33:13 -0700
Subject: [Buildroot] [buildroot 0004974]: Wrong name for linux-2.6.26 patch
Message-ID: <af5161da1a267dbbe0d89200606e2f42@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4974 
====================================================================== 
Reported By:                haizaar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4974
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-15-2008 08:33 PDT
Last Modified:              09-15-2008 08:33 PDT
====================================================================== 
Summary:                    Wrong name for linux-2.6.26 patch
Description: 
The commit 23188 added
target/device/Atmel/arch-arm/kernel-patches-2.6.26/2.6.26-at91.patch.gz
file. 
It should be called linux-2.6.26-at91.ptach.gz and just
2.6.26-at91.patch.gz, since makefiles search for linux-\*patch{.,.gz,.bz2}
patter.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-15-08 08:33  haizaar        New Issue                                    
09-15-08 08:33  haizaar        Status                   new => assigned     
09-15-08 08:33  haizaar        Assigned To               => buildroot       
======================================================================
