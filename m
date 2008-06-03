From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 3 Jun 2008 05:04:43 -0700
Subject: [Buildroot] [buildroot 0003574]: pango.mk redefines PKG_CONFIG_*
	for no reason
Message-ID: <91c2140c73752380e550586a52b0c0d7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3574 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3574
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-03-2008 05:04 PDT
Last Modified:              06-03-2008 05:04 PDT
====================================================================== 
Summary:                    pango.mk redefines PKG_CONFIG_* for no reason
Description: 
pango.mk currently redefines PKG_CONFIG_PATH/SYSROOT.  This is not
necessary as specified in configure enviroment.  In my case I have added
usr/local/lib/pkgconfig as well and without this fix I need to edit
multiple makefiles not just package/Makefile.in.  
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:04  daniellaird    New Issue                                    
06-03-08 05:04  daniellaird    Status                   new => assigned     
06-03-08 05:04  daniellaird    Assigned To               => buildroot       
06-03-08 05:04  daniellaird    File Added: pango_pkconfig.patch                 
  
======================================================================
