From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 17 Oct 2007 21:26:37 -0700
Subject: [Buildroot] [buildroot 0001540]: Buildroot cannot build gettext
Message-ID: <9767a0990acb4e401946201b11aa57cb@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1540 
====================================================================== 
Reported By:                hwstar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1540
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-17-2007 21:26 PDT
Last Modified:              10-17-2007 21:26 PDT
====================================================================== 
Summary:                    Buildroot cannot build gettext
Description: 
When buildroot tries to build gettext, it pops up a uemacs session and
wants input of some kind. Closing uemacs without saving anything causes
the build to fail during program installation.

Output of failed build pasted in the "Additional information" box.

The buildroot config file is attached.

Host: Ubuntu 7.04. 
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-17-07 21:26  hwstar         New Issue                                    
10-17-07 21:26  hwstar         Status                   new => assigned     
10-17-07 21:26  hwstar         Assigned To               => buildroot       
10-17-07 21:26  hwstar         File Added: new-config                       
======================================================================
