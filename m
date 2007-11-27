From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 01:52:52 -0800
Subject: [Buildroot] [buildroot 0001611]: ipsec-tools.mk should pass CFLAGS,
	LDFLAGS
Message-ID: <71f39c808c227aae516a3d6cdd2dee83@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1611 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1611
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 01:52 PST
Last Modified:              11-27-2007 01:52 PST
====================================================================== 
Summary:                    ipsec-tools.mk should pass CFLAGS, LDFLAGS
Description: 
ipsec-tools.mk fails to pass CFLAGS and LDFLAGS to the child make. This is
especially important for external toolchain builds, where CFLAGS and
LDFLAGS are essential for specifying the staging dir's /usr/include and
/usr/lib.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 01:52  ikonst         New Issue                                    
11-27-07 01:52  ikonst         Status                   new => assigned     
11-27-07 01:52  ikonst         Assigned To               => buildroot       
11-27-07 01:52  ikonst         File Added: ipsec-tools-pass-cflags-ldflags.patch
                   
======================================================================
