From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Jul 2012 12:49:07 +0000 (UTC)
Subject: [Buildroot] [Bug 5384] New: Can't build packages relying on gets on
	newer glibc
Message-ID: <bug-5384-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5384

           Summary: Can't build packages relying on gets on newer glibc
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: net147 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


On newer versions of glibc, gets is no longer included so host packages relying
on it will not compile properly.

Patches:
https://raw.github.com/OpenELEC/OpenELEC.tv/f7f4d70fd78621137745a2c5e08b10685dfc84b7/packages/toolchain/devel/autotools/m4/patches/m4-1.4.16-fgets.patch
https://raw.github.com/OpenELEC/OpenELEC.tv/3b2e87a6955627c122588bc4963b7aae5150c095/packages/toolchain/archivers/cpio/patches/cpio-2.11-fgets.patch
https://raw.github.com/OpenELEC/OpenELEC.tv/e2c5feecdb2cfd6e343a6a152612f6fcf3aae8e9/packages/toolchain/devel/autotools/gettext/patches/gettext-0.18.1.1-gets.patch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
