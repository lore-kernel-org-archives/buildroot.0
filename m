From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jul 2010 23:07:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	avr32-toolchain-fix
In-Reply-To: <cover.1280264418.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 27 Jul 2010 23:02:20 +0200")
References: <cover.1280264418.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739v4d479.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> This is the fix for the AVR32 toolchain build problem, but it makes a
 Thomas> change that impacts all other architectures as well. Instead of using
 Thomas> an incorrect --prefix=/usr for binutils and gcc, we use the correct
 Thomas> --prefix=$(STAGING_DIR)/usr.

 Thomas> With this fix in place, I can build the AVR32 toolchain and an AVR32
 Thomas> system with Busybox and DirectFB. However, I couldn't test it as I
 Thomas> don't have ARV32 hardware and Qemu doesn't support AVR32.

 Thomas> I have also tested an ARM internal Buildroot toolchain + DirectFB, it
 Thomas> builds and runs in Qemu. I also tested an ARM external Buildroot
 Thomas> toolchain + DirectFB system, it builds and runs in Qemu as well.

Pulled and pushed, thanks!

-- 
Bye, Peter Korsgaard
