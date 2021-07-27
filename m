Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30463C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 05:54:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE3161037
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 05:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BE3161037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 475FC400CA;
	Tue, 27 Jul 2021 05:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXHjuGZjCQyF; Tue, 27 Jul 2021 05:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 983FA4014E;
	Tue, 27 Jul 2021 05:54:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80A291BF2C5
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 05:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 700B2404B1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 05:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnylOscOMsqm for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 05:54:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B33440465
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 05:54:39 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8062540007
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 05:54:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Jul 2021 05:54:36 -0000
Message-Id: <20210727055442.700B2404B1@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-26
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

Autobuild statistics for 2021-07-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 19  |  5  |  0  | 24  |
  2021.05.x  | 19  |  5  |  0  | 24  |
    master   | 56  | 49  |  0  | 105 |

Classification of failures by reason for master
-----------------------------------------------

                  exiv2-0.27.4 | 11
           optee-client-3.13.0 | 4 
                       unknown | 3 
         host-gcc-final-10.3.0 | 2 
        host-sentry-cli-1.57.0 | 2 
                 mesa3d-21.1.5 | 2 
            pkcs11-helper-1.26 | 2 
              tpm2-tools-4.3.2 | 2 
                  zeromq-4.3.4 | 2 
   brickd-ev3dev-stretch_1.2.1 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                harfbuzz-2.8.2 | 1 
                host-odb-2.4.0 | 1 
               libfuse3-3.10.4 | 1 
                libkrb5-1.18.3 | 1 
             libmediaart-1.9.4 | 1 
          libmodsecurity-3.0.5 | 1 
          modem-manager-1.16.6 | 1 
                    mpv-0.33.1 | 1 
                 openmpi-4.0.0 | 1 
                   p7zip-17.04 | 1 
               pulseview-0.4.2 | 1 
                    qemu-6.0.0 | 1 
                   seatd-0.5.0 | 1 
                snort3-3.1.6.0 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |  brickd-ev3dev-stretch_1.2.1   | NOK | http://autobuild.buildroot.net/results/f5220659affe19a7268a6e407bdbb5e88048f057 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8fc1f49b7e5195e903d234af965c7121993acec3 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f95846f236eea5720f2cb71b529ef41db914d199 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/05fadcfdbf7d29b97858285aab7e42b8ff307406 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7f7e4389f64872aa32d0fdb8dd0b55e36c6a3d8d |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6344dd4847f1dfd4860257353ca1a4d8d4628459 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f585490b943bf02e6d68886170c551f25313e4d6 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1af26131d8a34aa353e1cb4260a9ee21882d7365 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1dac878205e278f2063ea5bdb79ed82e4fbe4bea |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2a681841a6a7e79e5ad6357957fb882eb9928573 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/65a2a5388bfed5844cf53b5b7afba1e1f91f6a5d |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d4878bdcc93f72f4d6cd77164cba0795126defd5 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/15686641dc9b92fc806ecb1ebe2501270eddd105 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ad4fd3960d9bbde645905d752a88a63ba194569c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/405dcf4f4a01927d8ab5bc39d9ebb83b2052fbc2 |     
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/8be90568480e3d5873134954e0434b61221b2234 | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3ab15a8e16a929dfb2b99b371fa9838d4e137bf1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e78a68cfe68461a78a50ee41a0ed5f0923611b00 |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7b02318af8dbf03fc4300b685b6404cdaefba69f | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/79139c4592f451767b4b354069bc592974f700fa |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c3370ace82c68588d3e3e61b334ba7bf0ed78413 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/275d50afea7ef0f78b958cbe0400db1283791399 |     
    arc      |         libkrb5-1.18.3         | NOK | http://autobuild.buildroot.net/results/baf6a336dd850eb97b57098b00299f3c7ae9ab81 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/1837876d351b9fc42513cdc8337b4e1b7d2434fe |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/eb8c399fae3e3313e8ad6f3dc2d0f31619c441c8 |     
  powerpc    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/30ab790558ae15aa5e22d406075feb6c0a56ae64 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/186e5e8dcbf5cc61fa7ec77e8eefc28098a318d0 |     
   nios2     |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/3fee1b9296f3bf6c514e8eb6981c9a490a4a1441 |     
  riscv32    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8a80668643429ad2033ca5d40e262c94f74aa482 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e44f67cd07bd5a6f718a8e361ba108671d158aa1 | ORPH
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/fb61a47db9f045475a2917832068117b292753fc |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/7e6149aa729da189216a80df2e5d481d7ceba9e2 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/dec2ea756a93eec0caec3253cdf0f8f979a89ae8 |     
   sparc     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/91f72bf60eec4a99dca56d610994e9f68a3fa5d7 |     
   sparc     |          p7zip-17.04           | NOK | http://autobuild.buildroot.net/results/4e1a920d09528b87803cc2e7245a470c85548946 |     
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/0e0359234e525be194bea84b0b77266d6f0f1f23 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/1e8113d638fcb73538329511eeac9f5e7cb04d6a | ORPH
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/c5fea36cf04de7dee2fbf8dba0bcd0471967b05d |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9cf6049ebdcf7b5a2f0bdc7dd7f61839bc0e28fe |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/e514e6700294d06e78b541611665d7b9160557c9 |     
   x86_64    |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/0019eac13bfb17da853d42ff52d6b12aebd3d45b |     
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/7305a2fc1d46a151354cb1a997f3392e2b2a6c91 | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6508e06b7365ad28a56de00ae349f153828d3f27 | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/446ec680a46415de2c31ffb4fa82828a6d66403a |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/882013fba656dd490f2b9f5b3129f440b41bcb3f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7dcc259c6e5fe62b9bba2bcd344cc214839f18fa |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2a7ac5858c4a8a75bd84b59601dce432b806312a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cdc2a36d50b6fbf0fcc5f408862ace348a23c41a |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/133d7a036ab740cf89e56322e1a5de0ca7e35467 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                  exiv2-0.27.4 | 1 
monkey-f54856ce250c4e257354... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6f0932a1705632297956d6e402de27330ef33b7a |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0ed5a23176fd7ce1cfd671d10fe26b8cf6eaba70 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c7ab95b8d3c791cccc130ca16c48419a17f205fb |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/79bb88e631ec13de02c5259d567c432b81f52639 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2a282dbc020a884f5ad3f40deb9893a1df50ac5c |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                    efl-1.25.1 | 1 
                  exiv2-0.27.4 | 1 
                    ffmpeg-4.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/c8a672aad63a4cf67e404b281d0c4a9b08b93b77 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2d19b3921855e875d1b47a735f60c4c80acdf5da |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/349a9ed73ece3cccc56b9eef444b4c33ba7bbd18 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/353d89bf25b82dd01a263d6e4dccd5785e8abc35 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/caf21d353a1e8dfab1d4495f50dea381f35024e7 |     


