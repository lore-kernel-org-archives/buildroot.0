Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4FCC432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 07:07:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DDDD60F3A
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 07:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DDDD60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2230A400B9;
	Wed,  1 Sep 2021 07:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9iYN7HGbuZYa; Wed,  1 Sep 2021 07:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53CFE400CF;
	Wed,  1 Sep 2021 07:07:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1E871BF3F9
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 07:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90BB340304
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 07:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAqRVUEojBXO for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 07:07:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EFA6402EA
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 07:07:04 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 201526000E
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 07:07:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 01 Sep 2021 07:07:01 -0000
Message-Id: <20210901070709.90BB340304@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-31
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

Autobuild statistics for 2021-08-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 36  | 13  |  0  | 49  |
  2021.05.x  | 39  |  8  |  2  | 49  |
    master   | 188 | 19  |  3  | 210 |
     next    | 48  | 13  |  0  | 61  |

Classification of failures by reason for master
-----------------------------------------------

                 mesa3d-21.1.6 | 3 
               libtheora-1.1.1 | 2 
                       mongodb | 2 
                 openmpi-4.0.0 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                flannel-0.14.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
                  mupdf-1.18.0 | 1 
                  pango-1.48.7 | 1 
            qt5location-5.15.2 | 1 
toolchain-external-linaro-a... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e3e67595cb8b0211731625f95745ae11ee6baa39 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f944f73e7a418e3ab005b342dca433d0360ad60b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b56f06327147e1227f362246ed5db608a23db904 |     
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/4d9f4f6413a01b6349f040eaa28d75df4ad51e10 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/b38cf1bba988a769f2e373cee2ef7b20e79aa79d |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/3042d48c13dc2dfa3fb050fd50aedd60c2c894fe | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a1c4fbeda2ffdefa47b438de88dc66bd6753aff3 | ORPH
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/07133865793f25bc644281816be5d3091fc919d1 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/650bd135d61f4a99cd838512f3cc3bfab22d39f0 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/93049bec80b966cc2b6e020773022e927916216f |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/94a64670488d7374040f0021194322662cb9a610 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/41e60f68c4c5c9248eff02e43adfde52a6a7fcf9 |     
   mipsel    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/48978d2579d84c09eea33988019f517f9a511dae |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/9d86c694a7787d94bff40393ac335dad63e195cb | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/16a39ce96119ec7b34a3cd7e70727cd0808fb7f2 | ORPH
   nios2     |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/f08cf3f1ce626c6d5db4c16b94dbc181a5565434 | ORPH
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/fd59d360b2c135c1119a1731a33d810409ff2139 |     
 aarch64_be  | toolchain-external-linaro-a... | TIM | http://autobuild.buildroot.net/results/b915b0e6545e43fe339b11a317362d8b41c6bc4e |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/405c23d3f2efd52d8b23d5911864da906f885a0f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b3f855fb837bffb65f59bffe94e01c135322dcaa |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/786660dc1b3ed301d7e4120ba64120c2b8b7e9d8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5def9a1f99831cce201936075250fae19017d7ca |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 3 
        host-sentry-cli-1.57.0 | 2 
                   sdl2-2.0.14 | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
                 dc3dd-7.2.641 | 1 
           heirloom-mailx-12.5 | 1 
               host-go-1.15.15 | 1 
             qpid-proton-0.9.1 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/3955df3e755369337ccda8ec278079fc65f33cdb |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2862b9d0a2f0c5a70f8372f2e4d6f2db13c31b19 | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/12444374b31903ab52bc2f2285e2a36613eab57e |     
  mips64el   |        host-go-1.15.15         | NOK | http://autobuild.buildroot.net/results/94967f86cf4938d2b5c87a06e9b68e9dcbc3c3a3 |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cc12c7d566ce7a9d9b828069ee303a403e51e847 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a12acfc5e9fc3b7ebe240634a6c38c913d548640 |     
   mipsel    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6c6716d2a37d8c1b3ef91f07bc8d5d83dfde554a |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/92983096b2be4191171951e87c53281e92f43c41 |     
    sh4      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/3f7409690371349b49dab35fce8a772d9efcd84c |     
    arm      |       qpid-proton-0.9.1        | NOK | http://autobuild.buildroot.net/results/562dd306d2faddec704f519b14457a7404a3bb35 |     
  sparc64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c8b579c5465aa51395815baf026047cd84a3fd4b |     
  powerpc    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/0a5e27e8635b13dfe2d6d57d84db8ddfba9a08ff |     
  powerpc    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/b97f529a3e8eee277864d8694283a786265f0391 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                qt5base-5.15.2 | 2 
              gnuradio-3.8.1.0 | 1 
           host-doxygen-1.8.18 | 1 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 
                       mongodb | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.26 | 1 
                     webkitgtk | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/102a208f7e1a87b5c02c8080aab26c59c9112196 |     
    arc      |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.net/results/e9d2366bea66c1d818e28a5a896f809daa4938b5 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/52a3cb10338aeca3f7d0f6b9656f9b0040068a4a |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/55f79e068cf9d75066745fdb3dc1f44cd7c36eb5 | ORPH
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/6c00a30b97432fc959f494ac04afb717c913ef8b |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8d594ad9df952985a7e82045ee2ceaa324da5e45 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/fa101e01bda0c4b459717faf57766faa9bf0841e |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/cdf9550807d445c43ccd3c1df4f5bca7db55b6cf |     
   nios2     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f1827c0e096251f284197736f15cb357d51dec71 |     
    arm      |           webkitgtk            | TIM | http://autobuild.buildroot.net/results/80684cfdbe64af88c89557e728090f9db214df40 |     


Classification of failures by reason for next
---------------------------------------------

              gnuradio-3.8.2.0 | 3 
              host-libcap-2.52 | 2 
                host-odb-2.4.0 | 2 
               libglib2-2.68.2 | 2 
          refpolicy-2.20210203 | 2 
               capnproto-0.8.0 | 1 
                    ushare-2.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/faa3e1096ceb4d5baa933f5a12bce683f6e4c5e7 |     
microblazeel |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/2bba10a36bdf6e2e4d118f1999da4fa6901b8156 |     
  aarch64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/690f9846d7b887103114ebf5839435839a037965 |     
  mips64el   |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/9f5e16c0255ddd7cb90c0850f415e595abe54584 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6562823170dd4980148f918d0d2d33a475f436c0 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b59937345cd6f6a6b55a526ce5941cc53d77f591 |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/76ee35b7039fb8f9969d893671f4d3b4c909817a | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/40aba10ebc1f74dd61e59359a22ed1759459cbe2 | ORPH
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/80a528a08ae8bb02485f74a1d06a8de827277194 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/691f5f487cec4b581d24daac47c6666905fa018c |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e9cc230abd42058d70c62c428ea6a1644df0dc9d |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d9e269e8b5cfc376801608e301d62d0834d06625 |     
   nios2     |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/67539990d405e179ec659dbf97612520524e058c | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
