From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Jan 2019 14:16:52 +0000
Subject: [Buildroot] [Bug 11616] 2018.02.09 fails to build libzlib with full
 RELRO protection
In-Reply-To: <bug-11616-163@https.bugs.busybox.net/>
References: <bug-11616-163@https.bugs.busybox.net/>
Message-ID: <bug-11616-163-IDUXGUWZXH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11616

--- Comment #3 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Could you do a build with this stock config in Buildroot and verify the issue
is repeatable?

qemu_ppc64_e5500_defconfig


This doesn't isolate the issue to the specific architecture but should simplify
your defconfig so I can help further.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
