From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 2 Oct 2007 00:05:58 -0700
Subject: [Buildroot] [buildroot 0001517]: some packages didn't honor
	TARGET_CFLAGS and TARGET_LDFLAGS
Message-ID: <2e424a1c02c9e03b7b08280f1e895d5c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1517 
====================================================================== 
Reported By:                shuhao_chang
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1517
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-02-2007 00:05 PDT
Last Modified:              10-02-2007 00:05 PDT
====================================================================== 
Summary:                    some packages didn't honor TARGET_CFLAGS and
TARGET_LDFLAGS
Description: 
When using prebuild external toolchain, some packages build failed due to
not honor TARGET_CFLAGS and TARGET_LDFLAGS.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-02-07 00:05  shuhao_chang   New Issue                                    
10-02-07 00:05  shuhao_chang   Status                   new => assigned     
10-02-07 00:05  shuhao_chang   Assigned To               => buildroot       
10-02-07 00:05  shuhao_chang   File Added: cflags_ldflags.diff                  
 
======================================================================
