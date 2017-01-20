From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Jan 2017 15:27:20 +0000
Subject: [Buildroot] [Bug 9606] xorg-server cannot build for ARM target
In-Reply-To: <bug-9606-163@https.bugs.busybox.net/>
References: <bug-9606-163@https.bugs.busybox.net/>
Message-ID: <bug-9606-163-k0r10W7y2D@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9606

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
I've sent a patch do disallow ARM+MUSL:

http://lists.busybox.net/pipermail/buildroot/2017-January/181737.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
