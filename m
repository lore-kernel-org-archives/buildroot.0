From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  8 Sep 2010 09:26:59 +0000 (UTC)
Subject: [Buildroot] [Bug 2533] New: xserver_xorg-server: Enable glx,
	if mesa3d is built
Message-ID: <bug-2533-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2533

           Summary: xserver_xorg-server: Enable glx, if mesa3d is built
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2443
  --> https://bugs.busybox.net/attachment.cgi?id=2443
Patch

My hardware platform has OpenGL support and therefore needs mesa3d and the
glx-extension within X.

The attached patch makes the glx-extension automatically setable if mesa3d is
built.

Frederik Pasch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
