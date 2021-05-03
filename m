From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 May 2021 08:17:33 +0200
Subject: [Buildroot] [PATCH v2 3/6] package/riscv64-elf-toolchain: new
 package
In-Reply-To: <20210502212141.934384-11-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 2 May 2021 23:21:38 +0200")
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-11-thomas.petazzoni@bootlin.com>
Message-ID: <87tunk2veq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit adds a new package for a prebuilt bare-metal toolchain for
 > RISC-V 64-bit. Indeed, some bootloader/firmware for the BeagleV (and
 > potentially later for other platforms?) do not build with a
 > Linux-capable toolchain.

Out of interest, why is that? For the ARM32 case it was a question of
32bit / 64bit, but that does not seem to be the issue here?

Just crappy firmware or are there any deeper differences between a bare
metal and Linux toolchain on riscv64?

-- 
Bye, Peter Korsgaard
