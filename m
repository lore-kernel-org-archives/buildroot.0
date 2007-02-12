From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:57 -0800
Subject: [Buildroot] [buildroot 0000258]: Update to e2fsprogs package
Message-ID: <3d6cf0ebeada48b854e6bc49edc2bf50@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=258 
====================================================================== 
Reported By:                cjs
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   258
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-11-2005 00:22 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Update to e2fsprogs package
Description: 
This patch updates the e2fsprogs package to build the 1.37 version of
e2fsprogs. This version of e2fsprogs adds additional features and
increases preformance. I've also change the configuration to build all of
e2fsprogs dynamicly linked. This reduces the size of the individual
binaries considerably.

Please do not credit me for this patch.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-11-05 00:22  cjs            New Issue                                    
05-11-05 00:22  cjs            File Added: e2fsprogs.patch                    
05-16-05 10:38  andersen       Status                   assigned => closed  
05-16-05 10:38  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
