Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0C8C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 08:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BCB740146;
	Sat,  4 Dec 2021 08:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U69HgHkPA62W; Sat,  4 Dec 2021 08:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3AE440366;
	Sat,  4 Dec 2021 08:03:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C70121BF35F
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEEB783096
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FuHowpTRNGw for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 08:03:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80F9781D67
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 08:03:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6DC1120008
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 08:03:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 04 Dec 2021 08:03:17 -0000
Message-Id: <20211204080324.BEEB783096@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-03
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

Autobuild statistics for 2021-12-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 47  |  4  |  0  | 51  |
  2021.08.x  | 41  |  2  |  0  | 43  |
    master   | 101 | 17  |  0  | 118 |
     next    |  9  |  3  |  0  | 12  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 5 
           python-pybind-2.6.1 | 2 
               capnproto-0.8.0 | 1 
      gst1-plugins-base-1.18.5 | 1 
              host-erlang-22.2 | 1 
libdbi-88b8477d57153b9f736d... | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-21.1.8 | 1 
                suricata-6.0.4 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8a68ec3f24e3420a0e0ca49fadfa687165e23874 |     
  riscv32    |    gst1-plugins-base-1.18.5    | NOK | http://autobuild.buildroot.net/results/d1e2bdde97777ff61c185d375ba412a93e7ca467 | ORPH
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d08e98483efff9ff8827eca08547795ccf2be4ee |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/787fbdece3945956980e91334643c775a17f7294 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/25d782aee267b4703a724ebb9f5b99c58d84cc8b | ORPH
    mips     |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/49e3da4de548b10aa522d79bee36f09338eaa5c5 |     
  powerpc    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799 |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/cacab20610f3e617619593001101450d6bc25497 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9508c738b712dcc40dada703fac229ccb07d1d3f |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2b826c2624c6a88ec3ac56ef17271f2dc7eb44aa |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3c59971b18dbbf96f19b884a9f0c3ec918fdead4 |     
    i686     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/227730211aef5a9c8a57b5dceafbb28f06f050eb |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5f4ce82654d45873f98023044e17dac8efc56f2a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/075f0c156ed35c4f099f82ae0953290d72360a9a |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a188a65d9325f6919dfea5dae7da076822154d91 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/98c76c2477f9ae9497ee16c10266b6e1361c374a |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

azure-iot-sdk-c-LTS_07_2020... | 1 
            erlang-jiffy-1.0.6 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/72fa18a4e3cd877af65b09bb2278d92addc6903b |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/97dd8aa4c67b87e97cb7bbc510985018f27b89f2 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ff877c59d6ffe6b6b56076aeae7935e40dcb9ed0 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/32c96c42d880fe5be93d7a34bcb535370ef84496 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/16bc54daf99154fbbbc840199e3738318c1755c5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a38171daafc2994a5981fa8376cad5d114877120 |     


Classification of failures by reason for next
---------------------------------------------

              host-erlang-22.2 | 1 
              tinydtls-0.9-rc1 | 1 
                  uhd-3.15.0.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ca90bea14014816a45caf62d49efcfefb0b5e8fd |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/70f72e1fb1b65f483d373fe5e9b8e7791f497f0c |     
   x86_64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b079f836daa1fa340467a1a1b1161e83e9f95660 |     


Gitlab CI results for 2021-12-03
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014366  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014368  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014369  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014370  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014372  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014373  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014377  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014378  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014380  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014381  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014382  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014383  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014384  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014385  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014386  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014387  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014388  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014394  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014396  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014397  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014398  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014400  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014401  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014402  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014403  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014404  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014406  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014407  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014408  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014409  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014411  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014412  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014413  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014415  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014417  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014418  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014420  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014422  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014423  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014424  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014425  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014426  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014427  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014428  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014447  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014448  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014449  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014453  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014454  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014456  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014460  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014458  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014459  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014461  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014463  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014465  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014467  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014469  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014472  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014473  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014479  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014481  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014482  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014484  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014486  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014489  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014490  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014495  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014496  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014498  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014499  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014500  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014501  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014502  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014503  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014507  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014510  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014524  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014533  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014538  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014537  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014540  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014541  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014544  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014545  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014549  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014555  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014557  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014558  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014559  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014609  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014618  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014621  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014631  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014634  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014636  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014638  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014642  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014645  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014646  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014652  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014653  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014656  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014663  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014665  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014670  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014675  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014677  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014678  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014679  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014681  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014682  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1841014683  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
