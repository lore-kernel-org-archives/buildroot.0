Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD15FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 06:59:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A12E60F70
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 06:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A12E60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D45983103;
	Sat,  9 Oct 2021 06:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSPr-GgfuFTc; Sat,  9 Oct 2021 06:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C915A83131;
	Sat,  9 Oct 2021 06:59:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBCD01BF23F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 06:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB3AA60AFE
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 06:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VBS3lM6BS0p for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 06:59:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DBD7606FF
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 06:59:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5034C240002
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 06:59:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 09 Oct 2021 06:59:32 -0000
Message-Id: <20211009065937.AB3AA60AFE@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-08
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

Autobuild statistics for 2021-10-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  | 10  |  0  | 44  |
  2021.05.x  | 29  |  5  |  0  | 34  |
  2021.08.x  | 28  |  5  |  0  | 33  |
    master   | 33  | 96  |  0  | 129 |

Classification of failures by reason for master
-----------------------------------------------

                     apr-1.7.0 | 32
               libtasn1-4.17.0 | 16
                libgpiod-1.6.3 | 7 
              asterisk-16.14.1 | 5 
                tpm2-tss-3.0.3 | 5 
                       unknown | 5 
              host-erlang-22.2 | 3 
           host-openocd-0.11.0 | 3 
                openocd-0.11.0 | 3 
                 boinc-7.16.18 | 2 
             gst1-shark-v0.7.3 | 2 
   host-python-decorator-5.1.0 | 2 
                 raptor-2.0.15 | 2 
                    bird-2.0.8 | 1 
               capnproto-0.8.0 | 1 
           host-mono-6.12.0.90 | 1 
                libcurl-7.79.1 | 1 
libpam-nfc-bb762e0e64919511... | 1 
                  libsoc-0.8.2 | 1 
                 openal-1.21.1 | 1 
           oracle-mysql-5.1.73 | 1 
             transmission-3.00 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/43c1cf43d286158d7ca4ff2b04c75753edd02f18 |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f54f8042d6ab540ae74785af0febd5bc15956439 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/91ce5acb2c80ca11dc3055c9b51544ba8e0ec8f5 |     
  riscv32    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4c5cb176f9d4d19bc19eaa5fd67769878ab78d1b |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3401c7ef65f0d32fd1599427a0dd72b10e9c925f |     
   xtensa    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3b3ff6a19ab472d6c0d4694f4e6c1ab7fe72304d |     
  aarch64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/6b569668829093aeeb0cd6c115121bc87a316fc6 |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/98e6084fa52131fbde157cf30acd35fbde53109b |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/01ca9bf0fdbabba6aa8103df345f4e262e08e5aa |     
  riscv32    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/0b2ebe6e46d797cc1d416e14a22f94453cbd9e60 |     
   sparc     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/646918391d54c9e366d4d67fdc28f3b9fc12c1f1 |     
    sh4      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/a0297c7cb11aaa88701957b68a682034d03a6a62 |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7f9b0ad4dc081e77e0c78ce592c2115cc66cbd20 |     
   mipsel    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/e58147eea903af4b648ada9d2a07c59f6ce486f8 |     
    i686     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/74900105eb2096f3db2dc4d233145e4824f982af |     
   xtensa    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/355b9deaf0b577237bf2e30054df430e02e0e8d7 |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d9049eee347c136baadb23b245b8cd1d10f1bd98 |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3ac18b4784142f9739207b463218d53284169bf8 |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/76661613ee04ec0cee43fbc2476998e8b33bd0c3 |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/0c9048cdfb126fa4211d69ac155eea60b064313c |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/e45f47a358f963e7a6265923d543227f068bbae3 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c8ad3ff8b5e3a5e376be8e5b42b387a14cbeaa1c |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/9ef841196125f834874b1c6c0460ba40b2df1888 |     
microblazeel |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7516ecbb260c4f95d24ca1732b54fc40cf59e0c6 |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4b91b5b24c0e9fc28907d4b9a296b8487fd84129 |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/bbc2ba04328fdc929f9789c05611cca23df83208 |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/de2db03298b7562a29b8fc12915196ef442f8d97 |     
   xtensa    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/5315df8757619e661b6e7c753a8dad02697ddbe0 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/93399a615824c177ab6ebccb968e17f8c224837a |     
    i586     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/0ebcd160e9499b73ac77ed098113699e8bb17dff |     
