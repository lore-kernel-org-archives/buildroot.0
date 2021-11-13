Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF537C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:52:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D8360C51
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33D8360C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5F2E60607;
	Sat, 13 Nov 2021 17:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-lc_ZSVM1aE; Sat, 13 Nov 2021 17:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 291D060612;
	Sat, 13 Nov 2021 17:52:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 517FB1BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D19E81761
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URLbUdZ8NJd0 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:52:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED5FC81754
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:52:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4C3361BF20E
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:52:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Nov 2021 17:52:32 -0000
Message-Id: <20211113175236.4D19E81761@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2021-11-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 38  | 12  |  0  | 50  |
  2021.08.x  | 35  |  7  |  0  | 42  |
    master   | 64  | 21  |  0  | 85  |

Classification of failures by reason for master
-----------------------------------------------

              host-erlang-22.2 | 6 
              tinydtls-0.9-rc1 | 5 
docker-proxy-55685ba49593e6... | 1 
            libodb-mysql-2.4.0 | 1 
                mongodb-4.2.11 | 1 
                   mpd-0.22.11 | 1 
               pipewire-0.3.39 | 1 
  pipewire-media-session-0.4.1 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/1f66ef78ee0c1d05254677e4b43e3f2a76faa087 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3a4fb885ef4416c212e0fc8058c66e5beb4a6903 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/cad66add5d943aa417e5fcda2ac1079c1f6e9109 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ed5a23bd1060aeb13981a0de2b86d7135f11d141 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0527f494208f6d9be2ecb2d0c4a1628aeea8159d |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5d6fc70412fab1e7da826c89177ea7c02e3b1c6e |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/554a4364a00bc91350e78c4a7344b3101e838209 |     
  powerpc    |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/9e3c09dd3d9bd55de14fc89a1d17ba9c008b195b |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/6be8efb96547f8ec6e9b776abae8c1b51501e9ed |     
    i686     |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/30d63fa7913601d02ff4ec1744536a05d97670a3 |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/cc444a73564ceb6e12b5b98e53ea0acf8032c7a5 |     
microblazeel |  pipewire-media-session-0.4.1  | NOK | http://autobuild.buildroot.net/results/bbf54d1bdb0f8f2d4f675ffdcbcbbf56562c3d7b | ORPH
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1f28f7975780a180edbb640d970b3937df609507 |     
    mips     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a3adb526565f28a084b34b611bdcf7bfab2b9da8 |     
  aarch64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ee560093120552ac4808bf57d12b9413c4ed2d8a |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4e7d4dac9a6ae594ed58285bde516388c7fde318 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e1af6c516f4e97e4c19efdd822c8489797ef3f1b |     
   s390x     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/9d67cdda3caafabee5bc4a1e1ae6544d489dda9b |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/207e5930878f0d6ce6aebd872de1235594d1dd92 |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d5d246bfdbc08a5f2325b2dc76653537ec4879a8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/36fbca6cc074eb2e03ce4ae58f21a8ea44672c8b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
            erlang-jiffy-1.0.6 | 1 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 
                rocksdb-6.13.3 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/fb33d72479d4c01ddc9d16e62497116645bd1124 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0cf0db39a96e5d3f7da31a8b752f6dffffb96648 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7c00bc349e1ea929f0cb85cf2f1d4b948eee6e8c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b2474bc1e6d1164f2f938ff85f64ffaa81bdb76e |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/5ed8d2d53d6242f02e2cc1aa9270caf3a21543d3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/51690a2d357293fadd758b36f712079aa90d608c | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c678db0609c8407b2b9f11daf8c220f2cb4e6899 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/de00088c72b5e4ce32ca8c8cf574c898e68a1d0a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/26b7f9b4d4ac9a5b8d9bc9b40083d63f4b57ca6b |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/1fa826e7b30202809e2281ea8566f2907755fb4b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b2ddd0256d94131be06e43971e06dfe587a65ad3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fb977f94ada82c037af82501a28c6182e8e1c880 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
  gobject-introspection-1.68.0 | 1 
                harfbuzz-2.8.2 | 1 
                 mesa3d-21.1.6 | 1 
                  mupdf-1.18.0 | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2acab6e5f2961ed90ae1b3791aced37d48d90f59 |     
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/601ca2bbca10ed46c2d3cb77a1fe4974bfc6621a | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/35eea518262b044d87a56c14f921595af49df8f9 |     
    sh4      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/66db9ef8158ba58705cf8abf2f357cbb048c0011 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/b1984203f35576c5e3a14c92a9d034a148bdf52e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c4ee491b8a5555c874cbf5a578334a7a68134368 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b108ba04aa1b9067a53312c17b0d5474cf40ceb0 |     


Gitlab CI results for 2021-11-12
================================

Detail of defconfig failures for 2021.08.2
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914670  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914731  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914733  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914735  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914756  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914784  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914785  |      
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914790  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914793  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914797  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914804  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914811  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914824  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914829  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914832  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914836  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914840  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914841  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914851  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914864  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914867  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914883  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914885  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914889  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914925  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914932  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914939  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914942  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914950  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914966  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768914996  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915066  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915179  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915204  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915219  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915224  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915226  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915231  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915296  |      


Detail of runtime-test failures for 2021.08.2
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915578  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915300  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915903  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915905  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915906  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915907  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915908  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915909  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915911  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915912  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915913  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915914  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915915  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915916  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915918  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915923  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915926  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915928  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915931  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915935  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915937  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915938  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915940  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915941  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915945  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915947  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915949  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915951  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915954  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915955  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915957  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915959  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915964  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915969  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915971  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915977  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915978  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915981  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915982  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915983  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915984  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915986  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915987  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915988  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915990  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915996  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916003  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916005  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916007  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916010  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916012  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916015  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916017  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916020  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916021  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916023  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916027  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916028  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916029  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916030  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916031  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916032  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916033  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916035  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916036  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916039  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916042  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916047  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916049  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916052  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916054  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916057  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916061  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916064  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916066  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916068  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916069  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916072  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916074  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916075  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916078  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916081  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916082  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916085  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916087  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916089  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916092  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916094  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916096  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916097  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916098  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916099  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916101  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916102  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916103  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916105  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916106  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916107  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916108  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916109  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916110  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916111  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916112  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916114  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916116  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916119  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916121  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916122  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916124  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916126  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916128  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916130  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916132  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916134  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916135  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916137  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916138  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916140  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916142  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916143  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916144  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916145  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916147  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916149  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916152  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916156  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916161  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916165  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916168  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916169  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916171  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916173  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916174  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916177  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916179  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916180  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916183  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916186  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916187  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916189  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768916191  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915890  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915899  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915312  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1773798087  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915585  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915751  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1773987559  | ORPH 
         TestPy2BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915565  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/1773780750  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915818  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915854  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915316  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915318  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1773990258  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915321  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915323  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915302  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915305  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915306  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915308  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1773973524  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1773993562  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
