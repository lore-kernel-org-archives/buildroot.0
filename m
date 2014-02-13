From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Feb 2014 11:26:36 +0000 (UTC)
Subject: [Buildroot] [Bug 6872] New: gpsd: disabled on microblaze
Message-ID: <bug-6872-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6872

           Summary: gpsd: disabled on microblaze
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rjbarnet at rockwellcollins.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The gpsd package is disabled due to an internal compiler error for the
microblaze architecture. The compiler issues should be fixed but for now it is
just disabled.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
