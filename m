From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Aug 2009 13:30:40 +0000 (UTC)
Subject: [Buildroot] [Bug 573] New: BR2_DEFAULT_KERNEL_HEADERS is undefined
 with external toolchain
Message-ID: <bug-573-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=573

           Summary: BR2_DEFAULT_KERNEL_HEADERS is undefined with external
                    toolchain
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: n0-1 at nwl.cc
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

I'm trying to compile using an external binary toolchain (installed via
crossdev in Gentoo), but when BR2_TOOLCHAIN_EXTERNAL is active,
toolchain/kernel-headers/Config.in is not being included. The later leads to an
undefined BR2_DEFAULT_KERNEL_HEADERS, which again makes buildroot try to
download http://www.kernel.org/pub//linux/kernel/v2.6/linux-..tar.bz2.

Greetings, Phil


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
