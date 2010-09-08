From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 8 Sep 2010 11:05:58 +0400
Subject: [Buildroot] initramfs disabling
Message-ID: <AANLkTim3kn-otz-=x4DsPWEWgvDk=uqLE-X415W7BK6O@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I want to ask why disabling the option about initrd integration into
the kernel image leads to disabling of initrd support in the kernel.
The description of this option tells nothing about disabling initramfs
support. What I should do if I want separate hand-made initramfs
image? Unfortunately, it leads to editing internal makefiles of
buildroot. Can you introduce "FORCE" option in buildroot that forbid
buildroot to edit kernel and uclibc configuration?

Thanks.

Sergey Naumov.
