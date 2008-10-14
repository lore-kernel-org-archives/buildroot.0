From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 14 Oct 2008 06:26:22 -0700
Subject: [Buildroot] [buildroot 0003614]: libxslt uses old build system and
	does not post edit the xslt-config script like libxml2/freetype
Message-ID: <f2e6ca38e291af45d1b8851aa64d7c7f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             06-03-2008 05:16 PDT
Last Modified:              10-14-2008 06:26 PDT
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

---------------------------------------------------------------------- 
 daniellaird - 10-14-08 06:26  
---------------------------------------------------------------------- 
Fixed in r23275 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:16  daniellaird    New Issue                                    
06-03-08 05:16  daniellaird    Status                   new => assigned     
06-03-08 05:16  daniellaird    Assigned To               => buildroot       
06-03-08 05:16  daniellaird    File Added: libxslt_build.patch                  
 
10-14-08 00:05  daniellaird    Note Added: 0013534                          
10-14-08 06:26  daniellaird    Note Added: 0013574                          
10-14-08 06:26  daniellaird    Status                   assigned => closed  
10-14-08 06:26  daniellaird    Resolution               open => fixed       
======================================================================
