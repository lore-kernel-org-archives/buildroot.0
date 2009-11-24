From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Nov 2009 15:41:19 +0000 (UTC)
Subject: [Buildroot] [Bug 739] New: New/updated hostapd package
Message-ID: <bug-739-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=739

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: New/updated hostapd package
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


Created an attachment (id=759)
 --> (https://bugs.busybox.net/attachment.cgi?id=759)
Add new hostapd package

This patch adds the hostapd package which basically replaces the old/deprecated
hostap package.
The package "rename" is to match it's new functionality (just a daemon now) and
upstream naming.

Testers are very much welcome, specially those with master mode capable
hardware.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
