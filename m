Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24F7C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:21:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D7646105A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D7646105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 517F9605D8;
	Thu,  5 Aug 2021 07:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H23A2z12Yz0I; Thu,  5 Aug 2021 07:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 094746066F;
	Thu,  5 Aug 2021 07:21:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8721BF859
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50E006066F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHuOXlN6CKuJ for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 07:21:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0159605D8
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 07:21:31 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9CA76C0009
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 07:21:28 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 05 Aug 2021 07:21:28 -0000
Message-Id: <20210805072135.50E006066F@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-04
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

Autobuild statistics for 2021-08-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 293 | 144 | 16  | 453 |
  2021.05.x  | 280 | 73  | 26  | 379 |
    master   | 1317 | 520 | 77  | 1914 |
     next    | 318 | 152 | 22  | 492 |

Classification of failures by reason for master
-----------------------------------------------

                  host-python3 | 58
                 pixman-0.40.0 | 32
                    mpv-0.33.1 | 26
          refpolicy-2.20210203 | 21
                       unknown | 21
                   gconf-3.2.6 | 19
                  zeromq-4.3.4 | 18
  system-config-printer-1.5.15 | 17
                    ffmpeg-4.4 | 16
             libmediaart-1.9.4 | 16
                librsvg-2.50.5 | 15
            erlang-jiffy-1.0.6 | 13
                    qemu-6.0.0 | 13
                      gdb-10.1 | 12
                   libnss-3.68 | 12
                         glibc | 11
  gobject-introspection-1.68.0 | 11
openzwave-62444b0f979c337d2... | 10
               capnproto-0.8.0 | 9 
        host-sentry-cli-1.57.0 | 8 
               libgtk2-2.24.33 | 8 
                 mesa3d-21.1.6 | 8 
                    mpd-0.22.8 | 8 
                 openal-1.21.1 | 8 
                harfbuzz-2.8.2 | 7 
               libfuse3-3.10.4 | 7 
            qt5location-5.15.2 | 7 
                 libqmi-1.28.6 | 6 
                mono-6.12.0.90 | 6 
   openvmtools-10.3.5-10430147 | 6 
                  polkit-0.119 | 6 
                   sdl2-2.0.14 | 6 
cegui-00b4e1fe174da53b7ed72... | 5 
kvm-unit-tests-kvm-unit-tes... | 5 
              libsecret-0.20.4 | 5 
                  mupdf-1.18.0 | 5 
                      tar-1.34 | 5 
               apcupsd-3.14.14 | 4 
                 dc3dd-7.2.641 | 4 
          libmodsecurity-3.0.5 | 4 
               libtheora-1.1.1 | 4 
                libvips-8.10.6 | 4 
         nvidia-driver-390.132 | 4 
                      poke-1.2 | 4 
               pulseview-0.4.2 | 4 
                qt5base-5.15.2 | 4 
               qt5webkit-5.9.1 | 4 
                 ripgrep-0.8.1 | 4 
                xenomai-3.0.10 | 4 
azure-iot-sdk-c-LTS_01_2021... | 3 
                   gvfs-1.44.1 | 3 
             kismet-2021-06-R1 | 3 
                 libvirt-7.4.0 | 3 
          lua-lunix-20170920-1 | 3 
android-tools-4.2.2+git2013... | 2 
                 apitrace-10.0 | 2 
                apparmor-3.0.1 | 2 
               belle-sip-4.4.8 | 2 
                       gdb-9.2 | 2 
                   gssdp-1.3.0 | 2 
                     host-mono | 2 
          host-rust-bin-1.54.0 | 2 
                 libebml-1.4.2 | 2 
              libostree-2021.3 | 2 
                  nginx-1.20.1 | 2 
                  pango-1.48.7 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
              syslog-ng-3.33.1 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
                usbguard-1.0.0 | 2 
                    xen-4.14.2 | 2 
                   bullet-3.09 | 1 
              containerd-1.4.4 | 1 
            docker-cli-20.10.7 | 1 
             fontconfig-2.13.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
      gst1-plugins-base-1.18.4 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-cairo-1.16.0 | 1 
                host-gcc-final | 1 
                        lapack | 1 
               libgtk3-3.24.30 | 1 
            libodb-mysql-2.4.0 | 1 
            libqrtr-glib-1.0.0 | 1 
                 libuwsc-3.3.5 | 1 
                lmbench-3.0-a9 | 1 
            luaossl-20200709-0 | 1 
 Makefile:740: target-finalize | 1 
                moarvm-2021.06 | 1 
          modem-manager-1.16.6 | 1 
                mongodb-4.2.11 | 1 
        network-manager-1.32.2 | 1 
                opencv3-3.4.15 | 1 
                 openmpi-4.0.0 | 1 
                      pdbg-3.3 | 1 
                     php-8.0.9 | 1 
                   poco-1.10.1 | 1 
             qt5wayland-5.15.2 | 1 
             s390-tools-2.17.0 | 1 
          shairport-sync-3.3.7 | 1 
