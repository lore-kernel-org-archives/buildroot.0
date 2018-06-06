From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 12:35:54 +0000
Subject: [Buildroot] [Bug 10856] openblas on qemu_x86_64_defconfig fails
 with "sgemm_kernel.o: No such file or directory"
In-Reply-To: <bug-10856-163@https.bugs.busybox.net/>
References: <bug-10856-163@https.bugs.busybox.net/>
Message-ID: <bug-10856-163-IJ0khFDoah@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10856

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This issue was fixed by commit
https://git.buildroot.org/buildroot/commit/package/openblas?id=5e6fa93483caac317ab8844feb2ae9c07078a6c8.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
