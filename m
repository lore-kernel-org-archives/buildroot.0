From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 17 Feb 2007 16:54:47 -0800
Subject: [Buildroot] [buildroot 0001231]: PATCH: 'make source' does not
	download kernel-headers source.
Message-ID: <d00c3bb8914ceca821385f4104c5332c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1231 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1231
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2007 16:54 PST
Last Modified:              02-17-2007 16:54 PST
====================================================================== 
Summary:                    PATCH: 'make source' does not download
kernel-headers source.
Description: 
There is no make dependency connecting the 'source' target to the
kernel-headers-source target.  Thus, 'make source' does not download the
kernel-headers source, and it doesn't actually get downloaded until it
comes time to build it.

The attached patch fixes this issue by adding kernel-headers-source as a
dependency for uclibc-configured-source.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-07 16:54  foogod         New Issue                                    
02-17-07 16:54  foogod         Status                   new => assigned     
02-17-07 16:54  foogod         Assigned To               => buildroot       
02-17-07 16:54  foogod         File Added:
buildroot.17919.kernel_headers_source.patch                    
======================================================================
