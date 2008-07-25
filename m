From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 25 Jul 2008 13:36:25 -0700
Subject: [Buildroot] [buildroot 0004344]: [PATCH] qtopia4 does not build
	correctly for x86 target
Message-ID: <4b5f57f121391c62092d5c7ce98324d3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4344 
====================================================================== 
Reported By:                patricks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4344
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-25-2008 13:36 PDT
Last Modified:              07-25-2008 13:36 PDT
====================================================================== 
Summary:                    [PATCH] qtopia4 does not build correctly for x86
target
Description: 
The sed commands to change the compiler in the mkspec file were not working
for x86 targets.  I changed the sed commands to hopefully work on all
targets.  I haven't tested on anything other than x86 though.  Also, I
added sed commands to alter the configure script and several .pro files so
that programs run on the host are built with the host compiler.  I also
added automatic checking for a qconfig-myfile.h.  Also, the docs and tools
build targets are eliminated.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-25-08 13:36  patricks       New Issue                                    
07-25-08 13:36  patricks       Status                   new => assigned     
07-25-08 13:36  patricks       Assigned To               => buildroot       
07-25-08 13:36  patricks       File Added: qtopia4.mk.patch                    
======================================================================
