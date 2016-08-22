From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Aug 2016 17:16:09 +0000
Subject: [Buildroot] [Bug 9176] minnowboard : USB not mounted
In-Reply-To: <bug-9176-163@https.bugs.busybox.net/>
References: <bug-9176-163@https.bugs.busybox.net/>
Message-ID: <bug-9176-163-kayMbg3pf8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9176

--- Comment #8 from CB <christophebricout@yahoo.fr> ---
(In reply to Ezequiel Garcia from comment #7)
Dear Ezequiel,

You are right about the kernel version. On the buildroot version 2016.08, the
kernel version is 4.6 but still some parameters are missing. (I think).
See the comment added at the end of the last file I sent.

Anyway, here after the missing parameters:
CONFIG_BLK_DEV_SD=y
CONFIG_USB_STORAGE=y

Futhermore, in order to mount autmatically an external USB drive, I modified
the fstab file. Minnowboard worked fine also with distribution selecting
systemd capabilities.

Lastly, I found some strange behaviour using rootfs skeleton custom. I will
probably open a new ticket. Indeed, some confguration seems to no more be
considered when selecting the rootfs skeleton option....Before, I will check
with the last buildroot...


Anyway, regarding the current ticket (Bug 9176), for me it is solved.
Thanks for your support (Yann and You).
Best Regards
Christophe

Best Regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
