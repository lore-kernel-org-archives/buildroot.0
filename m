From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 15:18:29 +0100
Subject: [Buildroot] snps_aarch64_vdk_defconfig fails to build
Message-ID: <20161105151829.712dd01b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jo?o,

I know you have left Synopsys, so you probably can't help directly, but
maybe you can point to someone else in Synopsys who can help. The
snps_aarch64_vdk_defconfig you contributed about a year ago no longer
builds. It fails with some weird messages from the assembler, during
the Linux kernel build:

  CC      arch/arm64/kernel/cpuinfo.o
/tmp/ccx1uMC9.s: Assembler messages:
/tmp/ccx1uMC9.s:42: Error: .err encountered
/tmp/ccx1uMC9.s:43: Error: .err encountered
/tmp/ccx1uMC9.s:44: Error: .err encountered
/tmp/ccx1uMC9.s:103: Error: .err encountered
/tmp/ccx1uMC9.s:104: Error: .err encountered
/tmp/ccx1uMC9.s:105: Error: .err encountered
make[3]: *** [arch/arm64/kernel/psci.o] Error 1
make[3]: *** Waiting for unfinished jobs....

See
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/snps_aarch64_vdk_defconfig.log.FAIL
for the full build log.

Are you able to point us to someone who could help us fix this issue?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
