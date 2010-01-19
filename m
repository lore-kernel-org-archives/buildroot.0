From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Jan 2010 19:18:11 +0000 (UTC)
Subject: [Buildroot] [Bug 931] New: Bump kismet package to 2010-01-R1
Message-ID: <bug-931-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=931

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump kismet package to 2010-01-R1
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


Created an attachment (id=955)
 --> (https://bugs.busybox.net/attachment.cgi?id=955)
Bump kismet package to 2010-01-R1

From the 2010-01-R1 announcement: Includes fixes to segfaults, compiling
problems on Snow Leopard, GPS, and sundry other quirks, and enhancements to the
UI, support for the new GPSD JSON-only protocol, and a BT scanning plugin for
BT device discovery.

From the 2009-09-R1 announcement: Release includes fixes to crashes on resizing
terminals, tweaks to plugins, addition of the autowep plugin, improved plugin
handling, plugin support on OSX, initial support for Snow Leopard, fixes to PPI
corruption, XML fixes, and quite a lot of other bugfixes.

Mostly fixes segfaults under many scenarios (improved stability).
Also tweaked the make file to avoid an install error when there's no config to
install (for instance when just selecting kismet_client).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
