From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 2 Apr 2008 21:07:12 -0700
Subject: [Buildroot] [buildroot 0002754]: make fail: several attempt to
	download incorrect version of tools.
Message-ID: <84985f43e6e0649610ff13d736437dba@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2754 
====================================================================== 
Reported By:                andrewma
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2754
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-02-2008 21:07 PDT
Last Modified:              04-02-2008 21:07 PDT
====================================================================== 
Summary:                    make fail: several attempt to download incorrect
version of tools.
Description: 
Just run a plain config for a Linux-2.6.24 and busybox-1.10 .  Build script
has a several attempts to download tool sources, and patches, with
incorrect version number.  I have attached the fix patches in the
"additional information" section.

Also a new directory "ed" should be made under package directory.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-02-08 21:07  andrewma       New Issue                                    
04-02-08 21:07  andrewma       Status                   new => assigned     
04-02-08 21:07  andrewma       Assigned To               => buildroot       
======================================================================
