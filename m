Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76B4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 07:11:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B4560F56
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 07:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28B4560F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCD2B40151;
	Thu, 23 Sep 2021 07:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egjXTEas45sJ; Thu, 23 Sep 2021 07:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EBC3406F9;
	Thu, 23 Sep 2021 07:11:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61ABD1BF342
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 07:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A899406F1
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 07:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOxz1RJEmNm7 for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 07:11:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE4A440151
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 07:11:24 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 788251C0010
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 07:11:21 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Sep 2021 07:11:21 -0000
Message-Id: <20210923071127.5A899406F1@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-22
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

Autobuild statistics for 2021-09-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 44  |  9  |  0  | 53  |
  2021.05.x  | 43  |  7  |  1  | 51  |
  2021.08.x  | 48  |  3  |  2  | 53  |
    master   | 172 | 103 |  2  | 277 |

Classification of failures by reason for master
-----------------------------------------------

                liblinear-2.43 | 41
 Makefile:740: target-finalize | 9 
                 diffutils-3.8 | 7 
              host-libcap-2.52 | 6 
                   gstd-0.13.0 | 5 
                      iwd-1.17 | 4 
              gnuradio-3.8.2.0 | 3 
                  ntp-4.2.8p15 | 3 
          refpolicy-2.20210908 | 3 
                       unknown | 3 
                    ffmpeg-4.4 | 2 
                      gdb-10.2 | 2 
                       mongodb | 2 
                  uhd-3.15.0.0 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
docker-proxy-55685ba49593e6... | 1 
            erlang-jiffy-1.0.6 | 1 
                 gerbera-1.9.1 | 1 
               linux-pam-1.5.1 | 1 
                     nmap-7.91 | 1 
                 openal-1.21.1 | 1 
                oprofile-1.4.0 | 1 
           python-pybind-2.6.1 | 1 
            qt5location-5.15.2 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/47e4495164322bcd6317fefd87114f2f6e0feeb8 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e91d0b9889aabb4c12581deff0d7d125c6514cbc |     
   x86_64    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/a023625838e401becae1527e597adc0335f722bb | ORPH
   x86_64    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/e7fdc267992f5145972f5662644b2e50c2171962 | ORPH
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/6ec4c6821f058d897f000592505e73402961d18f | ORPH
   x86_64    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/e2b19638a64363cc6c799eeece5b6c9db18b2cd9 | ORPH
    or1k     |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/20e6086fcae4b0801343b1a9659fe2f068bdebdc | ORPH
   x86_64    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/1436131bb23872960812202aa21c50d3f0a26388 | ORPH
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/75aee5373ab73229eb7444c702985a883946e9ff | ORPH
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/1e3fea1d69cd6ff2e987ff56c3bc9b2a529a7713 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1236e3a8c7c735ce6ef2eded424beda54544a60f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/51dc376d823037a0146401bc4fa883a1d7ad7f85 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/eaa3039f0bdf2619ca8eee30f330d6840554cd77 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/75ffdd03f1510435c20e6d73334d56d333182fc0 | ORPH
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/9c921489b50a271c3ea63aa79ad36d5cb609c337 | ORPH
   xtensa    |         gerbera-1.9.1          | NOK | http://autobuild.buildroot.net/results/e1cb027e04dbd464e78c0f99493963167ea62c1d |     
  mips64el   |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/429b0680f08b62a53103dfa37843dcf519023a08 |     
  riscv32    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/e4a488c25277b9adcfb21203b817512011629f50 |     
  riscv64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/683399b547ac9816bb0b28c0c6ddaeeba87c82c9 |     
    arc      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/d4e1c60ec8c24423313b0605f5d0d97c1e3f2967 |     
    arc      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/69ea881bbe98bf09fa5b9e1c30c26fe5bb8b21fe |     
  riscv64    |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/8b1adbcf27665b9a9a551a363b3c7c8e94c7d37b |     
    arc      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/9921511e9214dcb45aa84b1f67c9eec08a13545f |     
