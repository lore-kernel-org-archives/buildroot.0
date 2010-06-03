From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 Jun 2010 18:48:55 +0000 (UTC)
Subject: [Buildroot] [Bug 1945] New: PHP: add sqlite3 dependency when using
	external lib
Message-ID: <bug-1945-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1945

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: PHP: add sqlite3 dependency when using external lib
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1891
  --> https://bugs.busybox.net/attachment.cgi?id=1891
PHP: add sqlite3 dependency when using external lib

PHP can use an internal or external sqlite3 for PDO.
When using the external option there's a missing dependency that can provoke a
build failure for php since sqlite3 wasn't built before.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
