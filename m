Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2936C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 07:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A1FB40001;
	Sat, 20 Nov 2021 07:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KcayRgRNao_c; Sat, 20 Nov 2021 07:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DF934026B;
	Sat, 20 Nov 2021 07:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 235881BF2A4
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 07:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 204D760642
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 07:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHAd2pzJ_xyk for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 07:57:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 277FD60613
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 07:57:06 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4D918C000C
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 07:57:04 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Nov 2021 07:57:04 -0000
Message-Id: <20211120075709.204D760642@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-19
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

Autobuild statistics for 2021-11-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 72  |  9  |  0  | 81  |
  2021.08.x  | 55  |  7  |  0  | 62  |
    master   | 67  | 18  |  0  | 85  |
     next    | 10  |  6  |  0  | 16  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 6 
                    bird-2.0.8 | 2 
              host-erlang-22.2 | 2 
                log4cxx-0.12.0 | 1 
                  ndisc6-1.0.5 | 1 
                    qemu-6.1.0 | 1 
            qt5location-5.15.2 | 1 
                samba4-4.14.10 | 1 
                   strace-5.14 | 1 
                  uhd-3.15.0.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/b4499a4a353ea28d1e19817915cc7e83eab33875 |     
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/4642770a733d34a149902e7b7a5ea416c683ddb1 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f46391d7c0d4e4c6ec1ca5fb37ef202de9de1e29 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0ac397bd6443d707c6ed0b80e56379bee74a36bc |     
   x86_64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/1dce848561e4aec075b4429e41aa1fac33a1c963 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/84d46aa98a5b65ea4bb2944cc4c8c8e5e980321e | ORPH
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/7ca26bd024e2960d177c4d3b2810704932322160 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/b15ff370324ceaa2b2bfb2b45e2ecbc0d0cfb0e9 |     
    arc      |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/6c83c3b9918daca7b6bdc42e9e275f7878d574ae |     
    arm      |          strace-5.14           | NOK | http://autobuild.buildroot.net/results/d413258fab75c12da29bddb7e0f9e133a34e0160 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/eb8d30b62f9fa0f321e0bff241234a4c0a11946f |     
  sparc64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fb52d1a4322ce079c25d2537539cb973c9a90828 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/557274c17288977c7f633167e54880f0029d4616 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/dffffbc461c70742a44c3942a5bd1c2bcf3f8d45 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7042ef3d8a054f928cb159a59599d8c60df84b5d |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/668611d8d9d9e1bbb8fa5c55aa55fe5516d20840 |     
    m68k     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/550a23c788dd9ea0de20ae7f807d31a576c92adb |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ca88f44bb005240ac249f9ccd2ceabafa10f577c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 2 
                  gensio-2.2.3 | 1 
  gobject-introspection-1.64.1 | 1 
                  ndisc6-1.0.4 | 1 
             openjdk-17.0.1+12 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/8cb04c03e10132c1575cb015f5202a9da8489a3d |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/af202ff1557e00e49c902712c14a1253035cea59 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82edd4c3b66721e17accda9b0e9c9f8c5ba4226a |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e052d4039f21a77ba4d48fe610732dbc29342ed9 |     
   nios2     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ef740ffbf55859c1751b8c0e9350d96c856c47cb |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/3da7ee9b53daf7a434a1cb7f36dc856d31e50de6 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b11bc8d2541905b21332291a28ebb1e0c7c557e4 | ORPH
   x86_64    |       openjdk-17.0.1+12        | NOK | http://autobuild.buildroot.net/results/7a47a3bb38fcbd83a317c65feda68cdb8c290bc3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1c5122670611aa5ffc26b92597798c9ac459f36e |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               libtheora-1.1.1 | 2 
 glslsandbox-player-2019.08.23 | 1 
          gstreamer1-mm-1.10.0 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.21.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/042f6bdc28fbcb08acd9c7a8aac5c76bf2d34e95 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c347299ebeb31321388333ad664e075ef134a22b | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f7c80ea13d90db2bf14fa06934d73ab9e6637b4a | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/2eb622538bc1fe73343d457e2444ff68f9b74c33 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f0c33c9b8e607ad3e7e593b342a0ff3c22ade34f | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/c9498c2adc70cdd7c426a02f652dad3fb48d67dc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e2230b900d9bf3d7846dde98cc4b46745651eeea |     


Classification of failures by reason for next
---------------------------------------------

              gnuradio-3.8.2.0 | 1 
                harfbuzz-3.0.0 | 1 
                  rygel-0.38.3 | 1 
              tinydtls-0.9-rc1 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/2b3fefd8d0cc72b592907db4a6a6a9c9807379e5 |     
  riscv32    |         harfbuzz-3.0.0         | NOK | http://autobuild.buildroot.net/results/2340d53a3624bc7a28e741334ece77bcc4b5eb8c |     
    i686     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/24237385a2ff330ea27a2d099be5aa628f022a31 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5073e52a492d4bb83db21016eb760d7107a3d164 |     
   mipsel    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f1f9bb409a355ddfa9ce59bbe706ccc1411ce665 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/de3dce08cddc6a0960be29e88b54138433370e7f |     


Gitlab CI results for 2021-11-19
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045697  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045700  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045701  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045703  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045705  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045707  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045713  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045714  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045715  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045716  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045718  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045719  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045721  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045722  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045724  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045725  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045726  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045728  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045730  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045731  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045732  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045733  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045734  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045736  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045737  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045739  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045742  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045744  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045747  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045748  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045753  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045754  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045756  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045761  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045764  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045768  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045772  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045774  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045777  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045778  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045779  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045781  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045782  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045783  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045806  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045808  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045809  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045812  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045813  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045818  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045824  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045821  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045822  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045826  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045829  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045830  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045836  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045837  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045842  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045845  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045849  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045850  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045851  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045853  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045857  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045863  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045864  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045873  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045875  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045880  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045882  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045885  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045887  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045888  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045891  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045894  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045898  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045913  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045916  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045926  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045934  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045933  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045937  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045938  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045941  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045942  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045947  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045955  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045958  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045959  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045960  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046058  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046069  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046071  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046087  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046091  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046092  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046096  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046101  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046104  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046106  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046114  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046116  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046118  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046128  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046129  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046134  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046140  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046141  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046143  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046144  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046148  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046150  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795046151  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
