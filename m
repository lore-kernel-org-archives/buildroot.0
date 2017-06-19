From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Jun 2017 11:11:57 +0000
Subject: [Buildroot] [Bug 9966] New: util-linux-2.30/.stamp_built' failed
Message-ID: <bug-9966-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9966

            Bug ID: 9966
           Summary: util-linux-2.30/.stamp_built' failed
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tuzakli.refik at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

/home/osboxes/Desktop/boards/arm/karo/tx6u_8033/fs/buildroot/output/host/usr/lib/libncurses.so:
file not recognized: File format not recognized
collect2: error: ld returned 1 exit status
Makefile:5997: recipe for target 'dmesg' failed
make[3]: *** [dmesg] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
'/home/osboxes/Desktop/boards/arm/karo/tx6u_8033/fs/buildroot/output/build/util-linux-2.30'
Makefile:11718: recipe for target 'all-recursive' failed
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
'/home/osboxes/Desktop/boards/arm/karo/tx6u_8033/fs/buildroot/output/build/util-linux-2.30'
Makefile:4913: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/home/osboxes/Desktop/boards/arm/karo/tx6u_8033/fs/buildroot/output/build/util-linux-2.30'
package/pkg-generic.mk:227: recipe for target
'/home/osboxes/Desktop/boards/arm/karo/tx6u_8033/fs/buildroot/output/build/util-linux-2.30/.stamp_built'
failed
make: ***
[/home/osboxes/Desktop/boards/arm/karo/tx6u_8033/fs/buildroot/output/build/util-linux-2.30/.stamp_built]
Error 2


armv7 a9

-- 
You are receiving this mail because:
You are on the CC list for the bug.
