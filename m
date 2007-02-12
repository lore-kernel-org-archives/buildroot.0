From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:48 -0800
Subject: [Buildroot] [buildroot 0001014]: Tar suffix
Message-ID: <e3239efd1ea4decca51a0b3f4395fbcd@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1014 
====================================================================== 
Reported By:                bdelagoutte
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1014
Category:                   Other
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-01-2006 01:02 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Tar suffix
Description: 
When making a tarball from the root fs, we can specify options such as z
(gzip) or j (bzip). But the tarball's filename will stay the same, ending
with .tar.

I made some changes to detect whether z or j are specified, and add .gz or
.bz2 suffix to the tarball's filename.

Here is a patch for it.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-29-06 11:17  
---------------------------------------------------------------------- 
I've fixed this in a slightly different manner. See r16725.

Thanks for reporting. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-01-06 01:02  bdelagoutte    New Issue                                    
09-01-06 01:02  bdelagoutte    Status                   new => assigned     
09-01-06 01:02  bdelagoutte    Assigned To               => uClibc          
09-01-06 01:02  bdelagoutte    File Added: tar-suffix.patch                    
11-29-06 11:17  bernhardf      Status                   assigned => closed  
11-29-06 11:17  bernhardf      Note Added: 0001840                          
11-29-06 11:17  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
