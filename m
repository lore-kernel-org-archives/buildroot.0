From: Chris Brandt <Chris.Brandt@renesas.com>
Date: Wed, 14 Feb 2018 17:37:35 +0000
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <20180213212650.3fe2884b@windsurf.lan>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
 <20180213211453.519b65eb@windsurf.lan>
 <SG2PR06MB1165EA4292BE78ADF8D3A1678AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20180213212650.3fe2884b@windsurf.lan>
Message-ID: <SG2PR06MB1165BF807108E915E3F539B68AF50@SG2PR06MB1165.apcprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tuesday, February 13, 2018, Thomas Petazzoni wrote:
> > I don't have any big endian systems, so I can't test it either.
> 
> We have a number of Qemu defconfigs, including for big-endian systems
> such as PowerPC. It should be doable to perform a test :)

Since I've never used QEMU before, what config would you suggest I use 
in order to make the simplest system to test a cramfs rootfs?

All I want to do is just confirm it boots.

Should I just pick one with BR2_powerpc=y?

qemu_ppc64le_pseries_defconfig:BR2_powerpc_power8=y
qemu_ppc64_pseries_defconfig:BR2_powerpc64=y
qemu_ppc64_pseries_defconfig:BR2_powerpc_power7=y
qemu_ppc_g3beige_defconfig:BR2_powerpc=y
qemu_ppc_g3beige_defconfig:BR2_powerpc_750=y
qemu_ppc_mpc8544ds_defconfig:BR2_powerpc=y
qemu_ppc_mpc8544ds_defconfig:BR2_powerpc_8548=y
qemu_ppc_virtex_ml507_defconfig:BR2_powerpc=y
qemu_ppc_virtex_ml507_defconfig:BR2_powerpc_440=y


Thank you,
Chris
