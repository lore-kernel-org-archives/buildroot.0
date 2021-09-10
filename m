Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A6BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:59:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB3B611BD
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CB3B611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12837400DD;
	Fri, 10 Sep 2021 06:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lgu1Tg2RJKoq; Fri, 10 Sep 2021 06:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99539400EE;
	Fri, 10 Sep 2021 06:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D27721BF4E4
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3AE8400EE
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ToTBJAn2malp for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 06:59:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6081E400DD
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 06:59:41 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7DFAF24000C
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 06:59:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Sep 2021 06:59:38 -0000
Message-Id: <20210910065943.C3AE8400EE@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-09
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

Autobuild statistics for 2021-09-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  | 33  |  0  | 61  |
  2021.05.x  | 26  | 25  |  0  | 51  |
  2021.08.x  | 64  |  6  |  0  | 70  |
    master   | 220 | 72  |  2  | 294 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.52 | 12
               libglib2-2.68.2 | 10
          refpolicy-2.20210203 | 10
              gnuradio-3.8.2.0 | 7 
                mono-6.12.0.90 | 4 
           python-pybind-2.6.1 | 3 
                  uhd-3.15.0.0 | 3 
                       unknown | 3 
                 apitrace-10.0 | 2 
                    ffmpeg-4.4 | 2 
  gobject-introspection-1.68.0 | 2 
                       mongodb | 2 
                  zeromq-4.3.4 | 2 
              asterisk-16.14.1 | 1 
                  autofs-5.1.7 | 1 
            erlang-jiffy-1.0.6 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-odb-2.4.0 | 1 
                    mpv-0.33.1 | 1 
                     mtd-2.1.3 | 1 
                  ndisc6-1.0.4 | 1 
                  ntp-4.2.8p15 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/a80037d6b8aa2844b393298cde96cca191dc71bb |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/d3de274c61b08180317558b2bc31726571fbb762 |     
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/9c735a99d067c1ca33e663cd1348924bedc75168 |     
    arc      |          autofs-5.1.7          | NOK | http://autobuild.buildroot.net/results/41c449f50d37f0007bb55234d8ba26b3fa6f9c02 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/cec74d848c9b3eb1b75d0b306343987dc27f9d9f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ef9050f2da77bb9a8af556cf14ed27428374e526 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0a5f1238738c0f53103028e31084d51109abaf79 |     
  riscv32    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/571996e16d1f99396d9801394bbada3f6897b366 |     
  riscv32    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/5b4786d190a186d8b3000985f5de9cd98bdf83aa |     
    arm      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/2dd7f20a65cab338c8081e269618c27fda7fd8ec |     
   x86_64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/18e59cd8156fd4a4ce5989a5f01cfefc03731cc2 |     
   x86_64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/7b46f51588144bca1d323230c378ce7f6ee999a8 |     
    mips     |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/ef768dae302d52b0cb11b8cb458ba86c4a28f0e7 |     
   xtensa    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/17b304bc4cc817452afd03ae19fa98bf40500fe1 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/c41198ddd4ab95d82a893870ceb28ae21c1c1608 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/681f4e9ecd5a0f4d71269afbd71ab5467ec3b56a | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/36ae5e1dfeb7ede9664c2841460753f39684d409 | ORPH
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3ac109ef464b74e857816d692079b87cbf010918 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7559845aee5d49b7eda6c08b224f7eef47905fb1 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c84c34a4c64f8e05f5f0de73b7278a8dbf7b2247 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/45c1d61bf8b9d4b306bf8d60a8280944a7cf6997 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3e73adb4f6bd597e638abdee873cd48bbc765167 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/70ad54043c0fbf8a0326b6393395f6d1614213f6 |     
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2bd678b8059ba5fc86e74a61140d36b5caa621b5 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3d810edfc95955421f129ee2cd47c8d51fc8d3fe |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3a04302f18bf7ca1c19d4e84859d5c083f63f93f |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3e3f785fd736166529b813d4faa892814fbd7d22 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f51e7f1927322afd8c5ada52ca1ee0bb3619c238 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d8a4b587c92f976c8388884a9cb19da4a0b60b3b |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/29e01bc857f7afaaa90de6b5a21f6d8584a8d75e | ORPH
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/e51f9e8134e403bba6ab7110d1f27d6adddd19d9 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/3aad0177a5db3f85ef33acb5ca52cd55f654ceba |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/66089d1dcff309f1d5a8ab2551b55082fbcaa66d |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/3aa00460b052d1b10392f915f1756bdf32fdf37b |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/756826f065544a2e33e73924686b3182ff96525f |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/bd222bf87129cc45d2a6606b7ee5713b621e27da |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/d39f64b55338029b96f6306ea7f82431860eb4b3 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/673dfc3ffd739d8399099e3d099048178eb3d3fc |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/fd8ca7f8fcb3b181b92d62b279ba86a3c5ff5b31 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/b218adb89b9aaf488ee1523e680102fc803e79ab |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/554a6e488af6d06a6a58e0a389d3d7b08371f863 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/4be5e8a2a46bc1f555638ea33068ab2ef9325739 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4081be6d749ad98b8ac11287fbe06c6e4425cee7 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/e030a161f432297517dfe5dbe031d887b8522c1d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b5b3f11a7b80e83ba203e60b0e3e2683c168a2bf |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/e32e87431ef7fe1d7ca86ecd6f5a1342c429d36b |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/34ac74f3ec775cc327effd827efd81be3c0d80cd |     
    mips     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/66dd277a4738ce907a4ae51f1cf4691959bb2b1c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a76f40a459554a8f55586548fab5c63962df8715 | ORPH
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/64cb3cf65d1872faec312e65f98e6f8ef2b2ae2e | ORPH
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/b846f775c37777e217c9590e3e42a611e3755aaa |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/9bd632cdebcde0dfa19a02ac76f76c129d651d4d |     
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/ecbe2ba0642652a7f5ad74c148f6f0734d96dcfb |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a20989584c37c9d4b2dc0c1790f6856107a5df9a |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7fb6ab005ab211b87175a3a829ec304d9f5a0627 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4efd0f5d95028863f1e58aa590cf9253467169ee |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0d1dd2e19c09dc95a7493c4786bd54c7575a10df |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f00b565f1ff492628a9fac985a25efac5cda07af |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4804e5305814099fe6956da16c4adde30748fd82 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2b546153ff8b9a11a5bb8475b918f220dd5b1787 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9dcd9c5c75943037d75e34f2818631a824368dde |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ae2ca8c5a4d436fc09fb828a6f1ea14477e5affd |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5c3fa11804d7b5e287ce3b92e00d81ad58842ed4 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/974651ad2d8b1b0504a4f39b82f506825505f0fc |     
    arc      | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/c50550ec0420f62ebedcc51036ea9c7a18458d25 |     
 aarch64_be  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/e1c49ef6c12aac9598b62c6687ebc798f8b20c8c |     
   xtensa    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/6e079b66376d1d2a5389ae65353196a108192315 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/54f5afd9cebcbaf4566d656e343d65974b21795e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/42044c3ce0ade8dfeb0f12cfbf50c161386c7c61 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/d4600dc3a618d49b274c85a53a74374a5cbc1224 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/705a6052a5b68bab20801a3770693b14710dc9ee |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/7fc8c809c31efda484a183ff2ffc432a7c6bcc23 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/804938a803e1642f5041f9fbaaee8d08b9f4af53 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/21896f6f66510c549ac87dc2b47f62af7dcf26bf |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 c-ares-1.17.2 | 24
                apparmor-3.0.1 | 1 
                    bird-2.0.7 | 1 
               cutelyst-2.11.0 | 1 
        glib-networking-2.66.0 | 1 
        host-sentry-cli-1.57.0 | 1 
    kf5-modemmanager-qt-5.47.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/45a9682dff7b8cc56720260d02d96b90ee5e2035 |     
  nds32le    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/848159a64c8aba0847e69b28d929a66db5c128ed |     
  sparc64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/472ff6f8071f549a4874b3fb761cad061ca2e434 | ORPH
    i586     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/011509522c2c6b95b28d46408d8f5e231ea90c75 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/9b340da2b2a1cced8714caffd8715cb1e0e2ca4b | ORPH
    sh4      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/5f38f180d572335f304e5d8967463cd755f2a068 | ORPH
