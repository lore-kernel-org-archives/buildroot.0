From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Jun 2018 07:20:46 +0000
Subject: [Buildroot] [Bug 10861] Package batman_adv Makefile is missing
 include header directory
In-Reply-To: <bug-10861-163@https.bugs.busybox.net/>
References: <bug-10861-163@https.bugs.busybox.net/>
Message-ID: <bug-10861-163-NBY2Mjp0Dz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10861

--- Comment #2 from Miltiadis Koutsokeras <miltos.koutsokeras@iccs.gr> ---
I need to go back in my Git repo and find the exact defconfig of that period
and strip it down to the minimal reproducing case. It has changed since then.

Apart from that I'm quite confident that your minimal defconfig differs from
mine in these:

1) We do not use the upstream Linux kernel, we use this:
https://github.com/linux4sam/linux-at91.git, version 4.4 (tag linux4sam_5.5)
and 4.9 (tag linux4sam_5.7) were tested.

2) We use a Buildroot generated toolchain.

3) Custom Linux kernel configuration (got to find specific version from Git
repo).

Thank you for your time, I will come back with more info and a minimal
defconfig that reproduces the problem.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