sox-7524160b29a476f7e87bc14... | 1 
             terminology-1.9.0 | 1 
                  udisks-2.9.2 | 1 
         xlib_libxshmfence-1.3 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c4e48147db5e4e345c3743746455ff2c3cf87ed7 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b80a07177e26d82f10c8131f601469bfb6f8b1db |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7a40acab73b5a2588e78730987e197a1abc12f4c |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9cfe2d9c9a94957dc1057469b93e2e67774acdc4 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f21a3545d5ffb9c899e3b41f8de330274de6f8de |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fa595cc1716ee790595c6390d688a00990dc90f3 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/2f8a5db8b518bd522f4a661ec4bc3fbd270dfb07 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/1594bf298bdabd25cec91f33693465560cca279c |     
  aarch64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/72d543ca3c9e67cae5141ecb4b2f0036d5027268 |     
    sh4      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/79387fd1deb9cee2a9d9d862a17d390bd939ba80 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/004362e2239d3e233f3f5d74ba76a37b9e57a141 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/df3c719bbb2565d7752db560f0743c2a61747fe8 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/5cf4547b022b231e81894091acb6dba5dab52b8f |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/07c3ecb4c621dbd33228e2f37885eeb382205257 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/77dd07761032f0689053fc9ad4001a5c6d65cf71 |     
    i586     |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/f4d88bdc45b39876adc82f9b9c4514c21ec4f0a8 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5d8aee8d30b06d1deeb601f83745cbd28ee22cfe |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b0e209e174bc436ec78134ed47614f585a5d5a11 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/36d3f9280a73f79c1b2e887e554a0936da9f4009 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/de2b33a7e2f888630a7ba7633ab77106f7391bdd |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9e23e59ebf4cf9ade7cce6c581254eeea0fb161b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/56de43a5f02c18a9e24cd6f5d8be7d5700e3c8a5 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4a8056bfd673ece00ff93c57e8ba323adac77383 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6fce19d2dc96a7c02cad093bc4f5a206f37c9411 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/cc4cba46d6548437e3e59ec6ad101009cf87f6fa |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ccd4fddfd890aba7a3d4bf132e698e09a1e8d748 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c99475abe9c13dbc5c17ec8203fc0e4ac6f6e3c3 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/98e976a207121aa03df729dafd4effd8d5f4ef63 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f975eb43023a321cd69136aed7b83c47b74a4aef |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/dcb85358df2b27497b55e5b7dd153c2da92eefff |     
   x86_64    |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/9c4aceff430228912cbd9ef7d3aeaa40440cf39f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/10bae0a1360fa1115bf63fc98f686a25f9ace038 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f9f74cd75f77fbaa2463792ea976cd17b7c7a352 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/fc1e3f780501a04c977bcae35730e4424e79ec15 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/df3b3e69ac2f66aad4ed05455ef2b131d1e3936e | ORPH
    i686     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/3a6f3ed83775b5ddeb2f0c60fe62a2e83b57072b |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b6fd8bb35a375f26e584e9cd65c3f7ddabb901d5 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/744ae6c4991160836a08ea2f65185f356a1f2fe3 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5181423f4e51f8058155756f0b583a4fecbea612 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/77038dab5ba223a6addb35377bfd2be31706148a |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/db38e5fbe2e1a2464f1d5f3d157ce63fe0783c31 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/67b53dbe5deeed0875eeed5e23c9f5270091d230 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/afdd7399d31e3c7dacaed99e137ae9d07ee24147 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/fc320857ed431ceb32af23412c0b036a356b6a38 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b131806e21cf84f567db57fa1f1acbe8540692d8 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0b5d42f566aa8e0cf4dcf9b0a6bfa125e6e5ff5e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b2c06cffc262fab066019f01ec044625bd27b638 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/57f4342e2982921a747318b7ecff7c1886c9c653 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6830da98abb069c839808d7eacb509a4799eff4e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c4913b98b0e6740c07da037f547102fba115cc6d |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c419879d407383709383cf19e90fa12656b8d573 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/cd490cf81c93a89778dedb213791f1709f02853b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/63e3ea8560b031a20019e602f26c075d5757c0a7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/839feac9095d6f1e290135bf3514d8686448d079 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7d83e12c07b41cf41ab5a28c1698149d42ffe1a2 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c13883f29b82f245a3f846cc7764d24efb0c0442 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5465666a271c6165e2e6b8038470b5f447da8f70 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c2836845b6992effd27b012d430be38d64919530 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c1b205d7cd830b6134073d804d5cd0bc3a7c5cfa |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/021000b03b4381e0052279ddfbd14896ad69a645 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e8a644d1b1686258226ac7679ccb4bbc01a25bad |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/78eb8d4dd8d6444a763e5cb10ea416a99952be84 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8c5008d78829fed26961e1f939ccb97cc94b2904 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6571db3e7739713f5836ee71a5452dbc93988cd5 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/931f577554e91cbe62627cc794b00486d7c533f9 |     
   mipsel    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a5381f1de7441f083134549d497e6d7147f9d78a | ORPH
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/14a46a91f50180deb3ef22cbd2b4694f69c215b6 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/0a0673c4d90aad0dd66d0c21194dcda519a348da |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/dca7ecaa4fd6af86fdbce4b916c0e4fa767d718f |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/9d8a9160ca89f882797965d0d398fb2a95501d38 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/c90d76088f12e282a02fa845b0ee86be10206987 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e6a7cf96b9656cb2d9ac46659266aa93b5bc8309 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/ab68abb97cf56617620decb089ba904b9b4aa725 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e2f5b2886c0cc6f57d53a9a50d858ac646bb507c |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/65978fdb15d3ad4acbacacd23f7afeab94f0ea1f |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e763341a905ece80bfdb9831032d57d4372226cf |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/79447c74c69f838e155ee19f43e45a294938dee6 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/98829e1be4005ef9e71aa6ab5a13489fd6b15e77 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/0926d5c58f51d48b4d79fc73e7d7e28383e167c1 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b2ab7516aafd8258d03840d41742ed30e63c613f |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/d79f68185dc985087f6caf7b3cf3fbed00e49688 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e06334c151be676be16cdcb1a102613d456beb6a |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/7e54b3237cb832b0cdba22933e45415a90f694ba |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/c74931ca3514363b2ed1d991e54a49514265fc41 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/ad9e7d85726630429ce4d2d17f8cda764b436da4 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/105508c58a11e9ff9ead18ff4868ed7443bc7cca | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/529ca64af79760c84b885543f843b4395cd512b5 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/2f1567fb5ae3812f57a77c00f2883d2d3ea70fbf | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d4349fd641fef86b84e018abffad9572f74ee7ab | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/a33350f3a00be03b671b47614196741fa983e0ca | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/1a287b77f9cbd339190b53dee920ad95186292f7 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/e20e6644d523389e1080e1a36b12bc2b14951c12 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/75a9bc912e3ec1ff2d829fd56f3df3faa64f4c74 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/47dd72b50ed7e60dbc86aa6f1fbfbfe91fc67fe5 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d02ee02a0b090f244129c83317b6de67a366eb4a | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/71c208e05c4e262d02a281f40a9fcce34e2d26d3 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/54bddb5cfa0c2c6e25e0cd9bd43c0c661fc99bf8 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/5df7dfd6faedf55af6c699d2418c3b34cca71f6a | ORPH
   nios2     |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/1a045342b5f7f8597c2a67847551385bc1de8406 | ORPH
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/c0c0764381246639828a6885b29b9eb17b7ff2e5 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/b8d50bd7ead2eec0135c867a73670ae21c6d0c2e |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/3bc595165f33be9d3d93f6c6c0480ad8784ee7fe |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/0f0d977a6f4f1541bb83803d93c89cc959074ddf |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/41851becb850c73cf842e569a0511cfbc64bc293 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/c0281bbb09bad86574b230eb480f5c3a5251fe74 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/cbb24e4f9f639b23922463f03d9a03d5fdc23fb6 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/e8feda3cc80b980ea315affc84a38628a6107b3f |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/3b438b6b53f1edd8b606b48281a690dd2ca98d4e |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/ccfe858ec9f3fb923e5271a022446dcab95a314a |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/fb4ca4b8da50ca17c894cbab623afdc88ff01752 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/3f5b05c350ca0741d8008b487db9f16c7843e90f |     
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/13b04a7959fdf8e2937d9f9621f488305d32ff12 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/f5564db57ec4d8af32bbee05184132d692743e17 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3ebc6c1366be63eae2b8eb18851232d77ce3d953 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b8323de62fb6a7eb92a76abc1997f6a041228e47 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/843e55d9bf2fb772d3aef4439d5e3672241193b7 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/83031259d1ed9e833eda6382cc5e62a92a56ff17 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/246c91c4b0f273943942c0abb00a3ca7a3712d23 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6d0489fa1e9b0532157d181023b4764e9c8e5902 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/1a3275645681472dcd3dd4bf3f0d2e8d78a8f9a3 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/04e18aef085d8204d8e23d4b2c9786ff79662aac | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/768ec6f34dac8deb8affd489138e7250a4cde8fe | ORPH
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/174d093275f75ff22dcf94d0b005247ddd731d71 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/ba39192a21dd47cd7a3005a544b6edee1ff94c6e |     
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/05d5d738c4efc0d4a551e67ef2be531ddd209bd9 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b189e614abc319bf8cce8fefc85e676e5b861d11 | ORPH
  sparc64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/d0c38d1591f82e863d31a07ae7f89bba2a53144e | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/53b94a0c6efb378e8735c05bf95c2e2d5bf779c4 | ORPH
    i686     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/e2f2fb947a31f55abab842f0dd353f9053fe8a40 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/34772a12de0120dec3467a507f28a3d65ccee05d | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/494fb93881e0c29b34178709c3bab8dbd987815b | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/053f9499117c344998a081ab2bbf327960dae71a | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/bca87bf5c9696e3490895e6ec888351a9fd33810 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/bd3173ad566fbb0ac1d38932c8d9d2525b7e61da | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/15552eebcbf394b2a468306d7a80d29e5ad7f0ab | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/f4e44f4c9620e91c03e113cd72de0c45c3e14367 | ORPH
   x86_64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/61767f79888ccd4e5a1b3eb39e38cfa991d4a1b0 |     
    arm      |         host-gcc-final         | TIM | http://autobuild.buildroot.net/results/0669f115adb531c01556c1f3ae93900e0a3860be |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/f3f4fd8a0176cd7a493d5cbd0ec3968f2e0a0100 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/09aeb601abff8f620b075255966029111aac433e |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/3f1668b449eae777cdcd0646f8a540eb1b0a1951 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/1599b78387ff40e5f3c9d00530c911a1f8e16211 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/641488060a08a30eee220b9eadb340722355daee |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/d9696e2c6f64e99aa31f7c69a3217bc3a19ac3d5 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/2e76436c444731bcd4518bbbd00c1c06f6030570 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/c23303480c27c6092960988e50f64eb4065ebfe0 |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/ed7f85ebc6c7a0346ce110268d12493280d64203 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/379ee37155c7d8770163c1a24f6eb921dfd77575 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b5b3e39035018ccd993679784f49c6876a602c41 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/45e2fde42179f71d8606e215822932500dadda33 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/49d2a6422300d9b67caea0d25e697503aabab17b |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/02456a898882925f1733c2fe032fba11182d9aa8 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/183e54add33e16e2e8cdcfe8e5c3ec9250ec4f49 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/8eb8600dc7b11d4fa57df3038f912ffc2dca5cf5 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/83b744f0eb922d2c924462842eeac81735367775 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/fac32d56528aaebfe79b64a6f663386e36d277d8 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/ef6fa4519842af1ffc20a90ea20721bc1014fcd7 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/698ed5b987299ba6f462249545936e52d4095baa |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/50dc19d18016c01dfdefadfdd0396b8ff11fb976 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/be3e6ecc8a98af0e07ed5b0e46ca2ab841bfbf32 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b126c5b2d8b4c4e9d8e1cc14d1c52f574fb5736a |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/28f9155cde929cf7face040de2db57661915a2fe |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a76c4e07a9f0a6d65ad60a84c9d095c5d73c8c85 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c8ac6f46243554f4107fb34560b54cfea42754a1 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ce7485036a1049faa83da2d78bc048d415389b98 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/feee019738cd5ae778c134b95ef6a74c82d80ad1 |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/d369da57f22c63f7b4285abdb759b04a61b51294 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7b9191d2c999fb1b6c539c0c94e8ba9c39470e18 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/d89e87dab1d9db6231407e41ef231f99c370c6e3 |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/1d7ecb0f2404117599d983f2dc6bdc3251e5a22e |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/47ae72edddf6ab7bd77e2b6d3bf9e9bc693d0977 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/c79d129efa75ae52ab50656d72275f33a815a7aa |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/8e3d578ca7ee5f688ff808784a5cb6ec8f859d8e |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6001e749cbada581194f1430c6bfb7f8ef7bfcd7 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/403b606b223b9dbd646f160859a934345b6a83fa |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6c6892c9dd4153409a492da44759b0ae1f84302a |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/dd572f13302b5b9c24bef62b48a1266fc7972456 |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/d0f4997540055a13c9b1e7db7db64823f4516370 |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/675f46a6e1da9b1384ca914f2f50951ce3ec63cb |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0924e271a898c1c70e2eb40db8c24318d7fb7baf |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/2da6a8b51d8d8376c5727c750bb28f06a3897911 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/df6ab85279866a658b95f7ae08a3c393713c2f02 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6336a150549387d872132a0b8dd1c6a72d5732f2 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f6feca32d3fdc23e0d707dc70c6d5d3364ece5af |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/bfd7e90f0e4dcb08cebfd173bfd91f44175170d6 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d6d7e102fd55c5787c4c22e17e1dfe5cd4d02625 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6d2b3f56015ea614fe9d7eb0e0e54b8bcd96c4fb |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/e168b014c411770404a21ab5823008949a6d8136 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/588777acc8b49c57f23460cb65b31832928ea746 |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/38a5d1219bbefec53f28f5053cfcbeffe81acb8d |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/e3ad5751ae746855488ee1deab37ff1ba052c2b6 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/0fa9859c472a401250026a25a7c1b9d3452a3200 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/83067b811b4605252c4916492b15e32ff939235e |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4fa67e6c9fce0721a653332adec7220f6220ded5 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/cfe07be896512bbb1e2ff4e705b2ae6d68225107 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/8373ce7818f45c199973e5c6df0a7c0ae6589e53 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/dc7fcea8d39d01e0a545a7410400fba37646f78d |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/04392d7fbec37b669cfb8181a9729dca93674568 |     
    arm      |      host-rust-bin-1.54.0      | NOK | http://autobuild.buildroot.net/results/82ba15584d9ea8ed44212ec01478c6556da53c6d |     
    arm      |      host-rust-bin-1.54.0      | NOK | http://autobuild.buildroot.net/results/d2bf446d723eb448193914c9205de2bc190e265b |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3373e23a684bae197c0d00939a69a80fd5380c26 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8da0185f100acea63fd40ce3405d22c2ba2ac9c9 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/387f392b3d913690fba7238959434f5a21bcb8d4 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/951af156fc89d46b64812ef452c4d8cd6a3f67ae |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b3bfd07c74b328e8b58c486d4ae352bf3d783c43 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9c0ea735962c33aa59afc449a11810af6101ca1b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7c244700bfd52559d810fe8b2eed24550aadcef2 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ff7e6335c0e6bc8ddf075bf1ee8ab7c04a4374fd |     
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/9f6423e42e8d3c06ac860697c77ccc05865de249 | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/c29efb624115eaf978a509bf927664cf19c47c91 | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/418bb849f91e40696fb77b34dcc9bd20d0d7d07e | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/daa4ff6530d0a761f85805cc2f51d504034db1cf |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/bd1428bdd2d642b6b4e7a629276414fe901f4918 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/eadbf0cc2fb81f7d1b032102228aa0e801e7bc3f |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2c43b6b093ef51313ddb2fbecdbfe12e133d1870 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/4b01c0d22518a5b2df7d1c9a9edaa9c261dbc3c9 |     
  riscv64    |             lapack             | TIM | http://autobuild.buildroot.net/results/5dfd8b6a03cd6fcfa69ff5a3aa7aca9f797971a6 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e64e8a26eb231bbbcb8d9b259f77486d9bc372cb |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c812144acb61fa62d39d5bb7c12a43cffb8c40dd |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/f2f4c848293109efe75c4a15ab15700a134f3619 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/4daaf4628495eb50f4c820a44a57672584f61688 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/be76fcfe94cf91c97d9a72678acf254efdd6d146 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5849cb335292bbb6d12bae42f0ca9b787b7d58b2 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/c6237566c342243f4e1372cffb46c80398499916 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/369ce596f996546508172844e047815365e57bbf |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/a1cdc5faed8150e6d9133435614db9ef0241ebb6 |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/af2a48a32b78f69fc06f4e4550352e727d3491d4 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/1be39847598f17a174b1eea30540b80c2ca7bddd |     
 powerpc64   |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/c48f67c75ae6cff1bc65edfade5e35eeaed01896 |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/0c78f42f5df5b8714abb0026346814c640448147 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/6b9396960ce5cc7be281837414bc136d2dc02a6b |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/4866a31abf6c9848c7f74c1f7b4cd09aa3c30e14 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/e75b36a8a8b6fef61feb23c56a454bdac473a8b1 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/436beb474d43c37773cfdcdf9cd76e5388c402d0 |     
  riscv64    |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/ada66c13e28eb1e04a39665931fcabe7550d463a |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/16e806995dab1ecb16d5310d78667eca7b480652 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/2fb837126d310ead5dd3f13ff1fce04d30b04214 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c983dfbe9f084d445e0abb882a9fb5f314a3bf76 |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/7be9f6f4e17eb49b17abf13233d68fcf99cdda0b |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/e66059103e263e2edb02b97a1ad3faf8c22f271c |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/d6770752197e2092e43c1dfa01c08514a1708c10 |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/e07661776fd0644c227ec581ce165d2381265512 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/235090f32e1af9ae38a7c9acb3fc4ea61a7c127c |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b289cb4f32ff683ae305e4cbef5b4e9c5be9cde8 |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/356773d319f994bb385a24e6ebbeb67a8e01f06a |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/07e7399ca7f2a3cc6ef013f3d72eadb0e8484b64 |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/94ebd2c2c401e907dde37f74893d798468e95ebd |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/54ad6b18f8a9ea72fd19b67d5148fa7f60252152 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/288e6d51ada6a9a2651f03505bf70ad50f2f7817 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/d16d6458c6233c4a14c5fd5a6410f63b8e107af7 |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/31a06dddcb6481dbe38784743553c8f09e7393cd |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4129b4bcb4383f6cabb1b01b5435e60717867243 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d21904c780e0cc4f21c91c3ca75390945408b8dc |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/db256ef10ce37b2b65134b638b6814dd7c89cd66 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e66d537f335e14670fbf16819c1c03b6340595bf |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/a264eae3c9f074cb45a6cb5d3490c5fcc8b1e83b |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/477bd392f2b47c32e0d1c8fe9e1ab6227035589e |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/6f623092c7a487614d69069ebdbf9141e1199415 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/e857704839c13af7da8c1141e105080dcfa74f44 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/8dce2ab3084e941ecc3ad524c26415e92dea5cba |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/905d47cc37650abff5beaf7bc620e164d3442c5f |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b3be7ed7b43cdedea90508bdbc82e4151e4f34cc |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/7cac7f90a34b4642b01ed3438d4c5be7b16731e9 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/7eb48994fd84d54e1861e88291e4cb1faf3c49b3 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/5fac2a53e2802a7854dbd443454c47f3ff785d88 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/d9fff05a0b278887f64af1f6ebcd0cbfb063a35f |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/ee92d52c959fd5bd0f7cd8a8df92ff7e0df2ba6c |     
    arm      |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/d038b79e719c37a93d635c6b61443033094d8716 |     
   nios2     |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/2a1e55c0ece846d051e79d35d3773baea0a35247 |     
 powerpc64   |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/5b31efcbce213bbf9b0173ee473521cc96b261d4 |     
   nios2     |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/6c59bb3978068c5051017a0127db4a449cc2cc45 |     
    arm      |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/c13877a5700445253900e312bc87904152be429a |     
  sparc64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/9261009c6570633ab02931f72dbd6ee09935c7bd |     
  riscv64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/58afa4f3b39bf28860f9fe3472a250ffa1c610b6 |     
    arm      |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/16179074affc7494c59c35c864ea3d566cd99965 |     
  riscv64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/a601a7850a3dcbc7e6d4867ec22df512462fab3e |     
  riscv64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/788abfad8518b90158b210c14177fe0112f016eb |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/392d6330021faf0684216879cbe3965375f4259f |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/574513cd8dc2495ac957b96a57af8687bc8563c2 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/523d6fd9fa9e0faee931ef6ba89a94de87da8ad1 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/3d3aadb360793d11b3db15f6a683785aa6fff1af |     
  sparc64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/fca527ea4105214c88db25acd5ef55cccda4b87b |     
 powerpc64   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/251b5a1e4ec6c7f79d5b0f5af0c8b0d81b308d96 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/0c97bcf2f467c782b3a9462a694082c31d40b40f |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f5da66416bd1b7aceb6193ff8713e3147cabdf37 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/244c7508fed424e189d9a3cd63f838b8c8cece45 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/da298575c10f6c9e459d25e415b9578447eb82c8 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/cdabfc78d1b62d714a3d49af9669c7de90100cfd |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/54324c21d8135fa32dfdd8a0cc3e9cb586e06007 |     
    arm      |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/c27ac6c5135fa14c20759626a6b5253813189887 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/a0f5d89dc8e1f1d6d5a9ba203e63b7630ef59e2e |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/15a61a1a0e0b97c9c3325956060a19aa2862369a |     
  sparc64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/badec020be12cac18ee1922240e5ef37f5de263a | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/ca51a3949c6f8cd6abcf58ba71dbc283f2f4ca5d | ORPH
   mipsel    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/6209305b1c92afe9611ad545eef32412469c4f44 | ORPH
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/0bf0b5b86499e6de507f150d44b2d09619dc1eaf | ORPH
  riscv64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/ad45e743efda3307293d569c82f709f6837c4c08 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f6ca6d1a89916004aedc445aa8652200e8fe67ff | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/396242e7e454c90355102f444b71d6473ed4b123 | ORPH
   xtensa    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/3bd8870f9ce7fe63c477b2b3fa8c414aba30f795 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/7817e656718320703b13d6679f4bbefff38a022f | ORPH
    arm      |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/1b031667e6d184493ea55ea6630272af4e475375 |     
  aarch64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/a15fdaa67c3dd3e9b97df9c08a451db4a8d032f3 |     
   nios2     |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/2c7e326851e56b0a18694bc7a387ce031397eef9 |     
  sparc64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/dcfe7dc7d04da29cc33ece80b9e6dc79b22d71f4 |     
  riscv64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/ef846957f56f9a758b0db336a3d7e422d3c79058 |     
  aarch64    |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/aff581a3a13f72288bc462f36ea8987928cedf0f |     
    i686     |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/b9092268bfc9a267833e54926e3995d59c667a4e |     
  aarch64    |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/18db9ec30d5e60fbe9f5096c3fd1a30396e11856 |     
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/6cc01e83eef17581937d140925f19d83bbf66a7a | ORPH
  riscv32    |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/1b169cbfc130434ed120b8c7052d4a559c88b788 |     
   s390x     |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/1fe4566d395b1ebfa7271c0d2fa8a73c537dd888 |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/13d54c4e427230e048d07006844c391cdfae030f |     
  mips64el   |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/3e043f992f81ba1e7ad7a2c64d73425e074301a2 |     
   nios2     | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/bd00478876b447640e24ba0b64a4381cf1eaf4b4 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/231b347b9e9bfb7c5ff155c6bc5ae8617252ec29 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/7e2b4a0b034ed2bee7505044adaabd4c8046ded0 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/6fb115491af4e58ebac1c1ee75875f073cff696e |     
   x86_64    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/99fbb4034f59c90db6bdc87eeab86a1f64f00dbd |     
    sh4      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/ad4501a86f9d7cf18df0a805cf34b440eb7ad01c |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/18390b8012dfde5ffb5f20d9928c39eb304b6062 |     
    sh4      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/0090d0ee61c9aa4bec2e03715b789070c30cdf8b |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/b7758ef3b095d0814e26ec107609b02968e75384 |     
  riscv64    |         moarvm-2021.06         | NOK | http://autobuild.buildroot.net/results/3334152b447174cc4705b09d3a6623e94c615a7a |     
  riscv32    |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/67285699337ea2bfe8618a3ba2da979a0257bf54 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/3c11886407095aa0bdc69f881d2f28b5bb8fb954 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9609d868fd0191a7557e0ccf1a10689ef1275c91 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/5e6348e4e68b3a85d17e64bc73255e06ea15409c |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/5ddb25b5bcd4608a79da2b68a48c7a96ae68fbfb |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1734b8c5a997a1eb2f89ad01316753ab9a3d25be |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/79a36b2271db0744d3e3a21992ff3d57e1bb315b |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/6a4cfee981ad9a09a857cc771aa749b0858a7978 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/c683ec0a73ef5b5fafddc77b183f38f186cd7277 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/b7caf7e8cea36642e99df3e1e71aff845abce5c3 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/384258a29d27e6279d96a1cca335889551d29f26 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/eb52b40f83d39b866f15509c2faab42f67df8da4 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/f6814119840f3e235772bef16994647d72dee43e |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/04fb521babb906f5902bf8590517ee1b35b3c62d |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/06ed885f2a5b7d6195e84cd916001437ac8e7eff |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/fe69fef2d73273c55be283de4f7eaa09dcacbff1 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6a3ce8abd80b5b4fc9dc574881126805c55be1fe |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3b63f87d08d8b00be854a7650d6a15b1fcde579a |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5217afa0d53f3a5b65bc44d4f3e4fcbeb3de1e83 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4bf6c3d2ee0db28f90f175f3cc442dfa4a4e9edd |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/53d781e77d6e3a70e2019df12f509d62e836eb49 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b08e55825e5166f7c90cca2f58462c3f1d40df37 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/df4866146fb648ba15f4e1e8806388147dc3648c |     
    sh4      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2a4c5c0e982dee70389db1672ccfaec9719e0dca |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c2cdea43a0656e19996d9e13a87e268b47201f67 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1ba50f3b2356e180f4be654a9d5ac53c10a927b0 |     
 aarch64_be  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d5a54a8e2e7a0e69d9a0316bc3134b7641bdf6ff |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a5d9ad88329162992d5cc19272354ee040e9895a |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/150b94effd193b80ca815c9a4c07b318ce961af6 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/95bfa31c50ebd63f405253db2533865cb6344258 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5c5c96d49b9f1a797da909042b7086ac5b61d300 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/dc9b15364aea575a79a366970c7c1d6734b52175 |     
    or1k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ed57cea60568759e4ae51192d32b3c721c4f7f70 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/844f763c36610da887f34576a1a521f1f66dd9b2 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/42d90b2d7210bfd2676f470021f1b015712b473e |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/98ec2bda227760f59c797362737d28455a48cafd |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/935507b519cb7415039574992a12406720bddd55 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9bc0b910f2817dcee924017f32c4b0bcffce9fef |     
