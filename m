From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2015 13:04:39 +0000 (UTC)
Subject: [Buildroot] [Bug 8281] New: pyrexc fails to run when path is too
	long
Message-ID: <bug-8281-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8281

           Summary: pyrexc fails to run when path is too long
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: kevin.alden2 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


If your build environment starts with a path longer than 100 characters, pyrexc
will fail to run due to a shebang longer than 128 characters

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
