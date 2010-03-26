From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Mar 2010 15:58:44 +0000 (UTC)
Subject: [Buildroot] [Bug 1429] New: [SECURITY] Update php to 5.2.13
Message-ID: <bug-1429-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1429

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: [SECURITY] Update php to 5.2.13
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


Created an attachment (id=1393)
 --> (https://bugs.busybox.net/attachment.cgi?id=1393)
[SECURITY] Bump php to 5.2.13

PHP 5.2.13 includes security fixes:

*  Fixed safe_mode validation inside tempnam() when the directory path does not
end with a /).
* Fixed a possible open_basedir/safe_mode bypass in session extension
identified by Grzegorz Stachowiak.
* Improved LCG entropy.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
