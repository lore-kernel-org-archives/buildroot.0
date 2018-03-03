From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Mar 2018 07:57:13 +0000
Subject: [Buildroot] [Bug 10831] qemu_x86_64_defconfig build fails on
 linux-headers with "Incorrect selection of kernel headers: expected 4.11.x,
 got 4.15.x"
In-Reply-To: <bug-10831-163@https.bugs.busybox.net/>
References: <bug-10831-163@https.bugs.busybox.net/>
Message-ID: <bug-10831-163-3X8orBYnny@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10831

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.net/buildroot/commit/?id=8a6e30efdeb9f31d51a92ed465373f4128f55e8a
- Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
