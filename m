Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8860C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 06:57:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03BE60F39
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 06:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D03BE60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D7383B70;
	Sat, 16 Oct 2021 06:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rX3G7cFSKRG; Sat, 16 Oct 2021 06:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180B183B77;
	Sat, 16 Oct 2021 06:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9C6B1BF25F
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 06:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7DE3405D8
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 06:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cru85uK23DGr for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 06:57:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC92740521
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 06:57:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2F5DAFF811
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 06:57:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Oct 2021 06:57:16 -0000
Message-Id: <20211016065722.C7DE3405D8@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-15
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

Autobuild statistics for 2021-10-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 20  |  8  |  0  | 28  |
  2021.05.x  | 24  |  6  |  0  | 30  |
  2021.08.x  | 21  |  3  |  0  | 24  |
    master   | 37  | 34  |  1  | 72  |

Classification of failures by reason for master
-----------------------------------------------

          shairport-sync-3.3.8 | 5 
                tpm2-tss-3.1.0 | 5 
              host-erlang-22.2 | 4 
                  boinc-7.18.1 | 3 
              tinydtls-0.9-rc1 | 3 
                       unknown | 3 
libdbi-88b8477d57153b9f736d... | 2 
libpam-nfc-bb762e0e64919511... | 2 
            python-ujson-4.2.0 | 2 
libcamera-40f5fddca7f774944... | 1 
                libgpiod-1.6.3 | 1 
                      linphone | 1 
                 openal-1.21.1 | 1 
                 samba4-4.14.7 | 1 
             transmission-3.00 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/776b692f8c2fa79e6efb1e8691d5675e762512d1 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/223d2a0a2fe678cb3e5e2fc7d675ab1d115190f2 |     
   nios2     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/3047c6666481259f018f4ab7833fcc5512facb66 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/990ae90653e32b802f666c392771b6965e6599b5 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/caf5f559c820228b7b05dbd955a8158329c02343 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/90a3261f2c7538f2e1c758a425c691a2b56c7043 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5346a3ed1233cec48f5dc9abe1e477731d7e339d |     
 powerpc64   | libcamera-40f5fddca7f774944... | NOK | http://autobuild.buildroot.net/results/49caebe7ef7e3d63de49e78d5d6839dd0aedf10c |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/fa7ef8764d46c5a98924abc1ca8ce172509c8d70 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/af77de53e6b8ef2963a0eee3f52d09079c0d3118 |     
    i586     |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/7cd8bd7f8a444f4ea606052c51bd64181d37d082 |     
  aarch64    | libpam-nfc-bb762e0e64919511... | NOK | http://autobuild.buildroot.net/results/f286f52a42a1ab9ff64a017cbd5323474ca50f9d |     
    i686     | libpam-nfc-bb762e0e64919511... | NOK | http://autobuild.buildroot.net/results/4f6018cb44770ea8fb9a9eb24c161239c2d04c27 |     
    arc      |            linphone            | TIM | http://autobuild.buildroot.net/results/806c755d19416365c3a41842a1a1ff012fa2fdc3 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/afc0d7e2d47e234706810f5ba20c92dff03201b1 |     
  aarch64    |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/ba62db0765036b536b261ec60fea6d7976015e9f |     
    arc      |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/93f231c4a860f4467029a2c2e4fc0b67096b14f6 |     
    arc      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/f96688145139e277483da92ac70e1603a0372bcd |     
   xtensa    |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/360f077196da68fede5aaef628253b41fcdb763c |     
  aarch64    |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/464148bdccb705d8992dc860262bfdeb01b7e2a1 |     
