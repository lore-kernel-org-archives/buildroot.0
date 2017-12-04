From: daggs <daggs@gmx.com>
Date: Mon, 4 Dec 2017 07:35:27 +0100
Subject: [Buildroot] status of odroidc2's support?
Message-ID: <trinity-8c598823-c6de-4b88-91b4-43ba7c4de257-1512369327653@3c-app-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

now that gcc 4.9.x was dropped from buildroot, is it impossible to build the vendor's version of odroidc2. (uboot doesn't compile)
so the is no way to build a workable image for this board. I think there support for gcc5 was added but not for gcc6.
I've tried to add support for gcc6 but it won't boot the kernel.

unfortunately, I don't have any time to handle both vendor and mainline support. I wonder if it worthwhile to continue my support for it.
I know that soon to be mainline kernel 4.15 has hdmi support but I don't know for what extent (still trying to figure it out), one thing is sure, there will be no hw decoding support.
is there a way to restore support for the vendor's flavor? maybe and external toolchain?

Dagg.