microblazeel |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7d09b3039fd1e0b6de444e608f6c71ac5932bb69 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/775ab63486a3e6be2bc298b447279172285c797d |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e132867f8e953a2ca4ca635a3096509788acf989 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f2557e344de4d80b67510de2a3a9389ec092b7e2 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/1e90c1e10eb3c99ad03f59655e8b4cf0ce58a45a |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/156fe9ee5f6dccdc98990f6c5de5562383bc2b74 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/e99044b98fcfd921297225d2184aac1fb58e2fcc |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/5f09f105f0bd532d8bdcded1798eadf37a396871 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/00732de15c5f4ac46b37b09912484f4001298e3f |     
    arm      |     network-manager-1.32.2     | NOK | http://autobuild.buildroot.net/results/dc270ead82707f89d47616a0c18629715c6ea1a5 | ORPH
powerpc64le  |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/c76d9a5674da6df97e9009727e1002b45517953b |     
    arm      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/26708f21854650034870d7ef58285f0d5bf743d5 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/0931dbfb3a273c1916e66a848dac207d5837e044 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/c74dbff7d903c112e159add0edff83fd811bf660 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/4e9aff580adf78ad3c8f80e96d766bffe5819bac |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/9f263c2702178a925ce1b687fb21ef8245a615ae |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/83031d06687a5e4ae773716f6620186a8b18e52b |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2947268ba18af0e40f34984ef32880b062e3eca8 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/4091637050b327e0889b15cb23dea241746db8f3 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/3fce4f91052e3a894e7504012851363cd9f919f4 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/3e1a7bef5942e6f08e38a4f46bcc93ef032f6904 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/b18a6e635a590d7561fd0cc99c142ffc0736ead4 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/85f81df67b972e634ba6b3137ef0751fb034e3e3 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/c1b1be2a0f68d148fed332c86b98b5b1b927b5b5 |     
  aarch64    |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/ecd10a21cdf4bc348a1b37a170537d5b164cc0ce |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/227fa65b703252a1ca9450f6126563b2e0fcf1c6 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/5d27a66f770032a3a51761a70e0883f3d37a8944 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d7aa4918ea4d209160938a12dc17f9acda723ac2 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e6dd1fb176c4e2be3f891d429d8c68af35c0a6f0 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/737bb64d121a6927ddd506aa4a6e76898493fe14 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/7e03d68fce6a63ab50b1c30b230554a3aef9b575 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e53c91ba2c81642537a46b1c48f83480a8f7b2bf |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/087ae7efaab61baf55c59468b7bb40376ec73dcb |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/7416ec68c6a05dcc6f031a783893df0da65f158c |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/dbe7c6d797da7ae83776573a2b2a07ebb2394948 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/678c22f74bca4895aecdb1a4c34780ed4e7a23b5 |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/fa6cf124928cb0cbafaa2c4e1a2b9e79bb603ab4 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/a695e2b9b56576f311ce71ec5c4f6f3e6b0f485a |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/5c08b4e2bc56047e179ef4c7de9b27de39a6c31a |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/e5bb660ec3f009df82a3ae423bfb17491a56f791 |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/00d9d5fb0e33d3905d1f31f425aaefabebcf3f20 |     
    arm      | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/a7999ffe3b93391b9a20dcfa3ddd9d21daf0cace |     
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/b9e5f41a014b6d00254f5908c926c864a84d6260 | ORPH
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/10011fde01093098d7f282a52dc82570e65a4370 | ORPH
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/05e0fa26de5f47e5872301da9add9de131aa0bb9 |     
    arm      |           php-8.0.9            | NOK | http://autobuild.buildroot.net/results/4f5850929290b8105857c740763ee2767afb1c2b |     
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/731ddbdb1296df8e278304de458371039bc56958 | ORPH
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/e970f7685a8be379b5fdb96e4564fcf30ee36e03 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f512290f5acabc4ca24557c3fded4b06ff8b66cb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f65924f470d4286d604b945151a773e862be43b4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9a11bd24db5e0ad5335665c727052a13e592fdf8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ca676485502674f68cb81f0d4a4aed5d5a79438f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8594495b4e0c32442840047a1e95f53e1f23c80b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/525bf732914a4ffa5377948fd3b641e36994ad5d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9d46da583909930735eaa4b92dcaa15a30427495 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d15957885c994ad33cb8a575734fcbd875c3ade4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8952c8aaaf46c5c64182caa5758b68bcd8a76522 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cf294c677e2fb65358e4327da799aac6635803ac |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8de1a4f32e4b876735c90f217cf33ff6b2c420f7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a3cdf6f6fd28b07ab93b6e3512cf1fa723ebc3ff |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/92ef2e8db3867bf66b2fe31c755960f4d8fd0bb8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c0ebb1099893c55fb72c233f7a7266df28308b65 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d3428944c7104a4e9188f9ac052765a9efb6f43c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a8669335863b960224e347e64212fed643e4acb7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/770b96b8aeee1d8a3f5801dc8d02ae16ef4fe35f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b567fbbce581186b4c9de32157c6082d981269b8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ad3e4afdc6de3aba5c44b0eeeaccdf71c29e73ae |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f2d4a5cd4b5231b9bf8ed65c3639e24ef8f57fd8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ffa2f31e89eb368ee9c0953b166dfb9846c8bee1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3ecdafc59982928dd25dd8cf94d5ee1b87c07749 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/96810d341467034dd85b0396f09861fb0e1df8d0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/16592f35f03399ed2636badf9dc2551dacacb085 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1077e7b2cf92fd590a72891d6a7cf1dcab299a6b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/343fb14232c59d2786bdd2c6ed1335d08a364ca2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d073a09acd3974cb49c8ad99a6a4f4fa2fc1c193 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bae55ad474b60f074856ebc8deec5d1ec4abbcc8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/55025128032d9bf7f4822468c40b0b60bf23dc3a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b1a32bfd90f1bbc5f1410c97f4b4fbb5a93f4fdd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/30602dad0c2ef47bf64f56901d23bfda750fbd78 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/893d48b4df053ef495d4700d2bafceb1fb4ad736 |     
  powerpc    |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/3e3bcb77896a9955dd7f9de4a198ed4ab9dc4eca |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/1684f13e48340e10e9856aa0c5d75461b33982b4 | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/43010caac9bbfe2cb0d8e9a0bdfe51921e2ecc91 | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/024e21b4fa902f095832eb65d0ace996989b12f1 | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/77628fa8b784df9ce7a83eeac336f6c58eaf946b | ORPH
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/7f72c22bf3e1a21edd2784c9014de4d58326dce0 |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/90749ada134beb004792f450711a534e61198446 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/8e883aae797aba5605eac8c09233bccc15a8ca29 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/9719432994e6a08fa28b23f8f40a0151af92e132 |     
   mipsel    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/998f3c9cb9bd47e7b378e91d9cbf6970cf355b88 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/b7c3f790f2cb604025b55c3e448f5d508b92b71b |     
  powerpc    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/900147762e498fa3e660053e245bdbe9f3f655b2 |     
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/fc30c3c6fa60f797de09880e032ddf39db605da5 |     
  riscv64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/f7f3fb54fdd589293a1bbe558f17d6d24434c711 |     
   sparc     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/326dd4135da2a2990a3cb02aecfe2ca5aa27251c |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/30a9f24835c3f864feb3484eb8afe7a02e5f8823 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/fd4262dc364625a9e334625c5b4c6e8c774e38fa |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a24934f3a560edd2f25ca74323275d592294651e |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/08a586fc8f9659f1e9df4928850599b6adaf164d |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/179ad7dd158d195859527954e002f38c69ab031c |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/f5aa0730221c10e6bf914a25fab9fd12a3bb8149 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/5e17cc1e29faf3d7fcf7a6bc0ebc960b17c82e1b |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9fbe3fae551b6e8cdb8674411e71737f60362289 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/243492ccb2e0d958e4b36b6738a543497dab270c |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/607a625e9640a81d689be88a965673f3de205d36 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/877352afe5b0aecaadb2d2ce8b1dc8d8cf975082 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d03870ca1d62a6ac288399db6a9a1197e1f2d6da |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/54f924605ee6522c9fbaf121a6c484004f787733 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c911e484d43d2500dc56c529057e469427688905 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/88dda76581716240652a04d5e46efd3a29b7a267 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/ca97cf8be195fe39dcbb5fff86507a380b6821fe |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5ac81b3cdc2eeab611758c6b6b6fa8546600309f |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/21198fe375829d51c5d6f6c1eece077e1f1ea5ee |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/e82ebd9eae0e32cea5ffd31305877c3910d812dc |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/289b15e97ae520ebcf7c948092712b8fb2392ecb |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/d21327986ba2a369a3b567d2056e23a22dc19867 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/0c76e6d62e9b448827b979715a0ab3612fe22e85 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/73d87ab33a4449f904daf660107ffe3cdce9081a |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6d215e70b2e249d28b200ba9dc98d0ed1dafddd0 |     
  aarch64    |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/9fcc5174c113bea7c61800c965a2d29bddbb0d56 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/660fdb029c6ccddaf9104832881176ad05e2c9e6 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/563fa7dcab98ca337cb6200abe338809a31f525f |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d123c6633a23d4f93947fab5fb734f613ea52a66 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/0dd256370ab5bc360fe13dd350973106b1de576f |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/78bdea2bc6060ccac80c603a524563399b729056 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/20c9084b1f92bbc4ecc349063037944ad3784c60 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/26db2517904147552c69748c9d171a2892077a1f |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/89838b17aa73331c214b8baf04f39df21621583e |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1ddeac1c88148b03f26e7d9424d41c6123e698f2 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/06547361156e7afd4414978de3c0e25f2ee607c1 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a4861f606cfd528878d9c68951d64bac720970af |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a2e5cf5efc4d206b832a21d78c0a287ee96f8460 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3de6da9d1e46c44e0fd182e71143f248c1b1f2cf |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bcf74a161e3eda951acf1f83bd6c785e31e5cc13 |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ab7098948d1920e42fa587e07f0513f23ba7fc74 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/225a1e1bf449a3ea70c51523741e224893d66218 |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d8efb56760d418a7f521f43c33deec1a24f92f64 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a19deb4e5b9a582dbb7fcdf8ecb5baaf7c4d0b8e |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/03591877c4cad4b900cc76cbd30dbaa403bb01e2 |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5f0575540b08d8b52a66d233278ef968a8d9d405 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/23f5035d4e5b52c7d731b183dc2ad6b42f886830 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f52fece5bb98c340aa02b12d07500e43e0de5d46 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/fc01053bc0ea95c0ee096e19ede942ec24806aed |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/222213a97b54e49ccb01566c8245c9877f55e08a |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8d1a0814f57f376f167a2e315abefcdae561a1f0 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/de06687e72fb804089dd4f20e9a3389f2c9b517b |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/7604ebad2917d49055714e4e13383e117f651ac5 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/c24017a778d28da057e0ef961627dc7872d6cf18 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/e32b2a34ba5c82638dfc9c8f63cbb09d7da1058e |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/693ba7ff3d157a2d6f822cf9ecf5d1d9185976a5 |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/d9368709b0d751c3172ac131e71b2aff845a3b42 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/12a0092f62b919fd75d932a6a13c90c9219aeb2d |     
    i686     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/9c0e7b2876e2f8a10f6bcd5eef078b944eb24452 |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/22de82b4a7b45c2640b78ba271886007a3bede6b |     
