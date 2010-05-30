From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 May 2010 10:04:11 +0000 (UTC)
Subject: [Buildroot] [Bug 1855] New: XORG Keyboard driver fails to compile
Message-ID: <bug-1855-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1855

           Summary: XORG Keyboard driver fails to compile
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul at pauljones.id.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1789
  --> https://bugs.busybox.net/attachment.cgi?id=1789
Buildroot config

This is using latest GIT buildroot with no locale support.

checking for
/home/peejay/mini2440-dev/buildroot-x86/output/staging/usr/bin/i686-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=nocona -march=nocona -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/peejay/mini2440-dev/buildroot-x86/output/staging/usr/include
-I/home/peejay/mini2440-dev/buildroot-x86/output/staging/include
--sysroot=/home/peejay/mini2440-dev/buildroot-x86/output/staging/ -isysroot
/home/peejay/mini2440-dev/buildroot-x86/output/staging option to accept ISO
C89... (cached) none needed
checking dependency style of
/home/peejay/mini2440-dev/buildroot-x86/output/staging/usr/bin/i686-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=nocona -march=nocona -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/peejay/mini2440-dev/buildroot-x86/output/staging/usr/include
-I/home/peejay/mini2440-dev/buildroot-x86/output/staging/include
--sysroot=/home/peejay/mini2440-dev/buildroot-x86/output/staging/ -isysroot
/home/peejay/mini2440-dev/buildroot-x86/output/staging... (cached) gcc3
checking if RANDR is defined... no
checking if XINPUT is defined... no
checking if XKB is defined... no
checking pkg-config is at least version 0.9.0... yes
checking for XORG... configure: error: Package requirements (xorg-server >=
1.2.99.0 xproto ) were not met:

No package 'xorg-server' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables XORG_CFLAGS
and XORG_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
