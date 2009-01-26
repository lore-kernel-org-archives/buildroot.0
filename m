From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jan 2009 18:36:50 +0000 (UTC)
Subject: [Buildroot] [Bug 73] New: Bump openssl package to the latest version
Message-ID: <bug-73-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=73

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump openssl package to the latest version
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


2009.02-rc2 uses openssl-0.9.8g which has some security issues.
This patch bumps the package to openssl-0.9.8j.
It also moves openssldir from /usr/lib/ssl to /etc/ssl otherwise the openssl
binary will look for it's configuration file in that odd directory.
Tested for an arm target, someone should test if this didn't break avr32 before
comitting (i can try in a couple of days with my atngw100).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
