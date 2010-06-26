From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Jun 2010 21:13:21 +0200
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
In-Reply-To: <i052d8$8up$1@dough.gmane.org> (Grant Edwards's message of "Sat, 
	26 Jun 2010 14:21:29 +0000 (UTC)")
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org>
Message-ID: <87aaqh38vi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 >> comment "initramfs requires a Linux kernel to be built"
 >> depends on !BR2_LINUX_KERNEL

 Grant> Hey, wait a minute.

 Grant> I use this option and I don't use Buildroot to build my kernel.

 Grant> Can somebody explain why this functionality is being removed?

How about just using the tarball output instead?

-- 
Bye, Peter Korsgaard
