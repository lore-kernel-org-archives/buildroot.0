From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 4 Jun 2008 22:22:35 -0700
Subject: [Buildroot] [buildroot 0003654]: build for sh2eb is broken
Message-ID: <35c70e71096f83d99c73ec151166cf1c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3654 
====================================================================== 
Reported By:                david
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3654
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-04-2008 22:22 PDT
Last Modified:              06-04-2008 22:22 PDT
====================================================================== 
Summary:                    build for sh2eb is broken
Description: 
Use latest snapshot buildroot-20080604.tar.bz2.
# make menuconfig
Target Architecture (superh)
Target Architecture Variant (sh2eb)
All the others use default options.

It stops at:
buildroot/toolchain_build_sh2eb/binutils-2.18-build/configure \
		--prefix=/usr \
		--build=i386-pc-linux-gnu \
		--host=i386-pc-linux-gnu \
		--target=sh2eb-linux-uclibc \
...
checking target system type... Invalid configuration `sh2eb-linux-uclibc':
machine `sh2eb' not recognized

Build environment: Ubuntu 8.04 i386.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-04-08 22:22  david          New Issue                                    
06-04-08 22:22  david          Status                   new => assigned     
06-04-08 22:22  david          Assigned To               => buildroot       
======================================================================
