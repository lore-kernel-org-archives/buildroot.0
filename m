From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:15 -0800
Subject: [Buildroot] [buildroot 0000691]: ccache package use wrong repository
Message-ID: <f0f1fff52a8ed4fb2fca7118b363aac4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=691 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   691
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-06-2006 06:44 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    ccache package use wrong repository
Description: 
toolchain/ccache/ccache.mk:CCACHE_SITE should be
http://samba.org/ftp/ccache

The current repository http://ccache.samba.org/ftp/ccache does not exist.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-06-06 06:44  janlana        New Issue                                    
02-06-06 06:44  janlana        Status                   new => assigned     
02-06-06 06:44  janlana        Assigned To               => uClibc          
02-10-06 12:26  prpplague      Status                   assigned => resolved
02-10-06 12:26  prpplague      Resolution               open => fixed       
02-10-06 12:26  prpplague      Additional Information Updated                   

03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
