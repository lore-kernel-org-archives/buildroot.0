From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Mar 2015 07:55:04 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150302075504.4C72380DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #10 from Peter Korsgaard <jacmet@uclibc.org> 2015-03-02 07:55:04 UTC ---
(In reply to comment #9)
> I used qemu_arm_versatile, enabled glibc and systemd (no code sourcery) and it
> worked fine here too.

Ok, interesting. What is the difference in Buildroot configuration between this
and your sama5d3-xplained config?

> I'm not sure what other info I can provide; The x86 machine has all of it's
> valid configuration info posted above. It's a IBM ThinkCentre 9210 with a
> nocona Pentium D with 2 GiB of ram.

Ok, I'll give qemu_x86_defconfig a try. What file system are you using?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
