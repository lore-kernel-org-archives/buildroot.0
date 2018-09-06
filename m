From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Sep 2018 19:05:21 +0000
Subject: [Buildroot] [Bug 11286] New: python-rpi-gpio only should depend on
 BR2_arm || BR2_aarch64
Message-ID: <bug-11286-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11286

            Bug ID: 11286
           Summary: python-rpi-gpio only should depend on BR2_arm ||
                    BR2_aarch64
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: yuntian.zh at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

https://git.buildroot.net/buildroot/tree/package/python-rpi-gpio/Config.in

When using raspberrypi3_64_defconfig, python-rpi-gpio is not available since
this defconfig only sets BR2_aarch64.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
