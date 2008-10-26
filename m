From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 26 Oct 2008 01:46:54 -0700
Subject: [Buildroot] [buildroot 0005734]: xrx application does not compile
Message-ID: <49c1fa5414367aa3a8ea2cb5373e3c5b@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5734 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5734
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-26-2008 01:46 PDT
Last Modified:              10-26-2008 01:46 PDT
====================================================================== 
Summary:                    xrx application does not compile
Description: 
configure: creating libtool
appending configuration tag "CXX" to libtool
checking for ld used by
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/
checking if the linker
(/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/) is GNU
ld... yes
checking whether the
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 linker
(/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/) supports
shared libraries... yes
checking for
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 option to produce PIC... -fPIC
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 PIC flag -fPIC works... yes
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 supports -c -o file.o... yes
checking whether the
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 linker
(/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/) supports
shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... no
appending configuration tag "F77" to libtool
checking if Xtrans should support UNIX socket connections... yes
checking if Xtrans should support TCP socket connections... yes
checking for library containing socket... none required
checking for library containing gethostbyname... none required
checking for getaddrinfo... yes
checking if IPv6 support should be built... yes
checking for struct sockaddr_in.sin_len... no
checking pkg-config is at least version 0.9.0... yes
checking for XRX... configure: error: Package requirements (x11 xt xext
xtrans xproxymngproto xau) were not met:

No package 'xproxymngproto' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables XRX_CFLAGS
and XRX_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

make: ***
[/home/roberto/gles/buildroot/build_i586/xapp_xrx-1.0.1/.stamp_configured]
Error 1

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-26-08 01:46  robang74       New Issue                                    
10-26-08 01:46  robang74       Status                   new => assigned     
10-26-08 01:46  robang74       Assigned To               => buildroot       
10-26-08 01:46  robang74       File Added: xapp_xrx.patch                    
======================================================================
