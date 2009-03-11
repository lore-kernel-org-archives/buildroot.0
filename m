From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Mar 2009 16:44:49 +0000 (UTC)
Subject: [Buildroot] [Bug 181] New: Update to Xorg 7.4
Message-ID: <bug-181-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=181

           Summary: Update to Xorg 7.4
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: lykowdk at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=145)
 --> (https://bugs.busybox.net/attachment.cgi?id=145)
Patch to update to xorg-7.4 release

# PciReworkProposal: PCI bus scanning/accessing code replaced with libpciaccess
# x11perf 1.5: Compositing tests added.
# xtrans 1.1: Support for abstract socket namespace under Linux.
# xf86-input-evdev 2.0.x: Many stability and completeness fixes, should work
out of the box with a large range of devices, plus middle-button emulation for
mice.
# xf86-video-ati 6.9.x: Support for r5xx/r6xx/r7xx (RadeonHD 1xxx/2xxx/3xxx)
devices added, including textured video for r5xx. Full RandR 1.2 support for
all chipsets.
# EXA: Numerous speedups (inc. font rendering), cleanups, and correctness
fixes.
# libX11 1.1.5: Numerous i18n additions and fixes
# xorg-server 1.5: Faster startup and shutdown, lots of code removal, EDID 1.4,
Secure RPC authentication, GLX and DRI passthrough support for Xephyr, smarter
autoconfiguration, pervasive and coherent XACE security framework, easier
building of GL code, numerous input-related bugfixes.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
