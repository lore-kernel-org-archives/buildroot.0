Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A704DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 06:58:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B8CB60F70
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 06:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B8CB60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02CDF60672;
	Sun, 17 Oct 2021 06:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmXRLc9VjKut; Sun, 17 Oct 2021 06:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A68606BD;
	Sun, 17 Oct 2021 06:58:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDA901BF5DA
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 06:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5C5B606BD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 06:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sstQQ_VebbUv for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 06:58:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B1B360672
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 06:58:08 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A9731E000B
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 06:58:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Oct 2021 06:58:05 -0000
Message-Id: <20211017065811.A5C5B606BD@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-16
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

Autobuild statistics for 2021-10-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  |  7  |  0  | 41  |
  2021.05.x  | 15  |  4  |  1  | 20  |
  2021.08.x  | 23  |  2  |  0  | 25  |
    master   | 31  | 34  |  1  | 66  |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 6 
                  boinc-7.18.1 | 5 
              host-erlang-22.2 | 3 
          shairport-sync-3.3.8 | 3 
             transmission-3.00 | 3 
                       unknown | 3 
              strongswan-5.9.1 | 2 
               capnproto-0.8.0 | 1 
           host-mono-6.12.0.90 | 1 
             kismet-2021-08-R1 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                      linphone | 1 
          python-libusb1-2.0.1 | 1 
                 samba4-4.14.7 | 1 
              tinydtls-0.9-rc1 | 1 
               usbredir-0.11.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/7c068e0813b9316d137d1d098116f2e51ab2bec0 |     
  sparc64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b7497b0beca1a0dd8f46c53b5d7bd140c87fabb3 |     
    or1k     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/65e36c87a608cc2303c7492c51f1f2b5770fcc67 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/241cd4943843c8c71644c33b7395efaee78fa2fd |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b5c4dd0460d311073529ca32c1f08375787a719a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7da86e9540705455125f3e303d137286f6b21f37 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1d2e73397c2b82d5fc19fdab4f9b894de93318bb |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/207ef2363694e0f2c729f0fcdb3c6c33f2f2329e |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/2efd0ef6f76d2ce479a375679020ba9aaf94a89b |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/b916fda0747cb28dc26db227302eeb5529b50f54 |     
    m68k     |       kismet-2021-08-R1        | NOK | http://autobuild.buildroot.net/results/6a335c25d9b9b0f670a042b805a81682863d08bf | ORPH
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/c5df3e613bf76946cf14d46f39ae886fe2b8a7e7 |     
    arm      |            linphone            | TIM | http://autobuild.buildroot.net/results/37759943b3c34ca0023767f635303c5523c8bc16 |     
    arc      |      python-libusb1-2.0.1      | NOK | http://autobuild.buildroot.net/results/fe011ccb7eac1be9762919f9feda35114e752d8a |     
    arc      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/4fe6cbd66f403477374de3cd131279fd08d23234 |     
    arm      |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/4483de058cec38d9e7cbc8ba51ac1ccf7ae5a5fa |     
microblazeel |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/0fb0d939caa11df492fa6610287ff0a3c320e7a9 |     
  mips64el   |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/7464ef66193a3db33a302824b2dbb795e21513fc |     
   nios2     |        strongswan-5.9.1        | NOK | http://autobuild.buildroot.net/results/0c550721c20946e5b9d07951a9698b88e9c53e7f |     
    arc      |        strongswan-5.9.1        | NOK | http://autobuild.buildroot.net/results/354a022f789067edfe7ebd464991d1695a697a7a |     
  aarch64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/391843cb522a03f70029c42987ba023084a0b2a4 |     
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/0d0cc438b15dc83c53601f5ee38e9a7bba19ffd5 | ORPH
  riscv32    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/77eb6c78bc5ccbe88a271b415fadde1e86b697c2 | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/7cb52e9ecc78cff7c8dbbd60bf3da9849619fa3a | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/42a4bbe3896bd2a7042ff99567e64c3cdd55d18e | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c59db68cccc93ce4a3a9528abc000160b0d157f3 | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/29e9da8e7a37438cd7fa1abc1039d9288e3c1dcb | ORPH
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/154352773b959ae6144e1f2ee2321b216f8cf3ff |     
powerpc64le  |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/a11e4b18001d89ce41e3e7dc77197d34a14110a4 |     
  aarch64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/f2fd35c5a0b44b923d51d9f39ee773d08dd25bb6 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/c5923a13c2ce656dfe7230f5d14fee4bbc0d7587 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/cff18770f5469dbf8882bf171acaeb4713c05909 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6c6544ed280ba0f5aff633220f4e8a38a4d1d7bc |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/eca1d8a2b73a769354ab1d24c7996be30f152138 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e853fd778a0bf22d8e1907e28867850afa655b7b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 2 
                libkrb5-1.18.4 | 1 
               trousers-0.3.15 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5129085cf711287ab37050626f42e16bc473c612 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/25558bf509e1cadbd0f3961c4275df9db3ccc6cd |     
  riscv32    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/af44a3b5ac98d1d565982320ef32f43a54a2c64e |     
 powerpc64   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/9ac6722844051ad8b4784bc85b8639d7108f075a |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/351ba2a643b84fc526ee53647735795e154b5086 |     
  riscv32    |        trousers-0.3.15         | NOK | http://autobuild.buildroot.net/results/dcd62e82e7912149090e4d00b4ebc13589ae03d4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/88a25dd2fe9b9d2dcc4f62d4cfc92af76447114c |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                      linphone | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2c97a6ae7765ca843259de9d28663be061c895c2 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2fd3594eb38853d1b32765aacd03a5f76cfaa8da |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/414a0a971d9de4bb2d5d94d7bac4fc0e3eaa0563 |     
  riscv64    |            linphone            | TIM | http://autobuild.buildroot.net/results/db6ae6cc75d6b3dcc4070767995aa1a5f247933d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dff535fce2748cbf28de7a760e8bbd036c366900 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

           python-pybind-2.6.1 | 1 
