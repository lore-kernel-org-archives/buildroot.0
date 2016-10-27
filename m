From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Oct 2016 20:39:15 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-H7VEqBFJrF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #2 from Andrey Yurovsky <yurovsky@gmail.com> ---
Created attachment 6786
  --> https://bugs.busybox.net/attachment.cgi?id=6786&action=edit
approximate config

I've attached an approximate defconfig (sanitized to remove paths that have to
do with my product specifically, sorry for the inconvenience).  The SoC is an
Atmel AT91SAM9G20 so it's similar to the config you're testing with.  One
difference is there's both a CPIO/initramfs and a UBI image being generated but
hopefully that's not important.

I'm building with atmel_sama5d4_xplained_defconfig to see if I can reproduce
the problem, sorry for not doing that first.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