microblazeel |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/0c48cce2c61c9fbe85058651a6eb244dbbace705 |     
  sparc64    |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/e42dfc641d103bf9faa94328651edf63409f1abd |     
   mipsel    |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/0c092182a1794269d5981a428a6309b134cc9cf2 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a3e6aeab09ba0e2cbb7185a09df90637016e6d7f |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1ed2f0e8872c10b43d2484de2404e9231783f03c |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4914cedd0073d45e5d9433da22e9796ec166c131 |     
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/90207c81be19fec1ca85d4aba8372c44fa4564d3 | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ecc3bd00be49de70007b2f291b09cf10e2d3a7f7 | ORPH
    sh4      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/26a4723a4f89c86dd274ae89da4883a2cb791122 | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/23f3a43292c36d115c3d5cf7439f6cba034a4b7e | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b231fd50d073edb2dcffa8214736d8acd2e62128 | ORPH
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/90c262a1b8df7398560650b84286faa91ef709a5 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/6f93b88a39f1c5be627999ddfc8d1a84400f582a |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e4a68c612fd719914ec5ce5d52cdf77a5565b116 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1c1faaa6a1240fa61fb8a053a0cf6b49c017bf7a |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 6 
            docker-cli-20.10.8 | 1 
                 openal-1.20.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       docker-cli-20.10.8       | NOK | http://autobuild.buildroot.net/results/32a135fb1a9da850eaa1f2138c82c7d11ea64daa |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0d5f33732ba972c5970484c5f9d17f95ab1c3340 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd34275e7c58c686d26c092deee8c1c254e0d4a0 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a08695507e34f2eb3522cd261634a693eda59f1c |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/39c4526c7988854d3c5ed2656523aea64197d65d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f550d1884aaff1fbcbb7ed44b3ab750688904f5b |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1c129c4437297da5befa749fc199e80d19ba048f |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/47e0089cbe5f0ba2df07a01e0d8f32c6ece92e25 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                  zeromq-4.3.4 | 2 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/be01c4e91fe62bb1a321d542ac3440513d0703e3 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e8fe00d1f5a46df37d04e791aea397ba5a6b5db3 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/44fc5408e0b6a7479ee777b142ddadedcf299f42 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b9c9c65fc40a046fd36cd85799fb21baeeb92f89 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f4b4067d795e91b1c8c02132acdc48435bcde422 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2907b8567d3a1945078b19f3e5d7867def6156b3 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/5d64bc56707c5daa87d4795b0b9b552330760a67 | ORPH
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/d11bcad3402da4efe93b602febfdd6f55aa64b8f |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/70f30ffdb4b15d143294d09ce312585522014fb2 |     


Gitlab CI results for 2021-10-15
================================

Detail of defconfig failures for 2021.02.6
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431766  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431776  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431798  |      
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431802  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431804  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431817  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431827  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431830  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431836  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431863  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431880  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431966  |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431954  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678758095  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431969  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431971  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431972  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431974  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431990  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431991  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431992  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431993  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669431994  |      


Detail of runtime-test failures for 2021.02.6
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678859498  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678910168  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678910171  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432226  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678792263  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432228  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432229  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432231  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432232  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432233  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432234  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432236  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432237  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432238  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432239  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432240  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432241  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432242  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432243  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432244  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432245  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432246  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432247  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432248  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432249  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432250  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432251  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432252  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432253  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432254  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432255  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432256  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678899463  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432258  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432259  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432260  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432261  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432262  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432263  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432264  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432265  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432266  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432267  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432268  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432269  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432271  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432272  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432273  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432274  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432275  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432276  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432277  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432278  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432279  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432280  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432281  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432282  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432284  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432285  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432286  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432287  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432288  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432289  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432290  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432291  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432293  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432294  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432295  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432296  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432297  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432298  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432299  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432301  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432303  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432304  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432306  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432307  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432309  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432310  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432311  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432312  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432314  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678878078  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432316  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432317  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432318  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432319  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432320  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432321  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432322  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432323  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432324  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432325  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432326  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432327  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432329  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432331  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432332  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432333  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432335  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432337  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432338  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432340  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432341  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432342  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432343  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432344  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432345  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432346  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432347  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432348  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432349  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432350  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432351  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432352  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432353  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432354  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432355  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432356  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432357  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432358  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432359  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432360  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432361  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432362  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432363  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432364  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432365  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432366  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432367  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432369  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432370  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432371  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432373  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432375  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432377  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432379  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432384  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432388  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432390  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432392  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432393  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432394  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432395  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432396  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432398  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432399  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432400  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432402  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432406  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432407  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432410  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432413  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432218  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432220  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432222  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1669432225  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678759154  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678760465  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678911296  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678776757  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678908439  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678760574  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678924732  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678763183  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678910166  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678761385  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678803697  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678803685  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678802023  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678917370  | ORPH 


Detail of defconfig failures for 2021.08.1
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1667666710  |      
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


Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408380  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408445  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408591  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408596  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408634  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408650  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408674  |      
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408679  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408682  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408694  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408717  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408719  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408749  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408755  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408768  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408774  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408777  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408780  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408787  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408812  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408830  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408856  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408878  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408884  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408979  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408994  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678408999  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409001  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409005  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409013  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409014  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409033  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409060  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409066  | ORPH 
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409071  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409079  | ORPH 
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409117  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1678409128  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
