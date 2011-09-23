From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Sep 2011 07:59:27 +0000 (UTC)
Subject: [Buildroot] [Bug 4237] New:
	http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48308
Message-ID: <bug-4237-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4237

           Summary: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48308
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: marco_cantu_ranzani at libero.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


making OPENSSL with -fPIC -Os
doesn't work

Solution: remove -fPIC from makefile

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
