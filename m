From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 14:09:07 +0000 (UTC)
Subject: [Buildroot] [Bug 1807] LZMA 4.32.7,
	Required header file(s) are missing.
In-Reply-To: <bug-1807-163@https.bugs.busybox.net/>
References: <bug-1807-163@https.bugs.busybox.net/>
Message-ID: <20100521140907.BA21D8F6CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1807

--- Comment #2 from Peter Katzmann <peter.katzmann@edag.de>  ---
  $ ./configure --target=armeb-linux --host=armeb-linux
--build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr
--sysconfdir=/etc --disable-gtk-doc --disable-nls --disable-ipv6
--disable-debug

## --------- ##
## Platform. ##
## --------- ##

hostname = pet
uname -m = x86_64
uname -r = 2.6.31.12-0.2-desktop
uname -s = Linux
uname -v = #1 SMP PREEMPT 2010-03-16 21:25:39 +0100

/usr/bin/uname -p = unknown
/bin/uname -X     = unknown

/bin/arch              = x86_64
/usr/bin/arch -k       = unknown
/usr/convex/getsysinfo = unknown
/usr/bin/hostinfo      = unknown
/bin/machine           = unknown
/usr/bin/oslevel       = unknown
/bin/universe          = unknown


configure:20322: result: no
configure:20326: checking utime.h presence
configure:20341:
/usr2/new/Source-ast162/build_env/buildroot/project_build_armeb/../toolchain/usr/bin/armeb-unknown-linux-uclibc-cpp
-Os -pipe -Os  -mtune=xscale -march=armv5te -mabi=apcs-gnu -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/usr2/new/Source-ast162/build_env/buildroot/project_build_armeb/../toolchain/usr/include
-I/usr2/new/Source-ast162/build_env/buildroot/project_build_armeb/../toolchain/include
--sysroot=/usr2/new/Source-ast162/build_env/buildroot/project_build_armeb/../toolchain/
-isysroot
/usr2/new/Source-ast162/build_env/buildroot/project_build_armeb/../toolchain 
conftest.c
conftest.c:30:19: error: utime.h: No such file or directory
configure:20348: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME "LZMA"
| #define PACKAGE_TARNAME "lzma"
| #define PACKAGE_VERSION "4.32.7"
| #define PACKAGE_STRING "LZMA 4.32.7"
| #define PACKAGE_BUGREPORT "lasse.collin at tukaani.org"
| #define PACKAGE "lzma"
| #define VERSION "4.32.7"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_STDDEF_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_UNISTD_H 1
| /* end confdefs.h.  */
| #include <utime.h>
configure:20362: result: no
configure:20395: checking for utime.h
configure:20404: result: no
configure:20415: error: Required header file(s) are missing.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
