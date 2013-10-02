From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Oct 2013 13:20:56 +0000 (UTC)
Subject: [Buildroot] [Bug 6452] eglibc from Linaro 2013.07 not copied to
	target correctly
In-Reply-To: <bug-6452-163@https.bugs.busybox.net/>
References: <bug-6452-163@https.bugs.busybox.net/>
Message-ID: <20131002132056.C24D79B913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6452

--- Comment #1 from Jaap Crezee <jaap@jcz.nl> 2013-10-02 13:20:54 UTC ---
I am having the same issue with the current master of buildroot-git. When
building binaries with the linaro toolchain, generated binaries expect
libc.so.6 to be in /lib/arm-linux-gnueabihf/ but they are only copied to /lib .
A simple symlink also resolves the issue, but I argue with myself if this is
correct...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
