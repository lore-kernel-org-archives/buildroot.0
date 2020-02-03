From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Feb 2020 09:35:35 +0000
Subject: [Buildroot] [Bug 12521] RISCV RV32IA selected, RV64GC output
In-Reply-To: <bug-12521-163@https.bugs.busybox.net/>
References: <bug-12521-163@https.bugs.busybox.net/>
Message-ID: <bug-12521-163-9hMv3WeLwS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12521

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your report. Instead of looking at the kernel code, could you
instead look at some user-space application or library ?

Indeed, the kernel build system very often overrides the toolchain
architecture/ABI flags, depending on the kernel configuration.

Also, could you share a Buildroot .config file that allows to reproduce the
issue ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
