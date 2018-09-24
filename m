From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Sep 2018 01:59:38 +0000
Subject: [Buildroot] [Bug 11366] [2018.08] SysV IPC not available for
 fakeroot on WSL
In-Reply-To: <bug-11366-163@https.bugs.busybox.net/>
References: <bug-11366-163@https.bugs.busybox.net/>
Message-ID: <bug-11366-163-gUKu51SIjs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11366

--- Comment #4 from J.F. <jfdoyon@gmail.com> ---
Wait, I lied you can write custom tests in autoconf to test the actual presence
of a function ... I can see whether I can get a handle on that ... although a
user option still seems much simpler :)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
