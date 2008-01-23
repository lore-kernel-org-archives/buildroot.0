From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 23 Jan 2008 14:34:20 -0800
Subject: [Buildroot] [buildroot 0001969]: [PATCH] Add gdb-support for nios2
Message-ID: <f4d897899ba866f27e4dca2ab17b364c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1969 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1969
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-23-2008 14:34 PST
Last Modified:              01-23-2008 14:34 PST
====================================================================== 
Summary:                    [PATCH] Add gdb-support for nios2
Description: 
The attached patch (gdb-nios2-svn20890.diff) adds support for building
gdb/gdbserver for the nios2 arch.
Updated kernel-headers with fixes for ptrace syscall (needed for
gdbserver) are also attached: kernel-headers-nios2-svn20890.diff.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-23-08 14:34  atle           New Issue                                    
01-23-08 14:34  atle           Status                   new => assigned     
01-23-08 14:34  atle           Assigned To               => buildroot       
01-23-08 14:34  atle           File Added: gdb-nios2-svn20890.diff              
     
======================================================================
