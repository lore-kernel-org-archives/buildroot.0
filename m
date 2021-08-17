Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E8BC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 06:53:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FC360F5C
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 06:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2FC360F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 700E540010;
	Tue, 17 Aug 2021 06:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMc3HyFKt9f8; Tue, 17 Aug 2021 06:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B06B340189;
	Tue, 17 Aug 2021 06:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3789C1BF341
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 06:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 225A460800
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 06:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuHMBxYe_VWt for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 06:53:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BC5D60682
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 06:53:22 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 67E166000F
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 06:53:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Aug 2021 06:53:20 -0000
Message-Id: <20210817065328.225A460800@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-16
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

Autobuild statistics for 2021-08-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 31  |  6  |  0  | 37  |
  2021.05.x  | 43  |  6  |  0  | 49  |
    master   | 176 | 46  |  4  | 226 |
     next    | 36  | 25  |  0  | 61  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 12
  gobject-introspection-1.68.0 | 4 
                    mpv-0.33.1 | 4 
                    ffmpeg-4.4 | 3 
                 mesa3d-21.1.6 | 3 
                      gdb-10.1 | 2 
                       mongodb | 2 
android-tools-4.2.2+git2013... | 1 
              gnuradio-3.8.2.0 | 1 
      gst1-plugins-base-1.18.4 | 1 
                harfbuzz-2.8.2 | 1 
          libmodsecurity-3.0.5 | 1 
                librsvg-2.50.5 | 1 
                          llvm | 1 
make: *** wait: No child pr... | 1 
                  mupdf-1.18.0 | 1 
                 openal-1.21.1 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.15.2 | 1 
            qt5location-5.15.2 | 1 
          refpolicy-2.20210203 | 1 
                   sdl2-2.0.14 | 1 
                suricata-6.0.3 | 1 
                       unknown | 1 
                     webkitgtk | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f9e829599a78a0de3763519c4a9b9d5ecb37ce77 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e70059e17a04acaed550218cf42d75990061fc31 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8588f0ed92223682b4ab8d052b07c66b30e5d4fa |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8d327b3d6e9a8831787aa3e528127f42fdc41e02 |     
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/6eac66f923ea4e55907f67d355ad83ef2fb4aa0f | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/96d5dec95bdfc86eaa005df9ea829dc7070d0d16 | ORPH
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/e8fb1ffc5898b2d95387ff33ed336c04970ab465 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/c73077e54a829cb9b7698c05b789e819e540b30b | ORPH
   nios2     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4601b5fe79d151f6359f5ad3135b4b0e66435343 | ORPH
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b0642fc112450a08daa1001487af0de51f1d81d3 | ORPH
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/35cb049859793d6bd0ffc8f83f5595b373163e90 | ORPH
  riscv32    |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/e4d03a4c34193d348b3842e5a5697a18a2afc8a5 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/0c03aca5e3ade735b54b0b9233896b868aec1520 | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c24e685ae12b0fab41ff85f88472ba49f56415f9 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4f3d1e619992e85ac0e37a32763bdf26b04e96a5 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eab632dfb1cb961a9d4ff421bbf032cf599815a2 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4d5beea619d17f6b086d0b60a5ba7b785f49d22f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8cec23c6aa9649fdb27a76ea38e5c64eb64638a5 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a19cec2d66338116c7ef45735884b6446679c466 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/580cbaa572cbe3e17c28f8400e6c5e97bd5fa4b7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/158b8331cae07dbb4efa026fbabfa1f21af3ae28 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cc551f89b0b73cedf426283eb20cbf7d4b24ce63 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f53cabae604ddba4d3ad0a6d32e1480324a3e4c5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/018d396ec448f67de6775fee2f0b00a7cfbc0a8d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0fb5708984c2cc64b98eaf18c30a42265978c44c |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9ce2c8c11d41fb9187e5cb00d838edf7e39da013 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/5c83ceda2499ff39e72ca60f957755050de964d9 |     
    arm      |              llvm              | TIM | http://autobuild.buildroot.net/results/637f2410c5e4226ce756c1bd989c44b1f28136dd |     
  aarch64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/04a4983f3222704f4146cf9ee1aae69dc30d5c07 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/631d4e228069d2f8c89d0689f52e18fb5c85fb0c |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/c7326231db93519349ed517d39b6ee05a4cd63b1 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/310ce8505aeea9b063f95fe77cd1de67b5be8f87 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/6bcbcc3694d8d58edc4ecc6ad22452283fea2546 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/4ac0dfad98b12aa5c73049774c1eb91fffb2356e |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0f1dab6d8ba354a71cf2471ad5a77af07a452d53 |     
    or1k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/32c446349e16ca5fceda5a0127a001ec133a3698 |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f4ea8c0ed366fe7758cde155fed60b3880fa0eac |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3d09f85897b66c9bcfd16ce821f483bcb02f8e94 |     
   mipsel    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/8976b09d5ba151833c24d617dfe3e11db53ef823 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/74e14ed605fde809e879ead2d2d9194db9fdbc33 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/3bea671ce0c11617bd60a261bd7846cb3b5b0250 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/23567a09713cba12c63e9996ad45fcd0d5494299 |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5678ddebe1c032c98820ad5f93982174ba5077d7 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/a0c65c91e08a0789ace44f8dff27cf5d122038e4 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/db9658572064c6508c5938807560383c27f30e28 |     
  powerpc    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/ff8e1a52393352ec6c02a4aec117ddf2d272d72d |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/09c58b7df790cf0eceba424f533a9c6b3d47a21d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5b7f7d33010d69e009d201248c80a57797158163 |     
  aarch64    |           webkitgtk            | TIM | http://autobuild.buildroot.net/results/9476f05aa4462db9b73a80a29d5a54ef5a6ebbc2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/05685b22a429a00657b457a6ec35682ceffc5005 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 3 
            erlang-jiffy-1.0.6 | 1 
                libkrb5-1.18.4 | 1 
               libtheora-1.1.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/23a066d6dc6dd0f80ec8fb4322e6233daea7b507 |     
  riscv32    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/e623f4e1d6b6004e98815b8b7da3938238890bd8 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/b924dd88ccb77cd08d850759f850e67d0e4a07ff | ORPH
    i686     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a2b80b737aeebad42ec903ed4a5f6ddc90a9c9fb |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1eaefe940fa22b6cb3c576ecea2d5c42c6e6ce14 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/bca68ab305cb9414a27323fb914bdb7a1c701bb4 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
             kismet-2020-12-R3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 openal-1.20.1 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2e9ed60019479ca038b504b499ef6c92ab664691 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d01fda807dc76739126c1be59383591e2eea9261 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/9f3ebc8a522d01cc6bd45e51bacf2941c612eae2 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d12eafdad73b2bd585dafc8c2ee52e3b51cb7566 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a8167fa4994de34963de5012bb2fc2fdc57078d6 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/82ad988ef2c0734e576f943d572857557c3c2de6 |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 7 
              host-libcap-2.52 | 2 
