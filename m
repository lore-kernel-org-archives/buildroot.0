From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:25:40 -0700
Subject: [Buildroot] [buildroot 0001194]: iso9660 target does not build
	target kernel
Message-ID: <cfd8910cec6f1cae554609bda54b42d7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1194 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1194
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-05-2007 02:21 PST
Last Modified:              07-08-2007 04:25 PDT
====================================================================== 
Summary:                    iso9660 target does not build target kernel
Description: 
$(LINUX_KERNEL) dependecy is missing in $(ISO9660_TARGET) target. 

Patch is attached.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 04:25  
---------------------------------------------------------------------- 
Merged as r19028. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-05-07 02:21  janlana        New Issue                                    
02-05-07 02:21  janlana        Status                   new => assigned     
02-05-07 02:21  janlana        Assigned To               => uClibc          
02-05-07 02:21  janlana        File Added: target_iso9660_linux.patch           
        
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
07-08-07 04:25  bernhardf      Status                   assigned => closed  
07-08-07 04:25  bernhardf      Note Added: 0002570                          
======================================================================
