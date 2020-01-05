From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 Jan 2020 20:34:46 +0000
Subject: [Buildroot] [Bug 12446] Buildroot fails to finish installing
 packages
In-Reply-To: <bug-12446-163@https.bugs.busybox.net/>
References: <bug-12446-163@https.bugs.busybox.net/>
Message-ID: <bug-12446-163-fKDNzy9Zwa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12446

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
> This bug occurs on the pc_x86_64_bios_defconfig

pc_x86_64_bios_defconfig does not have xapp_xkbcomp enabled, so
I can't reproduce your failure.

> I haven't changed much in my fork besides adding packages,
> updating startup-notification, changing some defaults like
> the init system and libc

That's already a lot of changes! :-/

Please, try to reproduce on the upstream Buildroot, and provide us
with a defconfig that exhibits the problem, or we won't be able to
reproduce and help.

If it does not fail on upstream buildroot, then it's a change in
your fork that causes the issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
