From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 7 Jul 2008 07:06:26 -0700
Subject: [Buildroot] [buildroot 0003984]: openmotif-2.3.0 does not cross
	compile to ARM
Message-ID: <3f100be1d2ba11004179027c4c6ea0cd@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3984 
====================================================================== 
Reported By:                guillaume_g
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3984
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-07-2008 07:06 PDT
Last Modified:              07-07-2008 07:06 PDT
====================================================================== 
Summary:                    openmotif-2.3.0 does not cross compile to ARM
Description: 
Apparently it gets the errno.h file from host instead of getting it from
buildroot. So it does not compile and return the error :

#warning This machine appears to be neither x86_64 nor i386

How can I tell it to use the right errno.h file ?
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-07-08 07:06  guillaume_g    New Issue                                    
07-07-08 07:06  guillaume_g    Status                   new => assigned     
07-07-08 07:06  guillaume_g    Assigned To               => buildroot       
======================================================================
