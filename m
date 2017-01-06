From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Jan 2017 03:54:57 +0000
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <bug-7892-163-X00oSV55Z0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #25 from Andrey Smirnov <andrew.smirnov@gmail.com> ---
Created attachment 6841
  --> https://bugs.busybox.net/attachment.cgi?id=6841&action=edit
0001-skeleton-common.mk-Fix-password-related-variable-nam

Yann,

I did more testing and found a small bug in yem/systemd-skeleton, which I think
you might know of since I don't think it is present in yem/systemd-skeleton-2,
so had to apply this patch to fix it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
