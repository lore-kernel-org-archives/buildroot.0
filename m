From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 20 Jun 2008 19:19:55 -0700
Subject: [Buildroot] [buildroot 0003834]: cairo build broken when directfb
	support is required
Message-ID: <bb1ae9751e255807f2b801d4f8fa6ab3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3834 
====================================================================== 
Reported By:                kjzhang
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3834
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-20-2008 19:19 PDT
Last Modified:              06-20-2008 19:19 PDT
====================================================================== 
Summary:                    cairo build broken when directfb support is required
Description: 
After applying the patch uploaded in 0003584(adding directfb dependency),
cairo doens't build because of missing "directfb.h" when compiling
cairo-directfb-surface.c. 

I'm trying to build libgtk2 on top of directfb instead of X for both i686
and arrm, the above problem happens in both cases.

Does anybody else see the same issue?
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-20-08 19:19  kjzhang        New Issue                                    
06-20-08 19:19  kjzhang        Status                   new => assigned     
06-20-08 19:19  kjzhang        Assigned To               => buildroot       
======================================================================
