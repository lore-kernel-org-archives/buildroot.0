From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:46 -0800
Subject: [Buildroot] [buildroot 0000572]: Local mirror management
Message-ID: <74e85440f7f93f8a37d82a853137f7bb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=572 
====================================================================== 
Reported By:                david_bachelart
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   572
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-30-2005 05:42 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Local mirror management
Description: 
If you use a local mirror for tarballs download, you have to path urls in
.mk files. This patch provides a safer solution : it wraps BR2_WGET
variable.

Except for defined local hosts, all urls are first modified in order to
download on the mirror. If the download fails, the download is done with
the original URL. You can configure the wrapper to download exclusively on
your mirror, or to build a directory with packages missing on your mirror.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-05 05:42  david_bachelartNew Issue                                    
11-30-05 05:42  david_bachelartStatus                   new => assigned     
11-30-05 05:42  david_bachelartAssigned To               => uClibc          
11-30-05 05:42  david_bachelartFile Added: localmirror.patch                    
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
