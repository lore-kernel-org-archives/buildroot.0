From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 May 2021 18:15:47 +0000
Subject: [Buildroot] [Bug 13816] New: xstart failed since update the x11
 libraries
Message-ID: <bug-13816-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13816

            Bug ID: 13816
           Summary: xstart failed since update the x11 libraries
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: juergen.wack at gmx.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Builroot for raspberry pi4 32bit with x11 support generates an mistake.
"Package buildroot-20210520.tar.bz2"
An error occurs when xstart is called. The error returns the fbturbo_drv.so.
Comment from Xorg.0.log:
Failed to load /usr/lib/xorg/modules/drivers/fbturbo_drv.so:
/usr/lib/xorg/modules/drivers/fbturbo_drv.so: undefined symbol: fbdevHWSave

I think we need a update from the xf86-video-fbturbo library.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
