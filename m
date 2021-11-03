Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83573C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 06:53:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611DB6115B
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 06:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 611DB6115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E31B80BB2;
	Wed,  3 Nov 2021 06:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYnK3JUF-t9T; Wed,  3 Nov 2021 06:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E422F80BD4;
	Wed,  3 Nov 2021 06:53:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51AD11BF2F2
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 06:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40626608ED
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 06:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lBNeix10V3x for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 06:53:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54FF6608EC
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 06:53:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7E45F1C000D
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 06:53:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 03 Nov 2021 06:53:47 -0000
Message-Id: <20211103065352.40626608ED@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-02
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

Autobuild statistics for 2021-11-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 40  |  8  |  0  | 48  |
  2021.08.x  | 35  |  6  |  0  | 41  |
    master   | 42  | 89  |  0  | 131 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 32
                tpm2-tss-3.1.0 | 14
                  boinc-7.18.1 | 10
              tinydtls-0.9-rc1 | 6 
                    olsr-0.9.8 | 5 
             transmission-3.00 | 4 
              host-erlang-22.2 | 3 
                       unknown | 3 
libdbi-88b8477d57153b9f736d... | 2 
                  vim-8.2.3565 | 2 
                    bird-2.0.8 | 1 
                 diffutils-3.8 | 1 
                      gdb-10.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
               host-ruby-3.0.2 | 1 
                   iperf-2.1.4 | 1 
               libtheora-1.1.1 | 1 
       python-matplotlib-3.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/43620bebb024a3c26ff2bb597ec9abfaf3ce8ae4 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/25a5948ad4501cb2c93f52046532ba594d9ecb0d |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/11675e0e58ba768d194f03ba6426b63d8d2fb846 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/0423d6e20618941a4cf4b1817adfd9d1fe8c3e86 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/d9607dab93be112514ea0d3b1f2a11ecc43ee203 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/50fda9d3a36cd2530303fbfeb7efe011caace2fe |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/ca3a0fcf62c2e375330980167741d2490f87abdb |     
  riscv32    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/75511fd79a65c6c10dda1f72c60a50be45d2d3b6 |     
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/9779d80481f64e0f21777d0ff4125220cd986fe6 |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2592db43111089e51e4110067885b59100f6ff89 |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/05c224b4d1a4fbfabfcccdb075c074f9bb73d55b |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/fedfe28d5e9c8549ab439dd209cb44dc2a4c2e86 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e44d52b93c373a6121c5fd77153de36e1b3fe98b |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/833535e7bc469f9765026270e14779df9d2f7b7c |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0f1f3e1d339cef8b54003b1441d6c9510bacaf4c |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/227bc7a64c5c433d7e7c8c94cba2092df28fad7e |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/00bf1b3ba7c2dda2ff97d18c231a44c152f4ff6d |     
   nios2     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/345efc4979c7036e5651bb30ca42f42bb83a3556 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c899a2ed5aee3a124b93afbce225dc81a38eef4b |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/86e876dc45f6c12cd783f1896dc8f8f82829c53e |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b5a436f5099b2b9fe4b372da6fb550737ca63520 |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/76f7ee6b905b7e5c313bd926c3dc0f6f7088df35 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1b49ccf1437045644180ca9eb9595ca64c985af6 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e772886abebd39ab5c08b82206f07f64de524579 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ff1de5049577b6f463bbe1b86d5675c80168b1e1 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/53c0d203d28d5e8c05483d167445c53aa5c0676b |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/87b31826836210fe0656396fe5fbc1ca68f71aba |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0e436971e4d98fc8806679982aa7284ab18a54b9 |     
    or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/857d954112f02bc13b5e74f32011fb364e96c244 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d54b43d85f14a081747e9ad346ceaa32d279328c |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/10e6c665f9332ea53f449c9c57a03d48984a4719 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1d98085a5021e49487e115f8c7f0fb72871ab83d |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/da37ea965e4a54bf5f04eaf90062bf27e6b6a9a6 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a340961c19097f5a01aacf138bdd9046a48fe6c9 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6d2ccec2f985d8fb11671092d1f311fbca761423 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e7a99c5dd7fed71297245d44ed5bdc7abb400f09 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/02f01957ea335d8c9736304b2d410c6b5aaa9d46 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/edd2abe6b8263056364d480807388f205c64c11e |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0a9c969269a9f28eb3087de5d0450e59eb2dc1b7 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/22034e5107ae4a1f32a463e5698359e62bb40f52 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a8e12ba57dd26f0cc16898ce19ada75876152fc3 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/668ce47527bbf6b782c2608d0eb74d52293fed51 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/901c1feffba20461bf8dcc9757abf40d4d2c0a92 |     
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/6046a797472a859f6eeaf6b1d33737954b0ac20d | ORPH
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/cb92e80814e7e3137b883cd45f42ef4314ef17d2 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/083bd0ac15b4a0eb8fca5183d9e1dfa9a22ff1b4 | ORPH
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a404e1aabcf217b4e9c0d6d2600deb7e8a3953b8 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/539cb716c89036775a561bdb57664b8e09d1dadb |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4955328167077e8b295c840ab0236e78cc70a703 |     
 powerpc64   |        host-ruby-3.0.2         | NOK | http://autobuild.buildroot.net/results/c8e35273a41e662692fa633044a4b5efee4c024b |     
    arm      |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/bc830b46a390124a4c8f33f26010715c5f603643 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/410999a7e788234a05073d3a94eca87b5ccb6663 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/f479cb5a560f01733a73cc40d63c67e456bbc825 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/2866209150eaf8ac3e6bb36d4d9a2eeed5f786b4 | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/37f0a82d5b601e799e24ee1054924338b3792784 | ORPH
   xtensa    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1dc397c2adadd533837e6f4d50412c5afed68570 | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/23d15974faa7408004365e51659028b6399060cc | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/cb85f11b8cd4a4c681b76281d67cdfb2e29d4bf9 | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/dc02e71021d1fd8e0a4a07491e9a0d7fdc15c0a4 | ORPH
   mipsel    |    python-matplotlib-3.4.3     | NOK | http://autobuild.buildroot.net/results/65c86df1dabec956ca032fb36cab15965bc074df |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1d35191455a3037d0862999f7f2cc4e53e1e3352 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9444ec09a6d323383b0274ec1f5a1fb8a176d7e1 |     
  riscv32    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/db1d123a1c83cf218fb2ac4581399abda8b0fe7b |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/306d694b9a8fcf4f4c23aaf746eca26ea151909c |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/41025d8df8df7c46d1ad358762c7309848c68537 |     
    i586     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ae62ab2bd1038d5c1176dcc476158814d854b939 |     
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8af89e58bd4d8a37af78e5fa4403d0f0d9d2c98c | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/244d5d796b2ec34dd1baf5740e3601393849070a | ORPH
powerpc64le  |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ef29c85e502788412fbe11fdb68736957d4a0bdc | ORPH
powerpc64le  |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f6838ba48ba9337ecedfb51167f4609b2b04505f | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/69d0a777e2c0e3ae8d6d63522169f385bcf99d7d | ORPH
   s390x     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ef85ab7f7754d65b99ab775ed402c413dc266e50 | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/94b93a790df7b6ea71c214c3a533a73d9b896252 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f405cff75f40228374a3436e16b21a41958cdf99 | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/88fe35750df1cf7334ee705953c0c553fad5287d | ORPH
    sh4      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/5e72ce80d52049c5b6494599db5f8af89b4a8ba3 | ORPH
 powerpc64   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/19bd0e0720dc91184fe1b425bf238e8dbd9627e7 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/5699033107bdf2673259450b3098b05c1650e5d0 | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/9535e446a1a35b8e81e3e5db2e22cf978ded5cf4 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/de396d772b394144019f5e6f61204652651a8e36 | ORPH
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/a488564f63cd7f02786500456204b938b64766fa |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/a0f1e7e2867eef54b75301925a4ba388e495da1a |     
  aarch64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/2bd05617aeb4b0c7de4fb7ef97ec170928da8e0b |     
    sh4      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/a571dfdf6fd725262998a35d5f1a9ea7830e222c |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/aea8ab0d08c03a60a870ed11d4927b44006e881c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/80887f62d5ad89d26be934d2c3fe06f1c39b1d9a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1ab2a4b0166719cf109399f50e81b0f75e1093b8 |     
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/950e838cc0eb1f09a1a597520fe3727ef14f64af | ORPH
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/d0ca759c391ea22dbb64a42fc9633e17e42161dc | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  vim-8.2.3565 | 2 
        host-sentry-cli-1.57.0 | 1 
             kismet-2020-12-R3 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                 openal-1.20.1 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2fd6505a5ffb3758e476611eb5fce02646903e32 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/fff36c5033e3ef6ad3fe6b813398e21249608c48 | ORPH
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/665853b8c8dffed5c5d843980e1b90624a9e6303 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/0771d5e5451eb060d232a56358f03e0ce429bebb |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2cea6fe41b7f43ddc7bc851c62a75e477c58d47a |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/040d24bd9d35e63d19c9bf0bcce0657fccf1e1d5 |     
    arm      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/114e2f922df2b388027c423f5a1086eaf8faf8df | ORPH
    arm      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/3c22f2b4d41c27ad9ae49709e95270dd0350cd00 | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

docker-proxy-55685ba49593e6... | 1 
                 mesa3d-21.1.6 | 1 
                     mtd-2.1.3 | 1 
                  ndisc6-1.0.4 | 1 
                    olsr-0.9.8 | 1 
                   poco-1.10.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/6e8caa053c29bd02cc718813a2191b379599662d |     
    mips     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/fd97c93fc84a89b7c2a4c6205d89bc390c64902f |     
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/10da213b6e3057385a6f9d2df346a06c04dfe690 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1dee4f91c6db742faed8c164969ec29e574d9f0c | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c83877ba48e0e534bde5f7259709d11b83e9ce4d | ORPH
    i686     |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/0dd6d234d970f9741e44c6c9c0ea24977d11d262 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
