From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Oct 2016 12:57:17 +0000
Subject: [Buildroot] [Bug 9256] [Config file] New device: Odroid-U2/U3
In-Reply-To: <bug-9256-163@https.bugs.busybox.net/>
References: <bug-9256-163@https.bugs.busybox.net/>
Message-ID: <bug-9256-163-nlzr7VCJEI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9256

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks a lot. Could you instead submit a patch to the Buildroot mailing list?
See https://buildroot.org/downloads/manual/manual.html#submitting-patches for
some guidelines.

Compared to your proposal, we would need:

 - Keep the default toolchain configuration (i.e don't select glibc, binutils
2.26, gcc 6 and C++ support)

 - Use a fixed version for the kernel and u-boot, so that the defconfig is
reproducible

 - Add a readme.txt in board/ to detail how to use the defconfig.

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
