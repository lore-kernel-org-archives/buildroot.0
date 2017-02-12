From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Feb 2017 12:13:45 +0000
Subject: [Buildroot] [Bug 9651] New: libxcb-1.12b built Error
Message-ID: <bug-9651-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9651

            Bug ID: 9651
           Summary: libxcb-1.12b built Error
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: kalman.staudinger at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

[7m>>> libxcb 1.12 Building[27m
PATH="/root/buildroot/output/host/bin:/root/buildroot/output/host/sbin:/root/buildroot/output/host/usr/bin:/root/buildroot/output/host/usr/sbin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/root/my-applications/bin:/usr/games"
 /usr/bin/make -j3  -C /root/buildroot/output/build/libxcb-1.12/
make[1]: Entering directory `/root/buildroot/output/build/libxcb-1.12'
Making all in src
make[2]: Entering directory `/root/buildroot/output/build/libxcb-1.12/src'
  GEN      xproto.c
  GEN      bigreq.c
  GEN      xc_misc.c

Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.


Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.


Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.

make[2]: Leaving directory `/root/buildroot/output/build/libxcb-1.12/src'
make[1]: Leaving directory `/root/buildroot/output/build/libxcb-1.12'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
