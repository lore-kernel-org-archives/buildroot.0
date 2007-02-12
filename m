From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:57 -0800
Subject: [Buildroot] [buildroot 0000200]: Openswan userspace tools
Message-ID: <0b947509b8661c70dcf2de32ad772415@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=200 
====================================================================== 
Reported By:                HeMan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   200
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-31-2005 00:25 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Openswan userspace tools
Description: 
I've added inital support for building openswan userspace tools.
I haven't tried it on anything but i386 and done very little testing there
as well.
It adds libgmp since openswan depends on that and it adds awk and tr to
busybox.
====================================================================== 

---------------------------------------------------------------------- 
 HeMan - 05-27-05 03:36  
---------------------------------------------------------------------- 
Hi,
Do you want me to rework this patch
(http://bugs.uclibc.org/bug_reminder_page.php?bug_id=200) in any way?

// Jimmy 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 08:59  
---------------------------------------------------------------------- 
I've added an openswan to buildroot now. It's only compile-tested so far,
fwiw.

See r16707. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-31-05 00:25  HeMan          New Issue                                    
03-31-05 00:25  HeMan          File Added: buildroot.patch                    
03-31-05 03:15  HeMan          Issue Monitored: HeMan                       
05-27-05 03:36  HeMan          Issue Monitored: andersen                    
05-27-05 03:36  HeMan          Note Added: 0000216                          
11-28-06 08:59  bernhardf      Status                   assigned => closed  
11-28-06 08:59  bernhardf      Note Added: 0001827                          
11-28-06 08:59  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
