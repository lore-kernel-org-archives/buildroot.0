From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Nov 2014 08:43:13 +0000 (UTC)
Subject: [Buildroot] [Bug 7670] New: Fails to build mpc-1.0.2 on latest
	Cygwin
Message-ID: <bug-7670-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7670

           Summary: Fails to build mpc-1.0.2 on latest Cygwin
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: me21 at yandex.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The build process on Cygwin stops and says that C compiler cannot create
executables when it tries to build mpc-1.0.2 as a prerequisite for
cross-compiling gcc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
