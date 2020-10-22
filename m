From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Oct 2020 07:03:46 +0000
Subject: [Buildroot] [Bug 13281] New: Raspberry Pi 2: overlays folder
 missing in genimage-raspberrypi2.cfg
Message-ID: <bug-13281-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13281

            Bug ID: 13281
           Summary: Raspberry Pi 2: overlays folder missing in
                    genimage-raspberrypi2.cfg
           Product: buildroot
           Version: 2020.08.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: info at hifiberry.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When using the Raspberry Pi 2 configuration, no overlays will be copied to the
FAT partition.

The line 

  "rpi-firmware/overlays",

seems to be missing in board/raspberrypi2/genimage-raspberrypi2.cfg while it
exists in the other Raspberry Pi configurations

-- 
You are receiving this mail because:
You are on the CC list for the bug.
