From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 9 Dec 2014 14:20:06 +0100
Subject: [Buildroot] [PATCH] package/mke2img: always create sparse files
In-Reply-To: <CAHXCMM+Nhztq+d6YU9DDOvSUjYV7ot0f5pyEF2EkDhO-gbLqNA@mail.gmail.com>
References: <1418064064-30506-1-git-send-email-yann.morin.1998@free.fr>
 <CAHXCMM+Nhztq+d6YU9DDOvSUjYV7ot0f5pyEF2EkDhO-gbLqNA@mail.gmail.com>
Message-ID: <CABbD_XAm7d19sFkHF8Lbv9wWeW=KZN4f8mWA6dx1oNWmab6ZWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, Samuel, list,

On Mon, Dec 8, 2014 at 11:04 PM, Samuel Martin <s.martin49@gmail.com> wrote:

> On Mon, Dec 8, 2014 at 7:41 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
>

Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Tested with the same configs as the previous 3 (except w/ kernel 3.18),
successfully built different rootfs.ext images and booted them.
Tested with master branch, x86_64 arch in QEMU, internal toolchain GCC
4.9.2 w/ uclibc, Linux 3.18.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141209/8698db16/attachment.html>
