From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 23 Apr 2011 15:26:06 +0000 (UTC)
Subject: [Buildroot] [Bug 3643] New: popt source url is not responding
Message-ID: <bug-3643-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3643

           Summary: popt source url is not responding
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mjhammel at graphics-muse.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


rpm5.org appears to have gone away.  Launchpad has 1.15:
https://launchpad.net/popt/+milestone/1.15

and BLFS has 1.16:
http://www.linuxfromscratch.org/blfs/view/cvs/general/popt.html

The broken rpm5 URL affects the build from master if you use any package that
depends on it: oprofile, logrotate, rpm, librsync

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
