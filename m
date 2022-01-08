Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B61DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 07:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94BD6428E4;
	Sat,  8 Jan 2022 07:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksW_LZXnSZl0; Sat,  8 Jan 2022 07:05:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59F48428E7;
	Sat,  8 Jan 2022 07:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A23361BF36B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 07:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8685C428E7
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 07:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdw7-V7_NMeB for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 07:05:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DF31428E4
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 07:05:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9171620003
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 07:05:50 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 08 Jan 2022 07:05:50 -0000
Message-Id: <20220108070555.8685C428E7@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-07
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

Autobuild statistics for 2022-01-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 60  |  7  |  0  | 67  |
  2021.11.x  | 28  |  6  |  0  | 34  |
    master   | 100 | 48  |  0  | 148 |

Classification of failures by reason for master
-----------------------------------------------

                  xxhash-0.8.1 | 10
                host-file-5.41 | 7 
                  rygel-0.40.2 | 6 
                       frr-8.1 | 2 
                   guile-3.0.7 | 2 
             ksmbd-tools-3.4.3 | 2 
                     mdadm-4.2 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
       gst1-rtsp-server-1.18.5 | 1 
                 hiawatha-11.1 | 1 
                   i2pd-2.40.0 | 1 
               ipmitool-1.8.18 | 1 
          libmicrohttpd-0.9.75 | 1 
                log4cxx-0.12.0 | 1 
                mongodb-4.2.11 | 1 
                nodejs-14.18.2 | 1 
               openipmi-2.0.32 | 1 
                   perl-5.34.0 | 1 
               poppler-21.12.0 | 1 
               pulseview-0.4.2 | 1 
                    ruby-3.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/837c592fd6f8432654d097362bcd3642eb1c3d80 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/2ad3f23babdb7e398ff1b26728012f13651b0120 |     
  riscv32    |    gst1-rtsp-server-1.18.5     | NOK | http://autobuild.buildroot.net/results/da833542f6c53af80719107d3d76766a7bdc3464 | ORPH
  riscv32    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/3de75297546b593adb0e9076486e47d51d75ccaf | ORPH
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/f2dd39f0d4c5253c6c7584fae475b754d3b948bc | ORPH
  riscv64    |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/e255604dda0dc6567410e14690f58d00d093b498 |     
    arm      |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/dc5371f4e04257ba5e8f1ebf73483b52919d3b12 | ORPH
    i686     |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/f148071bc55f2d8016295d0729e63c70b3f24c57 | ORPH
    arm      |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/78a56a35c0f30d007199d5bd32fdda337c33e6b3 | ORPH
  aarch64    |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/97ce8deac2017cb7ea4af1af8265d373ea9451e9 | ORPH
   s390x     |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/ff361fd57a4a7e80b492afa5594d7b342a278613 | ORPH
    i686     |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/58d35b677928d73ece2bb791975d0500177b940d | ORPH
    arm      |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/2308143bed92f99a4fe7b7ee40f043e449177ce7 | ORPH
   x86_64    |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/3825ce0953558347fdf30b66b647660a77b8f095 |     
    m68k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/af2ff8788b28bffd16a00d196dd0ed4da630788f |     
    i686     |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/ad4bb4644fb1968cd16a6f061768a14cbd098359 |     
   xtensa    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/7b197aab2d53972e1e59cfd031a1c4fc331eeb5f |     
    or1k     |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/f7668104dd64a93f0b343ce3ebbe50b12584184d |     
    arc      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/352528dcc0e919da399eb25875096874fe419f01 |     
    arm      |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/469306768ebb2d871dc20a3e3449ea25f08c2712 | ORPH
  riscv32    |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/c967262963fa141ac6d9336131b89b44789ffd3a | ORPH
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/d7035fcbe841d6820012b1cad49c470cbbfecb92 |     
    arm      |         nodejs-14.18.2         | NOK | http://autobuild.buildroot.net/results/3a851d659dbb9d6bbc2df8f89448262cf22c1a2c |     
    arc      |        openipmi-2.0.32         | NOK | http://autobuild.buildroot.net/results/b0eb44ddbe2f10053a8a769d22d231caf82c7612 | ORPH
    arm      |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/74d25607bbe9f9a3ea222b2453604bf2f382dc63 |     
  riscv64    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/072275c19cb896669cd144cbeeb2d81aedccf608 |     
  riscv64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/65ea69a417e4103efd6004d7f6ec3fb589f527e0 |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/599ca54e97eb913e1436f0cbf32e53368751c24e |     
    m68k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2818db2e0a5453a83cb5369493cc6f7fb01258c6 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/693dcd618eaada02218919f06032d1c3c907fca5 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/fc34ea2a7ab09ac6629ce72f7780c1496a69a2bb |     
  aarch64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f2cc87e201456eb8f1b261436369f150cfe677cc |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/86e1592a15e36be97434bcfecf3d0304b22f92d2 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c4af583d23095a05cd1bc4b6f10bf570fd975477 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/731a1de84dbcd753d3dd27d5f37257ae2615e66c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5701f17df21c913ae6a6dd029fe27a3e57dede13 |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/17aa64727cbf51f28a77b925c9aa0db93b5b4f97 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0e50e75f343d18c7a830c57d36912d43e6034a94 |     
  powerpc    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/651ff4db1fd21bab6c7cbd575e6a742632320abf | ORPH
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/3e03cb469a3f273ca5febe8e110cc74abc749c89 | ORPH
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/057b2fdc14fd9bfabb3a5653a5ecca4c8411da3e | ORPH
   xtensa    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/22a8b531c66e25b005f568cd673f2a08121f38e7 | ORPH
   sparc     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/665dd9d2f5efcacc04a0d9164eb2885b5378db21 | ORPH
  powerpc    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9ec98624bfed3bf71eed8bd92a1060461d466bb6 | ORPH
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/d5bb532a8a2f3f4fb20c4d81d4d88d2f2d4a06a6 | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/c099de5599d23970d4319927347a8c52c03d622f | ORPH
    m68k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/dce11718731c338ce290191c2241accf76c86bcc | ORPH
    m68k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/b542eee260e1769dde761e498d5d108743fbeed2 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
              asterisk-16.21.1 | 1 
                   gvfs-1.44.1 | 1 
