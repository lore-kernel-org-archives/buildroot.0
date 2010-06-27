From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jun 2010 08:22:56 +0200
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
In-Reply-To: <i06hjh$fj$2@dough.gmane.org> (Grant Edwards's message of "Sun,
	27 Jun 2010 03:46:58 +0000 (UTC)")
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
	<i06hjh$fj$2@dough.gmane.org>
Message-ID: <87hbkp3sfz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 >> How about just using the tarball output instead?

 Grant> When building an initramfs into a kernel, a tarball isn't one of the
 Grant> options that's accepted by the kernel build system.

No, but you could extract the tarball (as root or using fakeroot) and
point CONFIG_INITRAMFS_SOURCE to it.

But yes, providing a way to generate the cpio archive without building a
kernel would be nicer.

-- 
Bye, Peter Korsgaard
