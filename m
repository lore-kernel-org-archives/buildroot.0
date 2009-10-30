From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Oct 2009 11:42:25 +0000 (UTC)
Subject: [Buildroot] [Bug 687] Are AT91 patches supplied with
 Buildroot-2009.08 out of date?
In-Reply-To: <bug-687-163@https.bugs.busybox.net/>
References: <bug-687-163@https.bugs.busybox.net/>
Message-ID: <20091030114225.50CFA77768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=687





--- Comment #2 from Steve <steven.tupper@calrec.com>  2009-10-30 11:42:24 UTC ---
Many thanks Peter, changing to the latest uboot option in the config and
deselecting 'add patches' option allows the build to complete.

Sadly none of my outputs actually work properly:
 * All atmel demo apps - works fine
 * my uboot (nandflash) + the atmel demo apps - gives me the CRC error
 * my kernel + the atmel demo apps - gives me kernel panic
 * my rootfs + the atmel demo apps - can't login to the kernel

so you can see i still have my work cut out but i think this is all
configuration related and so my problem and i will contact atmel for help with
it and see if they have any patches.

So thanks again
Steve 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
