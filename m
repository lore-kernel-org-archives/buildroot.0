From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:06 -0800
Subject: [Buildroot] [buildroot 0001003]: Grub patch file doesn't exist
	(obsolete)
Message-ID: <a3a7111d07763efbc3664843f29ed8e7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1003 
====================================================================== 
Reported By:                donr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1003
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-20-2006 20:27 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    Grub patch file doesn't exist (obsolete)
Description: 
target/x86/grub/grub/mk calls for a patch file "grub_0.97-5.diff.gz".
This isn't on the source site.  There is grub_0.97-13.diff.gz.  I assume
the older onw is obsolete.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 01:57  
---------------------------------------------------------------------- 
Fixed in r16619. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-20-06 20:27  donr           New Issue                                    
08-20-06 20:27  donr           Status                   new => assigned     
08-20-06 20:27  donr           Assigned To               => uClibc          
08-20-06 20:28  donr           Issue Monitored: donr                        
11-28-06 01:57  bernhardf      Status                   assigned => closed  
11-28-06 01:57  bernhardf      Note Added: 0001821                          
11-28-06 01:57  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
