From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Jul 2010 14:20:10 +0000 (UTC)
Subject: [Buildroot] [Bug 2269] New: setserial causes make error
Message-ID: <bug-2269-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2269

           Summary: setserial causes make error
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dstorey at barossafarm.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


choosing to enable setserial in the kernel will cause make to fail in the
installation of  the manual page as the target directory 
${TOP}/buildroot/buildroot-2010.05/output/target/usr/man does not exist.
Creating this directory solves the problem and the make can continue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
