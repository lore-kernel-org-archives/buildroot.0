From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 3 Jun 2008 05:06:35 -0700
Subject: [Buildroot] [buildroot 0003584]: Cairo does not build directfb if
	directfb support required (dependencies missing)
Message-ID: <7a8abfa685a51fdaa08110d835b87236@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3584 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3584
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-03-2008 05:06 PDT
Last Modified:              06-03-2008 05:06 PDT
====================================================================== 
Summary:                    Cairo does not build directfb if directfb support
required (dependencies missing)
Description: 
Cairo supports being built for DirectFB.  However it is not dependent on
DirectFB so DirectFB may not actually be build yet 
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:06  daniellaird    New Issue                                    
06-03-08 05:06  daniellaird    Status                   new => assigned     
06-03-08 05:06  daniellaird    Assigned To               => buildroot       
06-03-08 05:06  daniellaird    File Added: cairo_directfb.patch                 
  
======================================================================
