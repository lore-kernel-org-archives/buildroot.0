From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Mar 2008 08:07:21 -0700
Subject: [Buildroot] [buildroot 0002534]: Impossible to log
Message-ID: <8ccf9fa9b7a246409a390c034629f308@busybox.net>
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
Last Modified:              03-12-2008 08:07 PDT
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

---------------------------------------------------------------------- 
 saga31 - 03-12-08 08:07  
---------------------------------------------------------------------- 
Sorry. I complete the information.

The processor architecture is an arm AT91SAM9620.

versions of components:
binutils-2.18.tar.bz2
busybox-1.9.1.tar.bz2
fakeroot_1.9.tar.gz
gcc-4.2.1.tar.bz2
genext2fs-1.4.tar.gz
gmp-4.2.2.tar.bz2
gzip-1.3.5.tar.gz
linux-2.6.22.10.tar.bz2
lzma-4.32.4.tar.gz
lzo_1.08.orig.tar.gz
module-init-tools-3.2.2.tar.bz2
mpfr-2.3.0.patch
mpfr-2.3.0.tar.bz2
mtd-utils-1.1.0.tar.bz2
tcl8.4.9-src.tar.gz
uClibc-0.9.29.tar.bz2
zlib-1.2.3.tar.bz2

thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-12-08 04:21  saga31         New Issue                                    
03-12-08 04:21  saga31         Status                   new => assigned     
03-12-08 04:21  saga31         Assigned To               => buildroot       
03-12-08 07:53  sjhill         Note Added: 0005664                          
03-12-08 08:07  saga31         Note Added: 0005674                          
======================================================================
