From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:37 -0800
Subject: [Buildroot] [buildroot 0000896]: buildroot download path for
	asterisk
Message-ID: <eed8a8050636d76ef1c69a6854dfb68c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=896 
====================================================================== 
Reported By:                bt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   896
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-05-2006 14:06 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    buildroot download path for asterisk
Description: 
Download path for asterisks has changed.
Buildroot uses Version 1.2.0-beta1 which can now be found in the directory
old-releases. I attach a patch to fix that.
(Actually I would prefer to use a newer version of Asterisk, but it does
not compile ...)
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-14-06 07:26  
---------------------------------------------------------------------- 
Fixed in r16924.

Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-05-06 14:06  bt             New Issue                                    
06-05-06 14:06  bt             Status                   new => assigned     
06-05-06 14:06  bt             Assigned To               => uClibc          
06-05-06 14:06  bt             File Added: change-asterisk-download-path.patch  
                 
06-05-06 14:16  bt             Issue Monitored: bt                          
12-14-06 07:26  bernhardf      Status                   assigned => closed  
12-14-06 07:26  bernhardf      Note Added: 0001861                          
12-14-06 07:26  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
