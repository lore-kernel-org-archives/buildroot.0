From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 6 Dec 2014 12:59:46 +0100
Subject: [Buildroot] [PATCH 1/3 v2] package/mke2img: new package
In-Reply-To: <d34cfab4137e386aad07e144f2fa08c3bba5dd1f.1417730349.git.yann.morin.1998@free.fr>
References: <cover.1417730349.git.yann.morin.1998@free.fr>
 <d34cfab4137e386aad07e144f2fa08c3bba5dd1f.1417730349.git.yann.morin.1998@free.fr>
Message-ID: <CABbD_XAYmouXWr=CDX3RHOE=pRPXMPQN=LG4idC=0d6Z4D1wTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, list,


> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>

---
> Note: there is no way to use that tool for now. There is no menuconfig
> option in "Host utilities", and nothing depends on it yet. In the
> following patches, we'll convert fs/ext2/ext2.mk over to using that
> tool, so it will be automatically enabled as a dependency of the ext2
> filesystem type.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141206/5cb49738/attachment.html>
