From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 17:41:18 +0200
Subject: [Buildroot] precompiled kernel headers
In-Reply-To: <4ADF24C3.8010204@cs.ucsb.edu> (Roman Chertov's message of "Wed\,
	21 Oct 2009 08\:12\:03 -0700")
References: <4ADDE87E.1030601@cs.ucsb.edu> <4ADE49D7.10001@cs.ucsb.edu>
	<87iqe9q6y0.fsf@macbook.be.48ers.dk> <4ADF24C3.8010204@cs.ucsb.edu>
Message-ID: <871vkwrbz5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:

 >> 1: What kernel headers to use to build uclibc/toolchain
 >> 2: What kernel (if any) to build next to rootfs

 Roman> So if I want uclibc/toolchain to run a 2.6.24.7 kernel on the ARM
 Roman> device, I will have to manually edit the Config which is used by
 Roman> menuconfig to allow 2.6.24.7 to be used for precompiled headers?

No, not necessarily. The kernel headers for your toolchain doesn't have
to correspond to the kernel version you are using (E.G. you don't have
to install a new version of libc every time you update your kernel on
your PC either - Or the other way around.

-- 
Bye, Peter Korsgaard
