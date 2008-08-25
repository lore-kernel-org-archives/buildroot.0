From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 25 Aug 2008 05:52:02 -0700
Subject: [Buildroot] [buildroot 0004724]: [New Feature] dri compilation
	fixed and options added to the menu
Message-ID: <bdf8a16e3c27124ad06da5661128965f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4724 
====================================================================== 
Reported By:                antialize
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4724
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-25-2008 05:52 PDT
Last Modified:              08-25-2008 05:52 PDT
====================================================================== 
Summary:                    [New Feature] dri compilation fixed and options
added to the menu
Description: 
The current mesa driver dos not include any of the DRI drivers, enabling
them in the mesa3d.mk results in broken compilation. This patch fixes
those issues.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-25-08 05:52  antialize      New Issue                                    
08-25-08 05:52  antialize      Status                   new => assigned     
08-25-08 05:52  antialize      Assigned To               => buildroot       
08-25-08 05:52  antialize      File Added: mesa_dri.patch                    
======================================================================