powerpc64le  |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/7f1c345f5085efe32f32113cf21b678233b4d4e2 |     
   nios2     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/4d653ddb7fdabf6ae02581ed9143c5cdefeafa2a |     
   xtensa    |      shairport-sync-3.3.7      | NOK | http://autobuild.buildroot.net/results/92ed30a6855ca11800b779718822bcba4a69c9a3 |     
   xtensa    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/4bc58ed68b29642876bb02710d0cd4f31540de86 | ORPH
  powerpc    |        syslog-ng-3.33.1        | NOK | http://autobuild.buildroot.net/results/0cf359f9717d95bf592c017d552017f061a18277 |     
  riscv64    |        syslog-ng-3.33.1        | NOK | http://autobuild.buildroot.net/results/ad93e87ab886ea88b681dad7c74ada5cee802c70 |     
   nios2     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/bbb9cea5a275d73fe779cf28313d1d53c77e6573 | ORPH
   xtensa    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/6b2e2ed198d1329f7056c1f0c1c2b8a7a8d8f935 | ORPH
   mipsel    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/8cb70db4c6bae7a259cf36d7a557347170bfea7b | ORPH
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/7eb7790697869336fb3458081566be13de687c89 | ORPH
   s390x     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/d7a1dfdd8ab635c921315e0c2a2124dc6f78aba6 | ORPH
    arm      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/6f8b8e75d71c590e0e1d6ca11b5d84787f61dc27 | ORPH
   xtensa    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/0fd453057a736cf193aa0672c4fea64827e0d451 | ORPH
    arc      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/8606b578e9d92b76e10a7942b48d6fef641dd5d3 | ORPH
    arm      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/292b8005ef8a9719a55d53bce4daed5d983c251a | ORPH
    arm      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/1e9afc374cab8088bc61fa8e2230ecef6177d789 | ORPH
 aarch64_be  |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/c2fe75c567f3888556775de6d15aa6d84208ecc1 | ORPH
  mips64el   |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/e7447f6d58c2fd0f7127c1f54d409e28ab734d7e | ORPH
  mips64el   |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/14adcb4cb4903f991b1f0742e3a6a2cedf2230a4 | ORPH
  mips64el   |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/4f573761027467ae71c2b5f00ce306eebfe319a8 | ORPH
  riscv64    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/39508b701ca7331e89ce5369f3e510d40476f125 | ORPH
 powerpc64   |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/8feef1d0e16e5d8aef21a1368a54dfc2bc03bbf7 | ORPH
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/5c239a9e2c7ee9c6d9b3e2163088ecdf69c13562 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/b3c751821e91094f67ee2c43f42a7c8e6e42034d | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/d8cfcc8b41391f12ee3ab7322a723828b24daef0 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/8ecd8c67ef18963ed01aae83bbabef5f18340ee2 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/86045ad361aa42800cd8d43c28b6b60e0afbfd99 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/e34c2fd3bf6a8c6647b9ef624c8d698f997e1bea | ORPH
   x86_64    |       terminology-1.9.0        | NOK | http://autobuild.buildroot.net/results/857ee602a942750e322e4294f7ee8b3ce436904a |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/b497cde70f7ba2719edc3880cb7f8c5d57080246 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/527f144ce155fdd849d545377f725337b258f856 |     
  aarch64    |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/e3171c4a3a3a48ae05d636acf71002b65e16920c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0c2594662666f320e0c1c9b92975aa6508a4c182 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/9b3b8db792ff7efde1d1f9f4933f4549409735af |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5b59d51de23d41539e22848cba63b0e67be7fe10 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/9acbe71a37c37205975f60a4c0c42f327ac57fe3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d3d5120c958204271cf82bd62c064900121e81a |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/908cfff44ceb654bec3309d106e222560432de1b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/235b088eceaa62524cc147f7f0061b1791e7c90b |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/921f3dc0e5dfbbc741e529f961fd05273628ff94 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6226f883d6e9716b4ff5d36589c7ee85dff31e12 |     
   x86_64    |            unknown             | TIM | http://autobuild.buildroot.net/results/1430ba4a80cf5f1adc187c8d38e249b7c4cbfdcb |     
  aarch64    |            unknown             | TIM | http://autobuild.buildroot.net/results/27269bac9e416e308cca5912b59dace9731a77bc |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/724013871479b78082c1107d9ef0e884bf373ee0 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/aefc8c282d7656b507109f84f37ceb3fefab58c2 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/39239409296f561c02757812b0f2923f316a98c6 |     
