From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2020 15:47:42 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-OW5LBfUOkl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #6 from Yann E. MORIN <yann.morin.1998@free.fr> ---
I've just given a test-build in Ubuntu 20.04, on augfs over ext4 (in docker),
and the build succeeds without issue (as ;aready reported by Peter).

Can you provide more info on your running environment:
  - what distribution?
  - what filesystem?
  - are you running in WSL (windows Subsystem for Linux)? What version?

Note that running under WSL1 is not guaranteed to work. WSL2 is also very
very seldom tested.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
