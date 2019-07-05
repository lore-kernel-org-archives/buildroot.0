From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Jul 2019 21:35:59 +0000
Subject: [Buildroot] [Bug 11966] Valgrind segfaults on startup on armhf
In-Reply-To: <bug-11966-163@https.bugs.busybox.net/>
References: <bug-11966-163@https.bugs.busybox.net/>
Message-ID: <bug-11966-163-z9aWhY4t3d@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11966

--- Comment #4 from Peter Seiderer <ps.report@gmx.net> ---
Does an update to valgrind-3.15 (buildroot git) work?

Does the same failure happen in case you use an buildroot generated toolchain?

Does the failure happen when you use Nulgrind (BR2_PACKAGE_VALGRIND_NULGRIND,
'--tool=none')?

Any valgrind output before/while segfault?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