microblazeel |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/0deae5a0a540d7eb0cb0960cfde3f1d40bde08eb |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2917d5c62ef1ddd77df96ee3436875081bf4800f |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8ce281ce4be49071abd460dd16104aa7c03906f5 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/dfe8232bc2e64019b76b9a040348eebf299b52ba |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ac1eb607d77fddbdbceeeb0500f9aa507f87d96f |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/400535badeb06c6b2d05cc3976591237b1a7641c |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f29d04393c06ed064375f648bc10917cc0d84e0b |     
  riscv64    |            iwd-1.17            | NOK | http://autobuild.buildroot.net/results/e5f5ccbb9a86d3389ff52d2e9579cbd3ffbf208a |     
   xtensa    |            iwd-1.17            | NOK | http://autobuild.buildroot.net/results/8c6f6961829af0f8477fe38f85e0ce5515a55923 |     
    arm      |            iwd-1.17            | NOK | http://autobuild.buildroot.net/results/1982e70019cf31e6481637ca7a0b2b5bc3bdbb28 |     
   xtensa    |            iwd-1.17            | NOK | http://autobuild.buildroot.net/results/c8c3c4f6e196954148d1f12fb224dd860daeee79 |     
   sparc     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/b9309e30ef7149c65b4b5921edcc846a5bbde816 |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/be7c93aeb1d27ffdc270ff6aa9bc40a612173e28 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/c7e025ea20678bb20c3b96888a5e839da6281364 |     
   sparc     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/14be7fcd508eb791be73de00d0aa1103d09d038f |     
    i686     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/1f66e2eee073f5d4779f54a24e0c33e39be93b98 |     
  riscv32    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/33ca554251ee3043921b0bfa1612b75ad8482297 |     
 powerpc64   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/423b09d33596e8bdc058071063ac2118c3915e67 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/fbd499f2a9fe76919f3bbe3ff3bd8b7510a177ea |     
powerpc64le  |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/8f151af66295a9e29ee511bd982ccd25c029ee42 |     
   x86_64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/e976a3daecc7b408444d6fffe15d925fb6cf1915 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/03e581925d35d3a7fd7fba2b4afbfaf708765725 |     
  riscv32    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/3250a66f352dcec7e0fb4f841c6e658ee0b33051 |     
 aarch64_be  |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/469230fc9bf7716741498a9942f17ed549d43608 |     
   mipsel    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/e5e611c32bfcb43c308d77b0d9197abe09bcecbb |     
    sh4      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/dcb4a8813680ba57e2ce08a5387399432aaccfe4 |     
    i586     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/854a83c0db9123874913a763b6395dddd0c63ca2 |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/cf117d98ed45435dde370bb7ea6715c39e9211c8 |     
    arm      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/36c5fb590f4c40671448f1d9ad809cf00e90ab90 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/375cac6f259a718922fe20f9cb5097bb9b993471 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/eb3ecf7a4df62c4e27092ef4fcf9f14b2df30f33 |     
  aarch64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/adeea12029e871f052c0b74d583ca6462e97b654 |     
 powerpc64   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/852339bab4a6ba70385768c1ffe3120f68f2cbab |     
    sh4      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/1d689e47061b0b3d88c4588b08e07c4e3408c992 |     
   mipsel    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/2243ffb741954211d6f5d0e4b581b0a7b06df4f9 |     
    m68k     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/85bc93a2fa3aba3f875b91d9abe3f61b09a7ff5c |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/a39121ac77ab7ed0321ebd636fb10e3874e93924 |     
    arm      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/d55c93842727b454224269229618c8bdb488cec2 |     
  sparc64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/be0028248f4aad5f58bb03c0598c53f9feddb706 |     
   mipsel    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/9ce4d2a4e197602cbc7f36f0b5a2b8f40a5e81bd |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/8d4b3eb23599f98103d3e56c7afd81d32ba59ab9 |     
    arm      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/aa260d80a741eb6bd2154639628578d2463159e1 |     
   mipsel    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/02cd8e90fecf7b3bac1a79e5d373c8e442f6f773 |     
   x86_64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/da0f01f9d739a9fd996d6c6059efb7c4e11f22fb |     
   s390x     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/217a25e133644b8e351b114c7b2af73e49f84161 |     
