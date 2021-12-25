Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2315C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 06:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8701D4168B;
	Sat, 25 Dec 2021 06:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IG0vkdukF5eJ; Sat, 25 Dec 2021 06:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45CCE41690;
	Sat, 25 Dec 2021 06:59:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7EB1BF239
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 06:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D50C60B34
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 06:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jRlFrzkFsBq for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 06:59:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93B3C607A3
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 06:59:31 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B833D100006
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 06:59:28 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Dec 2021 06:59:28 -0000
Message-Id: <20211225065933.8D50C60B34@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-24
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

Autobuild statistics for 2021-12-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 58  |  8  |  0  | 66  |
  2021.11.x  | 30  |  3  |  0  | 33  |
    master   | 104 | 29  |  0  | 133 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 6 
              host-erlang-22.2 | 4 
                       frr-8.1 | 2 
libdbi-88b8477d57153b9f736d... | 2 
                 mesa3d-21.3.1 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
               apcupsd-3.14.14 | 1 
                  assimp-5.1.3 | 1 
           host-harfbuzz-3.2.0 | 1 
               libtheora-1.1.1 | 1 
                 libv4l-1.22.1 | 1 
              memcached-1.6.12 | 1 
                nodejs-14.18.1 | 1 
package/lttng-libust/lttng-... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/69b5339c9719e920acd02fce86227ef2e06b8220 |     
    arm      |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/b2b99a29f72641949ee022ad612695ce3500acf4 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/ea03ff1abb43bd3a59758764fb445788e030d889 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/312b84fb75323de167d2dddbc5559dba902b7d75 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1106a301541560f4e3ca44a567aa1ac594111227 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/bf493efc3b3cc76484a48c0e515726c066cb1be4 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d26fe0a894ad35ee3422725f7b96bc0018661783 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a6553fc782e61d75659e7e8b5f6f59677c521f77 |     
   xtensa    |      host-harfbuzz-3.2.0       | NOK | http://autobuild.buildroot.net/results/ff312ae0824a562b2b80f6147bcf2dc6d82fe24b |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/cfd90a23ff9cb9b3fd571844b99158073e90819b |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/241de60a6dc58bcb059afb1a0fd6139ee972cf15 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/ed9a13400f5395063aefd71a396b7e2b61fd5ad2 | ORPH
  mips64el   |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/7bc662e19934557013c0cb2bd7864b3826708574 |     
   s390x     |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/7a46ac38d10b1859034017e0294961daa8f48dd2 | ORPH
    mips     |         mesa3d-21.3.1          | NOK | http://autobuild.buildroot.net/results/ec0cb41f075f84807b68ace2e7016ac1f16e36ad |     
    arm      |         mesa3d-21.3.1          | NOK | http://autobuild.buildroot.net/results/980f4ab84e9d4af6221e605fd38a8f09dfab66e6 |     
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/24b7da96817312f086db0abb743fa783e5244a79 |     
    i686     | package/lttng-libust/lttng-... | NOK | http://autobuild.buildroot.net/results/3680ed6dff191fdec0cb74489193e9cc34afec35 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/dc98f263aa976693e3645799ab057669ed445cba |     
    i586     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/997d0c3601b4a1fa08e76a80c24a80f10a80ccb0 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/bda7446acd814d463dfb6b83979941c1cae29b09 |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/4de41d65372850cf48da6c9e3304d37a88809e75 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/26c9d855f795209e8ddf2a2c41264cf036a6dff1 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/814da1b7df853cf97bf108df615399e93279cc5f |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/34fcbcf895a14ecf390c45992c9bf9255aa6a6ab |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1afb52c01a976a2508c86b9f37b025e94e513f80 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1d4a29f49675f6440f4732aa0cdacf9885495320 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/86ab4ede0304f94f370d015b8f613ba4d133ae68 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e2fe8b51ec29b2a5d1f540ae6c081e2d4ec9fe3e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               openldap-2.4.59 | 2 
               capnproto-0.8.0 | 1 
        glib-networking-2.66.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                rocksdb-6.13.3 | 1 
                suricata-6.0.4 | 1 
                   uacme-1.4.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6b5c89686e13332e291363e51ab4028f3497542f |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/b0b2112afb63fbc136d0497fbe1a2c52277d5a97 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f70b9ce04c79f1a8b2133a0efccbcd66039726c9 |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/7f26ccec8370927fef76f850da699c98e595f8bb |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/f413375a0cb0698a1c71590186293437ead6fd66 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/dc737fee7798f14c4169ed5cb8f1d75f9bf8ad28 |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/0057d859e93fed33501b43bcf6dc64e8b94515c6 |     
  riscv32    |          uacme-1.4.1           | NOK | http://autobuild.buildroot.net/results/c16733a6d7f088eab88cf932a7aff46c7c4081c8 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 2 
                  ndisc6-1.0.5 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f270127be5340a6dd94f9cf26c15b3b436ea3c2d |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b8f542e25f8dba90b67775e90f440bab85679de6 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/ef23ae123f7618e0d3fe5a338fb122815d4099dd | ORPH


Gitlab CI results for 2021-12-24
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915005973  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915005977  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915005979  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915005982  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915005986  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915005988  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915005996  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006001  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006006  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006010  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006013  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006017  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006021  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006026  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006027  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006031  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006034  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006035  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006037  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006038  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006040  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006042  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006043  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006044  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006047  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006048  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006052  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006054  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006056  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006058  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006062  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006063  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006064  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006068  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006071  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006072  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006076  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006080  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006081  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006083  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006088  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006090  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006092  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006094  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006136  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006138  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006140  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006143  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006144  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006146  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006147  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006149  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006156  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006151  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006154  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006157  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006158  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006161  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006170  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006172  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006177  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006181  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006184  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006189  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006192  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006203  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006206  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006217  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006222  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006226  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006233  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006236  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006238  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006241  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006243  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006246  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006252  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006257  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006276  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006286  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006291  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006296  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006298  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006300  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006301  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006302  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006303  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006304  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006305  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006307  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006311  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006313  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006314  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006315  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006317  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006385  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006397  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006404  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006409  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006411  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006419  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006422  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006424  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006427  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006435  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006438  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006440  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006443  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006446  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006447  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006457  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006481  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006484  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006489  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006500  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006501  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006505  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006506  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006509  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006511  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006514  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
