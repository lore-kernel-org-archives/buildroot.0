From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 06 Nov 2016 22:15:10 +0000
Subject: [Buildroot] [Bug 8516] mkcubiecard.sh uses outdated sfdisk switch -D
In-Reply-To: <bug-8516-163@https.bugs.busybox.net/>
References: <bug-8516-163@https.bugs.busybox.net/>
Message-ID: <bug-8516-163-tvvtlugTVX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8516

--- Comment #6 from Tudor <tudor@tudorholton.com> ---
I was just pointing out that the bug report and your previous comment are out
of sync.  I reported this bug against the cubieboard2, not the original
cubieboard as you assumed from the cruft left behind.

I have only ever owned a cubieboard2.  At the time I reported the bug, the
cubieboard2_defconfig also called mkcubieboard.sh.  As you noted, it doesn't
any more as it was converted to genimage before I was able to get to it.  

I was only ever reporting against the cubieboard2 build, anyway, so it doesn't
affect me.  However, I believe the build between the two boards is identical
(since the only difference is the number of cores), so I believe that the
genimage script for the cubieboard2 could be easily used by
cubieboard_defconfig also.  However, I don't own an original cubieboard to test
it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
