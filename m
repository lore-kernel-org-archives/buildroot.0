From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 Apr 2011 03:06:21 +0000 (UTC)
Subject: [Buildroot] [Bug 3649] New: [PATCH] Add mapdir to existing
	pkg-config patch
Message-ID: <bug-3649-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3649

           Summary: [PATCH] Add mapdir to existing pkg-config patch
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mjhammel at graphics-muse.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


xfonts_font-adobe-100dpi was failing and the existing pkg-config patch didn't
seem to address it.  Adding "mapdir" to the exceptions in that patch addresses
the problem.  

Patch is attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
