From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Jun 2009 15:19:15 +0000 (UTC)
Subject: [Buildroot] [Bug 409] New: Bump php package to 5.2.10
Message-ID: <bug-409-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=409

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump php package to 5.2.10
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


Created an attachment (id=413)
 --> (https://bugs.busybox.net/attachment.cgi?id=413)
Bump php package to 5.2.10

php-5.2.10 is out, mostly misc bugfixes, one small security fix:

Security Enhancements and Fixes in PHP 5.2.10:

    * Fixed bug #48378 (exif_read_data() segfaults on certain corrupted .jpeg
files). (Pierre)

Key enhancements in PHP 5.2.10 include:

    * Added "ignore_errors" option to http fopen wrapper. (David Zulke, Sara)
    * Fixed memory corruptions while reading properties of zip files. (Ilia)
    * Fixed memory leak in ob_get_clean/ob_get_flush. (Christian)
    * Fixed segfault on invalid session.save_path. (Hannes)
    * Fixed leaks in imap when a mail_criteria is used. (Pierre)
    * Changed default value of array_unique()'s optional sorting type parameter
back to SORT_STRING to fix backwards compatibility breakage introduced in PHP
5.2.9. (Moriyoshi)
    * Fixed bug #47940 (memory leaks in imap_body). (Pierre, Jake Levitt)
    * Fixed bug #47903 ("@" operator does not work with string offsets).
(Felipe)
    * Fixed bug #47644 (Valid integers are truncated with json_decode()).
(Scott)
    * Fixed bug #47564 (unpacking unsigned long 32bit big endian returns wrong
result). (Ilia)
    * Fixed bug #47365 (ip2long() may allow some invalid values on certain
64bit systems).
    * Over 100 bug fixes.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
