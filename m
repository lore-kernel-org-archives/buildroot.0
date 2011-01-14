From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Jan 2011 15:57:23 +0000 (UTC)
Subject: [Buildroot] [Bug 3085] New: Init scripts are not compatible with
 sysVinit (when busybox is not chosen)
Message-ID: <bug-3085-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3085

           Summary: Init scripts are not compatible with sysVinit (when
                    busybox is not chosen)
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bardon.pro at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When you don't use busybox but build a rootfs with standard System V init (with
the sysVinit package) /etc/inittab and all init scripts still remain for
Busybox (no runlevel supported, etc).

When busybox is not compiled and SysVinit chosen a compatible set of scripts
should be provided in /etc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
