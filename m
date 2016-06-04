From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 5 Jun 2016 00:14:24 +0200
Subject: [Buildroot] [PATCH] configs/qemu: bump to latest version
In-Reply-To: <1465072230-12316-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465072230-12316-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160604221423.GC6825@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Gustavo Zacarias wrote,

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
> xtensa_lx60             4.4.12  2.5.0           YES     OK (2)
> xtensa_lx60_nommu       4.4.12  2.5.0           YES     OK (2)
> 
> (1) - Probably an endian issue with 8139 emulation/driver
> (2) - xtensa ethernet broken in 4.5/4.6

I have no issues with ethernet in 4.6.1 when using ml605 instead
of lx60 (tested with Qemu 2.6.0). Should we switch?

best regards
 Waldemar
