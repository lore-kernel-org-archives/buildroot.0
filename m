From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:46 -0800
Subject: [Buildroot] [buildroot 0000300]: gnu readline package enhancement /
	cleanup
Message-ID: <89f002bcdda2d68625dd27ab8d4c4740@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=300 
====================================================================== 
Reported By:                scott
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   300
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-16-2005 09:15 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    gnu readline package enhancement / cleanup
Description: 
These patches fix some minor problems with GNU Readline package.

patch-1 will make the package selection default=n (since it's not
necessary)
patch-2 will fix the readline.mk makefile to better follow buildroot
style.

This is a cleanup only.  But adds the 'readline-target' makefile target to
also install readline .so files to the target in addition to the full
install in the staging area.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-16-05 09:15  scott          New Issue                                    
06-16-05 09:15  scott          File Added: readline.tar                     
06-23-05 15:56  andersen       Status                   assigned => closed  
06-23-05 15:56  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
