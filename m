From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 22:15:38 +0100
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest linux
	versions
In-Reply-To: <1457988228-16989-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 14 Mar 2016 17:43:48 -0300")
References: <1457988228-16989-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bn6gdamd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > arm_versatile kernel defconfig updated to deal with multi-platform ARM
 > support and driver changes.

 > mips(el) 32-bits is back in working order for 4.5

 > Results table:

 > Defconfig               Kernel          Qemu    Network Status
 > --------------------------------------------------------------
 > aarch64_virt            4.5             2.3.0   YES     OK
 > arm_versatile           4.5             2.3.0   YES     OK
 > arm_vexpress            4.5             2.3.0   YES     OK
 > microblazebe            4.5             2.3.0   YES     OK
 > microblazeel            4.5             2.3.0   YES     OK
 > mips64el_malta          4.5             2.3.0   YES     OK
 > mips64_malta            4.5             2.3.0   YES     OK
 > mipsel_malta            4.5             2.3.0   YES     OK
 > mips_malta              4.5             2.3.0   YES     OK
 > ppc_g3beige             4.5             2.3.0   YES     OK
 > ppc_mpc8544ds           4.5             2.3.0   YES     OK
 > ppc_virtex_ml507        4.5             2.3.0   NO      OK
 > ppc64_pseries           4.5             2.3.0   YES     OK
 > sh4                     4.5             2.3.0   YES     OK
 > sh4eb                   4.5             2.3.0   NO (1)  OK
 > sparc_ss10              4.5             2.3.0   YES     OK
 > sparc64_sun4u           4.5             2.3.0   YES     OK
 > sparc_sun4u             4.5             2.3.0   YES     OK
 > x86                     4.5             2.3.0   YES     OK
 > x86_64                  4.5             2.3.0   YES     OK
 > xtensa_lx60             4.4.5           2.3.0   YES (2) OK

 > (1) - Probably an endian issue with 8139 emulation/driver
 > (2) - xtensa ethernet broken in 4.5 so stick to 4.4.x

Committed, thanks!

-- 
Bye, Peter Korsgaard
