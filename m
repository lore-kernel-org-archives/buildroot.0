From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 28 May 2008 06:15:31 -0700
Subject: [Buildroot] [buildroot 0003454]: Building Generic development
	system fails (First of two bugs)
Message-ID: <6c7386719ca9b72901c77d5a18d6f111@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3454 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3454
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-28-2008 06:15 PDT
Last Modified:              05-28-2008 06:15 PDT
====================================================================== 
Summary:                    Building Generic development system fails (First of
two bugs)
Description: 
The build fails if the target platform is a non ARM nofpu platform.
The problem is that the gcc option -mfloat-abi is ARM only.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-28-08 06:15  KHAksnes       New Issue                                    
05-28-08 06:15  KHAksnes       Status                   new => assigned     
05-28-08 06:15  KHAksnes       Assigned To               => buildroot       
======================================================================
