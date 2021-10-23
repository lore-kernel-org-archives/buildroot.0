Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8906C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 05:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8623B61057
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 05:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8623B61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D4D8402F0;
	Sat, 23 Oct 2021 05:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDbXoq6Mj1VW; Sat, 23 Oct 2021 05:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4392F402F3;
	Sat, 23 Oct 2021 05:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8BC1BF2F0
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 05:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF6B660623
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 05:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKX6HbQylDkR for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 05:51:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B0F06060A
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 05:51:01 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4610A240014
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 05:50:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Oct 2021 05:50:58 -0000
Message-Id: <20211023055103.EF6B660623@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-22
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

Autobuild statistics for 2021-10-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 43  |  8  |  0  | 51  |
  2021.08.x  | 35  |  3  |  0  | 38  |
    master   | 52  | 46  |  0  | 98  |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 15
              tinydtls-0.9-rc1 | 8 
              host-erlang-22.2 | 5 
                  boinc-7.18.1 | 4 
             python-pip-21.2.4 | 2 
             transmission-3.00 | 2 
                  uhd-3.15.0.0 | 2 
               host-qemu-6.1.0 | 1 
           host-sg3_utils-1.45 | 1 
                    mpv-0.33.1 | 1 
              strongswan-5.9.1 | 1 
                       unknown | 1 
             util-linux-2.37.2 | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/5134cf4d9ce07d379aaeaa0463201847be7b0358 |     
 powerpc64   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/6f32e8f876c39bc22a1a8af7d17e854a8bb096d9 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/9dbc9eaa05d3397b64e7fb5b1e21da8035fbda9e |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c9690417d7f5b75e34db0681fd0666f5ea639394 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/484b27b3da988730214982be8ff3687de551f217 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/24eb54c685b4cd40311a710fc708573668e011ac |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/bca459f29a2c4faf5cfacfb9af4b5ef09f31c5c9 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5ad9f2bbf8e9d2e32695b0f1d8f7f69e40a2c7f8 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d237baed66ad1046c0980bcbd1f290f6b9127db5 |     
 powerpc64   |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/222b5e152186b7fbd31b215631dc459686a78b1d |     
    arm      |      host-sg3_utils-1.45       | NOK | http://autobuild.buildroot.net/results/0eded615fc7b70f2f84e0759db103e3cc8fec71e |     
   s390x     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/846b54c01ea1f67f107768efe01566850103eb93 |     
microblazeel |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/91ea1eb2a966de474c8bbabf711942c491984be6 |     
    arm      |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/6e23b84fbab63b6ddfebbb59639fcd7de4e823bb |     
    arc      |        strongswan-5.9.1        | NOK | http://autobuild.buildroot.net/results/e2b2da5f09e5d0d9ed0bf4c550bbcdfe9dc05ef7 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e71dbdfb177be54b5f4e992617e1828fbf1a0344 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/090216da74d82b8d18fd86cb6e2f41e97bf65068 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f6b7a6d286f8446462fa7235ebc70273614312a4 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8e98af5d7c641e3147c86ade600c137114c39386 |     
   s390x     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/97fa67663e8913c7532332482bb1d84e1cbdc979 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c2560e6f30a27afe5ed6ee48331cb40ea4feda19 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/75c3d5e7f977406fbf3af5e6d379070c36e3c17b |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/984b1196b50cbd8b556ad8a6d4a90c8af57940c8 |     
   s390x     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a8fc4dd1382c7228e3f67323446f83f0935bc823 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/643c2785880a5c2b9d0bb0eb38b994af5720d348 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/26e48435b36669671a6dfb092fd435be4cc58760 | ORPH
    i686     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b8e0917d7155669bb86dbacfb8909dc4f83455f8 | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/3374589df82bc5cd59f54abf7e10adceb462dfa1 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/87f85c9dc1880fb50adbb940283a94e3d6cc52d4 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1916e74766ba7a2296ec2b4961d613a7be0d617b | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4bef8c465f9aabaa0aa851cfae36182a90638dcc | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2a281f4ed0e8f7396387eb71762739e0ebe8a5a3 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/e7e22a63044e8a0da6f1e36f2e3586a74ea97b33 | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8cda86c4211005f97b66419394ff680e566e4413 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f978476529864a4da1f42df7dcd9fe08319c1082 | ORPH
  aarch64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a896499d33c8e16a6f81a74468c0c9286930aece | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/3db9c4133a7aab3d09a370eb43c09c4b593ef4c5 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c4fce4504e78b747bb36631f38e7ea9638ded5b2 | ORPH
   sparc     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/e8824aba1e093fdd611be1e761f2a251b6ae9f1b |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/e630c86dac640d2c41a1417e6366836ea8a2d16d |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/84ce875c7b4d526cff0a07b7e43d05a7350273a2 |     
   mipsel    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f157d8873a2a4fe575560f395aa4bb9505f2007f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/aa08721d4442637da9caf7f4bb3868217b3825e6 |     
    arm      |       util-linux-2.37.2        | NOK | http://autobuild.buildroot.net/results/a1403c6de39117ee9de960945f94be66fdad9b94 | ORPH
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/56b5166b30bd25baa7b1c4aa4fb0da0b334895db |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c3f5a88acbbbf57f7fad02a894480846d9fa6da1 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                       gdb-9.2 | 1 
                   httping-2.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 
               openldap-2.4.59 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/e852cfbc60d7486cd9bfea95463faf6766cf3a98 | ORPH
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/adae7cd05224b2822b3d3b5fa42f988c9ed9d35f |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d3cc4e420885b3eaa1b9dad010a5b6cb3aca1ec9 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/697d8d4488aeb605858054acbb76d865892d5f79 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1a73c95462ffe707aa8a191f304a1c06fec0e868 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7741da5e9cb054468fabd91f8a18ac9d5e99d57b | ORPH
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/66b3ab2146227064ed45a05c3837c64b3da2657f |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b0c502959e5759c264c9706e6e791db6c086074c |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                 mesa3d-21.1.6 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6fc7650b4d0237e0a1287cab259b9e39532382a7 |     
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/59d1e5782da31d7220d8124b729d1f2f4abfe310 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/be7485b6b4b7e2a1a3869fe9634bcbf460fd7663 |     


Gitlab CI results for 2021-10-22
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422542  |      
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422551  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422555  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422556  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422558  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422559  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422561  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422563  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422564  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422565  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422568  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422570  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422571  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422572  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422574  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422576  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422579  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422580  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422582  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422583  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422585  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422587  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422589  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422590  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422592  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422594  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422595  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422596  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422599  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422600  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422601  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422604  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422605  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422607  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422608  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422610  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422613  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422614  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422616  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422620  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422622  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422623  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422626  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422627  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422630  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422632  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422636  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422639  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422641  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422643  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422644  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422647  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422649  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422652  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422679  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422681  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422684  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422691  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422693  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422694  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422705  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422700  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422703  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422708  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422710  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422711  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422715  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422719  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422720  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422723  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422725  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422726  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422728  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422733  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422735  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422742  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422743  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422746  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422747  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422749  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422751  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422752  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422753  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422755  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422754  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422756  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422760  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422770  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422772  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422774  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422775  | ORPH 
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422811  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422814  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422818  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422820  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422825  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422897  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422895  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422904  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422905  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422913  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422915  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422924  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422955  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422956  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422957  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700422958  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423002  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423026  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423034  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423035  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423037  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423046  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423047  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423048  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423049  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423050  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423052  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423055  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423056  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423059  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423060  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423064  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423068  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423069  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423073  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423080  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423082  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423084  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423085  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423086  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1700423088  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
