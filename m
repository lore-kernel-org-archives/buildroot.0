From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Dec 2015 21:49:49 +0000 (UTC)
Subject: [Buildroot] [Bug 8296] nodejs 0.12.7 - npm crashes (seg core dump)
In-Reply-To: <bug-8296-163@https.bugs.busybox.net/>
References: <bug-8296-163@https.bugs.busybox.net/>
Message-ID: <20151201214949.4D94F80567@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8296

--- Comment #2 from Martin <martin@barkynet.com> 2015-12-01 21:49:49 UTC ---
Created attachment 6236
  --> https://bugs.busybox.net/attachment.cgi?id=6236
qemu_x86_64_npm_crash_defconfig

qemu_x86_64_npm_crash_defconfig is modified from qemu_x86_64_defconfig.  It has
the C++ compiler added, node.js and npm for the target.  Running npm on the
target will crash.

Set BR2_TOOLCHAIN_BUILDROOT_GLIBC=y to test using glibc where npm will work.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