monkey-f54856ce250c4e257354... | 1 
               openldap-2.4.59 | 1 
          wolfssl-4.8.1-stable | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/03b47775fda00eb0ba86b89c0442253083a9d4e9 |     
   x86_64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/fc155bfa7a3b67e815026dc60174d0c9d000c6c4 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f8898c73ff2a30715e2613646c9449f324ba88d2 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7fcc97aa5714aea4e1ee049ae1c4373e7f62d418 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6b0c96edb8b6a0c9bcf89260db84043b1dfd1e6f |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/56653962e44a775bca2ac8111dc11dcda2f74ab6 |     
    arm      |      wolfssl-4.8.1-stable      | NOK | http://autobuild.buildroot.net/results/c9847ab9690acdd503404b0e50b313114d115e00 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                   gstd-0.13.0 | 2 
              host-erlang-22.2 | 2 
                 libqmi-1.30.2 | 1 
                   mpd-0.22.11 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/25c5f4f54abd0387ab0edcafe91b06883d0e079c | ORPH
microblazeel |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/9484e42e21284e7a8ce5c9b21f7362047fa5e362 | ORPH
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d03d7e34ac0533fd3e827d7e71cb5d795310175c |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b58daf25c60d7f45e1c1c5610671b095f204a1c7 |     
powerpc64le  |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/c78d32ee24bd259c0d503b68106824f6c5d66b9c |     
    arm      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/f6b0c9a78d4938e9efc40a4472b35a19deb04269 |     


Gitlab CI results for 2022-01-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650508  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650510  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650511  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650513  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650516  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650518  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650523  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650524  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650525  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650526  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650528  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650529  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650530  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650531  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650532  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650533  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650534  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650535  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650536  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650537  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650538  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650540  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650541  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650542  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650543  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650544  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650547  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650548  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650549  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650550  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650552  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650554  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650555  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650560  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650563  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650564  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650567  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650569  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650570  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650571  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650572  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650574  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650576  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650577  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650604  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650605  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650606  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650607  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650608  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650609  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650611  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650612  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650615  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650613  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650614  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650616  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650617  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650618  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650624  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650628  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650644  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650646  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650659  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650661  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650664  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650665  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650667  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650669  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650672  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650674  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650675  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650677  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650686  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650782  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650790  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650797  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650800  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650801  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650804  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650806  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650809  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650810  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650812  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650816  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650819  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650820  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650821  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650904  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650915  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650916  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650918  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650919  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650922  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650923  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650924  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650925  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650928  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650930  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650931  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650938  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650940  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650941  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650953  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650955  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650960  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650969  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650970  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650971  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650972  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650974  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650976  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
