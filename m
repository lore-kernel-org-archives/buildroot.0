From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:15 -0800
Subject: [Buildroot] [buildroot 0001194]: iso9660 target does not build
	target kernel
Message-ID: <a3477c8a937988fe051d04f158957e16@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             02-05-2007 02:21 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    iso9660 target does not build target kernel
Description: 
$(LINUX_KERNEL) dependecy is missing in $(ISO9660_TARGET) target. 

Patch is attached.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-05-07 02:21  janlana        New Issue                                    
02-05-07 02:21  janlana        Status                   new => assigned     
02-05-07 02:21  janlana        Assigned To               => uClibc          
02-05-07 02:21  janlana        File Added: target_iso9660_linux.patch           
        
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
