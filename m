From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 19:50:33 -0800
Subject: [Buildroot] [buildroot 0001210]: PATCH: Fix backwards logic in for
	installing targets
Message-ID: <8d784266a2bff23a0a0130b0cb511a37@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1210 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1210
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-12-2007 19:50 PST
Last Modified:              02-12-2007 19:50 PST
====================================================================== 
Summary:                    PATCH: Fix backwards logic in for installing targets
Description: 
Several packages have broken/backwards logic in the install portion of
their .mk files which prevents them from actually installing into the
target root filesystem after being built.

The attached patch (against 17872) fixes this issue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-12-07 19:50  foogod         New Issue                                    
02-12-07 19:50  foogod         Status                   new => assigned     
02-12-07 19:50  foogod         Assigned To               => buildroot       
02-12-07 19:50  foogod         File Added: buildroot.17872.install_logic.patch  
                 
======================================================================
