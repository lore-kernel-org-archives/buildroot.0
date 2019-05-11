From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 May 2019 15:50:50 +0000
Subject: [Buildroot] [Bug 11866] iniramfs file system fails to boot using
 Grub on EFI x86_64
In-Reply-To: <bug-11866-163@https.bugs.busybox.net/>
References: <bug-11866-163@https.bugs.busybox.net/>
Message-ID: <bug-11866-163-a2AW5yS0aL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11866

--- Comment #2 from Pete Morici <pmorici@dev295.com> ---
I enabled CONFIG_EFI_STUB support in the kernel and was able to boot the same
kernel with embedded initramfs directly with just using EFI and omitting GRUB. 
That makes me think this is a GRUB issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
