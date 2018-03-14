From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Mar 2018 08:31:59 +0000
Subject: [Buildroot] [Bug 10851] Patch to handle numpad Enter key properly
In-Reply-To: <bug-10851-163@https.bugs.busybox.net/>
References: <bug-10851-163@https.bugs.busybox.net/>
Message-ID: <bug-10851-163-c9YuW5jkBP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10851

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Thanks. 3 comments:

- Judging from the paths in this patch, it seems to come from openwrt. Who is
the author?

- kconfig comes from the Linux kernel. Has this been submitted upstream? I
don't seem to see any KEY_ENTER references in there?

- We prefer patches to be submitted to the mailing list with git-style commit
logs and signed-off-by. See
https://buildroot.org/downloads/manual/manual.html#submitting-patches for
details.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
