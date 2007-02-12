From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:16 -0800
Subject: [Buildroot] [buildroot 0000160]: Fix for readline package
Message-ID: <0406a4488409b1c515c82f867bbb44bd@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=160 
====================================================================== 
Reported By:                pgrayson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   160
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-15-2005 18:15 PST
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    Fix for readline package
Description: 
The readline package currently has a Makefile.in. This patch removes the
depricated Makefile.in and adds the relevant modifications to TARGETS to
readline.mk.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 03-20-05 18:54  
---------------------------------------------------------------------- 
added to svn, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-15-05 18:15  pgrayson       New Issue                                    
03-15-05 18:15  pgrayson       File Added: buildroot-readline-fix.patch         
          
03-16-05 12:11  andersen       Status                   new => assigned     
03-16-05 12:11  andersen       Assigned To               => uClibc          
03-20-05 18:54  vapier         Status                   assigned => resolved
03-20-05 18:54  vapier         Resolution               open => fixed       
03-20-05 18:54  vapier         Note Added: 0000111                          
03-20-05 18:55  vapier         Status                   resolved => closed  
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
