From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Mar 2008 07:53:45 -0700
Subject: [Buildroot] [buildroot 0002534]: Impossible to log
Message-ID: <1597e22d334bdc04f23c96084bdade77@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2534 
====================================================================== 
Reported By:                saga31
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2534
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-12-2008 04:21 PDT
Last Modified:              03-12-2008 07:53 PDT
====================================================================== 
Summary:                    Impossible to log
Description: 
Hello,

I have install and setup buildroot, busybox-1.9.1 and linux kenerl
2.6.22.10, but when I want to connect on my board, it's a big problem.

boot:
......
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 80K



Welcome to the Erik's uClibc development environment.
(none) login: root
Jan  1 00:00:05 login[157]: root login on 'console'

Welcome to the Erik's uClibc development environment.
(none) login: default

Welcome to the Erik's uClibc development environment.
(none) login:

I don't know why login fail.
Help me please.
====================================================================== 

---------------------------------------------------------------------- 
 sjhill - 03-12-08 07:53  
---------------------------------------------------------------------- 
You have not provided enough information. What is your processor
architecture. Which toolchain and versions of all components (binutils,
GCC, uClibc, etc.). Are you using glibc or uClibc? Once you provide the
information, it can be analyzed. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-12-08 04:21  saga31         New Issue                                    
03-12-08 04:21  saga31         Status                   new => assigned     
03-12-08 04:21  saga31         Assigned To               => buildroot       
03-12-08 07:53  sjhill         Note Added: 0005664                          
======================================================================
