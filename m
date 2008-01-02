From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 2 Jan 2008 15:04:53 -0800
Subject: [Buildroot] [buildroot 0001829]: SEGV when running openssh - the
	second
Message-ID: <e3e8139d71698e3244b0da36f4ff9770@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1829 
====================================================================== 
Reported By:                netvipe
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1829
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-02-2008 15:04 PST
Last Modified:              01-02-2008 15:04 PST
====================================================================== 
Summary:                    SEGV when running openssh - the second
Description: 
openssh build with the actual buildroot crashes with SIGSEGV.

i build the toolchain based on uclibc 0.9.29 and gcc 4.2.1. 
also used the 2.6.22.10 kernel sources for build process and binutils
2.18.

the problem is that all tried versions of openssh crash. 
i've tried already 3.9p1, 4.5p1, 4.6p1 and 4.7p1

a similiar bug was already described before -->
http://bugs.uclibc.org/view.php?id=967

i also figured out this bug a couple of months before. switching to uclibc
version 0.9.27 (stable) solved the problem last time.
using an alternative ssh daemon like dropbear isn't also possible this
time :-(
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-02-08 15:04  netvipe        New Issue                                    
01-02-08 15:04  netvipe        Status                   new => assigned     
01-02-08 15:04  netvipe        Assigned To               => buildroot       
01-02-08 15:04  netvipe        File Added: strace openssh.txt                   

======================================================================
