From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Aug 2013 14:34:55 +0000 (UTC)
Subject: [Buildroot] [Bug 6440] New: typo in ffmpeg makefile
Message-ID: <bug-6440-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6440

           Summary: typo in ffmpeg makefile
           Product: buildroot
           Version: 2013.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bluemrp9 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


My buildroot version is actually 2013.08-rc1.  The check for arm1176jzf-s
should be arm1176jzf_s.  Attached is a patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
