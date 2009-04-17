From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Apr 2009 19:41:33 +0000 (UTC)
Subject: [Buildroot] [Bug 289] New: New package iw
Message-ID: <bug-289-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=289

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: New package iw
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=247)
 --> (https://bugs.busybox.net/attachment.cgi?id=247)
New iw package

Introduce new iw package.
This package is a wireless configuration utility for the linux mac80211 kernel
stack.
This package depends on libnl (new package from bug #287).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
