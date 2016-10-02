From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 02 Oct 2016 01:05:30 +0000
Subject: [Buildroot] [Bug 9326] New: Odroid-C2 build results in non-bootable
	image
Message-ID: <bug-9326-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9326

            Bug ID: 9326
           Summary: Odroid-C2 build results in non-bootable image
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: gahabana at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Building default image for Odroid-C2":

make odroidc2_defconfig
make menuconfig
make

burn resulting 'sdcard.img' to SD-card and image can not be booted. Light on
the board/Odroid stays blue and does not start to blink (kernel heart-beat
never starts).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
