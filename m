From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 13:13:33 +0000 (UTC)
Subject: [Buildroot] [Bug 509] New: Bump sqlite package to 3.6.16
Message-ID: <bug-509-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=509

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump sqlite package to 3.6.16
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.sqlite.org/releaselog/3_6_16.html
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=521)
 --> (https://bugs.busybox.net/attachment.cgi?id=521)
Bump sqlite package to 3.6.16

Bump sqlite package to 3.6.16:

 * Fix a bug (ticket #3929) that occasionally causes INSERT or UPDATE
operations to fail on an indexed table that has a self-modifying trigger.
 * Other minor bug fixes and performance optimizations.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
