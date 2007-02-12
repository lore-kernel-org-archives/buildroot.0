From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:37 -0800
Subject: [Buildroot] [buildroot 0000569]: boot.c in dosfstools fails to
	build due to renamed FAT_12 symbol
Message-ID: <65c5453d04a65c128d3b19efafb0a556@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=569 
====================================================================== 
Reported By:                lord_apollyon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   569
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-30-2005 04:11 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    boot.c in dosfstools fails to build due to renamed
FAT_12 symbol
Description: 
There were changes in the Linux 2.6 headers which are included by the
dosfstools package, specifically in boot.c.  The symbol in question is
MSDOS_FAT12, which is the maximum number of FAT entries for a FAT12 MS-DOS
volume.

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 12-29-05 03:29  
---------------------------------------------------------------------- 
ive added dosfstools 2.11 to buildroot

if it's still broken there, please report the issue to the upstream
dosfstools maintainer 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-05 04:11  lord_apollyon  New Issue                                    
11-30-05 04:11  lord_apollyon  Status                   new => assigned     
11-30-05 04:11  lord_apollyon  Assigned To               => uClibc          
11-30-05 04:11  lord_apollyon  File Added: dos.patch                        
12-29-05 03:29  vapier         Note Added: 0000826                          
12-29-05 03:29  vapier         Status                   assigned => closed  
12-29-05 03:29  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