powerpc64le  |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/8b0f63bfd5180535b55c8558d7869ad292a52de8 |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/115dbde8cbdebbc5577ff64ba88f3a1fb45a9e5b |     
  sparc64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/f97132a0b0e2a726742d124441591261f95fbbfd |     
    i686     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/e788e2fd820aa4c6617576b025bb741b2ffd5f63 |     
  aarch64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/5b1b7837e9344abfda3a1b8ea1b0d30b725a7577 |     
  mips64el   |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/92316377a067ab5e4494820faf1be7ebff3e8f69 |     
   xtensa    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/2f7adc2fd4ef9002b6cc2f6aad3cce243c68c230 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/4ffb4689918287c1744e1551576ad1ea4052d7cf |     
    arc      |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/8415a5bf98cd651a14046a7b9e59c21cb963e413 |     
   mipsel    |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/c37abe1c7f3bd36f19686bedef29ddca3d90a329 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3eaa5daa89355d7bb5689e88311574c14f3dcf9e |     
    arm      |       gst1-shark-v0.7.3        | NOK | http://autobuild.buildroot.net/results/66d377a5c3e7dd85cde830138ce8d94d1f67e2eb |     
    arm      |       gst1-shark-v0.7.3        | NOK | http://autobuild.buildroot.net/results/b3342cbc810c1981dcf96ece41c6b5dea29e5399 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5e2418c2275a7c91ed869e79be981df37902c45a |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a4af00e59ce434735f7b3fccbd93248175a9bd8b |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/020d1ba02a53c864b417bdaf2ce73eea671bfc73 |     
  powerpc    |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/c3b2912868e0ba9cd1b3c317fde0d4d0afa95748 |     
  riscv64    |      host-openocd-0.11.0       | NOK | http://autobuild.buildroot.net/results/0d55f8e380dda01d40ac79e0768967ecb615c756 | ORPH
    or1k     |      host-openocd-0.11.0       | NOK | http://autobuild.buildroot.net/results/61e5401802c011c51e12cabd7219cbbb696448d2 | ORPH
    arm      |      host-openocd-0.11.0       | NOK | http://autobuild.buildroot.net/results/a8f948ec126ca5d1c3e5b59b9f1a8e82d4e7aabb | ORPH
    arc      |  host-python-decorator-5.1.0   | NOK | http://autobuild.buildroot.net/results/a4cdefe819c367606da2f126d75415712f060c40 |     
    arm      |  host-python-decorator-5.1.0   | NOK | http://autobuild.buildroot.net/results/18bca6c8dd56e5b66faa0897ced694e8142c2c7b |     
  riscv64    |         libcurl-7.79.1         | NOK | http://autobuild.buildroot.net/results/2956c8fb91a16d2ab59fb1c7babec46a6c8399e5 |     
    arc      |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/078eb8d70c4c013abcb082bc3930e89720c23223 |     
   x86_64    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/41341544708394b7d61c4d079fe43a8bb6aa4d52 |     
   mipsel    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/496b0bb24522563346ee868ae57b2391913e1f10 |     
   x86_64    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/6803c69d3f08a54adc7e34ce005deb9b9cf8fa65 |     
  riscv64    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/222febf33462c2f3a344d443d7bf83a5b9523219 |     
    arc      |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/bd0dc9c96206a2ca931844789bc7d7874cbb6675 |     
    i586     |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/7f2694d160c6e29fac2eca9a9bd0c02ea83ba528 |     
    or1k     | libpam-nfc-bb762e0e64919511... | NOK | http://autobuild.buildroot.net/results/ef5fb01ce0eef936b059380e4da6582973c999fb |     
    arm      |          libsoc-0.8.2          | NOK | http://autobuild.buildroot.net/results/290e6abe7462960061871fe64a9d777a42230b2a |     
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/853501a46dac66dd575cd397a517cd82e0520f62 | ORPH
   nios2     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/97cda723b4cdefca62ffd35b135b502b0d4730fe | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/e8e6caee8a75960d92a4875d08d224341a8310fd | ORPH
    m68k     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/b71d9f504834a19a268bef9467d1809c3d4b97f2 | ORPH
  mips64el   |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/42f2fa0c4a1bc3f1837a9246f64f7ab02eeb8591 | ORPH
    m68k     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/85e465c07f0669c199933d3f0c23e2b49364ea23 | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/b78bec09000fc62cca64a3c32c50dde5a49b29dd | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/d0e091b7c5304bf243576bf968bc90061b902577 | ORPH
  mips64el   |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/027fd31b33a23a190d38831b95dc4241c07f7031 | ORPH
    sh4      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/57e2c8236b3d15e9531cc4c64fa45ee7b3961786 | ORPH
   mipsel    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/40339ae634232dfee965c2eebb4f383b3ad662ac | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/e36f0a010a19e67ab4306127ec7aaaeb899079be | ORPH
   xtensa    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/325dabfeb1d7fb1a95d21b9cc9a32c0327984dde | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/d4ee11b910b222c07e2b9ff46c66e03f85e6d883 | ORPH
    m68k     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/a0129adeceb6fdf91556ddf583d8f7826c4dda1b | ORPH
    arc      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/e8b043a553d6b17b143b726d990c996dfc69b55d | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/9b1d7edeb720cb7dce56389ad19fea5d681e826d |     
