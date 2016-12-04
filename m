From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 04 Dec 2016 23:01:41 +0000
Subject: [Buildroot] [Bug 9461] odroidc2 - toolchain Linaro AArch64 2016.11
	compile error
In-Reply-To: <bug-9461-163@https.bugs.busybox.net/>
References: <bug-9461-163@https.bugs.busybox.net/>
Message-ID: <bug-9461-163-a9ZmtXDnoM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9461

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Using a gcc 6.x toolchain with a kernel version too old to support gcc 6.x is
not a Buildroot problem, but a configuration issue. One should either select a
toolchain that uses an older gcc version, or a kernel version that is recent
enough to build properly with gcc 6.x.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
