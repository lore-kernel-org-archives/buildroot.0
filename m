From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Nov 2012 15:43:39 +0000 (UTC)
Subject: [Buildroot] [Bug 5678] New: linux.mk: linux-menuconfig fails
Message-ID: <bug-5678-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5678

           Summary: linux.mk: linux-menuconfig fails
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: matzeton at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


make linux-menuconfig fails after make clean if using c cache

This was caused by the missing dep hostcc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
