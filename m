From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:42:07 +0200
Subject: [Buildroot] [PATCH] configs/qemu: bump to latest version
In-Reply-To: <1469483222-9091-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469483222-9091-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160727214207.3477576e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 18:47:02 -0300, Gustavo Zacarias wrote:
> Also bump the pc samples since they're tied to the (base) qemu config.
> 
> Results table:
> 
> Defconfig               Kernel  Qemu            Network Status
> --------------------------------------------------------------
> aarch64_virt            4.7     2.6.0           YES     OK (3)
> arm_versatile           4.7     2.5.0           YES     OK
> arm_vexpress            4.7     2.5.0           YES     OK
> m68k_mcf5208            4.7     2.5.0           YES     OK
> m68k_q800               4.7     q800-v2.4.0     NO (2)  OK
> microblazebe            4.7     2.5.0           YES     OK
> microblazeel            4.7     2.5.0           YES     OK
> mips32r2el_malta        4.7     2.5.0           YES     OK
> mips32r2_malta          4.7     2.5.0           YES     OK
> mips32r6el_malta        4.7     2.6.0           YES     OK (3)
> mips32r6_malta          4.7     2.6.0           YES     OK (3)
> mips64el_malta          4.7     2.5.0           YES     OK
> mips64_malta            4.7     2.5.0           YES     OK
> mips64r6el_malta        4.7     2.6.0           YES     OK (3)
> mips64r6_malta          4.7     2.6.0           YES     OK (3)
> ppc_g3beige             4.7     2.5.0           YES     OK
> ppc_mpc8544ds           4.7     2.5.0           YES     OK
> ppc_virtex_ml507        4.7     2.5.0           NO      OK
> ppc64_pseries           4.7     2.5.0           YES     OK
> sh4                     4.7     2.5.0           YES     OK
> sh4eb                   4.7     2.5.0           NO (1)  OK
> sparc_ss10              4.7     2.5.0           YES     OK
> sparc64_sun4u           4.7     2.5.0           YES     OK
> sparc_sun4u             4.7     2.5.0           YES     OK
> x86                     4.7     2.5.0           YES     OK
> x86_64                  4.7     2.5.0           YES     OK
> xtensa_lx60             4.7     2.6.0           YES     OK
> xtensa_lx60_nommu       4.7     2.6.0           YES     OK

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
