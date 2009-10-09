From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Oct 2009 13:34:20 +0000 (UTC)
Subject: [Buildroot] [Bug 653] New: [SECURITY] Update php package to version
	5.2.11
Message-ID: <bug-653-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=653

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: [SECURITY] Update php package to version 5.2.11
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


Created an attachment (id=691)
 --> (https://bugs.busybox.net/attachment.cgi?id=691)
Update php package to version 5.2.11

Security Enhancements and Fixes in PHP 5.2.11:

   * Fixed certificate validation inside php_openssl_apply_verification_policy.
(Ryan Sleevi, Ilia)
   * Fixed sanity check for the color index in imagecolortransparent().
(Pierre)
   * Added missing sanity checks around exif processing. (Ilia)
   * Fixed bug #44683 (popen crashes when an invalid mode is passed). (Pierre)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
