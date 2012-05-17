From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 May 2012 14:46:51 +0000 (UTC)
Subject: [Buildroot] [Bug 5228] New: build util-linux 2.20.1 failed -
	buildroot-2012.05
Message-ID: <bug-5228-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5228

           Summary: build util-linux 2.20.1 failed - buildroot-2012.05
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rdghx at 163.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


>>> util-linux 2.20.1 Building
PATH="/usr/work/buildroot/buildroot-2012.05-rc1/output/host/bin:/usr/work/buildroot/buildroot-2012.05-rc1/output/host/usr/bin:/usr/work/buildroot/buildroot-2012.05-rc1/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/FriendlyARM/toolschain/4.5.1/bin"
PERLLIB="/usr/work/buildroot/buildroot-2012.05-rc1/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/
make[1]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1'
Making all in include
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/include'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/include'
Making all in disk-utils
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/disk-utils'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/disk-utils'
Making all in fdisk
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/fdisk'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/fdisk'
Making all in getopt
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/getopt'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/getopt'
Making all in lib
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/lib'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/lib'
Making all in libuuid
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libuuid'
Making all in src
make[4]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libuuid/src'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libuuid/src'
Making all in man
make[4]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libuuid/man'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libuuid/man'
make[4]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libuuid'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libuuid'
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libuuid'
Making all in libblkid
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid'
Making all in src
make[4]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src'
Making all in superblocks
make[5]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src/superblocks'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src/superblocks'
Making all in topology
make[5]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src/topology'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src/topology'
Making all in partitions
make[5]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src/partitions'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src/partitions'
Making all in .
make[5]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src'
make[5]: Nothing to be done for `all-am'.
make[5]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src'
make[4]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/src'
Making all in samples
make[4]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/samples'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid/samples'
make[4]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid'
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/libblkid'
Making all in man/ru
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/man/ru'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/man/ru'
Making all in login-utils
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/login-utils'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/login-utils'
Making all in misc-utils
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/misc-utils'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/misc-utils'
Making all in po
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/po'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/po'
Making all in sys-utils
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/sys-utils'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/sys-utils'
Making all in term-utils
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/term-utils'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/term-utils'
Making all in text-utils
make[3]: Entering directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/text-utils'
  CCLD   pg
pg.o: In function `getstate':
pg.c:(.text+0x2b8): undefined reference to `cur_term'
pg.o: In function `pgfile':
pg.c:(.text+0x1f10): undefined reference to `cur_term'
pg.o: In function `main':
pg.c:(.text+0x3024): undefined reference to `cur_term'
collect2: ld returned 1 exit status
make[3]: *** [pg] Error 1
make[3]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/text-utils'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1'
make: ***
[/usr/work/buildroot/buildroot-2012.05-rc1/output/build/util-linux-2.20.1/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
