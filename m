From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Jun 2009 16:25:41 +0000 (UTC)
Subject: [Buildroot] [Bug 419] New: Bump lighttpd package to 1.4.23
Message-ID: <bug-419-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=419

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump lighttpd package to 1.4.23
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


Created an attachment (id=421)
 --> (https://bugs.busybox.net/attachment.cgi?id=421)
Bump lighttpd package to 1.4.23

lighttpd 1.4.23 is out, there are many bugfixes from 1.4.20 currently in
buildroot:
*  Fix workaround for incorrect path info/scriptname if fastcgi prefix is
?/? (fixes #729)
* Finally removed spawn-fcgi
* Fix bug with FastCGI request id overflow under high load; just use always id
1 as we don?t use multiplexing. (thx jgray)
* Workaround broken operating systems: check for trailing ?/? in filenames
(fixes #1989)
Plus fixes from 1.4.22 and 1.4.21.

spawn-fcgi was included up to version 1.4.22 and is now a separate project,
there's a new package in bug #417 to include this functionality once again.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
