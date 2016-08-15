From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Aug 2016 18:32:53 +0000
Subject: [Buildroot] [Bug 9176] minnowboard : USB not mounted
In-Reply-To: <bug-9176-163@https.bugs.busybox.net/>
References: <bug-9176-163@https.bugs.busybox.net/>
Message-ID: <bug-9176-163-RnKhNHMUdA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9176

--- Comment #1 from Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> ---
Hi,

I'm not sure why you are expecting your USB pendrive to be mounted
automatically.
The device manager is certainly not going to do this out of the box.

There are several ways to do it, all of them documented at length.

1. Using an mdev script
   https://wiki.gentoo.org/wiki/Mdev/Automount_USB

2. Using udisks
   https://wiki.archlinux.org/index.php/udisks

3. Using autofs
   https://wiki.archlinux.org/index.php/autofs

I'm only using (1), so I have no idea about the other two, but you can find
Buildroot packages for them, so I'd say it's possible.

This report doesn't seem valid, as you're .config is not selecting any of that.
Can you double check and comment some more or close this?

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
