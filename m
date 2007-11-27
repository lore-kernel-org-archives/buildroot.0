From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 06:41:04 -0800
Subject: [Buildroot] [buildroot 0001614]: Kernel headers unavailable for
	external toolchain-based builds
Message-ID: <7f88858fd643833a129f1d198cd476a0@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1614 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1614
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 06:41 PST
Last Modified:              11-27-2007 06:41 PST
====================================================================== 
Summary:                    Kernel headers unavailable for external
toolchain-based builds
Description: 
Kernel headers are part of the "buildroot toolchain" option, and therefore
won't be offered at all for external toolchains, even though external
toolchains may come without kernel headers.

Attached is a patch to decouple kernel header selection from the toolchain
selection.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 06:41  ikonst         New Issue                                    
11-27-07 06:41  ikonst         Status                   new => assigned     
11-27-07 06:41  ikonst         Assigned To               => buildroot       
11-27-07 06:41  ikonst         File Added:
kernel-headers-for-external-toolchain.patch                    
======================================================================
