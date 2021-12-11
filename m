Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E279C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 08:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F3E861C9A;
	Sat, 11 Dec 2021 08:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DE8zUxOvXEfc; Sat, 11 Dec 2021 08:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53AF61CC2;
	Sat, 11 Dec 2021 08:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1E7B1BF471
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E01A74234B
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikiACeQo4SkY for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 08:05:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81EBC4018B
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 08:05:45 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AACAD1BF209
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 08:05:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Dec 2021 08:05:41 -0000
Message-Id: <20211211080547.E01A74234B@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-10
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

Autobuild statistics for 2021-12-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 36  |  7  |  0  | 43  |
  2021.08.x  | 42  |  4  |  0  | 46  |
  2021.11.x  | 18  |  1  |  0  | 19  |
    master   | 85  | 17  |  0  | 102 |

Classification of failures by reason for master
-----------------------------------------------

                     frr-7.5.1 | 5 
              host-erlang-22.2 | 3 
                log4cxx-0.12.0 | 3 
                 wavemon-0.9.4 | 3 
                   gstd-0.13.0 | 1 
                librsvg-2.50.7 | 1 
               libyang-2.0.112 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/22b956c1faab5fb7ce47edd9564d7dfd6029cc59 |     
powerpc64le  |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/7468bf36a826eab768dae55d6fceb5e1843bea76 |     
  riscv64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/eb570fb100db8b2569411891882f3cfad4b4d9fe |     
   x86_64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/949d4a18758beb61946b90c9f6dbe5c1f65a4ebf |     
   xtensa    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/913f0b8d1bc518141e336bd68e48a69f6ea2a129 |     
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/67718a1ac36adf20b285a150a0dc2774b9d5c946 | ORPH
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/932c13b8d27d9f61b8b0bb0d3e77a2eadb398200 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f8637854b6dd96cea441714d9bad8db146049cd7 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/055361cc4cdf4a51a1e48d6545c9ff5c83d32a21 |     
    arm      |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/2390583f56785855e5c1c1f462b236edf0275c92 |     
   sparc     |        libyang-2.0.112         | NOK | http://autobuild.buildroot.net/results/366e7180bd361ee7994f12db1a1b473702c39371 |     
  aarch64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/a526388d6468fef25951140ad533b4ff36de4ad6 |     
    or1k     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/155178c07e411462cefd2c3ed885130dbf950448 |     
  riscv32    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/d96fbf57e1a25c5ca07e16bf77b7fa6c5398806c |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2c56de30bacf1e26e0d0a35be5524b9a07cad671 |     
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2ca80bc114ad63b4531d88e34b4c4bca819bf973 |     
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/eca3363c6f3741693a728a568733d0c3845dbc61 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 2 
                   delve-1.5.0 | 1 
        glib-networking-2.66.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 libp11-0.4.11 | 1 
monkey-f54856ce250c4e257354... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/7ee831d006623ffcb87ec6dd9cb88a2b014fe3bf |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/8407cd665eac49d99a9f546affcca2e79faa282b | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/81ac6e19ed9cc311b8e3dc5e3803db6395bd0aca |     
  riscv32    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/ba5aaf5b96589339e5d1f862259593540e7bffa8 | ORPH
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f9700090ba82ba5a96dbf22a6461228fdf6e6074 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/54bf6e68989ad2b810e47b72fab2f99b34bdea5c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/878fd273ad7bd374a20cc94fc77c19ee1155aaa7 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                 mesa3d-21.1.6 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/1515e343029da5c51336f309cc33564f6298d9bd |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b76b08dc53592efb1280431f90bd0864eed91bc4 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/9672ef27379db9defd894157872be3b1237ad060 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b46a0357e3057f925f0a30bc2e748c82d1ea8f6b |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/71ac35481b70f7200d231f94c6650f115378cdf9 |     


Gitlab CI results for 2021-12-10
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935027  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935038  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935039  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935041  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935043  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935045  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935058  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935059  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935060  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935061  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935062  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935063  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935064  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935065  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935068  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935070  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935072  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935075  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935078  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935083  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935085  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935086  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935087  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935088  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935090  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935091  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935095  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935096  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935097  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935098  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935100  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935101  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935103  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935105  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935106  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935108  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935109  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935111  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935114  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935115  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935116  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935118  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935119  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935122  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935123  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935139  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935140  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935141  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935143  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935146  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935147  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935148  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935149  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935152  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935150  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935151  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935153  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935154  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935155  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935161  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935162  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935165  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935167  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935169  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935170  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935171  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935172  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935175  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935176  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935180  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935185  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935186  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935189  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935191  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935193  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935194  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935196  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935197  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935201  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935204  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935217  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935218  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935226  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935230  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935233  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935234  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935236  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935237  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935238  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935239  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935240  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935241  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935244  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935249  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935252  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935253  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935254  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935255  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935314  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935336  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935339  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935345  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935348  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935349  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935351  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935353  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935356  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935359  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935360  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935362  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935365  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935366  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935369  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935370  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935371  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935376  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935377  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935379  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935382  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935383  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935384  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935385  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935386  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935387  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935388  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
