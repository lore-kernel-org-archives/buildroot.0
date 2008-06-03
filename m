From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 3 Jun 2008 05:16:09 -0700
Subject: [Buildroot] [buildroot 0003614]: libxslt uses old build system and
	does not post edit the xslt-config script like libxml2/freetype
Message-ID: <6de6f62764d33d760780792c49ae1acb@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3614 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3614
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-03-2008 05:16 PDT
Last Modified:              06-03-2008 05:16 PDT
====================================================================== 
Summary:                    libxslt uses old build system and does not post edit
the xslt-config script like libxml2/freetype
Description: 
libxslt is built using old build system.  Move to autotargets system and
make sure config script is post edited correctly.
Also add option to support conditional crypto support (based upon
libgcrypt being selected)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:16  daniellaird    New Issue                                    
06-03-08 05:16  daniellaird    Status                   new => assigned     
06-03-08 05:16  daniellaird    Assigned To               => buildroot       
06-03-08 05:16  daniellaird    File Added: libxslt_build.patch                  
 
======================================================================
