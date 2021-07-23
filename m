Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F62C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 05:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E1E260E8B
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 05:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E1E260E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47D9F40153;
	Fri, 23 Jul 2021 05:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDnoEVwgfMYt; Fri, 23 Jul 2021 05:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 572E14015E;
	Fri, 23 Jul 2021 05:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED58C1BF2F0
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 05:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA86440153
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 05:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgC7x4_mx9-7 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 05:59:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A09E40004
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 05:59:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E187E1C0005
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 05:59:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Jul 2021 05:59:07 -0000
Message-Id: <20210723055912.EA86440153@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-22
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

Autobuild statistics for 2021-07-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 13  |  7  |  0  | 20  |
  2021.05.x  | 16  |  3  |  0  | 19  |
    master   | 66  | 44  |  0  | 110 |

Classification of failures by reason for master
-----------------------------------------------

                    qemu-6.0.0 | 7 
              alsa-lib-1.2.5.1 | 3 
        host-sentry-cli-1.57.0 | 3 
                  exiv2-0.27.4 | 2 
                host-odb-2.4.0 | 2 
               libfuse3-3.10.4 | 2 
                 pixman-0.40.0 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
atest-895b0183a89c15f5e2305... | 1 
             bluez5_utils-5.60 | 1 
                 gerbera-1.8.2 | 1 
           gumbo-parser-0.10.1 | 1 
                harfbuzz-2.8.2 | 1 
host-gdb-arc-2020.09-releas... | 1 
          libmodsecurity-3.0.5 | 1 
                 mesa3d-21.1.5 | 1 
                    mpv-0.33.1 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
                      pdbg-3.3 | 1 
                     php-8.0.7 | 1 
                  polkit-0.116 | 1 
                qt5base-5.15.2 | 1 
                 samba4-4.14.4 | 1 
                   sdl2-2.0.14 | 1 
                  stunnel-5.58 | 1 
              tpm2-tools-4.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/7ea3222e87d4acf3690d5a74ad1b0507b89ae53d |     
    arm      |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/39aaa38c321d3cfa7766ca29b9c561d409cf7b61 |     
    arm      |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/a8fd791ba4c289cc4fc744a8ff9615bacd9558f3 |     
    arm      | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/e02f72bb5af131505ad391299b004a62842f955e |     
    arm      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/003968b25906579dbcf5a95d1e43fec0ab504ef5 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e52066d20ed9e77b5fb5bbaf60089ada20766451 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e675d346844f48f3efefbe100a6257eebcc216cb |     
    i686     |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/8b7fcf62a164d23666057102ece3f88f0c652d25 |     
    arm      |      gumbo-parser-0.10.1       | NOK | http://autobuild.buildroot.net/results/a94a6e1fd7ee07d92b246ddf38a83ed917084d86 |     
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/90ea037e1947d789c731c294a9f66c2708b07933 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/aa2faf98292c58af663422a7c05336e04dd7c754 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f17b65c296f9a129d59082649d863e6c5a9fe922 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d23e75bf0609d26bcad3e60b0a78b041e15fb09a | ORPH
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2cd7944f25e38696dcb32e893f7edaa3567a143f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8936eac8555ad8bbec9c9be7bdeee09bbc009d93 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fb47272083ec0a7f9e74376b08af122c31e7c43d |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/a272edebe9096004d3413eeb663e2c5756527ea0 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/9403716381f8c42eb189cba00692e221f0e73391 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c7e01580aee56e0b1773fd45ef63dc58c312f596 |     
    arm      |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/70fa456ff7eb7615be4e3a9eee90847843341866 |     
  riscv32    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/728297d792f904987790f5082405672e79362d79 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/750aa302fad8158970629b7c21b4ff2306cd6b07 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a8f949509512d050817fe329b19ecd1b78b4e978 |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/906bcd59437575236312e33469c2c9bb4e99e93b |     
  powerpc    |           php-8.0.7            | NOK | http://autobuild.buildroot.net/results/df0c7508927b7d6f1455bdb8c05d9b76e7752f73 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/26f45a1713c47be6bfbd5c6317c33a0e5c478ab7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e54526918ad4181d09b0f0a956edb1df1baa3725 |     
  aarch64    |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/549c54c61ddc77fcb84aea5f9cc1ae8dfe1d5a97 |     
    i586     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/10edeec42c620ebc631eb813307f602045bceb85 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/504a27a90da7e1b4071e8ab05256edbef497b06a |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/7cf57a3ebb986a5c32971ab9d2e2753c9bf29ce4 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a8fc77e406f5269a03265050859d028fa17cc992 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/42eabddbe01a9c740ef3c844f299658ae736e170 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/02eca3567ebec4b913422cff0aab63c3e02afb04 |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a4330d9c1fa7ac08fd4af065f95504259896778d |     
  sparc64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/24230242c15eb379d653c957a08621f8a1fac55e |     
    arm      |         samba4-4.14.4          | NOK | http://autobuild.buildroot.net/results/b9ed8be51a0eef77d6e48755861ae266c3b9f811 |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/47927ca2f28b0e181aa4c73a1b0d1542bf56d2bf |     
   x86_64    |          stunnel-5.58          | NOK | http://autobuild.buildroot.net/results/4b306a13f543bbabf3f01d882b3549e3d9961556 |     
   x86_64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/60c26f527049c73488e6d58d52aa968523c92891 | ORPH
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/23806a35cba9e4fa4ad53f5ab25b3840ddba2b42 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/93163c16707f94dd5645de173e3a38151a2ea3ea |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/279befb8f051459f110c43c297dbb2836d396cc7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1a402a1b75f9381cb03a8ad33d2938bfc9ae54bc |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 2 
        host-sentry-cli-1.57.0 | 2 
                libkrb5-1.18.3 | 1 
                 pixman-0.40.0 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/949c6ba76da9f0ba115cea1fe164ff269264ce88 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f830ff047cf8a883a7152f42d119e23e50f4d982 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/98c53ea14677301ba6e6e680ab123ebe8c76ba3a |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/562eb182426e3d27a8b69581641db4fb69e34ddf |     
  riscv32    |         libkrb5-1.18.3         | NOK | http://autobuild.buildroot.net/results/b0e65aa25b2fc9687c85ed041820a4ce1bee3e80 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1fc8fbcb4f490bc6ea14de7890c873aa2dba6c80 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/8acf5c5089d502916a232837f998aada7f5d491a |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 mesa3d-21.0.3 | 1 
   openvmtools-10.3.5-10430147 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/38e14dc53899a79a2baa223c8dc87309beeed329 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b88a95f612e325433f3f5754d471a693c44e0fd5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8dbce773f57558d10eb72b6eb20fc246a3660553 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
