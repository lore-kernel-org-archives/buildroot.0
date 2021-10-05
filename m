Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13C0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 07:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AD860F9D
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 07:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37AD860F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA52183BC7;
	Tue,  5 Oct 2021 07:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZW6gtxvGiZd; Tue,  5 Oct 2021 07:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 773D483C10;
	Tue,  5 Oct 2021 07:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14A721BF32B
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 07:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1105740611
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 07:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEwXPbiKSgoC for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 07:17:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D09340607
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 07:17:01 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6D805240012
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 07:16:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Oct 2021 07:16:58 -0000
Message-Id: <20211005071705.1105740611@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-04
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

Autobuild statistics for 2021-10-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 21  |  6  |  0  | 27  |
  2021.05.x  | 21  |  8  |  0  | 29  |
  2021.08.x  | 28  |  5  |  0  | 33  |
    master   | 60  | 25  |  0  | 85  |

Classification of failures by reason for master
-----------------------------------------------

                 wavemon-0.9.4 | 7 
               usbredir-0.11.0 | 5 
            python-ujson-4.1.0 | 3 
                liburcu-0.13.0 | 2 
android-tools-4.2.2+git2013... | 1 
                    ffmpeg-4.4 | 1 
                   libnss-3.71 | 1 
                log4cxx-0.12.0 | 1 
make: *** wait: No child pr... | 1 
              micropython-1.17 | 1 
                 openal-1.21.1 | 1 
                    qemu-6.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e5b79b92de28ec0286aa35ef9fc09197e69c5467 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/33bfab7b0c5e337021be6c12ab5678188abdcaa9 |     
   x86_64    |          libnss-3.71           | NOK | http://autobuild.buildroot.net/results/a5f8a126a42ab784c3b5ab375a8cd7cbf205d745 |     
    arm      |         liburcu-0.13.0         | NOK | http://autobuild.buildroot.net/results/b20806e1ed2bc74848287916f5d7062b9224815b |     
  powerpc    |         liburcu-0.13.0         | NOK | http://autobuild.buildroot.net/results/5b9912f01be94b3b54b09d4f8500f1f0d5cbddab |     
    mips     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/24fcd340023f4aff7d2e4e4b9ed635ff0da25f4e |     
  mips64el   | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/759c44825928e09ed41561d90b1c3fd0011fa1a4 |     
   xtensa    |        micropython-1.17        | NOK | http://autobuild.buildroot.net/results/1ccd38b121d255490f1fd64137da895e1c6edc36 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/8e5b19df635b605950f654a147d500c9cbe1496b |     
 powerpc64   |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/bf0f9dbc8910a6ca1dbac43faa8293b49d5fd2ec |     
    arc      |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/5e5049125dde09bb3fb490c813c9cfb9f00cad9c |     
  riscv32    |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/6c01012e2ec30fcce43a55afe1ab1df5e816fe9c |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/1291c35e4a1aa6b1ec775629937fb01b56cc6bcd |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/e287c08dce4015c001cc2b6447e786780c7beeba |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/15dac1f747578487124f4d642d7215f8702fc492 |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/c1e6f9e7073cb625d2bb4ed3722c5e31c1827807 |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/cb4dc71b1bf4633e3dc806ff1fd4baad9dee2c95 |     
    arc      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/4270c895fb1fda03708a25ffc8900e2cfc3d9bd0 |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d66aa6098f8dc3030889c9f4ba3317e9336c99dd |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2e7d73c3f2866a178a35164ff96d6bb71d55356b |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/995c19a47275cece31a982a69c45893fe8a4583f |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8d84aa5aece0cd76af3796fbb1e148c7a3982b3a |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/196ef00ffc8f5bdbca93b5d151cbd6f80dee8074 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c4670f773753e28c55472fafdb58cfcae13b64b8 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/22a7b5dda15f209868c15a7cc8cbc3f862fd9eb5 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  apitrace-9.0 | 1 
            erlang-jiffy-1.0.6 | 1 
          gstreamer1-mm-1.10.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/6922547c481df162570def7e2a833e31ed6f945b |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/18557d397ffdc063d4b8ebc1fb6e84efbe999763 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/83e605ccced9f6b73ae3cf8651daf0ec6357bf08 | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d2ded0b24a7d77c39409c01363aa7a100496080d |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/403dcb8f7263935a03c0d02b00d874e31dc11eb5 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3bfe8dd6febf7448e45e5ee6f14e2f8099c268e8 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3ea27dca7b34af71bedae4ac399e200a9fad4889 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3983c7dc50bb659914d329b68bb47cb01badb1e0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/43318529f8f90f4903a000123989d3fe8a297d32 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b8eeb7dab4bd8c4af6c3579611499ca30290f044 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/16fc88062d72c55920e03fb76f05fc1fcfa582b7 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d13902ff0f0c942906ff9616fdc182ea6c1e54c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/76149e4a2a1f72386ba5d0529aa2f573bd3f4c91 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e9899aa22084eb8c2aa1ae78582519776c9f8b2d |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                     cgic-2.07 | 1 
                dovecot-2.3.15 | 1 
            erlang-jiffy-1.0.6 | 1 
