From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Aug 2015 21:32:12 +0000 (UTC)
Subject: [Buildroot] [Bug 8271] Buildroot wit x86_64 architecture fails to
 boot on qemu with kernels >=3.10
In-Reply-To: <bug-8271-163@https.bugs.busybox.net/>
References: <bug-8271-163@https.bugs.busybox.net/>
Message-ID: <20150824213212.5CE3B80DF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8271

--- Comment #3 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2015-08-24 21:32:12 UTC ---
Can you provide us with the config files you used?
I tried to reproduce locally by using the qemu_x86_64_defconfig just adjusting
optimization to atom and everything worked fine, on qemu 2.2.0 / ubuntu 15.04
However i do lack an atom, it was runtime-tested on a core m which i'd bet has
all of the atom instructions plus a lot more.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
