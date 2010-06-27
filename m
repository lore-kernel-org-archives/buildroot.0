From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sun, 27 Jun 2010 13:42:34 +0000 (UTC)
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
	<i06hjh$fj$2@dough.gmane.org> <87hbkp3sfz.fsf@macbook.be.48ers.dk>
Message-ID: <i07kg9$jsp$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-06-27, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> >> How about just using the tarball output instead?
>
> Grant> When building an initramfs into a kernel, a tarball isn't one of the
> Grant> options that's accepted by the kernel build system.
>
> No, but you could extract the tarball (as root or using fakeroot) and
> point CONFIG_INITRAMFS_SOURCE to it.

An extracted tarball isn't one of the options either.
CONFIG_INITRAMFS_SOURCE can be pointed at either a cpio archive or the
source file list.

> But yes, providing a way to generate the cpio archive without building a
> kernel would be nicer.

It works fine the way it is.  What's the reason for disabling the
buildign of a cpio file source list?

-- 
Grant