libuci-52bbc99f69ea6f67b6fe... | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/879e06a0189b231da1e2b4122f09d1227ab056b8 |     
 powerpc64   |         dovecot-2.3.15         | NOK | http://autobuild.buildroot.net/results/17c35b93ffd3757b55c6ecca189b70700ece0806 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5d83dcfc5fba6b8b99c2f074ea50602ff7db1d91 |     
    arc      | libuci-52bbc99f69ea6f67b6fe... | NOK | http://autobuild.buildroot.net/results/ed75073c4673ad1900c7cc107d5422762810d3c3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f951ab4c279c1730902374c3c2fa05e346827249 | ORPH


Gitlab CI results for 2021-10-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        DetectBadArchTest | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480688  | ORPH 
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480676  | ORPH 
           TestCrudiniPy2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480784  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480786  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480788  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480789  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480678  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480790  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480719  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480720  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480721  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480725  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481127  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481128  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481131  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481133  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481137  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481141  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481149  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481152  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481154  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481157  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481158  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481160  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481165  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481167  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481168  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481170  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481172  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481175  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481177  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481180  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481183  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481185  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481188  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481189  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481191  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481192  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481196  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481199  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481202  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481204  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481207  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481211  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481213  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481215  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481217  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481219  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481224  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481226  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481230  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481238  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481242  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481245  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481247  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481254  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481256  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481261  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481263  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481273  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481278  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481280  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481283  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481285  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481288  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481292  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481297  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481300  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481303  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481305  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481310  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481312  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481313  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481314  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481317  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481321  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481325  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481327  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481329  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481333  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481336  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481340  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481344  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481346  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481347  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481348  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481351  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481352  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481354  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481355  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481357  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481364  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481365  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481369  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481374  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481375  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481378  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481380  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481384  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481387  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481388  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481390  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481395  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481397  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481399  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481402  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481409  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481415  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481420  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481424  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481427  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481432  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481435  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481439  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481440  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481443  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481445  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481447  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481449  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481451  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481452  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481454  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481457  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481460  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481464  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481467  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481469  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481470  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481471  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481475  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481482  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481487  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481494  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481502  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481511  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481517  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481520  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481521  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481522  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481525  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481529  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481531  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481534  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481537  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481540  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481547  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481548  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481550  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481557  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481106  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481112  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481115  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481121  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480726  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480691  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480693  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480792  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480796  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480777  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480798  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480753  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480754  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480756  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480757  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480759  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480760  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480761  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480763  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480769  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480770  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480738  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480740  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480742  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480820  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480844  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480812  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480816  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480827  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480871  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480874  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480839  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480878  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480854  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480886  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480858  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480891  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480896  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480834  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480881  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480899  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480868  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480847  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480907  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481070  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480863  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480824  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480845  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480814  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480818  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480832  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480872  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480877  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480843  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480880  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480856  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480888  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480860  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480894  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480898  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480837  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480883  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480902  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480870  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480848  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481072  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481098  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480866  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480904  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480906  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480909  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480714  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480910  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480913  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480914  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480916  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480917  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480918  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480919  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480921  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480923  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480924  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480927  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480928  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480930  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480933  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480935  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480939  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480929  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480943  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480944  | ORPH 
          TestPostScripts | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480699  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480946  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480947  | ORPH 
         TestPy2BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480781  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480783  | ORPH 
              TestPython2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480948  | ORPH 
              TestPython3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480956  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480962  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480968  | ORPH 
        TestPythonPy2Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480957  | ORPH 
   TestPythonPy2Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480972  | ORPH 
         TestPythonPy2Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480978  | ORPH 
        TestPythonPy2Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480984  | ORPH 
       TestPythonPy2Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480989  | ORPH 
  TestPythonPy2Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480996  | ORPH 
 TestPythonPy2Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481021  | ORPH 
    TestPythonPy2Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480807  | ORPH 
     TestPythonPy2Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481029  | ORPH 
     TestPythonPy2Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481034  | ORPH 
      TestPythonPy2Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481038  | ORPH 
      TestPythonPy2Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481045  | ORPH 
TestPythonPy2Subprocess32 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481055  | ORPH 
      TestPythonPy2Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481065  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480958  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480960  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480964  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480967  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480975  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480982  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480985  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480990  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480992  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480997  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481000  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481001  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481002  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481004  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481009  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481010  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481014  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481015  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481020  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481025  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480810  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481032  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481037  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481040  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481041  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481043  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481047  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481049  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481048  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481052  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481053  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481057  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481059  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481060  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481062  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481066  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481069  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480694  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480695  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480701  | ORPH 
        TestRootfsOverlay | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480704  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481074  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481076  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481077  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481081  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481084  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481087  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480706  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480708  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480709  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480710  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480773  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480774  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480747  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480696  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480698  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481091  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480679  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480681  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480683  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480685  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481093  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481095  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480748  | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645480750  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481102  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1645481103  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

