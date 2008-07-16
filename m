From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 15 Jul 2008 22:05:09 -0700
Subject: [Buildroot] [buildroot 0004144]: armeb-linux-uclibcgnueabi target
	fails for gcc-4.2.4-final
Message-ID: <5f96367745ef582a066679ec0bb1c5c5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4144 
====================================================================== 
Reported By:                xenoneus
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4144
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-15-2008 22:05 PDT
Last Modified:              07-15-2008 22:05 PDT
====================================================================== 
Summary:                    armeb-linux-uclibcgnueabi target fails for
gcc-4.2.4-final
Description: 
make[3]: Leaving directory
`/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/gcc'
Checking multilib configuration for libiberty...
Configuring in armeb-linux-uclibcgnueabi/libiberty
configure: loading cache ./config.cache
checking whether to enable maintainer-specific portions of Makefiles...
no
checking for makeinfo... makeinfo --split-size=5000000
checking for perl... perl
checking build system type... i386-pc-linux-gnu
checking host system type... armeb-unknown-linux-uclibcgnueabi
checking for armeb-linux-uclibcgnueabi-ar...
/home/builder/tools/src/buildroot/build_armeb/staging_dir/usr/armeb-linux-uclibcgnueabi/bin/ar
checking for armeb-linux-uclibcgnueabi-ranlib...
/home/builder/tools/src/buildroot/build_armeb/staging_dir/usr/armeb-linux-uclibcgnueabi/bin/ranlib
checking for armeb-linux-uclibcgnueabi-gcc...
/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/xgcc
-B/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/
-B/usr/armeb-linux-uclibcgnueabi/bin/ -B/usr/armeb-linux-uclibcgnueabi/lib/
-isystem /usr/armeb-linux-uclibcgnueabi/include -isystem
/usr/armeb-linux-uclibcgnueabi/sys-include
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/xgcc
-B/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/
-B/usr/armeb-linux-uclibcgnueabi/bin/ -B/usr/armeb-linux-uclibcgnueabi/lib/
-isystem /usr/armeb-linux-uclibcgnueabi/include -isystem
/usr/armeb-linux-uclibcgnueabi/sys-include accepts -g... yes
checking for
/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/xgcc
-B/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/
-B/usr/armeb-linux-uclibcgnueabi/bin/ -B/usr/armeb-linux-uclibcgnueabi/lib/
-isystem /usr/armeb-linux-uclibcgnueabi/include -isystem
/usr/armeb-linux-uclibcgnueabi/sys-include option to accept ANSI C... none
needed
checking how to run the C preprocessor...
/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/xgcc
-B/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/
-B/usr/armeb-linux-uclibcgnueabi/bin/ -B/usr/armeb-linux-uclibcgnueabi/lib/
-isystem /usr/armeb-linux-uclibcgnueabi/include -isystem
/usr/armeb-linux-uclibcgnueabi/sys-include -E
checking whether
/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/xgcc
-B/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/
-B/usr/armeb-linux-uclibcgnueabi/bin/ -B/usr/armeb-linux-uclibcgnueabi/lib/
-isystem /usr/armeb-linux-uclibcgnueabi/include -isystem
/usr/armeb-linux-uclibcgnueabi/sys-include accepts -Wc++-compat... yes
checking whether
/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/xgcc
-B/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/./gcc/
-B/usr/armeb-linux-uclibcgnueabi/bin/ -B/usr/armeb-linux-uclibcgnueabi/lib/
-isystem /usr/armeb-linux-uclibcgnueabi/include -isystem
/usr/armeb-linux-uclibcgnueabi/sys-include and cc understand -c and -o
together... yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking whether byte ordering is bigendian... no
checking for a BSD-compatible install... /usr/bin/install -c
checking for sys/file.h... yes
checking for sys/param.h... yes
checking for limits.h... yes
checking for stdlib.h... yes
checking for malloc.h... yes
checking for string.h... yes
checking for unistd.h... yes
checking for strings.h... yes
checking for sys/time.h... yes
checking for time.h... yes
checking for sys/resource.h... yes
checking for sys/stat.h... yes
checking for sys/mman.h... yes
checking for fcntl.h... yes
checking for alloca.h... yes
checking for sys/pstat.h... no
checking for sys/sysmp.h... no
checking for sys/sysinfo.h... yes
checking for machine/hal_sysinfo.h... no
checking for sys/table.h... no
checking for sys/sysctl.h... yes
checking for sys/systemcfg.h... no
checking for stdint.h... yes
checking for stdio_ext.h... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether errno must be declared... no
checking for egrep... grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for memory.h... yes
checking for strings.h... (cached) yes
checking for inttypes.h... yes
checking for stdint.h... (cached) yes
checking for unistd.h... (cached) yes
checking for int... yes
checking size of int... 4
checking for uintptr_t... yes
checking for a 64-bit type... uint64_t
checking for pid_t... yes
checking for library containing strerror... configure: error: Link tests
are not allowed after GCC_NO_EXECUTABLES.
make[2]: *** [configure-target-libiberty] Error 1
make[2]: Leaving directory
`/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final'
make: ***
[/home/builder/tools/src/buildroot/toolchain_build_armeb/gcc-4.2.4-final/.compiled]
Error 2


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-15-08 22:05  xenoneus       New Issue                                    
07-15-08 22:05  xenoneus       Status                   new => assigned     
07-15-08 22:05  xenoneus       Assigned To               => buildroot       
07-15-08 22:05  xenoneus       File Added: .config                          
======================================================================