powerpc64le  |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/3be1dfbf8d6993ec8425e2ad53d2336e79481f52 | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/76832995fd83e175977184a463a65487bd359829 | ORPH
    m68k     |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/20c22347b1435c1459a03c56f648aac5b3e3e191 | ORPH
  riscv64    |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/40af65bccedc9a8cc00dade1c9fd1b6a0dcd19e1 | ORPH
   x86_64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/dc5f92efe7e6e43c95d9dd95dfe4cab7aa045ad8 |     
    arm      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/8e2833d522d0887b39070bd5885cca23d2030085 |     
   x86_64    |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/0b993eb29379966f218301cd9055074032a4a7fd | ORPH
  powerpc    |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/f44aadaabb526d55045ef110327b5878e19f7fa9 | ORPH
microblazeel |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/9706f13cb34a4494e12062ad20f91ba955ddce0a | ORPH
    arm      |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/af25eb02712fadb76e313ad9b9cf4b43519a6d41 | ORPH
microblazeel |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/4724269c4eb518ab986e7c8413ce1eb5c615750d | ORPH
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/3e0d1e4c7ee0bb16af822d619b8b09cec9f54b5a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/df55d5672e695391fc4e053d3abff3488da46732 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cd858f698f9a95a21e5a60a80fa4686a9ea1a090 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/369fe94364599344e594849d41222be01f136530 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/9af776b3fd6f2e9bf7a1c789c803c209cc6517df |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/a1b8639d9622b54005cccdc26a836e719abbaf8c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
            erlang-jiffy-1.0.6 | 1 
                       gdb-9.2 | 1 
                 mesa3d-20.3.5 | 1 
   openvmtools-10.3.5-10430147 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ad3502c77d0aaf33b3c9f9457fb96b3849a3fd1e |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/00f41b483184d11d5a12fcc73399dcb52896dc23 | ORPH
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fdd34e34982122bc0b2715634c492fb3416bb1ee |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2f4e614369f337bf4c8ba20a5fc2355fa5c50620 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2a01e835ae9f73ca3b749cb38bd69d2fc5532d8a |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ac11e0c37514fe3362ddcee0e50b0cefd129618e |     
  sparc64    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/1072aa02726aa517a60d68e89fe50b8fc96dc530 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/fb8440b7c6c56162872dfc44265556d49265249a |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/47a67670bdf554a928b57f85a51d29c72c0def2c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d33a99d1d3f30ea363b5f8cd7f0c01009125c864 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               apcupsd-3.14.14 | 1 
              gnuradio-3.8.1.0 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/367868fdcc5622c2f6961a16ae2d799371a23f09 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a7a4c12163cb2e38ab054fd62dd90401b393853c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d8726adb88d21d9114279e5e0f64674c617667f2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/887df4db3ac69532c6a8369befe774ba8d8e00a8 | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  mupdf-1.18.0 | 1 
           python-pybind-2.6.1 | 1 
                    ruby-3.0.2 | 1 
                 systemd-249.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/c4728422ee3c93e6a9908099b045d8aedf400e55 |     
 powerpc64   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/06d1db26f3f625def3a4496f5444c4e54421e4a6 |     
    arm      |           ruby-3.0.2           | NOK | http://autobuild.buildroot.net/results/8b353fb1db28d3de6d86bb90524e6a7b0c321082 |     
 aarch64_be  |         systemd-249.4          | NOK | http://autobuild.buildroot.net/results/825b7b65e1a1bf2d3189406eb7494af7dfc8127f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3f8481889a6a78225562bea50c14692e6bc55c3f |     


Gitlab CI results for 2021-10-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116882  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116890  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116931  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116932  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116943  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116958  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116963  |      
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116967  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116969  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116988  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657116990  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117002  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117004  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117005  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117012  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117019  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117025  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117027  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117030  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117075  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117107  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117120  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117123  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117125  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117215  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117226  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117229  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117230  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117233  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117250  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117251  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117252  | ORPH 
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1657117269  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