microblazeel |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c94aca6de48fff58ec8901a24d36ce356f295b8e | ORPH
microblazeel |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/01bd0f42939781274b24182cc15754c731a9efb2 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/3f394bb723edd60a7e20f72d56acf534083d3eda | ORPH
powerpc64le  |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/34ed1f9c0428fce666240b3929b83348fe164e77 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/51cab2154bc4a25a420ef26c60583148d6b5e416 | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c6898436562a269138977e649c926ced927bf246 | ORPH
    mips     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/7bb114c1f6b615b051bf78de61377f872931a46e | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ad967b703c3805b83ca19600eaaeb9fa45c07619 | ORPH
  aarch64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/da6581045631986753c635efb85a2da40ab92689 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c33e25d55a14becd307a5cb4d27eb306556acb79 | ORPH
  mips64el   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/a03fd16a48e38be53f11ad841c8af4dc1a3802cd | ORPH
   mipsel    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ee4c02b7e11d0c28f2868273a89af4c0dc461ae7 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/fcd678210d83f597e14f15fbea45c4363e73dfc7 | ORPH
    m68k     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/1cae385eec2c279b52459ef1e5c027d368c42055 | ORPH
    or1k     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b83ea7d561a721f82ec16120cee64fc836e7dbce | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/82538f9233f98b103da604a5dd8676581ba34b5b | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/93998dd97f2b643381b22a4c8b38517a2a3e5c68 | ORPH
    sh4      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/14769a262e0348e912ac0a830a7b8967763124c5 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/15f1bb78ef027f87589223af2e2c32264df31972 | ORPH
   xtensa    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/e9468e33b2aa7af648a414e33c7398fc4c8ffb93 | ORPH
 aarch64_be  |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/d4927cc128e944c0ac75ee3083349c3d1140d6b2 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/9b60d65ae5dce4a713cbc9b10555ec5eace7aec8 | ORPH
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/138e9eca2d797a615e140b7ae8a8c2dc158903dd |     
   sparc     |   kf5-modemmanager-qt-5.47.0   | NOK | http://autobuild.buildroot.net/results/fa293d2f87c1d197825c03b86be87988324714df |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/e9d101f94c0e96bb108b864e5e8b4eb8cfcc4706 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4c8980071bc416f7f040464b7b10a69413553f1b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d0b42181f3ede99fbe1f38fadd5c1650a68f459c |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 c-ares-1.17.2 | 22
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
            qt5location-5.15.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/4d48694dd5c19ddfc2bdc9639bf26c3182678639 | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/fa291c64fa7b0c3f3c46b0c812be4fc5d93cee48 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/e57ddda2d47a8a39d2541b89106e0b66f913295e | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/3a95a6cc9d964a4d10adc2319c0e10626ff59d01 | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/2beea759c78191d9cd2f88d39fa65af2b70d8825 | ORPH
