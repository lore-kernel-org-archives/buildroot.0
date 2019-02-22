From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 Feb 2019 08:35:35 +0000
Subject: [Buildroot] [Bug 11686] New: fbdev_drv.so: undefined symbol:
 shadowUpdatePackedWeak, xinit: giving up
Message-ID: <bug-11686-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11686

            Bug ID: 11686
           Summary: fbdev_drv.so: undefined symbol:
                    shadowUpdatePackedWeak, xinit: giving up
           Product: buildroot
           Version: 2018.11.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pete.luuri at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

fbdev_drv.so: undefined symbol: shadowUpdatePackedWeak, xinit: giving up
raspberrypi3_defconfig
Cant Startx
Bug reported https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=900613

-- 
You are receiving this mail because:
You are on the CC list for the bug.