microblazeel |            unknown             | TIM | http://autobuild.buildroot.net/results/3c09933dec911c047fbcc3e521a3c4f8d4173cc4 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/4bf449a6c295a647302d1d225ca8103c11bc981f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3949baf455ce4a2df21d3f057ea9e3f40a0c9033 |     
    arc      |            unknown             | TIM | http://autobuild.buildroot.net/results/fab32d26ecf148a05bce094982913d56964b5e02 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/815a4e27f9269e45feef145e999e6970d50c8a0b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/719c9ba1474c2d65c930367ff4d43cd6dd335734 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b878f980d8b290fd7e708f6aa05cbbfb1d5825b3 |     
  powerpc    |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/fb9865e2c65ea1dd9a657e1181a6c8c49481fda7 |     
  powerpc    |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/617a2c4c12d4c94e4c76ee8945ad8ee91fa3ab44 |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/984644f1b8d9c0a0b08b3bc0dcbfccc1b4c41e3f |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/bffc915a90f7b4eda47b47c1b163c8164d1bb874 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8dc87b9a2d8ca3690933f07d23deb00676adcb36 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/af97eb4de5ffa02f9d86370be40fe17c588f0db7 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e5f89eb3cb69e87e5c6fc0bd69ed25bcaf443f19 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6e4605f639b56fd4d36fede725ac9f2d370b4471 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/1a5bd29ed6d0c73c93f888f6dfb4f41c71f613f0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7b8eccdc8b5169cfe6991f5113a8a1a819531c8b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0337114d6a70f42b821b152cbbedac64b340989d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/09ef06ffe88ce4ec1bf86452da8a9e83d0d7cdf2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/56934f92266dc229558d68b5a863969b9f3d95a3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ff01e7fe3d63dda158972b6bc80ada3f311e868e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9e409d8f186ee061e73a2a1096b5f19844f94f20 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5ed09aa48659cb7c220168dc33c3f8f177399e26 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3078bdd3dc832d46fa7c104a37c024aefd0c0992 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9442ff370d0186d0e7f39485d584312434c88fd1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6004c95db3231355c9f08862f01d9ba17fcef993 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0672394a8fff708e569229a0b4d62afa32f6cba4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ceba32b0f994638976c2cedcb984761e1e656607 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6c889ef53a02600199727274cc01dc0d5b7a38e5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/56390ce1c1b5ef9774b6131eda4f9c002be7b24a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ccb79eb1baf3f943c7dbf7a945eb5d806f7a764e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d93d5704ab6aa503e540f75451a9cbce8befac2b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/976704781d91f9e37926f276e508871cf09b1eb3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8d1823199ceb6e86cf793597938863a0cbc5ff96 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/1d7081d54638e8925cbcfc44d1e98ff833725280 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

          host-binutils-2.35.2 | 19
                  exiv2-0.27.4 | 17
               binutils-2.35.2 | 15
                  host-python3 | 13
monkey-f54856ce250c4e257354... | 9 
                       unknown | 7 
            host-binutils-2.34 | 5 
          libmodsecurity-3.0.5 | 5 
                  zeromq-4.3.4 | 5 
                flannel-0.12.0 | 4 
  gobject-introspection-1.64.1 | 4 
                mono-6.12.0.90 | 4 
        host-sentry-cli-1.57.0 | 3 
                    htop-3.0.5 | 3 
                 openal-1.20.1 | 3 
                 pixman-0.40.0 | 3 
azure-iot-sdk-c-LTS_07_2020... | 2 
               collectd-5.12.0 | 2 
                         glibc | 2 
                   gvfs-1.44.1 | 2 
             kismet-2020-12-R3 | 2 
                    mpd-0.22.6 | 2 
           python-pybind-2.6.1 | 2 
                rocksdb-6.13.3 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
                xenomai-3.0.10 | 2 
               apcupsd-3.14.14 | 1 
  binutils-arc-2020.09-release | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                dovecot-2.3.15 | 1 
                ejabberd-20.07 | 1 
                       gdb-9.2 | 1 
                  gensio-2.2.3 | 1 
                 gerbera-1.6.4 | 1 
        glib-networking-2.66.0 | 1 
                   httping-2.5 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                    lftp-4.9.2 | 1 
                 libcoap-4.2.1 | 1 
 Makefile:753: target-finalize | 1 
                 midori-0.5.11 | 1 
                netdata-1.21.1 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
               qt5webkit-5.9.1 | 1 
tvheadend-febcf9818d7c37fec... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/329ccf7cbcc66c73f75c24f6bfc0403f5f97581b |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/c7e5f658a94b82afb1155f27b539e8005daf907f |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/cdd3eb821c57b12b01680fcc27394d6323d17334 |     
 powerpc64   |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/b06fbf57785df2e5c2d0726881e3a886f3b8e66d |     
    arm      |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/4f870d0fe9a1a31850898c5d91de0b3bc774014b |     
  mips64el   |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/c3243763691a5bfc97e1e9d5fef1420baa7a15d5 |     
   x86_64    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/f569580684b18ef1f7656dd8c52530b6f1825893 |     
  aarch64    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/ca64ef2f24f83bf2fa2e958959e8f3a144e70401 |     
    sh4      |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/c6746a7778194df7ecf640c31a27191b211d7def |     
  riscv64    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/d7f04e31395ccb1dd43221269a25512805f59609 |     
   sparc     |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/c039310a12be5f5d060720514ea5e47a8468b7ce |     
   mipsel    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/e1aff5d3872843c80752584fbfaadb3d973d6f2b |     
  riscv64    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/e4b72e8a9380ca033c7de6a85436c1dc4d556405 |     
   x86_64    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/11b28d66733d64040aa1d99685c5585c9831a9f9 |     
   x86_64    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/8342169e255905edd9c4af7ce86e305590f81ccc |     
  aarch64    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/e409eb2b73d88aae3bb3929f48497b7b0bb814ef |     
    mips     |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/ec282c794c8479b3300115765787775eb6cef3ae |     
  aarch64    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/b4ba5cb21cb8b2eb1afa7c0bc52b053204d9ff80 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/5dcc570a0d15f2a2908211ee87a274f8ccd53b61 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/458039753336f50482bd5bccf5dda08425183952 |     
   sparc     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/21fb28983c58d9c62126dcdbbfcf600e5f9218ba |     
   s390x     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/399b67f1f60308db1e32438597de4b70f7d27ce0 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/5207881e0c2afb02ea1b6faa9a8cad07a8ca8cad | ORPH
    i686     |         dovecot-2.3.15         | NOK | http://autobuild.buildroot.net/results/b19009b99052c501f9413d9ad91df7347a864cb3 |     
    arm      |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/89d51c0a4a42681a77cd7ac46a79a8ff54f389ab |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2192ded96a2f7733794c215c7d46629d2db3054d |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ea5cd419f3403df2233fe0ca3e77b7211272f85a |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1e0c3430ce1fa53f9ff8c3b9ce10dfb57f2b2152 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ba3282e7c1a8566847628863b29ccdfd2bebbe9e |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e3c46dc3e35662bf10a97f77f4d736643d0cb4b3 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6367215d1f7cccc9fd57c494fe165b211aad004b |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9a79100e5fcfa93d4f4f63892b12343556750756 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c567f2f428bec8d60a781bb4ef070b7bc5f006e9 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4a379aeba36a6df860bfabb713199c60988ce300 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fdbb101ac777c48053a3ecca1c617d556baff2b4 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/93ec91e5a0c25ff90215a84d06b762b4e4b58cca |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/87a57d391f4d9d6bcf0a43863cb55ad1f3abd7df |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/807a9142672353f2bf990a2e364f92c99dc2fce7 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6432098f7f937fc022e0ad84e97b33ba2cac15ae |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/75cf9566634ee1304c7aa6d5b4bda8fd997b5c84 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/66e6028cd83d36eb44e6b51e2504755ce89c1c29 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/967a8cb7d8a1b80839d6b8d9613e345c8c8b2edb |     
