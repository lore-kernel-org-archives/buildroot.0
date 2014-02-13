From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Feb 2014 11:33:41 +0000 (UTC)
Subject: [Buildroot] [Bug 6878] New: dmraid: disabled on ARC
Message-ID: <bug-6878-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6878

           Summary: dmraid: disabled on ARC
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


The dmraid package is disabled on the ARC architecture due to an internal
compiler issue. The compiler issue should be fixed but for now just disabling
it. 

The following commit disabled dmraid on ARC:
http://git.buildroot.net/buildroot/commit/?id=262a4c0bf7fb64d632ae6d40c22a62380c0af65f

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
