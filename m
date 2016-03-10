From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 10:20:25 +0000
Subject: [Buildroot] [Bug 8781] New: Unable to build uboot for imx28evk
Message-ID: <bug-8781-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8781

            Bug ID: 8781
           Summary: Unable to build uboot for imx28evk
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: cycaxo at gmx.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6386
  --> https://bugs.busybox.net/attachment.cgi?id=6386&action=edit
build log

I am trying to use buildroot-2016.02 for the freescale imx28evk. Unfortunately,
I am not able to build uboot for this board. I was able to successfully build
images for another board (i.e. beaglebone), so I can exclude that there is a
problem with my environment. 

My procedure was the following:
1. make freescale_imx28evk_defconfig
--> # configuration written to /buildroot-2016.02/.config
2. make 
--> make[2]:
/buildroot-2016.02/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc:
Command not found

I am using Ubuntu 14.04LTS 64bit with all the required packages for building on
a x64 system (at least it works for beaglebone).

Please find attached the log file.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
