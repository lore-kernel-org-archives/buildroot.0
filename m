Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD918C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:58:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D92C60FE6
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D92C60FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A52402E0;
	Tue, 31 Aug 2021 06:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLY_pbGgWYmA; Tue, 31 Aug 2021 06:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DAB1403AF;
	Tue, 31 Aug 2021 06:58:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD5F1BF377
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CCE2403AF
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0sztLYnLKuf for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 06:58:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C28FA402E0
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 06:58:01 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A78EE6000D
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 06:57:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Aug 2021 06:57:58 -0000
Message-Id: <20210831065806.7CCE2403AF@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-30
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

Autobuild statistics for 2021-08-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  |  4  |  2  | 47  |
  2021.05.x  | 40  |  2  |  0  | 42  |
    master   | 199 | 20  |  2  | 221 |
     next    | 45  | 17  |  0  | 62  |

Classification of failures by reason for master
-----------------------------------------------

               capnproto-0.8.0 | 3 
                  mupdf-1.18.0 | 3 
                host-go-1.16.7 | 2 
                host-odb-2.4.0 | 2 
                       mongodb | 2 
                nodejs-12.22.5 | 2 
                 dc3dd-7.2.641 | 1 
                    ffmpeg-4.4 | 1 
                       gdb-9.2 | 1 
  gobject-introspection-1.68.0 | 1 
                 openal-1.21.1 | 1 
                 openmpi-4.0.0 | 1 
                qt5base-5.15.2 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0ffe064ae43d11dd64fe8ba272cfd4651e7029ae |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8fe6b37362c32a4f2b1d59c45a466b8ce2a00c1a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bdb9509d3c3cbef074c5c50f0c0c31c415276354 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/aa3165f2fde113d12fc7eb130dfa9178a0a79e02 | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ef328759cd2dfbc89912442946a8fb6adb43dfa6 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/1b0fee0e3a57d38831bbebed25ae1b8a0f10b039 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/0cfc7a02c8ddfbb0856589355120f817c3feba3c | ORPH
  mips64el   |         host-go-1.16.7         | NOK | http://autobuild.buildroot.net/results/a3f3a2ca7ec137baef8c206abb4b50a5cb0b82cd |     
  mips64el   |         host-go-1.16.7         | NOK | http://autobuild.buildroot.net/results/2a80369645897d86ca5fb6a8d8ec38ac4ac7250a |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/bd614edf693bdbe9b3e9cdb1adbc6f9a1d97dd9c | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/34cf394fb6528d6fb96a2ee3c290f0a9608f8c6a | ORPH
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/caee17c835c2c6a11e1786e1dfd5e9ac24d25343 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/aef367245849a829e12c8389ddbb8fb351a37a8f |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/ffdc69175b103a06dcd29e7c4d586ed2558763de |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/23ef03f3030b3ffdd38005bcdb15683134e8ae83 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/7b56f66bf74e76d4eab3aea64f68f9d0144b256d |     
   mipsel    |         nodejs-12.22.5         | NOK | http://autobuild.buildroot.net/results/ec0ec7890c314da8bbbcd0a091993c1514215688 |     
    arm      |         nodejs-12.22.5         | NOK | http://autobuild.buildroot.net/results/00e591626f931265eca0fe5e91894c81bad89a14 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/f7d7c5eeb453bd10ad43a3200ea0cefee2327dd7 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/86ffde2f67ffc0bfaeebe72fe742a5c241bc580b | ORPH
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a7a2c5cb711cc34a7bd7cc8199c0d2b5bec39eab |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/0885c764657939afe2740a82ba4480c25790ff3b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

