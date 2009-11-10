From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2009 17:24:13 +0000 (UTC)
Subject: [Buildroot] [Bug 705] New: Bump spawn-fcgi package to 1.6.3
Message-ID: <bug-705-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=705

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump spawn-fcgi package to 1.6.3
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://redmine.lighttpd.net/news/7
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=733)
 --> (https://bugs.busybox.net/attachment.cgi?id=733)
Bump spawn-fcgi package to 1.6.3

Some minor improvements and changes:

* Fix unix socket mode change to work without specifying user/group for socket
* Fix Invalid Argument in chmod if mode=-1 (fixes #2033)
* Fix unix socket mode change to work without specifying user/group for socket
* Add some ./run script examples for use with daemontools or runit
* Fix Invalid Argument in chmod if mode=-1 (fixes #2033)
* Add deprecated and /bin/sh info for -f option; wrap syntax output (fixes
#2044)
* Add run script examples in automake dist build


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
