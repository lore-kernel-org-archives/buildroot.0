From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 26 Jul 2007 05:41:16 -0700
Subject: [Buildroot] [buildroot 0001444]: Compiling DirectFB fails
Message-ID: <2bce62ff42e65298f4dcdace59239946@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1444 
====================================================================== 
Reported By:                alanszlosek
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1444
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-26-2007 05:41 PDT
Last Modified:              07-26-2007 05:41 PDT
====================================================================== 
Summary:                    Compiling DirectFB fails
Description: 
When buildroot tries to compile directfb-0.9.25.1 it fails due to incorrect
paths. I'm using gcc-4.2.0, buildroot revision
http://busybox.net/bugs/view.php?id=#19264 and uclibc-0.9.29. It
tries to copy shared libraries from staging_dir/usr/lib into TARGET/usr/lib
when they're located in staging_dir/lib. The same applied to the directfb-*
folder.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-26-07 05:41  alanszlosek    New Issue                                    
07-26-07 05:41  alanszlosek    Status                   new => assigned     
07-26-07 05:41  alanszlosek    Assigned To               => buildroot       
======================================================================
