From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Jun 2010 18:46:00 +0000 (UTC)
Subject: [Buildroot] [Bug 1879] New: Bump iptables to 1.4.8
Message-ID: <bug-1879-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1879

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump iptables to 1.4.8
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1801
  --> https://bugs.busybox.net/attachment.cgi?id=1801
Bump iptables to 1.4.8

Bump iptables to 1.4.8, includes support for new features from kernel 2.6.34.
Also remove /usr/lib/libip6tc.* from target when IPv6 is disabled to save
space.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
