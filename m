From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Jan 2008 02:47:19 -0800
Subject: [Buildroot] [buildroot 0001969]: [PATCH] Add gdb-support for nios2
Message-ID: <af3789ef43b9a6c036ef1d82c356b4e0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              01-24-2008 02:47 PST
====================================================================== 
Summary:                    [PATCH] Add gdb-support for nios2
Description: 
The attached patch (gdb-nios2-svn20890.diff) adds support for building
gdb/gdbserver for the nios2 arch.
Updated kernel-headers with fixes for ptrace syscall (needed for
gdbserver) are also attached: kernel-headers-nios2-svn20890.diff.

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-24-08 02:47  
---------------------------------------------------------------------- 
This kernel-header patch does not apply for me?
Please verify them against a clean checkout. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-23-08 14:34  atle           New Issue                                    
01-23-08 14:34  atle           Status                   new => assigned     
01-23-08 14:34  atle           Assigned To               => buildroot       
01-23-08 14:34  atle           File Added: gdb-nios2-svn20890.diff              
     
01-23-08 14:34  atle           File Added: kernel-headers-nios2-svn20890.diff   
                
01-24-08 02:47  bernhardf      Note Added: 0003499                          
======================================================================