powerpc64le  |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/bcf5dd06e67f2f8c0f42cba8941f7129c658af87 |     
    i686     |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/b8e11172dfa5ef9daca85f71cba7c6f8874b95fa |     
powerpc64le  |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/8c271c09f3eb4711752c83446dc780bb4349d21e |     
    arm      |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/c71ef315e956e45b0e046c4fc0a2ae5f36591926 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/ff00322a2c28858c845728f71a0e937983067e65 | ORPH
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/89483308d4bad0c8bbb4f2008ccd1290d35a168d |     
   nios2     |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/3b1e23de4d590b7d3bff9793bb0770e4dd325dfa |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/4bcff6c860b8d761ac684773039cb54cf6648d44 | ORPH
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/6729aa02966dd689e1c2c1fec66148010c963d1b |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/64eed94ba9e46b640aff712be266a8926e113347 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/290f70674285c223d41849cd16800f18e24ba84d | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/83d817af504fbe6c1ee4a19753eff648b0da77fa | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f0bdc8c3a89fb50a2f622983daf1994754daf477 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/88e0e953a261585639e2e0df0e9df7c1c1f4b74d | ORPH
 powerpc64   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/195737d84615f64ff41364aa9f196b5ab9fac970 | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/2c67604a424b79eada32cb7b78363dd37c5c5089 | ORPH
    arm      |       host-binutils-2.34       | NOK | http://autobuild.buildroot.net/results/979e4adef5c8f82463e6d75f2419269fa7fb79e0 |     
    arm      |       host-binutils-2.34       | NOK | http://autobuild.buildroot.net/results/e1af21e05a4dc2ac79300ed190bc13fdf540c2ce |     
    arm      |       host-binutils-2.34       | NOK | http://autobuild.buildroot.net/results/e6c941448d9e31fad3ee7fc3c4d8f603dcee87a0 |     
    arm      |       host-binutils-2.34       | NOK | http://autobuild.buildroot.net/results/7b1cdf039f491e08348240693412dd1d31a43c91 |     
    arm      |       host-binutils-2.34       | NOK | http://autobuild.buildroot.net/results/d19f7316e61a46d5cbcb11c603725aa8c24024f9 |     
  riscv64    |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/48d342a08a576e934d0bcb99923028d8b8573aef |     
   s390x     |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/8335a7b3fd09961beac041c40106c1cb9c954c57 |     
   s390x     |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/f1bc312876d662c9686c8e473ad66efd4f120cb0 |     
  riscv64    |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/a96603575376b0783f581d421b19d3add1aea46c |     
   s390x     |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/30665baf0618f79790b987e72e5780b7ddbfbabe |     
  powerpc    |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/9113987c21c8a5b1d83b97a2361159fcf24740a7 |     
  powerpc    |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/3d3a9b23ca27f7c41b5d11468c0954c082ae7dff |     
    arm      |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/1dc4e4ed2ecf7b8f93cb5d8e319a38f184cd11f7 |     
  powerpc    |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/87f5bb28bf28a7178c62ba14bc203bf087fdf388 |     
   s390x     |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/d5efd47a0bceb44930548f4b247715e2c87c25da |     
microblazeel |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/642a335d9553861d879ac378143e1682b2406200 |     
    arm      |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/3d0bfe273bf2c3c0754dff9fd2dfe7d6fc0b69d9 |     
  riscv64    |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/f9e911f1db096031e488a402dcb309796fb375e4 |     
    arm      |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/7447a49acda90198b450da5a1f73ff44bd89c0a3 |     
   s390x     |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/5d6f24707e6849bcd837512bf47c2e873c132acb |     
  riscv64    |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/302958699b93500b07f420d96b8c915f93b9440e |     
microblazeel |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/9a402524e9fec351ed031cde454ae089aae3028f |     
   xtensa    |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/247ff855d79f5f7af396dca35717a71dcfc55c74 |     
   s390x     |      host-binutils-2.35.2      | NOK | http://autobuild.buildroot.net/results/c4f9ce5a44d6523f659d1c56471099dc8ba950f2 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/c4679a78c0ca3994f99b7157498076a35477d5fc |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d1b1712947c53e7badc36ce8a8b48263efe46b68 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a0c906ea687a81c1948c3fd376f09a33e6ad47d1 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e383716827d1f53f78a8d7683aaae46672e8c641 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/12197b8af7e4b1c5a3904773ccdda09e818ed275 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/23f376521606736e8e2fc4dd431d41260150b578 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/59cd70072784c0bb39ef626899e0854e8eb0fbbe |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/60ba0f253ab05629a9d49a310df9fe3341003bb4 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/62ef07257c978f4a868af43374323ceb8c55d099 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/edbe7ab1bb11e4e49154f94c8379949baba24727 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/653c2d5d82a7796e212b6438483f38a5e01a5688 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/690927206e705002a1f13deb1c12bc59f1779796 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/72384e098e46a3e028ae433e1c4ec2835fbf8363 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/50ca7ad53a2c263b2491a215793362b584d8e2ea |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e2dd1bb294a8d4e67de958504da822933f365c9a |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4e877343c47fa874a4ba275db49f00a7fdd3685c |     
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1a2ba72fc4bf597d36f0e0e650ce8e251da134c5 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9609a0c52d612d5f85909426af79ab9fb6e1f15e | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/57066b5c724a4f2df4245c9656b0c5d365a5d603 | ORPH
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/222f567b7fa21fc50ba8572f884be77a83497f79 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/94abce363438edb2e5693bc1821ffab953acc8db | ORPH
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/3a4fc86d4153e51c2387fe202636bc1e046c0b57 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/52af3fc99184593cd022a732087f9c3ec72ac4ba |     
  riscv32    |           lftp-4.9.2           | NOK | http://autobuild.buildroot.net/results/1d759063679f490565c38b88b1dbf3f3a02e5578 |     
  riscv32    |         libcoap-4.2.1          | NOK | http://autobuild.buildroot.net/results/c51ef33f5eff5888aec8f7c5d779ecdc2eb87ddb |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/116aca9a458d20d11c8d2002de69a1eae0b716e0 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2ed1f6220adf907dfe4edd638b68d6f1de14cf2f |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bc627923964d6fc597a1ced4c0fd3bbfc0096d5c |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2a74481042db72bd9cf84b2ab8bc4f54ba27c4e1 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2b14d3b4e5967a34353e887c2d79b88aa695b30d |     
   s390x     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/2ef57c9614aa3dac03d68a54c8999676d6bc945c |     
   mipsel    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/921e7dedef830594be66df58adb2553fdcfc8c55 | ORPH
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6bd3cb91b71ad20ca6cb5967de08706195da3caf |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1e5904cfe333cbd4e89a4c3b5158b54a57420b98 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f39defdf3be423326f9bd7a068247700d328ca01 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/40edf349f17ee6590430b34837526b48932fd82f |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d5010460cd4d63803c74665f212e9240b71ae2ff |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b4969cf6aa79fa3b0f56397ded454d57aca4af06 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a349a7cc68abc8d37335f447ce3589d5f04f5122 |     
   nios2     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/67973681d7a0415cfc55a54e1de5115b68c6be18 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/83b084980d6fe3e8fc85d54a884f4e091e97b463 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/bd2bb74009dcc4b7020bc513f1df9a1860a4e7ea |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/2fce0426f4d99c54f6109932c078ef924e157c1d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/fbab56c11737894cd5080daba1b9510ff025d46d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4869d802d11fe7a35328ba86aa3b96cff4ad4aaa |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/901e1d8045849ebf900c1d90a8690cbfef190976 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c68de4d0bb17f6f7786aff6166989b9f2de7b1f2 |     
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/a704d6d5667f5f85a859904fdd40b4664461e0ff |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a22aa4ece9f74de1716db952d80b53a8b49e90de |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2f45e0fa41f820636077d93da4f6db1ce2011f08 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/4fc0afb771910f4d57d882489c4a289505219ff9 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/60521a387bbb9d651ec94c5940c49cf5538f7c53 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b7d9d14302a69b831e0a3d09b95a68211c5f364c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/05b6ec4017fbbd872853ede872f6a7b8d3e8fcd5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/092ef764d7dda035506fbb36a2aaf826eef5d57e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c3761494277bac5f8dfb382a1844edd12261fb4a |     
powerpc64le  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/5498199c5b94223f38d05d1c19ae36d3ea630ad7 |     
powerpc64le  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/5833a99c3705380ce5907ca74402d2ba34674429 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/b29f2f21801f3a46aa0feaacd98ab42a14c34b8b |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e2ec759f8e1f37d3381baefb68969ea0f0ce5b56 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/98bf36671c1212aff0e431f074d12438f81d0ba2 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/83235e962ebdef45dd19afeec8764a9a169002f0 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/aa2f185f2441d5f95f31b847427fd8925c1c7223 |     
  riscv32    | tvheadend-febcf9818d7c37fec... | NOK | http://autobuild.buildroot.net/results/30a0a673975ccee8155206fdc1aca49fcbdfa294 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/c7175bb2d53e1298e6847685b6e656570d2b63d8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5853d6fd0d696edf9cf9ea47fced8eab15880933 |     
    sh4      |            unknown             | TIM | http://autobuild.buildroot.net/results/e856f45d66b2486e24f563ea85d0dc13a9a54804 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f183ade5825c2d3575bf7addb1f1d9f1be5e3cee |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d7669e0a8df287689c3add8ac58bbc11b7145873 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/779940acb5e62db7f486288f42049fee22164d1f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7fd32a3a93b4b9dd83da335d055f3096eeeed77c |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ca60dcf27754b8d34cfd078b37323d00c4001442 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b5e880922f1ace8678db85f542f60c2616c0fdc2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/73673b81c7eccb63287b9acffa22dd49b813d92a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/97b55901c4b416461a8df27841c2d6b6952dbf8c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f65070a07978ddefcf8f4ca3dec6d0736de7605e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c7123a44c84767757b36b968670ebfe3de740327 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a824d6fa1d948575536bbd65eaef4477af45c39a |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  host-python3 | 24
                  exiv2-0.27.4 | 17
          libmodsecurity-3.0.5 | 10
            erlang-jiffy-1.0.6 | 5 
                       unknown | 4 
               capnproto-0.8.0 | 3 
                flannel-0.12.0 | 3 
                    htop-3.0.5 | 3 
                 pixman-0.40.0 | 3 
                qt5base-5.15.2 | 3 
                    ffmpeg-4.4 | 2 
  gobject-introspection-1.64.1 | 2 
                xenomai-3.0.10 | 2 
                         glibc | 1 
                   gvfs-1.44.1 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                        lapack | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-21.0.3 | 1 
                 midori-0.5.11 | 1 
       network-manager-1.22.16 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.26 | 1 
                rtorrent-0.9.8 | 1 
                   sdl2-2.0.14 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fe8b21f85942ab8d85cd0918e0e69a7a52521c48 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f8880b291a8fc3646f96add4053afa7856bd819e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/237fada846c9048126c53f6512d4190c3a47a6d0 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a2b423d1d9b8a6b8c43407b66ab7c784ddd53406 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a5f3fe813bd668efd2051b85579de2b1a083b3ac |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/430f512bf3a0916805c4290a486e87be8f0df042 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b1d79b6ca77f3647d1fe415bab2bf82fc9b2efbb |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e3a03d2fe570d572c7a47327beaa674c7c5d3b30 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/de466753781247b073bfd90d0887969634d69aef |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4ceed20614dafdbb0ab6c2fdbc58e531e0aee14e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0a827869b068caf6c47a89e5fd09f4627cdff754 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/640388b6188bedc414f77e6cedaa6defeb9302f6 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c9725208d39dfa2490eceebfbd65714c054f05e1 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/74a5383050fc5b11e6774aa12ef7f50941d76761 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f30d0ceb3f7277368e74ab0890dae8a22e09a6d2 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/68901128d3f8a62bd514632b41b0368bb434dabb |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/482da324aa210fc7267ae2cadd2198779660e027 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/18ed513260b8d6be04e270ac91c675b4343c59d3 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0d701e3bb62df81bc70074ab4e277875feb34e5b |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6a228ef7b320f25a479da28194f41d91ee1919e0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3cb59883ec208d408a723567dab7f7127b711fbf |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5adc45bf9eebb9502e4d0ef9265b15f3a886efb5 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6caa499194bb57c685c70ffc064346cd0d9d378e |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/df9ccdd53b491b37f25bd296aa6e32736f0fcb64 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9da8ca5b248c3a4504efab5abb575f4f77a1eae9 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/433e46f03f3cfb89a4e8ee24e5b8f2319723856c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a87f972ceed9b6c528f643763c6c20e3bd8a59f0 |     
    arm      |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/79da73c173c125b29467aca3e41b70f455d70f9d |     
    i586     |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/ccdcc3592ba3410b288d6d8dd6cef4449fc7e2f6 |     
