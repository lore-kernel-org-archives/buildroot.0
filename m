From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Aug 2015 17:13:32 +0000 (UTC)
Subject: [Buildroot] [Bug 8296] New: nodejs 0.12.7 - npm crashes (seg core
	dump)
Message-ID: <bug-8296-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8296

           Summary: nodejs 0.12.7 - npm crashes (seg core dump)
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: pfriedland at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


tested with  (armv7 and x86_64)
using a clone from git repository today 8/17/2015

npm built with nodejs 0.12.7 core dumps
nodejs 0.12.7 starts ok

npm built with nodejs 0.10.40 works fine
nodejs 0.10.40 works fine

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
