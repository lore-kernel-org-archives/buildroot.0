From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 22:28:47 -0800
Subject: [Buildroot] [buildroot 0001615]: Can not build?
Message-ID: <550da1b8311d56845579af1cdf1acd72@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1615 
====================================================================== 
Reported By:                linsample
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1615
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 22:28 PST
Last Modified:              11-27-2007 22:28 PST
====================================================================== 
Summary:                    Can not build?
Description: 
Anybody knows the compile error when I try to build buildroot???

/home/sample/projects/LX_2618_RG_5_3_00r4_SRC/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.
c:1: error: unsupported combination: -mabicalls -mabi=eabi
make[2]: *** [crtbegin.o] Error 1
make[2]: Leaving directory
`/home/sample/projects/LX_2618_RG_5_3_00r4_SRC/buildroot/toolchain_build_
mips/gcc-4.2.1-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/sample/projects/LX_2618_RG_5_3_00r4_SRC/buildroot/toolchain_build_
mips/gcc-4.2.1-initial'
make: ***
[/home/sample/projects/LX_2618_RG_5_3_00r4_SRC/buildroot/toolchain_build_mips/gcc-4.2.1-in
itial/.compiled] Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 22:28  linsample      New Issue                                    
11-27-07 22:28  linsample      Status                   new => assigned     
11-27-07 22:28  linsample      Assigned To               => buildroot       
======================================================================