powerpc64le  |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/aeaad156c113bd0bc4d7d13faaad40380b65d688 |     
powerpc64le  |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/e1678f93dc694d6aebc523d7a91ac0d6ef7f3f35 |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/ea14e8e3950351234bcce18ab3fa1644b7890c8f |     
   s390x     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/a39f3f0e435c61acc9aae9227414742d2974ee85 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/08d5a33fa976288ec216bd48f103d02f4273d3b8 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/5c7f8406655d0000963a4d337d439482b96c0b2b |     
  sparc64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/97c2a3babe8f9df7cda069858f13e3be2508cf40 |     
   x86_64    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/448ed9e69b4cb3c462cc22fffb5fd5691137ba08 | ORPH
    arc      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/5774c6237b72b6f5e005bb5b229c078235ff2741 |     
  aarch64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/8b8ca1421b40f36717cf96be3ff4e21ee6cca293 |     
    sh4      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/2825f840d5da012adbeb3474f7518f784c5b9f81 |     
 powerpc64   | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/9029515feb9dd6a7be2b2d2fc4610f46ba617473 |     
  powerpc    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/a9f4074912a59d2c82457074b062468ddfe4069b |     
   x86_64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/06a389301b6f3e33fb49ecd6ae395c81f9117d2a |     
  riscv64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/217157f4dd9fd56d0a13d47e6373f4c478f26757 |     
  riscv32    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/175c2dd82dd305ed88b4d1780bd8c52e4f651de5 |     
    arm      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/07bbab9be3481b4ebfca1b946cd55961fa69b87d |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/818778179845b3c0cbb283f8968b5bdbf944f691 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/a83223ba65d72710c30efe0622c6af00ca40c090 |     
    i686     |           nmap-7.91            | NOK | http://autobuild.buildroot.net/results/53034d8dd506bc033dc92343f9a37cd4ac8b2142 | ORPH
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/343134fd53c7d6a1df7e0e65802e3544400ced5b | ORPH
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/aad170c8dac45b443751de4dffbdfab2a082f131 | ORPH
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/189db8233c1128907b8aa7076a74e313c4873df6 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/868e2db9b4d5e591c808dd5202403f2155ccf4c3 |     
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/0e1d16dfbb455a08db80ac5d35613908c3b4163f |     
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/89b8cbc706018e4faf5e4a2f2ea472bad7b1916e |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/deddecccf68835aa924cb694dcab0374c00e01d6 |     
    i686     |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/77fd9400449c66da51cb67917eb83541049b8afd |     
microblazeel |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/eb6b7e3edeaa948895fe2253bb336436e61676ad |     
    arc      |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/a4223accc6adb70b06fd4e74ca4f28484446b6fa |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f8673afbf9fa011fb5af8756616b7f5f69b74d1a |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/6a1b48dbf3cdb70479967f1c91e640d86a050f70 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/aeaf64c4c63da737e0d5321c6cac82823aaed5a4 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c8c0198b82b45bf8b7db476183bc8bcad10188ba |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/0f997c0e5bcb164339a2b714106e07360d7bc266 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/eb341df880beaa0d1cf0a229b14318652d575d7a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1772e7458118024a5ff758b8bce71e74127e4041 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  gensio-2.2.3 | 1 
  gobject-introspection-1.64.1 | 1 
            qt5location-5.15.2 | 1 
      qt5webkit-examples-5.9.1 | 1 
                    rauc-1.5.1 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/09b3b151ca3fb6d4866d1410b5f94ce8bb6aead6 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/c32412f214aba1579c347f561a0afd2f811d2923 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/72d9d2c550c61df050de0b16be2556a3d5bbad4b |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/af948e0f693ffa707204ad55a979a551bb31b2e5 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/22c65274457a2755fe424e6196eca201607a0abb |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/4e3d4b772bb2928e554258720d6ba1dda480aa7a |     
  aarch64    |    qt5webkit-examples-5.9.1    | NOK | http://autobuild.buildroot.net/results/a10944c9b600124eaac38893a76e11ead4d6cdd7 |     
  riscv32    |           rauc-1.5.1           | NOK | http://autobuild.buildroot.net/results/9187d1e8ebae310f7a08e941dc0af43df96fb86e |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/3238f2c2dd56f818b214a5588adbcb7e94f610a9 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                host-odb-2.4.0 | 1 
                       mongodb | 1 
                 openal-1.20.1 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e3560c91b67627457848c19ce9d5857f69f42244 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c5893ca9fcbda32a4820668cd560b799e1e242a9 |     
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a4f436e991e2ab93c1fe3d4eb703bf591a25549e | ORPH
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ae7804a85bb27a8fe646a56976196c94d7c1ffda |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4eed53931bbead6100dceb5329534b89427da38c |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/4f97cfe69bb434323c919601a4a3ab713f53478a |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/0be24453e34b49f170d1557ca67fd83759b903f0 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/85e4c80e55a6ed56ef20746d922d11898ac816ea |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            docker-cli-20.10.7 | 1 
                          llvm | 1 
                       mongodb | 1 
                  ndisc6-1.0.4 | 1 
            qt5location-5.15.2 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/f8b2ef080c43e697a0c8c5da8c73186e77e662d6 |     
   x86_64    |              llvm              | TIM | http://autobuild.buildroot.net/results/83e8aee5f72dee18b883569e9e66979fa04b51e2 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/4b44a99f1ce8a81f8a12166ebf512954a0b6b2e5 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/27180f0c430fe9319c4449d7df820c061c8883c4 | ORPH
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/23fc59767d580a9750b3f62a116c1df966bc73c4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
