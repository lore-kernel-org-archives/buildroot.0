Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC130C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:03:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F06E0610FD
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F06E0610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F38401B6;
	Sun, 12 Sep 2021 07:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zf0anUN1Wxx9; Sun, 12 Sep 2021 07:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA0C401D9;
	Sun, 12 Sep 2021 07:03:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 593A81BF5A6
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5325F6081E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxUGJB_1_r2W for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 07:03:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56757607FA
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:03:25 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AA9481BF213
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:03:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Sep 2021 07:03:22 -0000
Message-Id: <20210912070328.5325F6081E@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-11
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

Autobuild statistics for 2021-09-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  | 21  |  0  | 62  |
  2021.05.x  | 28  | 24  |  0  | 52  |
  2021.08.x  | 63  |  3  |  0  | 66  |
    master   | 197 | 95  |  1  | 293 |

Classification of failures by reason for master
-----------------------------------------------

               libglib2-2.68.2 | 15
                  uhd-3.15.0.0 | 13
              host-libcap-2.52 | 11
          refpolicy-2.20210203 | 9 
              gnuradio-3.8.2.0 | 6 
                mono-6.12.0.90 | 4 
                 apitrace-10.0 | 3 
            erlang-jiffy-1.0.6 | 3 
                    ffmpeg-4.4 | 3 
  gobject-introspection-1.68.0 | 3 
tvheadend-dbaa0f850394af8ab... | 3 
                  zeromq-4.3.4 | 3 
                host-odb-2.4.0 | 2 
               libtheora-1.1.1 | 2 
                  mupdf-1.18.0 | 2 
                  ntp-4.2.8p15 | 2 
               qt5webkit-5.9.1 | 2 
                apparmor-3.0.3 | 1 
                  autofs-5.1.7 | 1 
                  boost-1.77.0 | 1 
              containerd-1.4.4 | 1 
                 gerbera-1.8.2 | 1 
                harfbuzz-2.9.1 | 1 
                          llvm | 1 
              openjdk-16.0.1+9 | 1 
           python-pybind-2.6.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/81a5e1c6fe9580f0ed286caa3c1cee76e75862e3 |     
    arc      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/b8c0cb00f085143700e5f3b283d8623f32467111 |     
    arm      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/8cc5428129f9fb987095b2a601e5fabfe5d0f2be |     
   nios2     |         apparmor-3.0.3         | NOK | http://autobuild.buildroot.net/results/695f89f15601e6be5e82b68a0e92d7145a9ce757 |     
    arm      |          autofs-5.1.7          | NOK | http://autobuild.buildroot.net/results/9646fc9a7b5f8944b7403d03ff7495933242286d |     
    arm      |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/5650100636ceb6f309400a163f82676dec6c1319 |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/a2d93066538632ea4ffcc8fe40271b5c4451ca12 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/dd7cb4716b7d469175a51fe81bc221fbc4e702d7 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0981574402dcfd8cc9761492c4dc23675e88521a |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/515ea93489248b428f2f5efb8fb1ea304a293e03 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9061b8affa2adf54f56a188f2c92e9a35d38211c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ab17ae4bf3bbc490a8d9ae5883b88d5a8906720e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f08875d78b2df09b646cefc9b6fe3dbda13eb2d0 |     
  riscv64    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/7d69f4674229bc91feb93571a1b1d7021c9f15e8 |     
    arm      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/8c8ad76f84de0277eb116db90ad8e0d303df269a |     
