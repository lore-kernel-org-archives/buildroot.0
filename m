From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 8 Sep 2008 11:05:13 -0700
Subject: [Buildroot] [buildroot 0004844]: Bridge-utils broken under kernel
	2.4
Message-ID: <9c9a430c5df95c308bdba453625a9722@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4844 
====================================================================== 
Reported By:                Feynman
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4844
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-08-2008 11:05 PDT
Last Modified:              09-08-2008 11:05 PDT
====================================================================== 
Summary:                    Bridge-utils broken under kernel 2.4
Description: 
Snapshot buildroot-20080905

The bridge-utils package compiles but the brctl command fails.
The error message is:
# brctl addbr br0
add bridge failed: Invalid argument

I think this is a problem with the bridge-utils 1.4. The former version
1.06 works fine.

My configuration is: 386, kernel 2.4, busybox 1.11.x
The project is openMGB, a RDC based NAS with WAP.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-08-08 11:05  Feynman        New Issue                                    
09-08-08 11:05  Feynman        Status                   new => assigned     
09-08-08 11:05  Feynman        Assigned To               => buildroot       
======================================================================
