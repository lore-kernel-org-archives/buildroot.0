From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:48 -0800
Subject: [Buildroot] [buildroot 0000188]: New target/device:  Via epia-mii
Message-ID: <3f21f0a4065ee5a9c35371539461d3a9@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=188 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   188
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-23-2005 16:02 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    New target/device:  Via epia-mii
Description: 
Creates a target for the epia-mii board. Fairly generic, based on 2.6
kernel. Doesn't override the busybox or uclibc configurations. Includes
one patch, which I still can't get to apply (it applies cleanly manually,
but isn't applied through buildroot).
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-23-05 16:02  gnat           New Issue                                    
03-23-05 16:02  gnat           File Added: via-epia.patch                    
06-23-05 14:34  andersen       Status                   assigned => closed  
06-23-05 14:34  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
