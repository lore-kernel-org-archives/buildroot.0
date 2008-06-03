From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 3 Jun 2008 05:12:04 -0700
Subject: [Buildroot] [buildroot 0003604]: libxml2 config script
	(xml2-config) is not edited in the same way as freetype-config
Message-ID: <5d8e27e8c9814873b47fcb5e8be538e3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3604 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3604
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-03-2008 05:12 PDT
Last Modified:              06-03-2008 05:12 PDT
====================================================================== 
Summary:                    libxml2 config script (xml2-config) is not edited in
the same way as freetype-config
Description: 
libxml2 produces a config script like freetype.  Called xml2-config.  It
requires that the same SED be done so that cross compilation works.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:12  daniellaird    New Issue                                    
06-03-08 05:12  daniellaird    Status                   new => assigned     
06-03-08 05:12  daniellaird    Assigned To               => buildroot       
06-03-08 05:12  daniellaird    File Added: libxml2_config_script.patch          
         
======================================================================