powerpc64le  |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/3ea8cf4a400ae070ae62ced909e244e857821a23 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/f201bce90daad892212295aa15566d5351679dc0 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6e7855985d5aaf50375474552926f5a32264125b | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/51bdb3546780dd28f0a93e44b6b08788cbbfe321 | ORPH
powerpc64le  |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/df1496d66e53f30b4d0240d3472bdb65e6ccae2b | ORPH
 aarch64_be  |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/087425156e745d81b09cab5a281774d3d9e0de9a |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/163add50e0fcd53f03de6d9377e6173cae24674d |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/75003acbe97aadb738150fd2b776c9b6db5e4d1a |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/9e4297575c5e20342971dc93bd13a5bf1ee068b3 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/05437f3151470df74db0e1fc43f1bc70ed4b4ad3 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7280adb4c79e3c54138bcaa4884fd6804252432e |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/1f09757e391f1253580324c2b4d9261a2ac8e4ba |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/31d8c3f48ddc8d9a09873e50feeec504acbb3477 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/63ee0aacc460e4fa8286abb10f36b186bbd0ef39 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/1cc90db9fbcdd48c781cb44c3f36c62555600bf8 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1ab3afca13b9f1ef84458bc29a4a230922959264 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/2f68e92ab1e07f6f3ca30954e455a7ac1d89546a |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b51fe48f6188861c5a8e82be99bede2647bac2c8 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a0b59644571112ba74fd53b8e8ed99170846ad9a |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1aa44a10be004516036d6004dcd1b719c0e79ad5 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/fcac26879b660bcdeec7c7a31200ddc8f58645af |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/ff61e51ce7fb31b89bcce3e3f054c47972f49d99 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6d22afc03be015795f4690f9b973f670c72b8878 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/d204df9712db8743e530e09908a343eebc6a4135 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/06d1475f92bba5f610bce480c5398c2948355c52 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/dabf9c9ac41101fd40d2a138822cf2f1663b47e8 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/edf204accd63cf33308aecf4c7e39add8c25aa25 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/c86849771f3e724f61bba101c96f04eceefe1a28 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/f1ea08a83ec3fd7279c1020aa57d2b712d0ce91b |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/23e1b19b6478f7dcacf432df9dce3051b5fe5370 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a89342d2277004f8540c9ed971cbe8eddc600761 |     
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7eb06d9db85d36e4d626d38b23f59e5878de9111 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4215d827099c41988c3bef7bd74b88d438576787 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7488a78fc3fda236626663b7a8660bcda8ed2adf | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/7fc8d7cb88cc32d2246026aa026f51af6701979a |     
 aarch64_be  |             lapack             | TIM | http://autobuild.buildroot.net/results/96823b0df65c2292d593b0af9da5e3ee4d6ae68d |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/497f1d51a1799d19de336fc07fea7b834753c8f0 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/90ba16b9018c2b6ffffec8c76caf41d3ff7c4b3f |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/76a2a67c560a8e43c865248c904e226138e13e1a |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4b183f2b22a29f0ee815f49107f881a2999af0a2 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cd9a9a421e3548642405235faecc5d3f8d3ae70b |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ab2ca2a6c24054eba975f820a4f1a916c24bb0b4 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7e3443d31cbc5c2820a2bd06085b34e74474d665 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7a151fbb2f177c93a775db77ccad92fcc5552104 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/71f7f1de21ce7131e8d2fe8a473099c59606c2a2 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3e21cfbd9dea92b2be0a85ed88c3f241aba1574a |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/1b6b297cb639ccab9a73f11a44ca712623fd762d | ORPH
   xtensa    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/3ff5b4c5a497f28dcba0ad0d9ab5cbdae85499ac |     
   mipsel    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/51e8e1f7fbf89c712f599730a8a9c9118cb077c4 | ORPH
   nios2     |    network-manager-1.22.16     | NOK | http://autobuild.buildroot.net/results/1c2a4fbacd9129f52da2a4925ba9b59f6196c0f4 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/7002c27d9d29590bc3620c5b21ca1b53d96fe6d5 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/dba2e8265e07e7f0255637cf226a112004b9a2de | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/32ce71d7a5f273619b78e870b191aadaaeb0c505 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/aafbca943fe97e79b65b6347c3f55995f4a11cc9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/45553d0fa4cb031e6dc16ab5a2dd7419ed0d0058 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e55d30cabd067be816bb31e2d47738dd5076d940 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ee53ffb552490fd738fd818f385b83c174325d59 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/345ed4de871419b836ec66a88bdb1484703eed54 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/efa57e9ba3fcc91a2d84acc27bf65835b0866edd |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f48039bb66d2c8274798da6d95867bc9ee288912 |     
  riscv64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/0d67685908abe1fa42b61ac04d945a64aa09fb60 | ORPH
  powerpc    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/3d397ef2112cd7abe6e283a091032c062d409062 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/117d482e572b487cd487ce75b71ec8f0195d192c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f7895c1a9d5b092016a9e28e63340304b879b683 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/848ff2b42b239635b78825a56298bd7f6c3fcd89 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f97fc7fee1732c914784380723a5f0f648416ce5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3d5d9db2fe30804227223aca84825d05c713c0f1 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/26635b1144aede0b56d34ac7c8b0fdaebee5666a |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c3108829033f0c40228fc037a39b6a5ac1163beb |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c0131c9f113a87eb587d8f3d0f6ccddea2673a2b |     


Classification of failures by reason for next
---------------------------------------------

                  host-python3 | 20
                  zeromq-4.3.4 | 11
openzwave-62444b0f979c337d2... | 8 
            erlang-jiffy-1.0.6 | 7 
             libmediaart-1.9.4 | 7 
                    ffmpeg-4.4 | 6 
                   gconf-3.2.6 | 6 
                librsvg-2.50.5 | 6 
                    qemu-6.0.0 | 6 
  gobject-introspection-1.68.0 | 5 
              host-libcap-2.52 | 5 
kvm-unit-tests-kvm-unit-tes... | 5 
                       unknown | 5 
                   guile-3.0.4 | 4 
                harfbuzz-2.8.2 | 4 
          libmodsecurity-3.0.5 | 4 
                   libnss-3.68 | 4 
             bluez5_utils-5.60 | 3 
                   erlang-22.2 | 3 
                     gpsd-3.21 | 3 
               libfuse3-3.10.4 | 3 
              libostree-2021.3 | 3 
              libsecret-0.20.4 | 3 
                    mpv-0.33.1 | 3 
                 pixman-0.40.0 | 3 
  system-config-printer-1.5.15 | 3 
