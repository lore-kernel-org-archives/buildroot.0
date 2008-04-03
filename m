From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 3 Apr 2008 02:29:33 -0700
Subject: [Buildroot] [buildroot 0002754]: make fail: several attempt to
	download incorrect version of tools.
Message-ID: <0247a3bc30e4827aa6b15555e7442a65@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             04-02-2008 21:07 PDT
Last Modified:              04-03-2008 02:29 PDT
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

---------------------------------------------------------------------- 
 jacmet - 04-03-08 02:29  
---------------------------------------------------------------------- 
Thanks - committed in r21623 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-02-08 21:07  andrewma       New Issue                                    
04-02-08 21:07  andrewma       Status                   new => assigned     
04-02-08 21:07  andrewma       Assigned To               => buildroot       
04-03-08 02:29  jacmet         Status                   assigned => closed  
04-03-08 02:29  jacmet         Note Added: 0006364                          
======================================================================
