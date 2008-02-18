From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 18 Feb 2008 11:52:07 -0800
Subject: [Buildroot] [buildroot 0002234]: make clean fails
Message-ID: <74084a6ce4843833902e7b1413ab5299@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2234 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2234
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-18-2008 11:52 PST
Last Modified:              02-18-2008 11:52 PST
====================================================================== 
Summary:                    make clean fails
Description: 
make clean fails in dropbear-clean

To repoduce make sure dropbear are among the applications built, then do a
make followed by a make clean.

The uninstall target seems to be missing.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-18-08 11:52  KHAksnes       New Issue                                    
02-18-08 11:52  KHAksnes       Status                   new => assigned     
02-18-08 11:52  KHAksnes       Assigned To               => buildroot       
======================================================================
