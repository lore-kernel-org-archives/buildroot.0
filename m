From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 29 Oct 2008 13:02:45 -0700
Subject: [Buildroot] [buildroot 0005834]: remove redundancy from mkdos
	makefile
Message-ID: <3d1d352090a08bf2aa72659b8c6fd9d9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5834 
====================================================================== 
Reported By:                Chris David
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5834
Category:                   Other
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-29-2008 13:02 PDT
Last Modified:              10-29-2008 13:02 PDT
====================================================================== 
Summary:                    remove redundancy from mkdos makefile
Description: 
When I changed the location of the mkdosfs binary at the top of the
makefile, the makefile breaks without this patch.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-29-08 13:02  Chris David    New Issue                                    
10-29-08 13:02  Chris David    Status                   new => assigned     
10-29-08 13:02  Chris David    Assigned To               => buildroot       
10-29-08 13:02  Chris David    File Added: mkdosfs.patch                    
======================================================================