microblazeel |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/a613002d846931018a3c6eb852d7b0c9f5cb1a2a |     
  aarch64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/0d923b9d798615f57d0e7cf9b2eef0f2c5e77a44 |     
   mipsel    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/2b8fc96941b18ac1e5dc4f402d84927245f866ec |     
  powerpc    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/1beb0a97e450fd67e10f7fc6e4b0b7b0d6ab4d5d |     
   xtensa    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/8d8638a22aea4880ec9263afd4a32e511cd21aef |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2847e9dcc3ae4d717ebef06abebd097d5a3c6175 | ORPH
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a0a052a33f053bc9619308d96c3d1fadafd573ca | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/37f65dc546f3ef544aa3a8094866d07d9cdc9e71 | ORPH
    arc      |         harfbuzz-2.9.1         | NOK | http://autobuild.buildroot.net/results/b167e65d019a5f9b8e99f83169a264a420c6be47 | ORPH
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/657e1927b7cc18633272942fd89583a3af60456a |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/405bf9367d694c18b7d11894277dc44ffdf251dc |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/289d21101a63171ecdafc7f8d058f708288caa38 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6e5c5ce21d04d480366d81be20a51654d985b773 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/fe2a7014b73275d852bfaa0315b7fd6051131b26 |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a4373332b33f37e9dbe89b3aa7934959c0dc8598 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4f9162dfb1e3fa8176728468a867b6c5498f8bab |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f1cc2eb6651d07884cd33dcc92af2bc22e324413 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/07edbd64ba6b5aa2a690b05ca52927d943df4e11 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6eb55ec28481f6d36d42055c837efb81cadcc577 |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7d6916810eddfa4d04b5f4910da5d201a24c9207 |     
    i586     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0003e03f39981faea197ce392fe13d5b12f3bc81 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f502f051150093bdf92fb5c7f256ef42d13bef82 | ORPH
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/d691b64fc50ebf1a8d6e6f55847c451708c2ba5d |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/2b1a758aa366a972bab2a96f5cda89873a7a7477 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/af9f971ab6d07597468d67b248e620f24fb39dd3 |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/2d7cd5a5bd94444c1bfeedebe3e8bacd90f6d419 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/40524d32f785b6bc3999cbc13255e74f89fdcc27 |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/b483ce9e4300a9a77b41fcaa18ae470ea8b21d3c |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/5fa13307fa3f7f3586a1cfac761c32a5bbc3cee8 |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/522036714ffc5ca1245d3a4837d4b8a11b3cd8f4 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/36095f8ccd6f9099347f330892daedf042d92029 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/43222ac873ce4149f413b454bba047afd4b20b04 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/04c4544f47875e49ba296d6ca5fbafe510aafb8a |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/f362714f6d5d186f96f0772aaddf91ceaf2f2d99 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/21f9c766416fc67efded7d14c2a9dac1e61b004d |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/9df2dde498340f31599471af4567fcd297daa05c |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/69e7fd01b964e3fccf4ba536cbefb0d6251a6b46 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/79ecaa55e5cd7ef89cd467bc5303547140528d37 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/13af9a2a578ee221d25cfb34b6e2581f99b1e571 | ORPH
  aarch64    |              llvm              | TIM | http://autobuild.buildroot.net/results/9bc7b61e3a31ae9c84bcc7416b9c7d2a612ae059 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/3b5bd54d23901f62a6e4e0229715a57f03dff5b2 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/09611d953cda989edc5eb45f9cc393cd91009b4e |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9921aed6573463920d5ffec70b2079ba9e6375a1 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/2a28e898fac07a2b7b8fa516b477d1e474bccbad |     
   mipsel    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/dfa364108bd3c53deb70b5b4c097e65dcfc0b696 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/af34ac5881da1a7d268d220aa40d2172460c5ece |     
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c42141261c5d6b4ecd69b7bdbe72357835013f3b | ORPH
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/66eae4a7375f547474b720ee7dbaf7301a27ca75 | ORPH
  aarch64    |        openjdk-16.0.1+9        | NOK | http://autobuild.buildroot.net/results/7072308d148ccb8237180729551df65c87a76f11 |     
   xtensa    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/1a6b83a5b227d1665a498d72af982df6ffe45059 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/e3b9f7273aa73fc24073cd7c3d587396a17f82ec |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/ff20e4bcfb6e42328ffee85acaeb7727fe0b5ecf |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/37248611649a07f5d3863706151b6b25fea18336 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/adc6242b6ef0a7486ed4300a48b99745dd209f7a |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/04cf44e2de33ed571faa631b19ca686153890d59 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/be8da8ec8a71c8a11440c0b7d71266a07b049b2c |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/788c3122630e4696bce9ad8b5044731524bb30de |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/73fc2c9e3cf879f22d705cdea15e2b0806c05f39 |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2a3ba42cea3f52e7d99d4483ca7db94a5f3851f7 |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/413f97ee055178094ecbe5edc2e9c70d1bcaa347 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1e94e70e03909b8bd3c11696a9939d8fe864c15f |     
   x86_64    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/0d393c155c274bab363fd8e0ae523971c987193b |     
  powerpc    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/edc917df771bcc3f550e053de6c17ea89cc36189 |     
microblazeel | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/881175d4b0c7e6b56d6ed03e587338568a8956a7 |     
    m68k     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/6b07411b2db2571ef29862b15e85c9711b41013d |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/86629bd477ecd3232fb697b1c1d21b2385d3731d |     
   xtensa    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/7bbe24513303c32f8af49e5fb337386d71191926 |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/88d4c3fdf97a3378ecfb044ffcc819d36da0e8db |     
