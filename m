From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 5 May 2016 15:05:37 +0200
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest version
In-Reply-To: <1462447857-29400-2-git-send-email-gustavo@zacarias.com.ar>
References: <1462447857-29400-1-git-send-email-gustavo@zacarias.com.ar>
 <1462447857-29400-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160505130537.GX26720@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Gustavo Zacarias wrote,

> Results table:
> 
> Defconfig               Kernel          Qemu        Network Status
> ------------------------------------------------------------------
> aarch64_virt            4.5.3           2.5.0         YES     OK
> arm_versatile           4.5.3           2.5.0         YES     OK
> arm_vexpress            4.5.3           2.5.0         YES     OK
> m68k_mcf5208            4.5.3           2.5.0         NO      SO-SO (3)
> m68k_q800               4.5.3           q800-v2.4.0   NO (4)  OK
> microblazebe            4.5.3           2.5.0         YES     OK
> microblazeel            4.5.3           2.5.0         YES     OK
> mips64el_malta          4.5.3           2.5.0         YES     OK
> mips64_malta            4.5.3           2.5.0         YES     OK
> mipsel_malta            4.5.3           2.5.0         YES     OK
> mips_malta              4.5.3           2.5.0         YES     OK
> ppc_g3beige             4.5.3           2.5.0         YES     OK
> ppc_mpc8544ds           4.5.3           2.5.0         YES     OK
> ppc_virtex_ml507        4.5.3           2.5.0         NO      OK
> ppc64_pseries           4.5.3           2.5.0         YES     OK
> sh4                     4.5.3           2.5.0         YES     OK
> sh4eb                   4.5.3           2.5.0         NO (1)  OK
> sparc_ss10              4.5.3           2.5.0         YES     OK
> sparc64_sun4u           4.5.3           2.5.0         YES     OK
> sparc_sun4u             4.5.3           2.5.0         YES     OK
> x86                     4.5.3           2.5.0         YES     OK
> x86_64                  4.5.3           2.5.0         YES     OK
> xtensa_lx60             4.4.9           2.5.0         YES (2) OK
> xtensa_lx60_nommu       4.4.9           2.5.0         YES (2) OK
> 
> (1) - Probably an endian issue with 8139 emulation/driver
> (2) - xtensa ethernet broken in 4.5
> (3) - It boots, you can login, but apps exit/crash often

What kind of crashes do you see? Can you tell me the applications?

Thanks for the nice overview.

best regards
 Waldemar
