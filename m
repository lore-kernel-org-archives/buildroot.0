From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 6 Dec 2014 15:15:59 +0100
Subject: [Buildroot] [PATCH 3/3 v3] fs/ext2: add option to specify a
	filesystem label
In-Reply-To: <0244e2c2f1c3933e110df8478544efafe66c7e5c.1417868913.git.yann.morin.1998@free.fr>
References: <cover.1417868913.git.yann.morin.1998@free.fr>
 <0244e2c2f1c3933e110df8478544efafe66c7e5c.1417868913.git.yann.morin.1998@free.fr>
Message-ID: <CABbD_XDpzzHs_cHmnyOGjEURG3y+EcjkmvmiXPVeWdEEzrTtEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, list,

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: K?roly Kasza <kaszak@gmail.com>
>

Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Tested the whole series of 3 together (v3), successfully built different
rootfs.ext images and booted them.
Tested with master branch, x86_64 arch in QEMU, internal toolchain GCC
4.9.2 w/ uclibc, Linux 3.17.4.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141206/dd6f609b/attachment.html>
