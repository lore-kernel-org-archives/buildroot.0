From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Jan 2010 13:08:08 +0000 (UTC)
Subject: [Buildroot] [Bug 1009] New: [SECURITY] Bump php to 5.2.12
Message-ID: <bug-1009-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1009

              Host: i686-linux
            Target: arm-softfloat-linux
           Summary: [SECURITY] Bump php to 5.2.12
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1009)
 --> (https://bugs.busybox.net/attachment.cgi?id=1009)
Bump php to 5.2.12

PHP 5.2.12 fixes several security issues:

* Fixed a safe_mode bypass in tempnam() identified by Grzegorz Stachowiak.
(CVE-2009-3557, Rasmus)

* Fixed a open_basedir bypass in posix_mkfifo() identified by Grzegorz
Stachowiak. (CVE-2009-3558, Rasmus)

* Added "max_file_uploads" INI directive, which can be set to limit the number
of file uploads per-request to 20 by default, to prevent possible DOS via
temporary file exhaustion, identified by Bogdan Calin. (CVE-2009-4017, Ilia)

* Added protection for $_SESSION from interrupt corruption and improved
"session.save_path" check, identified by Stefan Esser. (CVE-2009-4143, Stas)

* Fixed bug #49785 (insufficient input string validation of
htmlspecialchars()). (CVE-2009-4142, Moriyoshi, hello at iwamot dot com)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
