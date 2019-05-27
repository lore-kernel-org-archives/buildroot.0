From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 May 2019 22:38:22 +0000
Subject: [Buildroot] [Bug 11911] systemd v240 memory leak in
 systemd-journald (buildroot 2019.02 LTS affected)
In-Reply-To: <bug-11911-163@https.bugs.busybox.net/>
References: <bug-11911-163@https.bugs.busybox.net/>
Message-ID: <bug-11911-163-0j39E7BdHZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11911

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
There are way too many changes between v240 and v241 to just bump the version
in the stable branch. So please backport the patch, thanks.

Actually, I think it's sufficient to take commit 2d5d2e0cc5 in addition to
eb1ec489ee.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
