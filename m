From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 May 2017 11:34:55 +0000
Subject: [Buildroot] [Bug 9876] New: aarch64 support with gcc 4.8 toolchain
Message-ID: <bug-9876-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9876

            Bug ID: 9876
           Summary: aarch64 support with gcc 4.8 toolchain
           Product: buildroot
           Version: 2017.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

I'm trying to compile for the aarch64 architecture using an external gcc 4.8
toolchain.
However I get the following error :
>>> toolchain-external-custom  Installing to staging directory
/usr/bin/install -D -m 0755
/home/jpcartal/Dev/Ssd/buildroot/buildroot-2017.02/N30_test/build/toolchain-external-custom/toolchain-wrapper
/home/jpcartal/Dev/Ssd/buildroot/buildroot-2017.02/N30_test/host/usr/bin/toolchain-wrapper
aarch64-linux-gcc: error: unrecognized command line option '-mabi=lp64'

My understanding is that the mabi=lp64 option is only available on gcc 4.9.x
and newer.

Is there any solution available to compile for aarch64 architecture with a gcc
4.8.x toolchain ?

Thanks for your help.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
