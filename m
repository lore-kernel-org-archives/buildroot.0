From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Mar 2018 22:48:08 +0100
Subject: [Buildroot] Defconfigs failing to build with gcc 6.x
Message-ID: <20180304224808.566fa00d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

You are in charge of a defconfig that causes some build failures.

The defconfigs listed below still don't build with gcc 6.x. It is more
than time to fix those defconfigs: gcc 6.x has been around for a
while. If those defconfigs are not fixed in the very near future, we
will have to remove them. Usually, the fix is to upgrade the U-Boot
and/or Linux kernel version.

 - ts5x00_defconfig

   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306956

   Vivien: could you add yourself as the maintainer for this board in
   the DEVELOPERS file ? Thanks!

 - firefly_rk3288{,_demo}_defconfig

   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306815
   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306814

   Ariel, Ezequiel: could you add yourself as the maintainers for this
   board in the DEVELOPERS file ? If you're no longer interested by
   this board, please let us know, and we'll drop the
   defconfig. Thanks!

 - ci40_defconfig

   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306806

   Abhimanyu: could you add yourself as the maintainer for this board
   in the DEVELOPERS file ? Thanks!

 - riotboard_defconfig

   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306938

   Nikolay: could you add yourself as the maintainer for this board in
   the DEVELOPERS file ? Thanks!

 - telit_evk_pro3_defconfig

   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306952

   Fabio (Porcedda): could you add yourself as the maintainer for this
   board in the DEVELOPERS file ? Thanks!

 - freescale_p1010rdb_pa_defconfig

   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306827

   Gustavo was taking care of this board. I'm adding Fabio (Estevam)
   from Freescale/NXP as a replacement, in case he is
   interested. Fabio (Estevam): let me know if you're interested. If
   not, we'll remove this defconfig.

Could you have a look at those issues ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
