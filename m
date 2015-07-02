From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Jul 2015 08:04:32 +0000 (UTC)
Subject: [Buildroot] [Bug 8191] New: Request update support for the
	cubieboard series
Message-ID: <bug-8191-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8191

           Summary: Request update support for the cubieboard series
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fancp2007 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 6086
  --> https://bugs.busybox.net/attachment.cgi?id=6086
Patch for the latest cb1/2/3 support

The official Buildroot support for cubieboard1 and cubieboard2 is very
outdated.

The 'legacy' sunxi branch of U-Boot is unmaintained now, see
[http://linux-sunxi.org/U-Boot].

The current U-Boot release (v2015.04) fully supports major functions (except
NAND) on all the older Allwinner SoCs (A10/A10s/A13/A20/A23/A31/A31s).
see [http://linux-sunxi.org/Mainline_U-Boot]

Linux kernel for the sunxi series (linux-sunxi) also need bump to the latest
stage/sunxi-3.4 branch to match the latest U-Boot.

The third generation of the famous Cubieboard, named Cubietruck, had released
at October 2013, but lacking the official buildroot support yet.
see [http://linux-sunxi.org/Cubietech_Cubietruck]

Attached patch provide the latest update support for cubieboard1 and
cubieboard2, also new defconfig for cubietruck.

You can also get this patch from the next url:
https://github.com/vancepym/buildroot/commit/61317cfc4cde93e1795634c0a85c6357e9948fe7.patch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
