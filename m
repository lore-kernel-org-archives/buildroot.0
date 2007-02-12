From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:59 -0800
Subject: [Buildroot] [buildroot 0000919]: makedevs device files creation can
	fail
Message-ID: <b5a1ba5d6c23fffb74564a11fb068b83@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=919 
====================================================================== 
Reported By:                blurgk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   919
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-21-2006 02:25 PDT
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    makedevs device files creation can fail
Description: 
makedevs should use the makedev() macro to create device numbers, else it
gives wrong major/minor numbers to devices files on systems which use big
device numbers. Patch attached.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 11:46  
---------------------------------------------------------------------- 
Sounds reasonable. Please ping me again if i didn't check this in within
let's say a week from now on.

Thanks for the patch and sorry for the long delay..

cheers, 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 06:36  
---------------------------------------------------------------------- 
Fixed in svn revision 17434.
Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-21-06 02:25  blurgk         New Issue                                    
06-21-06 02:25  blurgk         Status                   new => assigned     
06-21-06 02:25  blurgk         Assigned To               => uClibc          
06-21-06 02:25  blurgk         File Added: use_makedev.diff                    
01-19-07 11:46  bernhardf      Note Added: 0002008                          
01-21-07 06:36  bernhardf      Status                   assigned => closed  
01-21-07 06:36  bernhardf      Note Added: 0002015                          
01-21-07 06:36  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
