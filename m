Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFD1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 07:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 261EA83E1D;
	Sat, 22 Jan 2022 07:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpyNXj_ZY4LS; Sat, 22 Jan 2022 07:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A8183E1E;
	Sat, 22 Jan 2022 07:06:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5331BF2A7
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 07:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5191C607F2
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 07:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mj7D__AHFN8I for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 07:06:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4979460782
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 07:06:55 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2861140003
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 07:06:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jan 2022 07:06:51 -0000
Message-Id: <20220122070657.5191C607F2@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-21
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

Autobuild statistics for 2022-01-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 70  |  5  |  0  | 75  |
  2021.11.x  | 17  |  6  |  0  | 23  |
    master   | 94  | 29  |  0  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 7 
                       frr-8.1 | 4 
             bluez5_utils-5.63 | 2 
      qt5webkit-5.212.0-alpha4 | 2 
                cryptopp-8.6.0 | 1 
              cryptsetup-2.4.2 | 1 
                   guile-3.0.7 | 1 
                   gvfs-1.48.1 | 1 
                 hiawatha-11.1 | 1 
             ksmbd-tools-3.4.3 | 1 
                libglvnd-1.3.2 | 1 
                mongodb-4.2.11 | 1 
                nodejs-14.18.3 | 1 
               pulseview-0.4.2 | 1 
                rtorrent-0.9.8 | 1 
           tesseract-ocr-5.0.1 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/6217231b30e9f62574a7408359bb8b18ef0a4228 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/cbca95b985a594e897c9dacbe12341d3a0a34f06 |     
  powerpc    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/6b96ab6c391e304dc1f6c175e6ae4e68a8362d9b |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/4c5e5eaca926372cc71418583b56ea0d93d110cc |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/dbda895ef25cc48fee89ac49863480a6773778f9 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/5e524ed0b4768304caad7fa29249cf64751ec6d6 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0f43deb205ad3da2b37694aa777f3cbf184436a4 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0e3fd4b6121097e7ea648d57f9f57596a395bec8 |     
  aarch64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/69ade733bd49d6cfafc0f162c352e2d624bfa9b2 | ORPH
   mipsel    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/e22684977c48652c170da28b3b3ce5808eb63b47 | ORPH
    arm      |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/12a20b3f9e4f9f343b7a23f3fed530407827615e |     
 powerpc64   |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/05272cff4dee5b09d00b7f7f50c77bcd6f13f9fa |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/d27fcdd52ad149433e38539ef3bd00b501ae32c4 | ORPH
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/0e199ae9f1bc4d9d6a542afb4a01dce3f605cb5f |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/f2ab8baa03dd2dad4b9fbe3ed175f006a745f3dd |     
  riscv32    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/4158a3a5ec242eb1987352f75754d4fe63761a38 |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/53016bd78eedffb608efb8f4c069c217fb8859c2 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/0cda723b5fcf349270ad20875aec6d317d774f66 |     
    sh4      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/bd03b1790b50a5f3f8e7697c3ad9ba31dc16e5c3 | ORPH
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/5796cfad0dff3218bac43f3bfb1488b1f953b39d |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/66c839da496742b9a34598cf6d0a2ec83779ba2f |     
    i586     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9c4d38131a27255b7be320c3a6dc1009f0b54aa1 |     
microblazeel |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/408f07a95f55bb8c15c4df092de61ecd1c99bda7 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/303e1b4a2d6e8f9a5abe382d862b601494ae7eb0 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/446b5f21c8906ac75ef9e65670e28ac583eccebb |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/86a60928dc063946886f403211348e65bf8099e2 |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/0bac6491188b6681df2ca13eb230706e83cbb130 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6c789e62dd2b24a4f265aaddc34f30f6283a961b |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9e6966d48d75a987b69052d518dbcebb53e7ba6b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

              gnuradio-3.8.1.0 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/08143fac4c9a19096d6375500505bf1984423598 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2e14189d66bf643ecef5546fa9f84a62cb6083f4 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2e2175d95d63f4a606da6d38028eb390a8eb9d92 | ORPH
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/845168c5ee9c0e77a775f4e764c4205b368ca225 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9162bc2b5fa9408edf2bec3d2a4db48cf3644abb |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                   gstd-0.13.0 | 1 
              host-erlang-22.2 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                   libnss-3.73 | 1 
                 libqmi-1.30.2 | 1 
                nodejs-14.18.1 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/da0348d455ac3660491bbec9ff9b8a15d6186b0d | ORPH
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7f856109152d8c9ad224377317cd750b3870e584 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/adc3b7eb59b9a71ccb2ba79c724b693bbecbf5db |     
   x86_64    |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/c368e02bedecb8ccb0b5db8c27f61912b43f09a3 |     
    arm      |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/dbce587915079f8014ea48524682fd567f33214d |     
    arm      |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/c3715d2b8e3a938c6d5dd93d2497ea8adec0f70f |     


Gitlab CI results for 2022-01-21
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143358  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143361  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143362  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143363  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143366  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143368  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143373  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143375  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143377  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143379  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143381  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143383  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143384  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143386  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143388  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143390  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143391  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143395  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143396  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143397  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143398  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143399  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143401  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143402  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143404  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143405  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143407  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143409  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143410  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143411  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143415  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143416  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143417  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143420  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143427  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143428  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143431  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143433  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143435  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143436  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143437  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143439  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143440  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143460  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143462  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143463  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143464  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143465  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143467  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143469  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143470  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143474  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143472  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143473  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143476  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143477  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143478  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143487  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143500  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143501  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143506  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143507  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143510  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143511  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143512  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143513  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143515  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143517  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143518  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143519  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143522  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143527  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143546  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143556  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143562  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143566  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143567  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143572  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143574  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143577  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143578  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143580  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143584  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143590  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143591  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143592  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143631  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143660  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143668  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143669  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143671  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143672  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143674  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143675  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143677  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143679  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143680  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143682  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143685  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143687  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143689  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143706  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143707  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143709  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143714  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143715  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143716  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143717  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143718  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1995143719  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
