From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:01 -0800
Subject: [Buildroot] [buildroot 0000255]: Update to bzip2 package
Message-ID: <039bbcab28fbcd16cdd210eecfe931ca@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=255 
====================================================================== 
Reported By:                cjs
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   255
Category:                   Security
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-10-2005 23:56 PDT
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    Update to bzip2 package
Description: 
This patch updates the bzip2 package to build version 1.0.3. The 1.0.3
version of bzip2 fixes a security issue with bzip2 v.1.0.2. This patch
also modifies the .mk file so that version changes can be acomodated more
easily.

Please do not credit me for this patch.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-10-05 23:56  cjs            New Issue                                    
05-10-05 23:56  cjs            File Added: bzip2.patch                      
05-16-05 10:29  andersen       Status                   assigned => closed  
05-16-05 10:29  andersen       Resolution               open => fixed       
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
