From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 5 May 2008 00:30:27 -0700
Subject: [Buildroot] [buildroot 0003244]: [PATCH] add kernel header v2.6.25
	support and nios2 updates
Message-ID: <bc0c6dce613f70f99233d1b3efb349b1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3244 
====================================================================== 
Reported By:                thomas_chou
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3244
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-05-2008 00:30 PDT
Last Modified:              05-05-2008 00:30 PDT
====================================================================== 
Summary:                    [PATCH] add kernel header v2.6.25 support and nios2
updates
Description: 
This patch enabled v2.6.25 header support. There is a patch to revert the
exporting of linux/user.h and asm/user.h. They are needed to compile
pthread in uClibc.

Also included are the kernel patches for nios2.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-05-08 00:30  thomas_chou    New Issue                                    
05-05-08 00:30  thomas_chou    Status                   new => assigned     
05-05-08 00:30  thomas_chou    Assigned To               => buildroot       
05-05-08 00:30  thomas_chou    File Added: kernel_header_25_nios2.patch.gz      
             
======================================================================
