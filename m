From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Jul 2012 12:32:09 +0000 (UTC)
Subject: [Buildroot] [Bug 5354] New: host-lua doesn't build for EFL
	elementary
Message-ID: <bug-5354-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5354

           Summary: host-lua doesn't build for EFL elementary
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: belzo2005-dolphin at yahoo.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi all,

I used qemu_x86_defconfig on x86_64 ubuntu precise host, activating more EFL
packages with elementary default dependencies.

In building host-lua package, it complains about missing symbols.

Using GCC4.7, same status but not exactly the same reason.

I am bulding with uptodate GIT tree master on July 13rd.

Anyone can help me??
Regards,

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
