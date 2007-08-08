From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 7 Aug 2007 20:58:53 -0700
Subject: [Buildroot] [buildroot 0001456]: failed to configure "ed" package:
	Unrecognized option: "--disable-nls"
Message-ID: <21876fb437cbfc418b6254eaf4cbffe7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1456 
====================================================================== 
Reported By:                nawawi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1456
Category:                   Other
Reproducibility:            unable to reproduce
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-07-2007 20:58 PDT
Last Modified:              08-07-2007 20:58 PDT
====================================================================== 
Summary:                    failed to configure "ed" package: Unrecognized
option: "--disable-nls"
Description: 
ERROR: configure: Unrecognized option: "--disable-nls"; use --help for
usage.
make: *** [/home/dev/buildroot/build_i386/ed-0.6/.configured] Error 1

juts remove "$(DISABLE_NLS)" in package/ed/ed.mk
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-07-07 20:58  nawawi         New Issue                                    
08-07-07 20:58  nawawi         Status                   new => assigned     
08-07-07 20:58  nawawi         Assigned To               => buildroot       
======================================================================
