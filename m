From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Sep 2014 12:17:32 +0000 (UTC)
Subject: [Buildroot] [Bug 7448] New: Having export MACHINE="something"
 breaks glibc build on IMX6 target
Message-ID: <bug-7448-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7448

           Summary: Having export MACHINE="something" breaks glibc build
                    on IMX6 target
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: risto.avila at digia.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


If environment has MACHINE variable exported the eglibc fails to build.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