powerpc64le  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/766befac552e61083e34218153c730f60d34f157 |     
  powerpc    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/59f87be0f1b826b61e32d2eca96e894ccc8b22ed |     
  riscv32    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b8294e16ded556d84677ade70bcc91f20cc9b0d8 |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0fd1157cef156fac459020a82d884e78b4a9bbf5 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/1454f699b5a605923a698332d8c93e340009f6c6 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/cf2be21eeaef2768fd2652ac5b8ee617a1274fe6 |     
    sh4      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/c1455095a4ff1ca1453f873702b8c37c1262d2f0 |     
   xtensa    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d0f926e36345178cf419f03afc16c64fd90ef3e2 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/13b0f312755b0f145033a36261906059654d1d8c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/75221f70730e20a6ce28f21f7e3834d074bf3583 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2bec4cf1c66c21b36d36457e568ccf094f614316 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ef831d2de5477ddb1f0aba82e67e6b07b1e83dab |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f1e0238104cd356d0aa8abd1534d4f9e94fff8f5 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 c-ares-1.17.2 | 14
                  ndisc6-1.0.4 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9c9994c2d5c05fdce49cc4fe92554e1a3f1f983a |     
    i586     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/f8e8d20100eb1fdc050cfed12840c7fe740b5bd7 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/47cc1c2d0140b829b933ebb864e2f48602535807 | ORPH
    i686     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c06cceaa72dfc5e4aee546205004167889dfbede | ORPH
 powerpc64   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b47de5a3b152cc98856e2d9267fb50cc325a3802 | ORPH
  aarch64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/5e89f64dd3cc8e7df6c44a595adecc9501a30176 | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b7eb64bcbba82d6c75b40d64f7f19735e847111d | ORPH
 powerpc64   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ace8e5e3dfcf162088952282782d05fc78f2e5c8 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/0b3147f2521866b3db3b5a6cf4cc880e72c78d09 | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/12afe77237c9609658133682c08eaec24719bff5 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/7009c342fff556ea70bc7e4c615851c472336db5 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/5b656878a64e33d20bedfc9f1f5b928b5c5c56ee | ORPH
  aarch64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/2d39ac351d4de23e0301ff2de92df5bce87ea37f | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/600336582d7b1a9300b19d613d7fd74f98fa5f28 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/d8f26ef01663d1738cf5c8a4f0dc6bdef7b6c724 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e7b2a322537f2a83931d91d022c08b0cdea0bd9b | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/07eed17729381062ed4e6a5ee4eb21c8551aa9f6 | ORPH
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/678a7c299a84666c030ccd3fd69dba73d0b5a326 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2701dcda58a38975c9c550ffc6128417309d0231 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/c2405016a771f1bb077d45f1fab9468b4fd8d01c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7964f62818e7e7d5012f32ac6ee6a19a4edc024f |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 c-ares-1.17.2 | 19
                  zeromq-4.3.4 | 2 
          libmodsecurity-3.0.5 | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/4e63f6f8ff322af135c7226bfdf0779709d8f6f1 | ORPH
    or1k     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/d3f3ed58225165ccea844b5796ca9a78b153772d | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/2a121f55ef8a25d8ee4f397007c9ae4747ac54da | ORPH
 powerpc64   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/7a50d685501e07f081704123ae2619d8749c6a04 | ORPH
  mips64el   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/122e6494a7218e1ff720e988b4cab8c1fd02977f | ORPH
   xtensa    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/fdfc622b5dd47960f29f9287cce5f6fcf611290e | ORPH
    i586     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/f57c4bf831379c24f1ed66393ae728eedc5e218a | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/39b233c33af9d99be7f9fbcac13771b43eb041e0 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/db3a844c9d09f1fcbc3eef1dbafc669e8bf3751b | ORPH
    i686     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/3e48e13b81ed69467d1141691ac6e19bb6f5befd | ORPH
    i686     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/41a59323ada69036cb6c7bd1af31937270584205 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/2de351753df1ff405127e09f137bdd0c6818e561 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c7d7e723a80e43b4be387859de22f60d74d585ab | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/27a03030af44bfff946abd3ef2780b44c97b3057 | ORPH
  mips64el   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/536f2a74b095304f38479da8448c87a2ce787fae | ORPH
   mipsel    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b2afcdabeaabd884eeee40c66003abe391629fe9 | ORPH
    i686     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/73b3fb23ffb5003853f6db0cba68c4a6fe07eb18 | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/aa2805f34ef03c02ab35d2bf903004bee1af0b34 | ORPH
  aarch64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ded38a36d13ca3ff99e7ff0cef0966c22906707a | ORPH
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/12090b374f05d1479507659a0d1126cd2fb0068a |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/4eddda0b1fc947908baf915e9895f5f63cb94fb1 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/66df3aa6e04adef9387e231dbcd62af0b167472f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1e42aa8c1655502217cae18c69b158c5216fbe6e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/78dc98fabfd5fbf815ff75586f48f799a4e6b0be |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

  gobject-introspection-1.68.0 | 1 
            qt5location-5.15.2 | 1 
                  udisks-2.9.3 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/05bc289b236a58f575e1afd706c277725f413864 | ORPH
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/33f0f02914d55852b0b5ecd35c7f40f417fc4484 |     
microblazeel |          udisks-2.9.3          | NOK | http://autobuild.buildroot.net/results/3d7a81f752409822907534e54422a0d54b39a99a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
