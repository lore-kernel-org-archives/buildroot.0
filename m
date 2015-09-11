From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Sep 2015 10:05:54 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] New: kexec fails due to missing
	/usr/sbin/shutdown
Message-ID: <bug-8331-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

           Summary: kexec fails due to missing /usr/sbin/shutdown
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Chaining a new kernel using kexec fails as /usr/sbin/shutdown is missing.

creating a link in the skeleton, or overlay file system from /usr/sbin/shutdown
to /sbin/shutdown fixes the problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
