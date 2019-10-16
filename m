From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Oct 2019 14:48:32 -0700
Subject: [Buildroot] [PATCH] opensbi: Bump from 0.4 to 0.5
In-Reply-To: <20191015092042.669fb465@windsurf.home>
References: <20191014232106.13179-1-alistair.francis@wdc.com>
 <20191015092042.669fb465@windsurf.home>
Message-ID: <CAKmqyKOtYc4cBE8W_F-AK0YHSTkzMahAgdnYUBJeNnnzBZMqpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 15, 2019 at 12:20 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 14 Oct 2019 16:21:06 -0700
> Alistair Francis <alistair.francis@wdc.com> wrote:
>
> > diff --git a/board/qemu/riscv32-virt/patches/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch b/board/qemu/riscv32-virt/patches/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch
> > new file mode 100644
> > index 0000000000..5f554a6c24
> > --- /dev/null
> > +++ b/board/qemu/riscv32-virt/patches/opensbi/0001-Makefile-Don-t-specify-mabi-or-march.patch
>
> Why is this patch in board/qemu/riscv32-virt/ ? It doesn't seem to be
> specific to that particular platform, so anybody building opensbi for
> another RV32 platform would also hit the issue. Shouldn't the patch (in
> this form or another) be in boot/opensbi/ ?

Good point, I'll move it there.

>
> Also minor nit: the commit title should be:
>
>         boot/opensbi: bump to 0.5

Fixed.

>
> You could also send a patch adding the hash for the license file in
> opensbi.hash.

Will do!

Alistair

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
