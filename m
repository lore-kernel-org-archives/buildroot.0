From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  3 Mar 2009 17:54:42 +0000 (UTC)
Subject: [Buildroot] [Bug 141] New: New php package option: build with
 external/interal sqlite3 support (for pdo_sqlite)
Message-ID: <bug-141-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=141

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: New php package option: build with external/interal
                    sqlite3 support (for pdo_sqlite)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=97)
 --> (https://bugs.busybox.net/attachment.cgi?id=97)
Allow php to use external sqlite3 for pdo_sqlite

This patch add a new option to allow PHP to be built against an external
sqlite3 library instead of the bundled one.
PHP 5.2.9 bundles sqlite-3.3.7, latest is 3.6.11 which adds functionality.
Also it might be troublesome to build/work with a db from CLI 3.6.11 and then
try to use that with PHP's bundled older version.
Tested against 3.6.11 from bug #139 though it should work with current svn
3.6.10 also.
BTW you can close bug #137 since it's done.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
