From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 6 Dec 2014 12:59:50 +0100
Subject: [Buildroot] [PATCH 2/3 v2] fs/ext2: use the new mke2img host
	package
In-Reply-To: <386e8bf861789f27e2001bb8a4206b6a115ef2db.1417730349.git.yann.morin.1998@free.fr>
References: <cover.1417730349.git.yann.morin.1998@free.fr>
 <386e8bf861789f27e2001bb8a4206b6a115ef2db.1417730349.git.yann.morin.1998@free.fr>
Message-ID: <CABbD_XDB3c38Sz6rR4ErM-_n+j7KZj2AJtof7rDrkjAtNFvKyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, list,

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>

Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Tested the whole series of 3 together, successfully built different
rootfs.ext images and booted them.
Tested with master branch, x86_64 arch in QEMU, internal toolchain GCC
4.9.2 w/ uclibc, Linux 3.17.4.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141206/25444418/attachment.html>
