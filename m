Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEAFC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 06:50:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 304106127B
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 06:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 304106127B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A2580D1B;
	Sun, 22 Aug 2021 06:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcZ642G7X3FS; Sun, 22 Aug 2021 06:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C5B480D90;
	Sun, 22 Aug 2021 06:50:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86BFD1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 06:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76D8B80D90
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 06:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUxlr2sJ0qHY for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 06:50:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C67C80D1B
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 06:50:28 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 377AA100003
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 06:50:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Aug 2021 06:50:25 -0000
Message-Id: <20210822065033.76D8B80D90@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-21
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

Autobuild statistics for 2021-08-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 48  |  9  |  0  | 57  |
  2021.05.x  | 38  |  9  |  0  | 47  |
    master   | 181 | 18  |  3  | 202 |
     next    | 40  | 30  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

          libmodsecurity-3.0.5 | 3 
                 openmpi-4.0.0 | 3 
                 dc3dd-7.2.641 | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
            erlang-jiffy-1.0.6 | 1 
                harfbuzz-2.8.2 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-21.1.6 | 1 
                       mongodb | 1 
                mono-6.12.0.90 | 1 
                        nodejs | 1 
                 openal-1.21.1 | 1 
                          qpdf | 1 
                snort3-3.1.6.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f439d1a52141107c7ce3019096e4277e24d6e354 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a4dd2483fdf07ce89b05ae0340c2b0365a311f34 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1bf1ea6bf7a5d4f0af1de480bd5f8bac94006a21 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ef690db7bd0e4052d93a03182763f297d236ce46 |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/e1575f6f6bf351bc733623b63176447cf8c9bf80 | ORPH
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bc861d2447bb8deba8d848230c39fd052e66428e |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a14707eaca547ea95203f238dd77cbfeb3aabc62 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bfa8d3674f07e43974fb2e1fea60465864009dd5 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/4e083241d301fe5c5234291b5dbec64cb14c6a6b | ORPH
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/326f935af51c353822d684ecab8bed79cf057494 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/92749005c311d8f8eb7234746352885c14d38f81 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/3325db983d6d9b894487801887c1b5dc51ce2915 |     
   mipsel    |             nodejs             | TIM | http://autobuild.buildroot.net/results/8511eb866f0246641d81ad3672a75bd1b4e6368c |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/c461ee536ff5d17756b158189cb06582eac1b3b2 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/86923ea76864add8ffbfaad84472bcede29af398 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/3c39bb50ea8de9f6bfdc9214a836da2bd2692253 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/6878dd85c55cf38245c23db4c09accca25c671d6 | ORPH
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/64235f7dcc5a775f49e175ff6c165995b6fcdd9e |     
  powerpc    |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/df34a69175e61bc7b180d89c738747e19aaf13bf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bd259fd2ffbb691fdbea1c9ab59990a9a9750540 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3c08f5a19fd517ba08133d4f0abacf0d762a00ca |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                 openal-1.20.1 | 2 
kvm-unit-tests-kvm-unit-tes... | 1 
monkey-f54856ce250c4e257354... | 1 
                qt5base-5.15.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/03bc7302bb844ca9e631b6d2473d39b1fd7817cd |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0d45bbc73b2312c3d678ea93a83d1c9168a41358 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2df036f809665dcb829c84481109b5b5a2d71142 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/fc9bbddae2232522abc20c673607beb9d7673068 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/53dd12746b0aed09cecfa239817dc4d200777638 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/5eabcda458049fa5c074e117b00c12f3e3d70f30 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/41c78138659245141889707b9ede6f2708e6bb86 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7ad3c05aab7d025efd946600b20f474fe737eba5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a818fb59ef249753e7c8797903c9411efc6d492f |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 openmpi-4.0.0 | 2 
                 dc3dd-7.2.641 | 1 
        host-sentry-cli-1.57.0 | 1 
                   httping-2.5 | 1 
                 libidn2-2.3.0 | 1 
                 openal-1.20.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.26 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/fb4dc080e8287e8944ba36b104a0dcdad2be75eb | ORPH
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0d672c3b7bec0aeeede76a36931918f734a13ba5 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e9b3fe30a0f47e893bfacb234ddf32e2eed25103 |     
   x86_64    |         libidn2-2.3.0          | NOK | http://autobuild.buildroot.net/results/2ab7ca7cbd6373adeb08ee1043f25f29567933e7 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/71ce199c6f3408479081352a0f605f88e2a159d9 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/923612b10c1442465517b08a9089b16955f130b4 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/7444d490e2211981f4f27ea52434e409ccf0814b | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/de807149d22aaa0a2afe4c49b415ef84baaa03d2 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/4b369a5bd0711f1a4e834e2ae11434d5ad284532 |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 12
              host-libcap-2.52 | 4 
package/sdl2/sdl2.mk:163: s... | 3 
               capnproto-0.8.0 | 2 
              containerd-1.4.4 | 1 
                    ffmpeg-4.4 | 1 
                  libbpf-0.4.0 | 1 
                libsoup-2.72.0 | 1 
                 openal-1.21.1 | 1 
               sdl2-legal-info | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/17dc65ac9287eb65b6c7b5a6a75ffd967e134364 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8df6d76f3ea2b7ef863b2fc6ce8aa7e2aa270fa6 |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/923e6abb8e871168e7dc6bb59b8ae39eb05b2f16 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ce3a19df3d760a708be455e7e7a35dafb932c7b3 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/30ca4f5ef0600d9033f7b3d946a367606ad98c70 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5d3a4774d88b2281c4f0c672df11fa29d55e5f3a |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/918dccc750beca041d5a8309dcac2412fc1e1665 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e5bfcb89e3174609375f967e1fba8acf5264e66d |     
  aarch64    |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/cc6877308cb7e88fc996661aa8e498f891b5ac12 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ace38379086016cb1609cf8a1d75817a223beb2f |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/739daaf890e927355d7e3223ba5b88a65e8c606c |     
    sh4      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f459cb7b0b7d99d7de47e58de28408601ca1bffe |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f061f61eb1082c95d0eb51c022b2c557b25fa9b1 |     
    or1k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/0e871f1620a9b64620c74ee7d876e608aad6bfb9 |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/14cc1bac127b679571776978461946e2438ae21b |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/21d7ee07732ec6e3ae70ec7ecd1106409f94e455 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f8611f578e3f1792bc6e004b68a073ddac487d44 |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b881eae9828ffa00ea160f03ae0adb64ad31d0bb |     
powerpc64le  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/21d59067bcc03b99d564d16eb285554e932364e4 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/bbf93ff52e847ef32ea03b8a52740fb94250265a |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/59e05415b8f28fe19e120076a9df38fffc585e42 |     
  riscv32    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/9e1d951285309de1a101f022d5729306b6a7bed4 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/bd1f3a3903f433fbe1a0c7c4eea71a76f9477a19 |     
powerpc64le  | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/3e810aa23a22b6891644882857a9adf4a7b7f760 |     
  powerpc    | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/eed50c85aae67060116c6e6e359e578e1ebe2a46 |     
   sparc     | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/4600bd8df6f2a914712c7b183d223be9343e44b2 |     
    arm      |        sdl2-legal-info         | NOK | http://autobuild.buildroot.net/results/49768521a5f5a8ddec28633af6fd8c8e681b6be4 |     
   x86_64    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/7a3b153a9344711ed622cb9ca2d150ba14fd1ab3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4e9b692abcb71118b869e4a6ecd28e45b105319b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6863bf83ef095f7a082a6913371ec2b72659d42e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
