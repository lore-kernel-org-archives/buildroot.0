From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 Nov 2016 20:29:58 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-g0Q92tAFk1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #16 from Peter Korsgaard <jacmet@uclibc.org> ---
Switching to pseudo brought a number of issues, so I have reverted that and
instead added a workaround to the ubifs package:

https://git.buildroot.org/buildroot/commit/?id=01354e1a0f4333ffee40a20260a5689e3846560c

-- 
You are receiving this mail because:
You are on the CC list for the bug.
