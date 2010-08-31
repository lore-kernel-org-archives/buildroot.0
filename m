From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Aug 2010 16:04:55 +0000 (UTC)
Subject: [Buildroot] [Bug 2485] New: Add numactl package
Message-ID: <bug-2485-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2485

           Summary: Add numactl package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The numactl package allows manipulation of which tasks run on which NUMA nodes.
This can be quite useful in embedded systems that use NUMA to handle on-chip
memories (e.g. SuperH).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
