From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:49 -0800
Subject: [Buildroot] [buildroot 0000151]: new target root filesystem
	provided: cloop
Message-ID: <ead82a6767ddfb51311085f60f21760c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=151 
====================================================================== 
Reported By:                clausklein
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   151
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-13-2005 13:07 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    new target root filesystem provided: cloop
Description: 
Current version: 2.01-5

                    COMPRESSED LOOPBACK DEVICE (cloop.o)
=============================================================================

This module is licensed under the GNU GENERAL PUBLIC LICENSE Version 2,
as
stated in the source.

-----------------------------------------------------------------------------

The cloop.o, a Kernel module is needed  to add support for
filesystem-independent, transparently decompressed, read-only block
devices.

Original Author: Paul 'Rusty' Russel
Extensions & Bugfixes: Klaus Knopper (http://www.knopper.net/knoppix/)

The current available debian patch is not used.

Note: target/default/device_table.txt is not yet supported! ck
The quickfix is to use sudo to mount the previous created cramroot

Sources from:
http://developer.linuxtag.net/knoppix/sources/cloop_2.01-5.tar.gz

For more infos see: http://knopper.net/knoppix-info/

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-13-05 13:07  clausklein     New Issue                                    
03-13-05 13:07  clausklein     File Added: cloop.tgz                        
03-16-05 12:11  andersen       Status                   new => assigned     
03-16-05 12:11  andersen       Assigned To               => uClibc          
01-25-06 05:54  prpplague      Status                   assigned => resolved
01-25-06 05:54  prpplague      Resolution               open => fixed       
01-25-06 05:54  prpplague      Additional Information Updated                   

03-08-06 16:53  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