cegui-00b4e1fe174da53b7ed72... | 2 
                      pdbg-3.3 | 2 
                      tar-1.34 | 2 
               belle-sip-4.4.8 | 1 
  binutils-arc-2020.09-release | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                   delve-1.6.1 | 1 
                      gdb-10.1 | 1 
                         glibc | 1 
        host-sentry-cli-1.57.0 | 1 
                 libebml-1.4.2 | 1 
               libgtk3-3.24.30 | 1 
            libodb-mysql-2.4.0 | 1 
               libtheora-1.1.1 | 1 
              libuhttpd-3.12.1 | 1 
          modem-manager-1.16.6 | 1 
                mono-6.12.0.90 | 1 
                    mpd-0.22.8 | 1 
                  nginx-1.20.1 | 1 
                 opencv4-4.5.3 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                  polkit-0.119 | 1 
                poppler-0.84.0 | 1 
             qt5sensors-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
                   sdl2-2.0.14 | 1 
                suricata-6.0.3 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/aa49dbc7f13d80c00ac0db998972a87ea60ac944 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/01b6cbce60ec4e903a4c86f7ac25fd988b889c94 |     
  riscv64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/9f8ccb288bb0ce20386dc91fe6a0e038e3c228a3 |     
  sparc64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/da3fc4edbbdb34939612f52a21607aec56148bd0 |     
  aarch64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/34f2123b12757ea61ac55ef8b6c57c68a5644757 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/89e340a8ba37669a709a4c12abb449f27402083e |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a0570c052965dd32f1b09a6e2630bd2cd34d14a3 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e8c6316dca7dd75de6f3c5d3b96e45ae6b37e968 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/09093bd0eff4fc23f0ddad58d61d0265207a3dae | ORPH
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/23b6debb2f0e526f6a2b44902a9e7ff53052ff81 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4938d19ac475519d5ecc5a317a5deccd1d1cf0d1 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8e9cdde9cbb8f3779c1b44807dab8268cd738943 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4b95365763938731c0760d98a5b24180440e6072 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/078211c01983beaeb12f5356b842d13d637f6945 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/fdfcb2b24a4d414180ec6a1fae5121148f9da055 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b610015ca3e6bb4311878f32f16e2a8092b9064a |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/270db5a97402d9492150efd6a229ab2e9e17629b |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/222fb039a7fcd79b2a18d5f8674ff37b7c98bc5b |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/78ab833eea80455d6e33b597a5b5449e74bfdf60 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d691c007f5eba9be78b1fdecf0ee48273a8c937e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b8d72c64f2cfd9d4c00c1d3c7bc375ff0fadb511 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0451825d44d7d6fb7a43f7ec9081ae67bd6d0a64 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/022057dac3e5a93602c271dce403dcc6644e2e4e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7cf17bce7b80f9044ab04084aeb712c78e0e3a5a |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/fadd9eee107b27cc6c075b819d19af95ba4aa57f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0b2206faab078534f82571fd38e75548f32bbea1 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/dda5218bfc3cdca8af6755e3a30179a90c8cf4d4 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/383824f9ca581a6f313ef1f8a4fc853b7dd6beea |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/28f04e8336bd393acad7a4192943567e66781fdc |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/3c0e001eb23e5425a4a256db8ac1ec089f5bf949 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/a3d05d1b5e2200a1cf5de010d9b9219e8085ffcf |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/f2afd8279383cfc5810d7bba005d0654f0e722af |     
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/3ee9a48341f7aa96c03b9e2a5c8823f376afa901 | ORPH
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/901bbbf0d9b8663e559f8de8ee24971d55e47861 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/50ec358fb4352aed628748acd7375a2481be2fb6 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4dd45a348550a159da254091eee72bc25477e0a4 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/34e1435bd236866574ff775dd71b32758f510c06 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/315d85a07b51c0c2ab853a49515219c5ffc9c9d6 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/5582017076e139c2db9e10f217d63388dcbd89e8 | ORPH
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/907ce467c0e4cde66f79b1b91fc748d5e6782f7c |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/89a5ac145bfc46b55e546821f1e0fd8beb9b0689 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/e531d71bbbe023bcd10e0dd161c25dfda522554f |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/3a9b49600ac201cb64885504f4b060d65266aa02 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/6b5661cde4241f3923bb1eebcc1976123766a085 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/c54b46667fd1f631120743cd97e81712fe364171 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/ddb60cca88845db97627a21a032d0ba5a9ca40d6 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/dfdc59ae56e971848688578354e03a9142768a39 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/e62937e5fb9093a82bf610e7d258315529e67709 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/4f6800af0aaa422e29db0fcc8cfe0b6165e460e0 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/cd5c102c18e7bd4a197b5084acafdaba0f5326af | ORPH
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6508a6fc5503daff96c6d5101788546f276ae0e6 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e5ab305706b8194a975b764995e03df9169fb556 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bfe919bd6ab1d31f6ec24fd2d28c9dd0cbbb3e7c |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/75753f5c54a8d33df9850f62d1612e91049e347a |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9db368e0c543f0987efc2871f2b6bdfa47d104be |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c41180f5d220fb9d8cd5bf25174d8c3767ed1c1e |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/954c311fcdac0ceac8d8bc9c38fb8118c35edd99 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/f7d56862f831a948d74543436ce815ae687c984e |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/16a6042a9c5c303450768161407d530c17abc9d3 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/07ae0d0a45c9bc0d55d9ddad08935ea75268f29b |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/86f4ad7bcda7e3da6c38de2c9d0060a1a5ac7bb3 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a2eb5c8e677d547efee4b1872754162432fb5ca2 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/162db51e81a7a214a6a11c72d4e3c9d933c05566 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/3cbbdda9b48fa68faf139e65b2e63a6f7ef8877e |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/38bc2eb88dca1e14bf3c0d19988a0b85db3f490b |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/24944da13ea58749407d2e5719a210a3edfbce60 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/dae2a07542f78ed3fd7bcd7969ba14a53888d237 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/cb00f29000813a01f0eb896f1fa0fbc1f332b38c |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b21bc2b129412755196d5dd1063a2fe1c994dacd |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/7983b023336129f54de48da960cf35454ac6bdb7 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/9fc863ddf0e2d6bbf2c034ca43f1bbfe70819201 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/cb36840b70efebac76159a6f90e20af0a04e9b6d |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f8911b2a062bb2e5f5918c9ddf32a3f085767927 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7a7797797d7ed9faa6b6a44f382b8d342959586f |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0a04925d7f5f22787ae5d3717300a142bf27555c |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/efab14fdafd1e3add8da0705f8edcd8067a03307 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/5f6b7243c58931d30b4fcc267e0e0521b2c36d0c |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/906f22235d6a79359adc01b1c61bb9c70eda1010 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/0c8dabe058a0cbb2a41f15406de952c3aa9bcc57 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9fade2b3bee1a5de6dd455359ff1f9590ce4b8f0 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/01fb7408bb8aeb16dc2fac7926174ee6a7e775dc |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3dd7baf8a8cb3a45c3b2c438447b5ade6ba543b3 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/38b58fc3e56d0cafda10d9f2c987cf85574b3008 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/178f39284be11bff14aa1badd48ac77c1921fa1d |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/f31e91fe99004eb0eb7969727fb59ba3960394f5 |     
  aarch64    |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/d8e8b55c3ad27a05cb10c2164bc388ef04e28cb1 |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/5bd45443f0d6c613075794dfdd3c9b6206cd1a6e |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c900805f4701f05901f28ea5f1171a59a9d934a9 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/08a92d245cee3bbc5800426b6357ec23065871cf |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/4fe4d5797548e29c89db3ced851bc0cf1148bae1 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c434f74969b63a8088a85c36fc955de9cd740ba8 |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/9e57cd7aae6a23e984dc9658a7f4333cb1271b9f |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/259fa3819cd61fa06986943ed00258946d49e198 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/75ba0c3e61c67d95037848e29045cc4478e0453d |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5b3408269c614721fb8a258c64ddacc7a1ef1fbe |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ded19874798aa09f28fba2dc9161f0167464d256 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/79ee8b6bfaf1ca2263095f66953519c1659e0b6f |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/98dcab2d8b0b1c932d0c1d34aacabac9943f1e80 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/dccc3ba155100bdf467612fdc503328b29307d30 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/5c02a536720bf1487169b0d2012a79c9c7e552f0 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b228c6d5354c5e4b2d33e4a0940831a3ab67901c |     
    arm      |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/8f0e3b604ff9809e3b415036b8d99521db33c4db |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/be3ba5b85bb07f41ca6c207650dc99172c8c7ea6 |     
 powerpc64   |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/c556576f06be3f690465468ae00c930921e80e92 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/6660623ef45eaa0518922f005fe05ed0fc2a3f12 |     
 powerpc64   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/87fadb42cf50fe0dfe7a8566b04f23c3953da931 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/18b1674c8ad4982e8da38dbb974c1805797c5a2e |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/4c0cce2454f602e049a18b9b17839a47293282c5 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/395c12ea1aa3e34d670a4a0acabdff136fb39036 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/ca4b9a4520c07726cade6223bb3b43bc53cfe257 |     
 powerpc64   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/6c4f24361ac805f72d3e95e1a3432e548a1f310e |     
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/1a938f9e8eca60b9635230fa971e398458dee3ee | ORPH
   nios2     |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/3dcaf2970ae559956ae0a4a398504ec3ac039150 | ORPH
  sparc64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/775a0894f4074855f25ee5e65f77837b9bddfa48 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/239563ce767d393e01932476cc76060fdd0b6eee | ORPH
    arm      |        libuhttpd-3.12.1        | NOK | http://autobuild.buildroot.net/results/d0fb629b40b05ad828775894fabed878692bb222 |     
   nios2     |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/47d1bc67d499d97748ebdf1a70867e84a74d2aca |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b2bc9670cc06e7f9cecda46cbf3255b5ad9a32f9 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/865698e498657ad718f8365a71a57ee732df9165 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/56605cae263bd01d93161a827fb86c41fa0641c8 |     
microblazeel |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/eebae056c150ddd20d9c36b0673a980852e52e9d |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ab23425eb0cfe5b6094914d2879743cbb4c83542 |     
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/05d7d96fddb6f2e4b04c8b85bf24f2f17dc66f8d |     
  aarch64    |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/37b8e3c91676dcc81f9a6b48199f48a36eaf384e |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/1890163b7d3d5ae6ced89a3e717450c22310e717 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/271ca4af7d3d9a027b86c44f3d589b5e187bbcbc |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/61a1a833b4ce80ced861da3011f859af4b665b04 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/45acfd56ece843ed6e3721b3cc06fe6064155d32 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/dfe2f2ea3d835cb578a26f216d9fec271bfa7e31 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/97350b36d7218e03936319b5337bd554c67ed982 |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/2fc5220d827b303227f3e623d3f672d26bc92e80 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/89583c6973242d718e26e61cd6de8b9053a429a5 |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/38aac66f3a39398e6416d32a107153d9b4cdafd6 |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/ca5c844d60ef61def53374a4bec0877305cf76db |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/336f1f780b0110cd65a621c4dc1d5d0d211a316c |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/c9810b1d4c1378ae9752531bfd07552e6e333c35 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a0ef46408f302c7bcaded5c4b7f60d37a6ae401c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/58a86321a8145c15f802e212ba6c3cfd0fe17410 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/73306f1c800a0b28aa27f946a2e4dd97619e056b |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/6b172903716af9a3189c71f9507830fe65863406 |     
    arm      |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/9abad13b1a2ee5e0f1618175e105ec34472893b5 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9c4592a7ca3641a24efce19da93f8ec0752c1eff |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/6fffcaf7072981cce78c41985338dd4c82a19976 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/3872c0997924e008b47e43f17090751f0ad8eaae |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/999a96ff4f6dacc8fc8daafe06916060660678f3 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/92e86cffaa4a5c58175c8f94149efcaa7b2b0a73 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/cdae807eee3894fbbe27ac35b262eaa48ba2a54e |     
  mips64el   |       qt5sensors-5.15.2        | NOK | http://autobuild.buildroot.net/results/f283b730fe608c21e85a22855cd26bdf43e48cf3 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/17279fc22bf1e1ddbce9ae9bd9992147c75ba54b |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/8c7cd52deee918cd348331fc659366ffc180c609 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8631219d5a928bbf28b772fb94736ba8e88b8b1c |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/f73e8ca98ab26eae2050c8981e2de574cb5a19b3 |     
  riscv32    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/b75aaf18948870d0034c7e8c21bde29db6d47af2 | ORPH
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/865e565e458bbeb03e0dfbfeabd75e241a7ca971 | ORPH
    i686     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/132090fd04cccaba380335a159b438deccfc9d93 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/9969ea686fbf9964e950b9dda8d28a401dce33b9 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/7c594b4bc4186aa39f174c451fa47ac3d8215fc0 | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/828b8d3772df9864f59fd446ffcf71551c97e292 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/1c5d0afe9890babc22f54d86e3331c8b4afb3a75 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/cc1cd75af4381f602cec6d0763dcf9fb86c34d59 |     
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/39e925d70014efde30bb2bd5c6a1f5e73bf915f8 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/db373cc0d0b9e39ad74c8b4ae23f3fee0beebd30 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/672415c91ffc2c6d3bf81c8b5f85aa5e965f9520 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/78b5a534869219975fecead110a3c981c9d2a85e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/63cb7aa38c1d18057166ee621106505fc8102545 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0cff880e5a875a8a9a857528e2b5463bd16fcd36 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9d41fe4f8ccde2df676cefd2a1544cc4040fa720 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5cebca7d197b5930d02774d8a47b009ebb50e1d2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/52d4c4d43a7c3ca1ddc24270c41b44842720110b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fe3108a0a2dc0143526674be87200d49cb6eede1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f64ac9f9537fdff7708c38a9a3ebc43d7f2fd0f2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/478fbfc098d5f3c45153d22b0cdde3b602943a77 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/114c8e849578b5b00eeb0adcb6bfd48875d0e026 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/da73a8a38caa9528138448f7c1ade6d10b75c34a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
