From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Oct 2016 21:40:55 +0000
Subject: [Buildroot] [Bug 9366] New: no link rootfs.ext4 -> rootfs.ext2
Message-ID: <bug-9366-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9366

            Bug ID: 9366
           Summary: no link rootfs.ext4 -> rootfs.ext2
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mikhail_tchernychev at yahoo.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6766
  --> https://bugs.busybox.net/attachment.cgi?id=6766&action=edit
this is .config file which make this problem.

Hi, I have compiled raspberry pi 3 image with config file attached here. 
Unfortunately at the very last stage I had manually link 

ln -s rootfs.ext2 rootfs.ext4

in the images/ directory, then run make again and it assembled sdcard.img

When I used default rpi3 config it was not the case, so it is something in my 
custom config, which is default based.

It seems it is something minor.

Thank you
Mikhail

-- 
You are receiving this mail because:
You are on the CC list for the bug.