Gitlab CI results for 2021-07-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175391  |      
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174680  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174583  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175024  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175026  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175028  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175030  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175034  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175035  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175037  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175040  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175042  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175044  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175047  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175048  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175050  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175051  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175055  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175058  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175062  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175064  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175065  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175066  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175067  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175069  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175071  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175073  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175078  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175079  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175082  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175083  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175084  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175086  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175089  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175092  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175093  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175095  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175096  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175099  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175100  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175102  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175103  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175107  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175109  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175110  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175113  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175116  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175117  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175119  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175122  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175126  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175127  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175130  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175133  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175135  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175138  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175140  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175142  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175143  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175145  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175147  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175150  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175151  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175155  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175158  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175160  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175161  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175163  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175164  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175167  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175170  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175173  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175175  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175179  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175182  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175185  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175190  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175193  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175197  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175201  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175205  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175209  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175215  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175216  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175217  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175220  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175224  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175226  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175229  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175233  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175237  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175239  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175243  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175245  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175247  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175249  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175253  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175255  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175257  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175258  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175262  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175266  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175267  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175269  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175272  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175274  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175275  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175280  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175281  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175282  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175285  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175286  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175288  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175289  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175290  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175292  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175294  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175295  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175297  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175299  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175300  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175302  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175304  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175305  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175306  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175309  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175310  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175311  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175313  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175314  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175316  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175318  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175320  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175322  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175323  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175327  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175328  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175329  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175332  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175333  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175334  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175337  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175339  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175340  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175343  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175344  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175345  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175349  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175350  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175351  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175352  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175355  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175358  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175360  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175364  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175365  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175367  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175368  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175370  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175371  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175374  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175376  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175378  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175379  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175380  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175381  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175383  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175385  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175386  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175387  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175388  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175390  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175010  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175012  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175013  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175015  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175017  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175018  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175020  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175022  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174686  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174644  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174650  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174630  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175003  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174780  | ORPH 
TestPythonPy2Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174868  | ORPH 
...thonPy2ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174914  | ORPH 
        TestPythonPy2Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174923  | ORPH 
     TestPythonPy2Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174927  | ORPH 
    TestPythonPy2Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174933  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174980  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174994  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174997  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451174999  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175001  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175006  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175007  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1451175008  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
