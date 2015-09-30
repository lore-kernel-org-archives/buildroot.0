From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Sep 2015 08:31:04 +0000 (UTC)
Subject: [Buildroot] [Bug 8381] New: make manuconfig problem in opensuse 13.2
Message-ID: <bug-8381-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8381

           Summary: make manuconfig problem in opensuse 13.2
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ztutberidze at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


when I type make menuconfig I am getting error
 *** Unable to find the ncurses libraries or the
 *** required header files.
 *** 'make menuconfig' requires the ncurses libraries.
 *** 
 *** Install ncurses (ncurses-devel) and try again.
 *** 

even when ncurses with development packages are installed.

The solution is adding -ldl in file /usr/lib64/pkgconfig/ncursesw.pc section
Libs.

after that make menuconfig is working.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
