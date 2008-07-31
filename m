From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 31 Jul 2008 04:57:28 -0700
Subject: [Buildroot] [buildroot 0004384]: GCC 4.3.1 fails with cannot
	compute suffix of object files
Message-ID: <f3caaff2ac5d5c4ea526926fe4a3cf91@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4384 
====================================================================== 
Reported By:                kreuters
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4384
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-31-2008 04:57 PDT
Last Modified:              07-31-2008 04:57 PDT
====================================================================== 
Summary:                    GCC 4.3.1 fails with cannot compute suffix of object
files
Description: 
from buildroot-20080731.tar.bz, only things selected are gcc 4.3.1 and
EABI.


checking for arm-linux-uclibcgnueabi-gcc... 
/home/dikkie/Documents/dns323/uclibc/buildroot/toolchain_build_arm/gcc-4.3.1-initial/./gcc/xgcc
-B/home/dikkie/Documents/dns323/uclibc/buildroot/toolchain_build_arm/gcc-4.3.1-initial/./gcc/
-B/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin/
-B/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/
-isystem
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/include
-isystem
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/sys-include

checking for suffix of object files... configure: error: cannot compute
suffix of object files: cannot compile

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-31-08 04:57  kreuters       New Issue                                    
07-31-08 04:57  kreuters       Status                   new => assigned     
07-31-08 04:57  kreuters       Assigned To               => buildroot       
======================================================================
