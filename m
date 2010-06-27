From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sun, 27 Jun 2010 03:46:58 +0000 (UTC)
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
Message-ID: <i06hjh$fj$2@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-06-26, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >> comment "initramfs requires a Linux kernel to be built"
> >> depends on !BR2_LINUX_KERNEL
>
> Grant> Hey, wait a minute.
>
> Grant> I use this option and I don't use Buildroot to build my kernel.
>
> Grant> Can somebody explain why this functionality is being removed?
>
> How about just using the tarball output instead?

When building an initramfs into a kernel, a tarball isn't one of the
options that's accepted by the kernel build system.

-- 
Grant
