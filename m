From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 01:26:51 -0800
Subject: [Buildroot] [buildroot 0001608]: flex should go to staging dir
Message-ID: <bd66a0b77fe09d3d61cf44216fac9c0a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1608 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1608
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 01:26 PST
Last Modified:              11-27-2007 01:26 PST
====================================================================== 
Summary:                    flex should go to staging dir
Description: 
/usr/bin/flex and /usr/lib/libfl.a is needed for building some packages
(e.g. ipsec-tools) but it's almost never needed on a device.

Issue 0000438 added copying libfl.a to the staging dir but placing it in
the target dir is unnecessary in the first place and usually needlessly
increases the size of the target device.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 01:26  ikonst         New Issue                                    
11-27-07 01:26  ikonst         Status                   new => assigned     
11-27-07 01:26  ikonst         Assigned To               => buildroot       
======================================================================
