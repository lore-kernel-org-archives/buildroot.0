From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Mar 2021 15:27:18 +0000
Subject: [Buildroot] [Bug 13646] New: Gen image version 14 error : no sub
 -section title/index for 'config'
Message-ID: <bug-13646-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13646

            Bug ID: 13646
           Summary: Gen image version 14 error : no sub -section
                    title/index for 'config'
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: neerajkrishnat at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The following error is for any board not just for Ci20 , i tried earlier
versions of genimage also but haven't had much of luck 


>>>   Executing post-image script support/scripts/genimage.sh
board/ci20/genimage.cfg:29: no sub-section title/index for 'config'
INFO: cmd: "mkdir -p "/home/nirajtummala/buildroot/output/build/genimage.tmp""
(stderr):
INFO: cmd: "rm -rf "/home/nirajtummala/buildroot/output/build/genimage.tmp"/*"
(stderr):
INFO: cmd: "mkdir -p "/home/nirajtummala/buildroot/output/build/genimage.tmp""
(stderr):
INFO: cmd: "cp -a "/tmp/tmp.tU65pvVkfR"
"/home/nirajtummala/buildroot/output/build/genimage.tmp/root"" (stderr):
INFO: cmd: "find '/home/nirajtummala/buildroot/output/build/genimage.tmp/root'
-depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
'/tmp/tmp.tU65pvVkfR/{}'
'/home/nirajtummala/buildroot/output/build/genimage.tmp/root/{}'" (stderr):
INFO: cmd: "mkdir -p "/home/nirajtummala/buildroot/output/images"" (stderr):
INFO: hdimage(sdcard.img): adding partition 'uboot-spl' from 'u-boot-spl.bin'
...
INFO: hdimage(sdcard.img): adding partition 'uboot' from 'u-boot.img' ...
INFO: hdimage(sdcard.img): adding partition 'uboot-env' from 'uboot-env.bin'
...
INFO: hdimage(sdcard.img): adding partition 'rootfs' (in MBR) from
'rootfs.ext4' ...
INFO: hdimage(sdcard.img): writing MBR

-- 
You are receiving this mail because:
You are on the CC list for the bug.