xdriver_xf86-video-nouveau-... | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/37508e26bde3ec18a13fd833751d0f009b50e065 |     
  powerpc    | xdriver_xf86-video-nouveau-... | NOK | http://autobuild.buildroot.net/results/60379cb2f4b8d5e3d8a8b616258682c5e77f9b2b |     


Gitlab CI results for 2021-10-16
================================

Detail of defconfig failures for 2021.08.1
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666713  |      
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666715  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666737  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666746  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666760  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666762  |      
                 arm_foundationv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666834  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666843  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666845  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666846  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666848  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666851  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666854  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666857  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666858  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666859  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666862  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666865  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666867  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666868  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666869  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666870  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666871  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666928  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666958  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666960  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666961  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666963  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666964  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666965  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666966  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666967  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666982  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666996  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666998  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666999  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667000  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667001  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667002  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667004  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667005  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667006  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667007  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667009  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667011  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667012  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667013  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667014  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667015  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667017  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667018  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667020  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667023  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667030  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667032  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667034  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667037  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667039  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667040  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667043  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685008401  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667047  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667048  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667049  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667050  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667054  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667052  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667053  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667056  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667059  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667061  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667064  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667066  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667068  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667070  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667075  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667077  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667080  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667086  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667088  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667090  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667092  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667094  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667096  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667099  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667101  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667102  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667103  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667105  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667107  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667109  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667112  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667114  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667117  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667119  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667120  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685008420  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667124  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667126  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667125  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667128  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667131  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667133  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667135  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667136  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667138  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667139  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667140  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667141  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667143  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667144  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667145  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667146  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667147  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667149  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667150  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667152  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667157  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667156  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667158  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667159  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667161  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667163  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667165  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667164  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667166  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667178  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667182  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667184  |      
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667192  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667195  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667208  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667210  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667363  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667375  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667376  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667379  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667381  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667384  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667390  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667420  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667429  |      


Detail of runtime-test failures for 2021.08.1
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668211  |      
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685084160  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667433  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685100059  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685017755  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667778  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667779  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667784  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667786  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667787  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667789  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667791  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667792  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667793  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667794  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667796  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667797  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667798  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667799  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667801  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667802  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667803  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667804  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667807  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667809  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667810  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667811  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667813  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667814  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667815  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667816  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667817  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667821  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667823  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667824  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667827  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667830  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667832  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667836  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667838  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667840  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667841  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667842  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667845  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667846  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667862  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667867  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667871  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667873  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667874  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667877  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667882  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667883  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667885  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667892  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667897  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667901  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667904  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667909  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667914  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667918  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667920  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667923  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667925  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667932  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667935  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667942  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667949  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667950  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667953  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667959  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667962  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667965  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667969  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667972  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667975  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667979  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667982  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667999  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668003  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668005  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668006  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668010  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668011  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668014  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668016  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668018  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668020  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668022  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668023  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668027  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668029  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668030  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668032  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668034  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668036  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668039  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668041  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668044  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668048  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668049  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668051  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668052  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668054  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668056  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668057  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668059  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668060  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668061  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668064  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668066  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668068  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668070  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668073  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668077  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668080  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668084  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668086  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668088  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668089  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668091  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668093  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668096  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668103  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668105  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668110  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668114  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668118  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668127  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668128  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668133  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668136  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668141  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668143  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668163  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668167  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668170  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668174  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667668177  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667764  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667767  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667769  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667771  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667776  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667777  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667440  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667442  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685084151  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667596  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685078690  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685076897  | ORPH 
         TestPy2BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667521  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685085556  | ORPH 
      TestPythonPy2Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667724  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667445  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667446  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685031999  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667449  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667450  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667434  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667435  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667437  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667438  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1685015643  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667667763  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

