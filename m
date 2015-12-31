From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Dec 2015 21:30:51 +0000
Subject: [Buildroot] [Bug 8576] New: Building embedded Linux for Atmel
 SAMA5D4_Xplained with HDMI work not propber. HDMI does not work
Message-ID: <bug-8576-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8576

            Bug ID: 8576
           Summary: Building embedded Linux for Atmel SAMA5D4_Xplained
                    with HDMI work not propber. HDMI does not work
           Product: buildroot
           Version: 2015.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: JensAmberg at mail.de
                CC: buildroot at uclibc.org

Building embedded Linux for Atmel SAMA5D4_Xplained with HDMI work not proper.
HDMI does not work.

When I build with buildroot the images for the Atme SASMA5D4_Xaplined Board.
inkl HDMI and fb0 HDMI will not work.

A already change the device tree to the correct dts file. However the fb0 is
present in the rootfs under /dev.

I make a double check. I use the linux4sam demo Image 4.7 and flash it tto my
EvalBoard. HDMI Works perfect. After this i build with buildroot. Board is
booting everthing works but not HDMI.

And no the strange thing. I have replaced file for file from the demo 
linux4sam demo Image 4.7. Firts when i take from  linux4sam demo Image 4.7 the
at91bootstrap.bin the HDMI works.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
