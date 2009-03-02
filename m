From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Mar 2009 16:38:24 +0000 (UTC)
Subject: [Buildroot] [Bug 137] New: Bump php to version 5.2.9
Message-ID: <bug-137-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=137

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump php to version 5.2.9
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.php.net
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=79)
 --> (https://bugs.busybox.net/attachment.cgi?id=79)
Bump php from 5.2.8 to 5.2.9

PHP 5.2.9 is out with some security bugfixes:

*  Fixed security issue in imagerotate(), background colour isn't validated
correctly with a non truecolour image. Reported by Hamid Ebadi, APA Laboratory
(Fixes CVE-2008-5498).
* Fixed a crash on extract in zip when files or directories entry names contain
a relative path.
* Fixed explode() behavior with empty string to respect negative limit.
* Fixed a segfault when malformed string is passed to json_decode().

Also ditched $(DISABLE_NLS) from the mk file since it's not used.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
