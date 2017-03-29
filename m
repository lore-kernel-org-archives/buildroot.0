From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Mar 2017 16:45:51 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-SB870FegEF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

--- Comment #6 from sir.ferdek+buildroot at gmail.com ---
(In reply to Thomas Petazzoni from comment #5)
> So, are we looking at a Buildroot bug, or a Crosstool-NG bug?

Looks like this is known and ongoing development. I have found a recent
activity regarding this issue in Crostool-NG.
https://github.com/crosstool-ng/crosstool-ng/pull/639

And then, look at this commit message from 12 days ago (included in merged pull
request):
https://github.com/crosstool-ng/crosstool-ng/pull/639/commits/63b2a19de4b33f304b236850028b6c6f32ce51e2

I guess it might require both Buildroot and CT-NG to synchronize on this
issue... :D

-- 
You are receiving this mail because:
You are on the CC list for the bug.