tvheadend-dbaa0f850394af8ab... | 2 
              containerd-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
            docker-cli-20.10.7 | 1 
                      gdb-10.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                  libbpf-0.4.0 | 1 
               libgtk2-2.24.33 | 1 
            libqrtr-glib-1.0.0 | 1 
                librsvg-2.50.5 | 1 
               pulseview-0.4.2 | 1 
                    qemu-6.0.0 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/3e2ab8cbc461bf978d94525071e83f7f4ebe6ed3 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/194b5f24678481506161b2e9b4cad23229b2f72c | ORPH
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/d8f48d9d7f812f79129b0c69e94f4c9176ee5dc4 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/fb14ca4d37f680fd9114202810148335c4b661e0 | ORPH
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c3e8173513786339e4b04cc7063d9cac38980657 |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/fc61dc8bca9cad5127fe9bcfe8c378359792ea4a |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d95733b9aecd3d62540338e9782674678d5cbca |     
    arc      |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/db4cdd8bce99c290de11de402382d05c29550bbf |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d408b039899cfd75fb5eecacd3444ec210f639fe |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/0492624eb385dc903f3ae140921cd939067b75db |     
    sh4      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b8ee3b8e607943890e4f50e6968c09897e5a8a31 |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/075ea051ced202fcf45067082e1a21f6a1544a4e |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/0faf8d640a7afc7235d55fb3b1b0415baef5d84a |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/9e5e01ed4c76d553e81d3301ac33ef232e70412d |     
    i686     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b4fdcd90b2a60699618367e9eb1218b9d6f17bf0 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/2933062b10cacae4194d8cceb60a9622c037fd53 |     
    arm      |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/68b6b8a663eb4292d9712610390c81f19a3cb621 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/2c0f41d53cbd199ad295a733ba4f37d745a1ee38 |     
   s390x     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/0f46a6e2a7e86939a685c42d8352427873d8ce74 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/fd6b78e21a89c8e1c5bdc096171505e14baa6920 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/86ff37808dced1fe603ffffcb846df6fee28708e |     
microblazeel | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/681316d40218aa3a1f44cf4954a97618e2bb1882 |     
   x86_64    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/aebbb3082b7b0a2bfc67b9fbf5fb86791f54ad4c |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/21bf5b10072d2c14072e98d7525f8bfe3da18663 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/55472c595350615fed6f55ddcdf50fc3853a4c55 |     


Gitlab CI results for 2021-08-16
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505532698  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533398  |      
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505532815  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505532700  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533161  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533162  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533163  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533164  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533165  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533168  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533169  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533171  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533174  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533175  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533176  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533178  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533181  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533183  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533185  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533189  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533191  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533192  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533193  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533195  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533196  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533200  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533201  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533205  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533208  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533212  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533213  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533215  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533218  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533219  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533221  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533223  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533226  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533228  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533229  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533230  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533233  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533234  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533237  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533240  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533242  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533243  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533250  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533252  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533254  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533255  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533258  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533260  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533261  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533263  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533264  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533265  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533267  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533269  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533271  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533272  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533273  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533275  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533276  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533278  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533279  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533281  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533284  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533285  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533287  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533288  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533289  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533291  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533293  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533295  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533296  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533298  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533300  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533303  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533304  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533307  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533309  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533312  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533314  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533316  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533319  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533321  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533331  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533334  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533336  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533337  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533341  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533342  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533343  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533344  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533345  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533346  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533350  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533351  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533352  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533353  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533354  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533355  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533357  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533358  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533359  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533360  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533361  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533362  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533363  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533364  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533366  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533367  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533369  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533370  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533372  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533373  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533375  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533377  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533378  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533379  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533381  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533383  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533384  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533385  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533387  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533388  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533389  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533390  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533391  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533392  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533393  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533394  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533395  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533396  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505532823  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505532768  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505532772  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505532924  | ORPH 
TestPythonPy2Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533001  | ORPH 
...thonPy2ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533045  | ORPH 
        TestPythonPy2Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533053  | ORPH 
     TestPythonPy2Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533056  | ORPH 
    TestPythonPy2Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533059  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533071  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533089  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1505533090  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
