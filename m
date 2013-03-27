From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Mar 2013 14:22:31 +0000 (UTC)
Subject: [Buildroot] [Bug 6140] New: --enable-fileinfo not applied for php
	package
Message-ID: <bug-6140-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6140

           Summary: --enable-fileinfo not applied for php package
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: aleksandar.zivkovic at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Overview: php package options typing error

Steps to Reproduce: Build php package with option: --enable-fileinfo
(BR2_PACKAGE_PHP_EXT_FILEINFO)

Actual Results: ./configure script will not include --enable-fileinfo even if
BR2_PACKAGE_PHP_EXT_FILEINFO is selected.

Expected Results: ./configure script should include --enable-fileinfo when
BR2_PACKAGE_PHP_EXT_FILEINFO is selected in menuconfig

Build Date & Platform: BR 2013.02

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
