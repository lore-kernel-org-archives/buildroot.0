From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 4 Mar 2007 07:29:37 -0800
Subject: [Buildroot] [buildroot 0001258]: Packages with "self-written"
	configure scripts fail with non-Linux hosts
Message-ID: <aaa1ab7798cbe38900df49f67ced8b34@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1258 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1258
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-04-2007 07:29 PST
Last Modified:              03-04-2007 07:29 PST
====================================================================== 
Summary:                    Packages with "self-written" configure scripts fail
with non-Linux hosts
Description: 
Non-autoconf packages seem to be unfriendly towards cross-building. Few
examples are zlib and jpeg. On Mac OS X host, they cannot link shared
libraries correctly, because they identify the host system as the target
system and try to pass OS X linker flags to, for example,
i686-linux-uclibc-gcc. Autoconfed packages, such as gmp, seem to work
fine.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-04-07 07:29  holin          New Issue                                    
03-04-07 07:29  holin          Status                   new => assigned     
03-04-07 07:29  holin          Assigned To               => buildroot       
======================================================================
