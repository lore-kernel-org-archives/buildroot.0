From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 3 Jan 2008 22:50:03 -0200
Subject: [Buildroot] [PATCH] Create /boot/uImage symlink to the current
	kernel image
Message-ID: <d6cda7730801031650i439f5821h566eeef460615172@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   A while ago, the kernel naming have been changed to include $(DATE)
which makes it annoying to keep track. This patch adds an option to
the Advanced Kernel option to create an /boot/uImage symbolic link to
the built kernel. Please consider applying, this really improves
usability, if this naming scheme is to be kept.

Kind Regards,
    Thiago A. Correa
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-uImage-symlink.patch
Type: text/x-patch
Size: 1237 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080103/1edff06a/attachment.bin 
