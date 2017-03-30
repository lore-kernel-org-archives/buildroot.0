From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Mar 2017 09:30:56 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-C6Gmk24zB5@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

--- Comment #7 from Thomas De Schampheleire <patrickdepinguin@gmail.com> ---
In the mentioned ct-ng issue I see they are 'working on' a buildroot patch.
However, my toolchain patches already make a fair amount of changes to the
logic, and it makes no sense that other toolchain patches would now be
developed unless based on top of my changes. Would it be possible to apply my
patches first, then see what are the remaining issues for some toolchains?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
