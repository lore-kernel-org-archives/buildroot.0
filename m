From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 02 Jun 2019 19:51:28 +0000
Subject: [Buildroot] [Bug 11926] New: Cross compiled Qt applications aren't
 working anymore
Message-ID: <bug-11926-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

            Bug ID: 11926
           Summary: Cross compiled Qt applications aren't working anymore
           Product: buildroot
           Version: 2019.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ramtheconqueror at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8071
  --> https://bugs.busybox.net/attachment.cgi?id=8071&action=edit
QmlTest Code

Used Buildroot 2019.05-rc3 
Linaro 7.4.1 toolchain

Compiled fine and then installed Qt Creator and setup qmake and cross compiler.
Created a blank QML application, compiled, deployed and ran the app only to see
shared libs related errors.

# /opt/QmlTest/bin/QmlTest
/opt/QmlTest/bin/QmlTest: error while loading shared libraries:
/home/ram/work/linux-tool/buildroot-output/2019.05-rc3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libGLESv2.so:
cannot open shared object file: No such file or directory

I'm using buildroot 2018.05 which works fine for the same application.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
