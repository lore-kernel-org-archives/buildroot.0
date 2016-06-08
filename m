From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 22:43:04 +0200
Subject: [Buildroot] [PATCH v2] configs/qemu: bump to latest version
In-Reply-To: <1465301581-1991-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465301581-1991-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160608224304.74ed2b99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jun 2016 09:13:01 -0300, Gustavo Zacarias wrote:
> Also bump the pc samples since they're tied to the (base) qemu config.
> 
> Results table:
> 
> Defconfig               Kernel  Qemu            Network Status
> --------------------------------------------------------------
> aarch64_virt            4.5.6   2.5.0           YES     OK (4)
> arm_versatile           4.6.1   2.5.0           YES     OK
> arm_vexpress            4.6.1   2.5.0           YES     OK
> m68k_mcf5208            4.6.1   2.5.0           YES     OK
> m68k_q800               4.6.1   q800-v2.4.0     NO (3)  OK
> microblazebe            4.6.1   2.5.0           YES     OK
> microblazeel            4.6.1   2.5.0           YES     OK
> mips64el_malta          4.6.1   2.5.0           YES     OK
> mips64_malta            4.6.1   2.5.0           YES     OK
> mipsel_malta            4.6.1   2.5.0           YES     OK
> mips_malta              4.6.1   2.5.0           YES     OK
> ppc_g3beige             4.6.1   2.5.0           YES     OK
> ppc_mpc8544ds           4.6.1   2.5.0           YES     OK
> ppc_virtex_ml507        4.6.1   2.5.0           NO      OK
> ppc64_pseries           4.6.1   2.5.0           YES     OK
> sh4                     4.6.1   2.5.0           YES     OK
> sh4eb                   4.6.1   2.5.0           NO (1)  OK
> sparc_ss10              4.6.1   2.5.0           YES     OK
> sparc64_sun4u           4.6.1   2.5.0           YES     OK
> sparc_sun4u             4.6.1   2.5.0           YES     OK
> x86                     4.6.1   2.5.0           YES     OK
> x86_64                  4.6.1   2.5.0           YES     OK
> xtensa_lx60             4.6.1   2.6.0           YES     OK (2)
> xtensa_lx60_nommu       4.6.1   2.6.0           YES     OK (2)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
