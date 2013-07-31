From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 31 Jul 2013 22:45:28 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <20130731191415.545f7dff@skate>
References: <20130731191415.545f7dff@skate>
Message-ID: <CAAXf6LVc5T9=hCTwdiCz+HcfaU9wt8Ypk+9fiQm6pNX6wdxJJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jul 31, 2013 at 7:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Very quick initial run-through:


> http://patchwork.ozlabs.org/patch/188525 Question about 64Bit kernel and 32Bit applications

Can be closed, that problem was fixed differently.

> http://patchwork.ozlabs.org/patch/201313 Passing arguments to the linker when external toolchain is used.

Can also be closed for the same reason.

> http://patchwork.ozlabs.org/patch/207717 dtb: provide option to install dtb to boot directory

At first sight, this feature is already present but with a slightly
different implementation. Could you double-check?

> http://patchwork.ozlabs.org/patch/231856 Install DTB as part of images install command

Seems to have been acked by several people, can be applied as-is?

> http://patchwork.ozlabs.org/patch/241250 toolchain/gcc: Introduce BR2_ARCH_HAS_GCC_x_y_PLUS

Needs to be updated to latest buildroot, but has been acked by Arnout
before, after two other iterations.

> http://patchwork.ozlabs.org/patch/249635 UCLIBC_EXTRA_CFLAGS in uClibc overridden while using buildroot
> http://patchwork.ozlabs.org/patch/249855 UCLIBC_EXTRA_CFLAGS in uClibc overridden while using buildroot

Former is the old one, can be closed.

> http://patchwork.ozlabs.org/patch/256744 tar: avoid ccache chicken and egg problem when bootstrapping tar

I'm going to test this.

> http://patchwork.ozlabs.org/patch/260246 xzcat: treat as host prerequisite and build if needed

This is one of mine, feedback would be welcome. I tested it and it works :)

Best regards,
Thomas
