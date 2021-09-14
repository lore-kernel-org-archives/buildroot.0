Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CC4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 07:06:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4EE761163
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 07:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4EE761163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AB504016A;
	Tue, 14 Sep 2021 07:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwM4-dcV_soE; Tue, 14 Sep 2021 07:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68BB540215;
	Tue, 14 Sep 2021 07:06:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF0441BF3ED
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 07:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA3F540215
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 07:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6aljlmu7UMxC for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 07:06:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C18994016A
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 07:06:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8B8861C0007
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 07:06:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Sep 2021 07:06:16 -0000
Message-Id: <20210914070622.DA3F540215@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-13
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

Autobuild statistics for 2021-09-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 50  |  7  |  0  | 57  |
  2021.05.x  | 44  | 10  |  2  | 56  |
  2021.08.x  | 36  |  5  |  0  | 41  |
    master   | 225 | 83  |  0  | 308 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.52 | 18
                  uhd-3.15.0.0 | 8 
                      fio-3.27 | 6 
                    mpv-0.33.1 | 5 
                    ffmpeg-4.4 | 4 
                  ntp-4.2.8p15 | 4 
                 apitrace-10.0 | 3 
                  mupdf-1.18.0 | 3 
               pipewire-0.3.35 | 3 
               capnproto-0.8.0 | 2 
                 libfuse-2.9.9 | 2 
                 mesa3d-21.1.7 | 2 
                 openal-1.21.1 | 2 
            qt5location-5.15.2 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
                    atk-2.36.0 | 1 
             bluez5_utils-5.61 | 1 
                  botan-2.17.3 | 1 
                ejabberd-20.07 | 1 
              gnuradio-3.8.2.0 | 1 
                host-odb-2.4.0 | 1 
               libgpgme-1.15.1 | 1 
               libtheora-1.1.1 | 1 
                mongodb-4.2.11 | 1 
                mono-6.12.0.90 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
          refpolicy-2.20210203 | 1 
                  waffle-1.6.1 | 1 
              webkitgtk-2.32.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/1f20afb5b7084cb8da9effda8db35ad09a19136b |     
    arc      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/4473aa8944b43d6cbcaabdbbb9350265ae295a42 |     
    arc      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/9adf2b1d62e943517bde0ee82414cc48b125e454 |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/82d52f3cb7431e81537db8d88124a872c989ef33 | ORPH
   s390x     |       bluez5_utils-5.61        | NOK | http://autobuild.buildroot.net/results/a332beee6088bd368908fc27d9f68d6bb70ffab0 |     
    m68k     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/4fbf2a63f9ddfbc540ce7dabd10964b311477c06 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fe6d00156715c8a256dfce2bb457a7af53140b56 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/488ad069df3d0cbd7c193addfa6ffe1404b7fd64 |     
    i586     |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/70943b0be896d20e32a939362e2b17d9c559ed81 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/4428207fff787558afa5b98211c9c0b0d8f7d4ea |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/908768f70352f317c5a53390e99bbe7e0bda790f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2e30b815f304127ae5bfde6810f9e4093e5b4fae |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f01d9cedec8e1b371308d0f7af561a75883fa27c |     
   s390x     |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/c2856fe09ab6b802adcbe0410dc0afc83a95b5ae |     
  riscv64    |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/dd1db41ec26ae6a115cf8b7afca6a14808e83449 |     
