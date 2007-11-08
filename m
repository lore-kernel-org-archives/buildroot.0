From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 8 Nov 2007 03:30:32 -0800
Subject: [Buildroot] [buildroot 0001579]: libstdc++ build fails with uclibc
	headers
Message-ID: <9ab6608e260e3313298ea3ca3a146f01@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1579 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1579
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-08-2007 03:30 PST
Last Modified:              11-08-2007 03:30 PST
====================================================================== 
Summary:                    libstdc++ build fails with uclibc headers
Description: 
Building gcc-3.4.6 with c++ support still fails as reported in the closed
issue http://bugs.uclibc.org/view.php?id=904.
The issue is reported in gcc PR14939,
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=14939
and a patch (incorporated in 4.2) is found here:
http://gcc.gnu.org/bugzilla/attachment.cgi?id=6132

The patch is tested with gcc-3.4.6 and uClibc-0.9.29 for the nios2
architecture, and works well. Could you please include this patch in
toolchain/gcc/3.4.6 ?
This issue is a show-stopper for compiling libstdc++ on the nios2 as we're
stuck with gcc 3.4.x.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-07 03:30  atle           New Issue                                    
11-08-07 03:30  atle           Status                   new => assigned     
11-08-07 03:30  atle           Assigned To               => buildroot       
======================================================================
