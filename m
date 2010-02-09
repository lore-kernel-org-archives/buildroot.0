From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  9 Feb 2010 14:32:15 +0000 (UTC)
Subject: [Buildroot] [Bug 1063] New: [SECURITY] Update lighttpd to 1.4.26
Message-ID: <bug-1063-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1063

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: [SECURITY] Update lighttpd to 1.4.26
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


Created an attachment (id=1081)
 --> (https://bugs.busybox.net/attachment.cgi?id=1081)
Bump lighttpd to 1.4.26

lighttpd 1.4.26 fixes:

* Request parser handling for splitted header data
* FD leak in mod_cgi
* Segfault with broken configs in mod_rewrite/mod_redirect
* An OOM/DoS vulnerability (CVE-2010-0295)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