microblazeel |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/8cb1fe4d41627c1fc746a1381fbbca6759d0d05d |     
   s390x     |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/1efbeb98d8616c48cf315a9d4ff6cc1edbf9bf00 |     
    arm      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/fa2aea191e1046cebce0889ae518d0880816a9c9 |     
    arc      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/9de57fe5b26cdbdc9e81647c304c527b627b423e |     
 aarch64_be  |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/0fa05f87c8e8c5c8dd102d8f1bd9ce1a1ee6239c |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d541dc5e5942ac743e8a3de8e8f920c9e3f7c055 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2825496ebfd8c5fcc78135eaabd930177993c6a5 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7384a619725cc9d7fc3330171665b2144ce3167e |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f54f92768a9fff4f0e24cd858143f57ce9adcbbe |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0b089a23f5077fa50c9cb18e980e811e72eb477f |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bcc6672323d67520c22f678ca7e257e5e6ec8378 |     
    mips     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ea8d4066707bae8428712c59718bd278d25b26b3 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/004ac5ada223c096f6e90c14cf27a032c30dd658 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7af65cac91261d99ad90403fd11b2ab246e11725 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4175b947c504d85a4ebc191fe6be175cd4f43c10 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5509662f6258ff4daa84c14882756c35d6d1e5c7 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2eea2ec15abfe6f45076a13532edf86d5d96ee71 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1ff2e644e1198233a79b476c5710daecc459730d |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9a74f62f4ffa7007d0ea67eb5e38b1057c697a09 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1ea8fb8562895565c8d1e0e21dfe8a83fccedb6a |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/321c4218c0b40c7b957b4d45f81de7ecbd3f8415 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b7000765982dc4127778bef41c93c9f68311577b |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7d3851d5d5c8e6aa50c5672c6fc3e11f1543b511 |     
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/48da6dfc6fc655e504e8166d951bd60e19d9abcc | ORPH
   s390x     |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/827d644e7d889b82ec7326437f575f96f8de70bf | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/ce30795591d8f085a9185798e5f5f8bc41bcc5ef | ORPH
   s390x     |        libgpgme-1.15.1         | NOK | http://autobuild.buildroot.net/results/ea75ae720833855f565dcf542e1accfb1ac717c7 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/19725812314cc63a41588987673beba107c086ad | ORPH
    m68k     |         mesa3d-21.1.7          | NOK | http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a |     
    m68k     |         mesa3d-21.1.7          | NOK | http://autobuild.buildroot.net/results/6e3a40d1b10ee7e86422783b28ed64e4441157dd |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/8653928efec0ae2bad5ab3f204301270fa361c65 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/2d51e94ef6c5733784b4430551e4fb706646ed21 |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1a8fe912fae49e9a49b0bb565107422eef38739f |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b4c2f47a89d16fa9524e5fabbd86c637374f1e20 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/67a8c6db2385dac67bd2036715ab10e00c3d4dd9 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e7d4b5c0cfaa7347dd561e6d637cd141c2bc5edc |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/53fea4da993d2416d97436437469084cb4ccc436 |     
   mipsel    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/cad34bae5ed6511c184cb755fdbb539fd93fed38 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/655ada9d76e225142115b1ffdefa517a9dec5dd1 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/2e17daddab81e7df88aa84814177be53e1a1f66f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a05e2f2126c219495ea578829cd170683d440a58 | ORPH
    arc      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6f87b9a716bed43978ffbd87b78af30195a955fc | ORPH
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/f55c331685acdd9cc3bba2535de8078e092369b9 | ORPH
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e6d87ada5487867498c7ffdb42b0bf52cdc57209 | ORPH
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/0ee44a517445c68c9f906d7ac167c0a668b86a9f | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/64a393b71b361660d2b3181d4258ef0ffbfefc9f |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/415d9853e5021a1c0070c148f003ab5daaa10aa0 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/33d9e04aa81ead9dd1c323169c71f9b9258889e1 |     
   sparc     |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/51c0e2869e0c72bfffcd4c7befab32c8d7fd63d5 |     
   x86_64    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/4800a7ec2c1646b053c2f2fdc9ed536f15dbefac |     
   mipsel    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/eeeeb16c7a792471b65273a7b0fe693e6ce26daf |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/ed372a4a8e50d9e20be589eeda40c92888d709bc |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/bf8a133d4ed599ea6efb86be635b8ba07f6882fd |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/19f190b7528ddf8ad7d359d1b402dbaaed54b3f2 |     
 powerpc64   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/ab8719cc3880bcd6c69ce03fed16eea55a2e8765 |     
 aarch64_be  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/ab98e1cef221c95da9f3c822c6fcf16ab83d74e8 |     
   x86_64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/29b3ec0087bd83a7ccad94c37d4358387af3617e |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/03b830c97c8cb5cb3013e4ca3e0f8555654721c2 |     
  riscv32    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/96c1492b537713b565e39639bb6b9c1d41bd43c7 |     
  mips64el   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/e29b57bb206d100dc8ef1d7d9ee49bc491691d45 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/97197428bf13c1b774837d5a041ea3145c03fee1 |     
  riscv32    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/dc0162ac0e308f5e1353b9b770b88c7f5662fd84 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/97fada180e6dfd9d0ed4ce353638432895d6f427 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/26af3e4e16d5232bcbabbf6f0d448251b9e9e370 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/3c14e646233448235734f60fb49b53d0b3409da9 |     
    arm      |        webkitgtk-2.32.3        | NOK | http://autobuild.buildroot.net/results/20395872de8138501c3f5e96c7d94a4b2b707507 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5a7abf18c07eed168e541fc551b424d8e3219152 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/708f7e08bd929905239853fee54b6da436dd9b80 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                       gdb-9.2 | 1 
                  gensio-2.2.3 | 1 
                libkrb5-1.18.4 | 1 
            qt5location-5.15.2 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/3e9563df509eebba4a09ce763561b4d12172f04c | ORPH
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/2001d683061d4ecf2e72147b51d40b5d64e873fc |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8830244078a467f11692ef0d28a41a413122cc0c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/47e2c9496a149a341f9a7c29d58c33ee04cc7bc3 |     
  riscv64    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/97113eb42341ad892b2e94f66d29eb920efd5772 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/86f919acb989944c300822ecaf3bff59d583010b |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/c0f6f205c5f606e7e9d29a9f46bebab9afef274a |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                 mesa3d-21.0.3 | 2 
                apparmor-3.0.1 | 1 
                       mongodb | 1 
   openvmtools-10.3.5-10430147 | 1 
                          qpdf | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/8ea9c2cb135fad008f93a6fc1630338bb8cec06e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/879eccba092a3d2582d6a176a9a26ef3be71cc8e |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6cdf5977c18b0ad6a431374e6a135e18011b9d02 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6dc277a10e0cc875c8ee1e323b95e997cb1c428a |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/66c5f70ad745e3d1993f3d43e42067a17a5a07fa |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/0023a28558a130c6f04406cdca5b5eedc4407b3e |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/c751d66fa6ab985c54b04a3a81bdc465dc4dbf7a |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a6d13f21e8a7a88ef120ac89fa991d20f7b9734c |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/1bf681afba0a98c8b92efe6f6d04ccc1ffafe531 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/14b4edbb3b43a2b33cbaa5d5bf539ee42b87b737 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4f944f039695329d8e6407916a57b71407a8d255 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ec21176d3f7cedb6be76e2bc81fb79633c1ea19d |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
              gnuradio-3.8.2.0 | 1 
                 mesa3d-21.1.6 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/927cf8e07575b520dee2d7038ae16a12bf49a6f3 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6f9e1bca8ad78691f5c7a4f0951d3e9446d9bcba | ORPH
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/d2da3b6231e3cc052fa380984ac95253f160082f |     
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/5c0e6ad31502ccdc9aeb8b8b6abc769dfdbcc484 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/da2bab5ad3f434228c77444982130c3d10f0474e |     


