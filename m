From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 6 Dec 2007 17:53:05 -0800
Subject: [Buildroot] [buildroot 0001649]: avr32 & netplug-1.2.9
Message-ID: <a3a48162a6dca75f2391cf0aaee20171@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1649 
====================================================================== 
Reported By:                dl9pf
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1649
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-06-2007 17:53 PST
Last Modified:              12-06-2007 17:53 PST
====================================================================== 
Summary:                    avr32 & netplug-1.2.9
Description: 
Fix for netplug-1.2.9 building with avr32

netlink.c  line 287:

change:
int addr_len

to:
socklen_t addr_len



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-06-07 17:53  dl9pf          New Issue                                    
12-06-07 17:53  dl9pf          Status                   new => assigned     
12-06-07 17:53  dl9pf          Assigned To               => buildroot       
======================================================================
