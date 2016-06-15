From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Jun 2016 07:09:01 +0000
Subject: [Buildroot] [Bug 8991] grub2 fails to compile
In-Reply-To: <bug-8991-163@https.bugs.busybox.net/>
References: <bug-8991-163@https.bugs.busybox.net/>
Message-ID: <bug-8991-163-GSVNnvwEWF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8991

--- Comment #4 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
Created attachment 6476
  --> https://bugs.busybox.net/attachment.cgi?id=6476&action=edit
config derived from qemu_x86_64_defconfig

The following is what seems to cause the error

grub2:Platform (x86-64-efi)
(boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop terminal)
builtin modules

-- 
You are receiving this mail because:
You are on the CC list for the bug.