Gitlab CI results for 2021-09-13
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865396  |      
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583864525  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865072  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865075  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865080  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865081  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865083  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865084  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865087  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865088  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865090  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865094  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865095  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865096  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865098  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865102  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865106  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865108  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865110  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865111  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865113  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865115  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865117  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865123  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865127  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865129  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865132  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865133  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865138  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865141  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865142  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865144  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865146  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865148  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865151  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865152  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865156  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865162  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865163  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865165  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865167  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865168  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865171  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865173  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865175  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865177  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865184  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865189  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865193  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865195  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865197  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865200  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865202  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865204  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865205  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865206  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865211  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865213  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865218  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865220  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865233  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865236  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865238  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865240  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865243  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865244  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865246  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865251  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865254  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865256  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865257  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865258  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865259  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865264  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865265  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865267  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865270  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865271  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865275  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865277  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865278  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865279  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865283  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865285  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865287  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865288  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865294  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865298  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865300  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865301  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865303  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865305  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865309  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865310  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865311  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865312  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865314  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865319  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865323  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865324  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865325  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865326  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865327  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865328  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865329  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865330  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865331  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865332  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865337  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865338  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865340  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865341  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865342  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865343  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865344  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865345  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865348  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865350  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865353  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865354  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865356  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865359  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865362  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865363  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865364  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865365  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865366  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865368  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865369  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865372  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865376  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865377  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865380  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865381  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865384  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865385  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865386  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865388  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865389  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865390  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865392  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865393  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865394  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865052  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865055  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865059  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865063  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865067  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583864605  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583864608  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583864769  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583864808  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865022  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865049  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1583865050  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
