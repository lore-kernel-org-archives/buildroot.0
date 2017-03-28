From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Mar 2017 20:04:03 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-TuKygeS9Q1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
Can you try if http://patchwork.ozlabs.org/patch/725387/ fixes this? You'll
have to apply the preceding 3 patches as well, and there may be a few merge
issues.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
