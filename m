From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Sep 2018 20:46:08 +0000
Subject: [Buildroot] [Bug 11366] [2018.08] SysV IPC not available for
 fakeroot on WSL
In-Reply-To: <bug-11366-163@https.bugs.busybox.net/>
References: <bug-11366-163@https.bugs.busybox.net/>
Message-ID: <bug-11366-163-goNY3ifrNJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11366

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report. I'd say this is something that should be improved in
fakeroot configure script itself: it should detect if SysV IPC is available or
not, and fallback to TCP if not.

Is this something you could have a look at ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
