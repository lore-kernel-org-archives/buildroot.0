From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 May 2014 09:02:49 +0000 (UTC)
Subject: [Buildroot] [Bug 7088] New: elfutils on Blackfin doesn't build
Message-ID: <bug-7088-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7088

           Summary: elfutils on Blackfin doesn't build
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The elfutils package is currently disabled on Blackfin, due to an assembly
symbol prefix issue. See
http://autobuild.buildroot.org/results/922/92291286e86f9ea943ae7aa58cbd884c8db0c5d2/build-end.log.
It would be good to fix this and re-enable the elfutils package on Blackfin.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
