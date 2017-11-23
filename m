From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 23 Nov 2017 02:15:17 +0000
Subject: [Buildroot] [Bug 10521] U-Boot 2017.09 has a bug in fdt set command
In-Reply-To: <bug-10521-163@https.bugs.busybox.net/>
References: <bug-10521-163@https.bugs.busybox.net/>
Message-ID: <bug-10521-163-3LPayO7O4M@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10521

--- Comment #1 from Steve Rhodes <sjr_ee@yahoo.ca> ---
The bug affecting fdt set is still in uBoot 2017.11, so there is no reason to
consider changing the default in buildroot on that account. The bug is not
present in uBoot 2017.03.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
