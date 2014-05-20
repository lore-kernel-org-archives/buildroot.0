From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 May 2014 12:09:36 +0000 (UTC)
Subject: [Buildroot] [Bug 7094] New: pciutils doesn't build on Blackfin
Message-ID: <bug-7094-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7094

           Summary: pciutils doesn't build on Blackfin
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


See
http://autobuild.buildroot.org/results/c78/c78e5cbf1b6f2ec25f34f752d2fd58a6a38b55b7/build-end.log.
It seems to be caused by the _ symbol prefix needed on Blackfin.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
