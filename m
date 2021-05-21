From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2021 16:51:43 +0000
Subject: [Buildroot] [Bug 13816] xstart failed since update the x11 libraries
In-Reply-To: <bug-13816-163@https.bugs.busybox.net/>
References: <bug-13816-163@https.bugs.busybox.net/>
Message-ID: <bug-13816-163-TJ8mjNgqfl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13816

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to jwack from comment #0)

fbdevHWSave() is defined here [1], so this looks more like a module loading
order problem, see e.g. [2] for similar example...

If not please provide a minimal (but complete) defconfig against plain
buildroot version to reproduce the problem...

[1]
https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/fbdevhw/fbdevhw.c#L748
[2] http://lists.busybox.net/pipermail/buildroot/2021-May/310053.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
