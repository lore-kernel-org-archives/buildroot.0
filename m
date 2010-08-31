From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Aug 2010 13:52:28 +0000 (UTC)
Subject: [Buildroot] [Bug 2479] New: host-module-init-tools 3.11 fails to
	build
Message-ID: <bug-2479-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2479

           Summary: host-module-init-tools 3.11 fails to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nnazarenko at radiofid.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


>>> host-module-init-tools 3.11 Building
PATH=/home/savant/devel/irz/buildroot/output/host/bin:/home/savant/devel/irz/buildroot/output/host/usr/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/lib/perl5/core_perl/bin:/opt/qt/bin
LD_LIBRARY_PATH="/home/savant/devel/irz/buildroot/output/host/usr/lib:"
PKG_CONFIG=""
PKG_CONFIG_LIBDIR="/home/savant/devel/irz/buildroot/output/host/usr/lib/pkgconfig"
PERLLIB="/home/savant/devel/irz/buildroot/output/host/usr/lib/perl" 
/usr/bin/make -j4  -C
/home/savant/devel/irz/buildroot/output/build/host-module-init-tools-3.11/
make[1]: Entering directory
`/home/savant/devel/irz/buildroot/output/build/host-module-init-tools-3.11'
Makefile:15: *** recipe commences before first target.  Stop.
make[1]: Leaving directory
`/home/savant/devel/irz/buildroot/output/build/host-module-init-tools-3.11'
make: ***
[/home/savant/devel/irz/buildroot/output/build/host-module-init-tools-3.11/.stamp_built]
Error 2

[savant at savant_devel buildroot]$ LC_ALL=C make -v
GNU Make 3.82

OS: Archlinux

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
