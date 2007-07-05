From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 5 Jul 2007 10:11:49 -0700
Subject: [Buildroot] [buildroot 0001422]: add logic to build a replacement
	make binary if host has unsuitable binary
Message-ID: <0e8e57e258ffc5a08988df3cd3598c6f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1422 
====================================================================== 
Reported By:                chickenandporn
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1422
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-05-2007 10:11 PDT
Last Modified:              07-05-2007 10:11 PDT
====================================================================== 
Summary:                    add logic to build a replacement make binary if host
has unsuitable binary
Description: 
On my build, the make binary is unsuitable; I have created a patch which
recognizes this and builds a make binary from the host using the same
download/configure logic in package/make/make.mk.  The previous failure in
dependencies.sh is resolved, although this is not a bug per-se (user can
manually fix the issue, but this allows some laziness).


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-05-07 10:11  chickenandporn New Issue                                    
07-05-07 10:11  chickenandporn Status                   new => assigned     
07-05-07 10:11  chickenandporn Assigned To               => buildroot       
07-05-07 10:11  chickenandporn File Added: buildroot-hostmake.patch             
      
======================================================================