docker-proxy-55685ba49593e6... | 1 
  gobject-introspection-1.64.1 | 1 
                       mongodb | 1 
              netopeer2-1.1.53 | 1 
                   python-lxml | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/2a31e4c5dcd2f11cd3b78ec0951f20ba276d9381 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/536bd961acde245a51d14435eb72a3f9fc587168 | ORPH
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/cc53cf29edc80207e4415f24d90a50a6aa86b704 |     
  riscv32    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/774f1549e02a581460d3d651d4b87695e0af6c41 |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/bfa02db6ae89aff2a6566201e7250a96887d5a3c |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/d93bc4027a427e8bf91e71cc46ee5e9146539535 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/cc689b2de748b71ded93947ea0494f7fe321eecb |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/fef9cb22bf0ef4932de026ea976b1b790785ec05 |     


Classification of failures by reason for next
---------------------------------------------

                  uhd-3.15.0.0 | 3 
          refpolicy-2.20210203 | 2 
                    ushare-2.1 | 2 
                     fmt-8.0.1 | 1 
              gnuradio-3.8.2.0 | 1 
              host-libcap-2.52 | 1 
               libglib2-2.68.2 | 1 
               libtheora-1.1.1 | 1 
               linux-pam-1.5.1 | 1 
                mono-6.12.0.90 | 1 
               target-finalize | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           fmt-8.0.1            | NOK | http://autobuild.buildroot.net/results/8a1d9a9759f13054d7ef6b7121df75bb34ec1ab2 |     
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/91767149557a3fe8b180beb1ce11c18b3d024444 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/745e6fe06033936b23ae17b23691c536fe903069 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/7e3d33d914fd06c50f14146b4dcd6d1a2e028317 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e64ec012c18fd2f6d14785c41eae01fbf2e25a75 | ORPH
  mips64el   |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/bfa5099a659c596e8b493368b430336d032408a4 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/3b88e00c0d49fdac372febd69a5d13afbd602dad |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6efedff209918aff251a996c195e38e88e506da2 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f740d0a5a37b6688d93eb07f26ddf5c8e963d98a |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/7433c64bfd7f0ccaa171906b9b5d2b73ed72f8b1 |     
    arm      | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/2ec96dd1089ba9291f1113987b28f74745477be0 |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/9fc229151ee80996414c8d3b73fa938d6a7e5c0c |     
  powerpc    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/84d523178389d92bee506707061c5217585e8925 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/9bbcfc0ac88bcbaa4d1ec2939516f55c81b63cd6 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f256a93f576196d4f38f6c5b7041a6899b863775 |     
powerpc64le  |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/0c2c281850dc082d7f66e11e8fe0c0c56f3761c3 | ORPH
powerpc64le  |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/86ffe1082b8d1aa1b4216b1469ca0cf2ebb96e51 | ORPH


Gitlab CI results for 2021-08-30
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640917  |      
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544639872  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640553  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640556  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640561  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640566  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640570  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640573  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640577  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640582  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640584  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640587  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640589  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640591  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640597  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640598  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640600  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640603  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640607  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640611  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640617  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640619  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640627  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640629  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640634  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640637  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640640  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640644  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640648  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640650  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640653  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640656  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640658  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640659  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640661  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640662  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640664  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640666  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640668  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640670  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640677  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640679  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640680  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640684  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640685  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640691  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640694  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640696  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640699  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640700  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640701  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640705  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640707  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640711  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640714  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640718  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640721  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640724  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640725  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640730  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640733  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640736  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640739  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640743  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640746  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640749  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640752  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640753  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640755  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640758  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640760  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640762  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640763  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640767  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640769  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640770  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640773  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640776  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640778  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640780  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640782  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640783  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640790  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640791  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640794  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640795  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640797  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640798  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640801  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640803  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640805  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640807  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640811  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640815  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640816  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640817  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640818  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640822  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640825  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640827  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640831  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640833  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640835  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640837  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640839  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640840  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640842  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640844  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640846  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640847  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640850  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640851  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640852  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640855  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640857  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640859  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640861  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640864  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640868  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640870  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640874  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640875  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640877  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640880  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640881  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640882  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640884  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640885  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640887  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640890  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640891  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640894  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640897  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640898  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640902  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640905  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640908  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640131  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640420  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640454  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1544640457  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