powerpc64le  |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/6d8903f9b91c27889a1cb84e64800d6d9796bc33 | ORPH
   s390x     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/3213a60499dceb471d6ef0a67dc0affa108cfd3c | ORPH
    m68k     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/00e55d594b9d6734b2814e44d374f972e11e9cad | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/3183e842aab8ce1ffd446184b6ceb313de4b7988 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/84cdf1c92b6774513ee8e04e5a01f6cf37145bf9 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/080c3fec309b0500b7d60ba100e38a4624da1461 | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b024c26c4297d907db54c7001c0d9b498ded54db | ORPH
microblazeel |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/13cd2b6a26f222d765ade6d2e55bc08af16e1c61 | ORPH
   sparc     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/5f94ec07726891368adea9598223e48d1eda5ee7 | ORPH
   mipsel    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/40f33e0124eb613984603ac971746e0f0b16bbad | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ea724b9dd49c11c666058bf59cbe50d418388c2f | ORPH
   mipsel    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/1e8d8188a50d74120fcf688f28fa2d4c3efa386b | ORPH
  mips64el   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/09d90ab445f029e136f97fccc87e36d32a0c42c3 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/af21bc51571e2d53428d6c5f306c33b0701771e4 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/47590d0750a079ab33eb7f98c0111c0dc406a760 | ORPH
microblazeel |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/635cccf85e7cbbb1cec21f3561fef7d8adc22820 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/bd1718a5ec9cc0526d662ca82d9107b027304410 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a3a6d2a433320b504bb1d15d5633cff7b1a5ea3e | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6b90ee530044fe4d92abf121c5c98a703dce3681 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/30852b0cf72e6851cadb9fe844129103987a04d0 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
                    ffmpeg-4.4 | 1 
                   gssdp-1.3.0 | 1 
            qt5location-5.15.2 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                    vlc-3.0.16 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/54f07de03fa46400ba4e7d265c8dafac73cbf9cc | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/81a8847a4e9413b856816fdc5d81dd0ae0c0a42a |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/f0006c64da7b0107fce3f321917b653ae6ba3e02 |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/536a6bfc85b4b147941cbb9e8bb87b69e8290a06 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/6383cbb1ed3d0618f1ce22df4a7b7e74fffcb727 |     
  riscv64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/7a969f22d54bb26f4652f9a5ae5ce8661e93bec3 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
