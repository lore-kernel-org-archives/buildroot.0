From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 Nov 2009 15:44:29 +0000 (UTC)
Subject: [Buildroot] [Bug 711] New: WebKit host dependencies problems
Message-ID: <bug-711-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=711

              Host: x86
            Target: x86
           Summary: WebKit host dependencies problems
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: llandwerlin at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

I'm working with RH5 distribution, I'm having problems to build WebKit.
Theses problems are related to the fact that the host system is missing some
packages, I identified 2 packages : flex and gperf.

Here is a patch to fix the problem.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
