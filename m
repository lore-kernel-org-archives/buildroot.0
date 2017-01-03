From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 03 Jan 2017 20:11:07 +0000
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <bug-7892-163-bTEZShdaDh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #23 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Andrey,

I have a series that fixes systemd globally, especially sytemd-journald:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton

It is not complete nor correct for now (there was some comments by
Thomas), and I have a rewite in progress (so it is not finished):
   
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton-2

I hope I'll have something clean before the end of the month, so it can
go in for the next release.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
