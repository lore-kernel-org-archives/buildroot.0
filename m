From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Aug 2015 11:31:26 +0000 (UTC)
Subject: [Buildroot] [Bug 8271] Buildroot wit x86_64 architecture fails to
 boot on qemu with kernels >=3.10
In-Reply-To: <bug-8271-163@https.bugs.busybox.net/>
References: <bug-8271-163@https.bugs.busybox.net/>
Message-ID: <20150810113126.B2B2E81DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8271

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-10 11:31:25 UTC ---
Could you try:

 1/ make clean
 2/ make qemu_x86_64_defconfig
 3/ make
 4/ Follow the instructions in board/qemu/x86_64/readme.txt

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
