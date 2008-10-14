From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 14 Oct 2008 00:05:39 -0700
Subject: [Buildroot] [buildroot 0003614]: libxslt uses old build system and
	does not post edit the xslt-config script like libxml2/freetype
Message-ID: <db4e840cb3599e272621a0e88042f6d8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              10-14-2008 00:05 PDT
====================================================================== 
Summary:                    libxslt uses old build system and does not post edit
the xslt-config script like libxml2/freetype
Description: 
libxslt is built using old build system.  Move to autotargets system and
make sure config script is post edited correctly.
Also add option to support conditional crypto support (based upon
libgcrypt being selected)
====================================================================== 

---------------------------------------------------------------------- 
 daniellaird - 10-14-08 00:05  
---------------------------------------------------------------------- 
Fixed in r23275
Close this 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:16  daniellaird    New Issue                                    
06-03-08 05:16  daniellaird    Status                   new => assigned     
06-03-08 05:16  daniellaird    Assigned To               => buildroot       
06-03-08 05:16  daniellaird    File Added: libxslt_build.patch                  
 
10-14-08 00:05  daniellaird    Note Added: 0013534                          
======================================================================
