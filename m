Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135F1C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 06:57:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92CFF61050
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 06:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92CFF61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4B9403B6;
	Mon,  2 Aug 2021 06:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aiQX5VkEEjJF; Mon,  2 Aug 2021 06:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E2A9403BA;
	Mon,  2 Aug 2021 06:57:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D594F1BF280
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 06:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C27006062D
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 06:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUGfNs9YppAK for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 06:09:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9E9660585
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 06:09:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6EA8810000B
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 06:09:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Aug 2021 06:09:39 -0000
Message-Id: <20210802060946.C27006062D@smtp3.osuosl.org>
X-Mailman-Approved-At: Mon, 02 Aug 2021 06:57:43 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-01
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

Autobuild statistics for 2021-08-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 425 | 169 |  8  | 602 |
  2021.05.x  | 457 | 191 | 10  | 658 |
    master   | 1903 | 802 | 53  | 2758 |

Classification of failures by reason for master
-----------------------------------------------

                  host-python3 | 50
          libmodsecurity-3.0.5 | 47
                  libogg-1.3.5 | 39
                 pixman-0.40.0 | 31
                       unknown | 31
                  zeromq-4.3.4 | 30
                    mpv-0.33.1 | 28
            erlang-jiffy-1.0.6 | 26
               libfuse3-3.10.4 | 23
                    ffmpeg-4.4 | 22
                   gconf-3.2.6 | 22
             libmediaart-1.9.4 | 21
           optee-client-3.13.0 | 20
               nfs-utils-2.5.4 | 19
  gobject-introspection-1.68.0 | 18
                     gpsd-3.21 | 17
                    qemu-6.0.0 | 17
                harfbuzz-2.8.2 | 14
               capnproto-0.8.0 | 12
cegui-00b4e1fe174da53b7ed72... | 12
                      gdb-10.1 | 12
                librsvg-2.50.5 | 12
              libsecret-0.20.4 | 11
                 openmpi-4.0.0 | 11
                mono-6.12.0.90 | 10
                 dc3dd-7.2.641 | 9 
                   erlang-22.2 | 9 
                   libnss-3.68 | 9 
              libostree-2021.3 | 9 
                    mpd-0.22.8 | 8 
                    olsr-0.9.8 | 8 
                 openal-1.21.1 | 8 
               libgtk2-2.24.33 | 7 
                 mesa3d-21.1.5 | 7 
              open62541-v1.2.2 | 7 
   openvmtools-10.3.5-10430147 | 7 
                      poke-1.2 | 7 
                 ripgrep-0.8.1 | 7 
                   sdl2-2.0.14 | 7 
                  polkit-0.119 | 6 
               apcupsd-3.14.14 | 5 
azure-iot-sdk-c-LTS_01_2021... | 5 
                    bird-2.0.8 | 5 
                   gvfs-1.44.1 | 5 
                libvips-8.10.6 | 5 
                  mupdf-1.18.0 | 5 
                xenomai-3.0.10 | 5 
                 gerbera-1.8.2 | 4 
                  ibrdtn-1.0.1 | 4 
                 libebml-1.4.2 | 4 
                 libqmi-1.28.6 | 4 
          lua-lunix-20170920-1 | 4 
 Makefile:740: target-finalize | 4 
                  nginx-1.20.1 | 4 
         nvidia-driver-390.132 | 4 
android-tools-4.2.2+git2013... | 3 
                 apitrace-10.0 | 3 
                   bullet-3.09 | 3 
                       gdb-9.2 | 3 
                   guile-3.0.4 | 3 
             host-gtest-1.11.0 | 3 
kvm-unit-tests-kvm-unit-tes... | 3 
                  libodb-2.4.0 | 3 
               libtheora-1.1.1 | 3 
                      pdbg-3.3 | 3 
               pulseview-0.4.2 | 3 
             s390-tools-2.17.0 | 3 
              swupdate-2021.04 | 3 
  system-config-printer-1.5.15 | 3 
                      tar-1.34 | 3 
    trace-cmd-trace-cmd-v2.9.1 | 3 
                   delve-1.6.1 | 2 
            docker-cli-20.10.7 | 2 
                  exiv2-0.27.4 | 2 
                   gssdp-1.3.0 | 2 
      gst1-plugins-base-1.18.4 | 2 
                 libloki-0.1.7 | 2 
                libmbim-1.26.0 | 2 
                 libvirt-7.4.0 | 2 
               libxmlrpc-r3119 | 2 
                 mesa3d-21.1.6 | 2 
          modem-manager-1.16.6 | 2 
openzwave-62444b0f979c337d2... | 2 
                  pango-1.48.7 | 2 
               pipewire-0.3.32 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
                qt5base-5.15.2 | 2 
                  xvisor-0.3.0 | 2 
  binutils-arc-2020.09-release | 1 
              containerd-1.4.4 | 1 
                ejabberd-20.07 | 1 
                      fio-3.27 | 1 
                 fluxbox-1.3.7 | 1 
gli-559cbe1ec38878e182507d3... | 1 
 glslsandbox-player-2019.08.23 | 1 
           heirloom-mailx-12.5 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
             kismet-2021-06-R1 | 1 
           libfreeimage-3.18.0 | 1 
                 libidn2-2.3.2 | 1 
                 libjson-7.6.1 | 1 
                 midori-0.5.11 | 1 
                   ogre-1.12.0 | 1 
                 opencv4-4.5.3 | 1 
                   poco-1.10.1 | 1 
           python-pybind-2.6.1 | 1 
            qt5location-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
          qt5websockets-5.15.2 | 1 
                rtorrent-0.9.8 | 1 
sconeserver-6b932d7d8dbb700... | 1 
              syslog-ng-3.33.1 | 1 
             terminology-1.9.0 | 1 
           uboot-tools-2021.07 | 1 
                  udisks-2.9.2 | 1 
                usbguard-1.0.0 | 1 
                     vdr-2.4.6 | 1 
                    vnstat-2.7 | 1 
                  waffle-1.6.1 | 1 
              wpewebkit-2.32.3 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 
xdriver_xf86-video-openchro... | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5d420a73afade9aebb75d62f63b84ec4f72d46ad |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5d70f4e560eb5ca6cc5ae518c8e5d62d24a7c147 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f007d3385885ad3dedfe8fb1b046e35727aac7aa |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e69109079a940a6fed8982af9dcbb8e9cba6af7d |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/dc25aa85d7c33602f0a76f512dae35d672647852 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0d778167811ab61ae40769fbb9a03f9eae847c9d |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4543da98b17471ed37a34566be2201e9a5984efd |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/93777aa23efc77b1707f7f1386e023369486a8ae |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/f991786dfd93455692d2206009beacf968408c0f |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/89552ff0ae02134fd2a6355e8de5849b726b13ad |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/fa44d200923f8526c82a93a07d9e9cbb356d8591 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/def34b8ee9b88c34a2e0fdd498ae6fd374dd4a78 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/f638eced75b6d5ee8eedb8d514cf99618abf80ee |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/9e0932c0c341ebd1081bb9705fc0d9f9c2c614ba |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/5915060bd6807b7ddae45adf26d4c3a507327822 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/22dbc24a9ab1b771cdadd674c09f1fb19a085b26 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/892c7ee39fb1b5a79ff4a375f374d29088751dcf |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/56c057bf26a81fe26ce07db3723ab679e0d8046b |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/e224c73ff1ce98edd8b17a2dc39c24d6a041c7a7 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/18fe146d92dd9a123a0a69dcee146b1357e39003 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/c1750a9dd886162ff112988b085853a4df5b5c45 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/e35c6b330fed612430f45d0773e9b70c2833faa3 |     
   x86_64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/0acb27cb5fe7836aae42be4d32a9df0693efec33 |     
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/7b61bb54bcbd68b6c4cdeabeff547836e78f4db6 |     
    i586     |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/9f4a1b893a05385f3b8a3f92ece9f2c1b8c85ccf |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ff4cf9f52a1fb3432d883ee389d4e15e893a064c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/228e5a2055e29a1d125f2b0f61d53c4e42347567 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5d6d034b360ef165673fc106a999e993a23c5ea3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/797dc487188e4689fbdd438506972c526f80ab99 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3e0910441cce3827ed2508d6c55f4c77ad743d55 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e94396e9d4db2b5a7364c2c401034faebec6829d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/90354ff1d2791df9d8810f8061ac49f94005c8e3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/caa14177947a48ac50d509d9b4bdcc9dbd1ac6ef |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/acda01be2e28b4e8d6bd90e8423bf5db905b387e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7e1b0723839505fb5e2686ac925ab7101d5467d1 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/dba6130b07be6324e188c1a108de4f77ff900c99 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/603bdb02e2686e93d89b5b4efd82aefba58b2da4 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/54275dc25b2d41ff55170f177e36cc0c4ff79566 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/99414b34492831db14200c4b62762c17209005f3 |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a7650fbfcb1d07eacbd08be6e156ea46ba5caf4b |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/383ac5c8e6a7a69dc97ba9ec66119fa5311f5dcb |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e6f3c9c4f45c44cf6a5d9aa2ec374248c9e16471 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/294a604c4cb8969772455153d41c7560669960d6 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2912b396644cbcdf6d9c5b3dc13bb430b58eeeab |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/006ce109980a76870d2347e53307082b36d9904a |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/fcf5a9c3e2abff5e0490c856797bef14f5c2a25c |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/24fca767be6237666b40833b7ee6b0ddc76d8a33 |     
    i586     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a89da070fc7b2a7e8a5c570bb705957f5b3c7e03 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/81cc1fe2ba56ac0d9b6f1afcd1c8ca0d7ce8438c |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/88266daf991f2abb9fdebad7044763e81d0711b2 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/eaa0b2d9bad0087b2e12dbfe38fb17465af068a9 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7dbbbfab8c8f0e93ddf55d6d35d6ee10ecc3f407 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/011fe978ef2b44f51bac29d50f7af475eaea464a | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a5c21d2f8d7db9a0f70412a3da3a985151263aaa | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/68cd4e779bff2169cc313f989ea144470471efee | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2baecc69aa41c43e09f7f847f4106e63314bd57f | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f3423f52e5142260838ad51e1dd1fcef01ba4f36 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/21c9b8e20cf4fbc154a2576dc8b98fea4b6c48d4 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/168a8486f7cc4e35509b6227631bf9da41750e36 | ORPH
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/b24a8dc960e01be1e71d457c3699ca22f44e1159 |     
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/55579568c98bd7f502742ee25e2332b5d271bc65 |     
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/842740f70aff5958450c4d9a4bcc8c4578d85e45 |     
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/5d32f09c734301d4e2e09da4689c8c728eea1f55 |     
  powerpc    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/74cd3cf90821163db98506d735b16839a5645bca |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/3416a21133697186ae32b285bee8966f1e5adee8 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/6f82fede62c8e71f1ebb19e947d04dc39a6d2c4b |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/fb63b9097ac145d32c5cef4b21e464f26484ff8f |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/62ed766a78a858c79017a24f6b2f7250585ac2ad |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/67d67464fc398463ccc3a51ef44d228cd6a4bcc4 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/5a275977deb584378cc55ffdc98ed086cf8cfed4 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/ab98d617e3e80da55b85545c727d456397b223bc |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/dd0955542a413a95dec4ea4bdb588be46635abfb |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/afc441b6e9727196599cb8ad3e8c8ef04fb47750 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/dcb085398189c190802b368486dd3e209a82fc8c |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/fac11b72c6be58ade7ad1694ac3ecb90185683db |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/734d7dfc625e615bf2f4db4259998d9bf6c8b125 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/64a65d69d95d35513dda71a65e041fbb5171a1c9 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0b7d53247df187cfd54eac085624cf33e8438328 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/fd13e48984598b04c2827c314b7d7891e4723c18 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3e3cb2a8aa3b4eb94730a90d47cd972c9aac9226 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/87e179ae7f611d0020102da7b281986d2c01e0fb |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ab6b422012f18b6654c67aeece5be967bb97f10a |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5aafd0804370e4db50e51c4c6ca1825f7895aad5 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7adca7a350703c8fbed567c3ec4073e14db9c03b |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/374f9e76eabd577c7b6407f045b6d69f00326569 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/31e35ee4890d84e8b8caab8c99a84d4b2156527e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/dd654d286ff0c1d4c05de298ae91ac584f312bc0 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a35297e0f7a71772ba48eb659f99383c1d86ed73 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1e565358ae3b343a840b58bb8a1e5e26ac15fece |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/48837856d5db113d929291c75ea9a5475b979f38 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/31835b264e69e20fe6882ea62b91ef591e9c7a25 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/137494a35fad1665e220150b2411a5c27caf6fde |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c2ed757f56739a7ccf5a4f7f5fb1a05515b06aa7 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/486b926ecafeec0a94f1e7b1bacad46fb672195a |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e09f6f1cbf4d8f36555d1ae29580b64cce828ad7 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4824db3d7b98f728e74cfad38fab4a5247855424 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1281448606b5be091cd0f1bda5ee437da6b841b6 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8b0d84f164f020f10524f47861362b473267aa4e |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5b93c7fd049344004f956fd4628b29008e3bf92f |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6a3ceaad3a8842d7ab421b3e407d837d896d5926 |     
   s390x     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/34c6f454958aff0de0398cbdb2710bf684456890 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7ad9d41eadf0f8e4431763b40aef87ba1377f3ad |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e28dbe094713960039f3ae15933251990d69b52f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/333d9de06b3b232364822ab03b78b015527d5df1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/84c7b6c0d6d502d30093f498bdd0d8c9fe382c6f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a29be5177cd0cd3a61079bb504911f067628669f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e8be71d12dd825bd6a28a21480c3f279e2b54fc8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/350a0415eb32b5e004b35580fc89591c96a7b7bf |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8d103fe30727a0e7ae0770972857f8911559f42b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a9b646809046f77e3ac0bf07bd469c6be0345874 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ab618810048c55a60980ff49f97b83e558d52318 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/aa0b682f474303480b6beaaaf0f2ba8f8fc98939 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1f91c9f47606842c3b92e8c7501164df9b97d8cd |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3ee468206c94d18627baffa0ab6cc347608de797 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6a10f907ef7ab291eea65f2bda7d7eb8bf0e4157 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/46dd02ee57e2b6c646ea82ff3dc1f484923435aa |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/00a9d89ad60ee43f13c1778cce83f65b4fcbcc33 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/bfab9b0631f9b9c6f13bb141f5642511630fef68 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/77df6f5cbe3058ec6c2161860395e102d26cc5cc |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/49a353ade5f9c77b97e6ce1c403327667e681f5c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/16fdaf48ca6ecec45d9bb649a281bf55bf1d90ea |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/50e38eef2de940df95712ebfa7dcea5ecd6401cb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/91a122a7e3fcfb1432e066d9d5fdd76cb2692198 |     
    arm      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/01a1e2f4c02e86f3c5b0eb333ed5f4dd6568edf8 |     
    arm      |         fluxbox-1.3.7          | NOK | http://autobuild.buildroot.net/results/6e718bb662aa4961ea264eb81e4b7e7b20485e30 | ORPH
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/96037b26960f87d6ffee9ebcbefd4dc2bea9cded |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/8fcda30f3daa7c2dc1214f8130269a1571144e96 |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/0efb2f006d8dee687979701a8924714c9e972cb3 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5574d16c88bf902c3e5dd43a31fc531ca2ba0eb8 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/9e18c04c3d1486c7004576153ab1b9c17c482476 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/c1927caaee7dec456012ea62049461db49ba44ed |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/20736e69a2fe1fa1f1053fcc284f4a8fd73ce079 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/7fad08cafffa85f22f3d3cce399abe59e94eecc4 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/082a9b5268ba8697fb7c5abdbc8e5c5aa73577dd |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/120ae025a885cf16b8a185f21ed70d0553c16f0d |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/fbca8a23c52c71d9d04408cbee94e2af068b5285 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/d2a53ca0aef2563ee2598bebf55aeaeef019ed40 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/05f0ec8debd42a2b938951ed2a1be8a0fe20bf96 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b655f1f05ea4a233f1630e80ae882dfc2aec7227 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5f2647b06d1eca3b2c773e4c864cc2ff154eb475 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/2f47f4b99c9918dccbfa9268b052f4d07c558f7f |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/edc4ba19234d36a96fde3d5b7f206a611bb8dafb |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/ab69ba143e1f9066ca0d92109abe3d5245622b55 |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/a7682644c3ae5048d67fcbbe3cc3f84e808b3761 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/44b2c7d42d2383e717dbdf24f41a4719295b20df |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/8a267f4202d4887bdd944f11adca2e01277e7dfb |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/a244ec3b060076f2230eb1206a59d1683640545b |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/4febe2f0eaad1b7fa381f77ef1507be803a20d8c | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/874e9f6a2b1672c53eb33bc120de368b1729cb2f | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/56bc05d5dc6ee9d21d3d1680356ce3b8282b3775 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/a93810ce389a5f6eec7fe86da3b0fdcae2e81efd | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/2ed2c5c8d8a65adade9ca021c344c4c3e1b13f61 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/745115be10d6a7061bfa7d671d474736f7b5f1ea | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/ad7a14e4d1943316b6351e40486a04f607dc74a9 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/30197a24f3862592f0a366fb00a4afc67bd4ff88 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/bf14c75ddbd2115469a887724258d3647aef19d2 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/7d0c3af3c8c13ec31a049f02c8876c0d9f3dad5d | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/f35b9f4fd0d1ae5a28d6998f34fb54658bdfbea1 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/3b218482c9408896620ab4ffd33ce620e1c4c303 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/c4cc3fb20c2aecad24f94e6975a413dc87bc94b6 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/a51b39248137803243a308cb2aa46c98a1f6129b | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/f31abf2f8f8c0fc62e82917cd1a65e04feba4a84 | ORPH
    arc      |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/7fb4aa71f55e42d1ced3903a469aba68636e10e1 |     
    m68k     |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/8c1da35c5b253338a5692c26f4cd9d96fc09d36d |     
    arm      |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/536e375bbadea00960cfbad023dce4f7a0ff1a3f |     
 powerpc64   |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/dad3df9e04d2c4094aef30df67e74a684c5ca2d0 |     
    arm      | gli-559cbe1ec38878e182507d3... | NOK | http://autobuild.buildroot.net/results/978c54bbdc48deab68aaeb135908a03a3bab967c |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/b0c97a4f0298a9f727813e64c4043a4010221559 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/ac29210d148498a76c59285fcca5665af486236a | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/7e73dc999c36f4be7c68c6ba748cb2b395209f34 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4921d44dcdd939786d8b9c0bea9b05bbdb809e40 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a04b189226a6a9926ab6cb59efe39ec9a2ca8f6c | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/80afd8f4a3c8b9ba930fdc0be9e181629735ea17 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/f945e58f54d623d02b039eddf78749753daaa4ad | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/593687eb95fad4642509b2737b318535403045d0 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2269fbea6666ec3bbea1783f124d928169717244 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b92abbe63bfb40ef44676f776542f5b5c5529cd9 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/7a4a3b320ed60bdd476370f717d3d2c2f44a80cf | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d321aea0de877a6cbb6f06fd2391904ad88af892 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/394b8cf266026cacf51ed5a814de2c29bf58e7be | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/788cbf71b892f302b0fbd5e761a2a2c5b6428de5 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/e5b82bed8fe15a8939d9c1fc1b8439f80e914257 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a4e263053fce803e03f90620f8a444cd535a55b3 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2a66e328e2df8d2c1ba5e5330849cbbac07be0b4 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/5b24b8974d5236635f59e54d7cdd5fc0537e8df4 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/89a92b33eb241bc8babef4d209dab55bfa5a3fa8 | ORPH
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/8af8cdac9dec13593cd1612a717b82f2e83c2c51 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/1c4ba727e1ae9b2762626ca7fd4be43f66b80812 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/9d0154c3e2f032fbc0f7493aa89e76c429d828ab |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/30770b1ce372e83020b6f3ecf0726abea84bd21f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/d5a23d192a77f5fe5e03347bd76c31304389211c |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/d85aa1613420f7822099354b7293bdc755026be9 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/6d67899831ca2ccb8eeaefa40d5b1437212b3692 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/3fca25f56f0793ec4b51b5b9666f85951ef2099f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/14270283c7d749b61fcbd4179f9441db781a4293 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/90a316e7b16b9422ac67a359b2cd7db4588e5394 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/0d2e98ef30be4f9fd30a3c3a9c7f51f7a2de1201 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/bf5457c0e20c3dec05579727762d925e5276b8c2 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/4bc86010d4024ddfcf09624683a2a38061032d71 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/6f62d335893b482799a4793888e2e33407bdf356 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/504860399750313cf44f00c4ebc10fdfa8412f9c |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/cb425dc7bc5a667034fcadb739afb4cec028df9f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/63ebf3f39c5af6a89b367ec19dd3e6da9c1fa679 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/3d73e766bb742b9d1207f06e070f11773bd60de0 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/cb0beb25f054546ca2fb13bfcdd4ce7d323676b1 |     
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/aebc9146e4cb179ac2c48b72e188a4f28534876c | ORPH
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/5d9a3902baaaf9e03283cac7506f0e19637c9421 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/7b256e51794ad996fc5f0dcad3e1066a5b9e2805 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/bdc7139c2057b0c2bce86c1ea659c7314bebd772 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/c660b6fa71e7316deaac2cbfccd8959ce6496cb8 | ORPH
 aarch64_be  |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/073d3fa44bdbf4d8b728c92e2943938fddd543eb | ORPH
    arc      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/72c095ada28affe26085e97e13ffb089ff28c194 | ORPH
   xtensa    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/520e45fcd622c95a8f3aab02629667ed81a97883 | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/65583fcf349820c38bbf29b81e4fc35c2781103d | ORPH
    m68k     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/89e20f82afe8914ca261b047ad89e28a510df0ad | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/6014b734e66646d614396f6c31ff2107d91cdfa6 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/abdc6a69f923f08349910b9d46a4bb11aaa747e2 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/207ddf07191a653fe77e2308d1e3ca6817684db3 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/0aadc30328d2c0d4d6ff1f759788339afb47948a | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/7e0bcf760a336387e650f49c91bfd8299d342f74 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/c8ed04b1f833f1a25dfb3700b096d23de7192e0c | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/47157c2b25238922166115a939bd868e2cbf774b | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/4f660f8bfa91acefc1d0c2e33bb06950c69de40b | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/beafb1e984c19a1d2ed43d9e80c07ecce07ab85d | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/bfbe79d1090b06cf88427cb03a9722ef7738856e | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/7bbbfb80ec88dcf2f26daec831d211b329c39478 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/e0ac1bf66e2c1136222b50e8367d8c44e5b79941 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/78d57869a3b4a37d5f52c70dd224cb87d2db52fd | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/67982a57cfc2e5a2f0e5b51795e095f4654326d7 | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/88409bd501589b4acceb3fc37e0f815463febb1c |     
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/8f448ae928dc8647cdf3c38328f896a58d9b4a1a |     
  riscv64    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/85dd5327ec4ca24f839266a50e26c6cbf603397a |     
    arc      |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/a1d2e100a65d7c1c39c20bdd5bf687a804c94305 |     
  riscv64    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/c35f17f4068b53be6114ec69c611240bcef31a4f |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/530a3b5b8c103c2aeca2b585c02ea8af6d97a28c |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/12a6b411d31055f4ff8eb254b6f5a7e6ee5f30e3 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/92df6d1b3aab3ca1740518f0fd77475eb7007480 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/b354e649be47318df5052afef5c453f0752a2920 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/412f3b64d8ab7e64f56dd31e22989df7541b03eb |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/2c987ad0c1855b6eebd965c1a703fef216ec8a58 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/531be168ceabe2f97bb086457e17973f510e220a |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/22c79e41cc9b1184d68a6c78900f760ff61f4a47 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f0f2cb3fe9278f2f2ac3321bfc6ae69ffe593abb |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/e53bbc3bfecf664d90edc914e754c98d7b05a187 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/12abe21c9d1d258a0f40f6dfebad4873fd9ddfb1 |     
   s390x     |          host-python3          | TIM | http://autobuild.buildroot.net/results/e1647e0ef4eeabc689ff56a0c00313a4bbe82636 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/64347af2d03ce4904ce906009d9f23112bac29df |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/ce0130ad404d25bfcbd19cf58005be51cfc6288f |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/8f16b354ac1562a705af17d0fb6ba868933262ca |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/2c83b84d302c2f726813252c2cf0a9354b3763bc |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/9dfea925c46b2c1e4509171d2a33dfe311cf3732 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/4285c06c761d7471b753c19d0ea368075a033466 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/5d77a3df7790d8fba3e84241f8c42a22ec58bbfe |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/97fbda8c9e15f621c1c95780ef77927862ea0727 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/baf36fa1fe23987b0ba435e278b703bb4b481666 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/28e91013df6ad9c6ff6bbd182f9ef88d3f4389c2 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/3c0c3759015a184d28282e39b0593e17753ccfdd |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/39ab6d2be014dfcc4f960978f13b01d83e49036a |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/3fd03cb43e95e046816abf731cf2a9b657536a3d |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/5e34158b9c88e1e0a1d98c79343ab38631b5fca6 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/aeceaa4285fca70570896e91b4c32abcd80c4834 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/ad3ed201e21a4a04d6387abdb428215472303286 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/82278886594e45a664ace7fb2d38bed314d2dba8 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/05415cef5d968b2537151b3c88935832b9368bd9 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e7be89968d96cd6111a2a1eb03ac2452c2b96f6e |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/69887771c0cafc90eee92c460d56788685245b52 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/024dbbfb419e49461f52e055eef987fc1f2a87c8 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0c2055f9b99c98dea13718686dded76484ca41cf |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/740a468d0383a75323f7b1cc9810b058c037bc1c |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/30c8aac12d9185850d5e221fb8e313fa3df03e54 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/b43c9d6cb2195cac02df63975aa42818c0b623ff |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f96fe0004e301913308d4ba1926f828d3cca0975 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/05ad2e7eb044d505b771888c448dc6b73935fbcd |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b9c8dd99e860b76e59492039398218620df739c6 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/7380e545673f602ef1cd3694e05aa2ebf4dd63ef |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/db487969dce361a1de1c1ed4656baa00879bf5d7 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/5b2d96fc8d3c27294508a6cc2665c22e14e02cde |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/e847f564e3bbeb188d52c7b2bae5e51d18e36f50 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c590dec3ad49fa50cbf8e5392dd0238b321af692 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/3303be02ec70585d1efe9afc4432a7ed0c039773 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/4a95baa73ac287a8051355e61a8f6f87ab5dc3cc |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4b2e5764fa781d0983645e6580f50895ea89657c |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/431ef2addf71d8e1f967a644c0f1479a8200c8b6 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/cc3f68a7cb5043fdf0209733bea3fb8600cc971b |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5acdbb6bccafae6bb1e84eee3e7455f411934c0b |     
    arm      |          ibrdtn-1.0.1          | NOK | http://autobuild.buildroot.net/results/f310c846b38c1ee3d9f6a7cf439774949aebf923 | ORPH
    arm      |          ibrdtn-1.0.1          | NOK | http://autobuild.buildroot.net/results/c2d9033c68b5c1407d2cf87b98dff61958b8e7b6 | ORPH
    arm      |          ibrdtn-1.0.1          | NOK | http://autobuild.buildroot.net/results/ee88121530428ff2446e0529ff4bf18a63a2a1f0 | ORPH
    arm      |          ibrdtn-1.0.1          | NOK | http://autobuild.buildroot.net/results/78cb2ac74f1d1c2f715934b559e305247e4c93cb | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/7608772e3695f6c013b05bdb7d6081d268a553cc | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2c9b3852136300c98dfd3e01e2ff1ec42c87a6f3 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2984744fa1228794003144f88e4bf008729e0d72 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/652f4d4cd79ed70934f15a1901de1da327f608e1 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/97c228cb72ca054be15a0d51e21a4c0f14bad7f9 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/74791680bf534c0eb00eb3092714669562b7cd1b |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ef634a23e93208cccf0fcc111157b3bb97a31537 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/db32d5ff231fd294a1ce2ff21a54806006e50ec1 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/953cd07402fe2f99f2361a3b4a7b086a88e0d72d |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/6123ccdcff67026a28d3a4327f59313809d47e0a |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/57bcb18eaef2accfa1524c0734bea1838cf61502 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/9704f10f861da1171873039e846cd36448f771cd |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/6f88c43ae144766f43d9ba1e8a8c0ca6606988ff |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/04a800aac45ebc35431ea304d426283d1061876a |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/4ae5f8df2b1827ada10634b284a7f36e236bc31f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/9269ebf8d52a07a313d1cd265b7e6b46241d7449 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/37d299cced6550685f25e76fcd485b67777d74cc |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/7af968a43b48902145a32a79d7101bb0fe652b21 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/8754332687e232bff96a23947cc0a0b0a200954a |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/1847e6292dd4036e04fc524345478fbb5d722bd2 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/594e770c88f86bd40cce02b6c5325669ad5cc1e4 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/73a672346c86f0889ccb991db4417e7ea332c618 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/e76eab1a3d1a7130c31cf24c7db02031c9072fa5 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5714e7d76aba62fea15cafed611e00d05391522f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5ca297e8d1d46bb8ad43770f78815f84a47eeb19 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/df3ddc0bd92c7beacdf3d29d345e6c363bd8d70b |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/d9a1bc31290f9158ac972f9b94393fadaf80af2d |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/513f5365c98bbcf74eaef453ab3662bc840896d1 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/1d2805d2cb03cde322aba4a3c0a35fad7c64a9b6 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/f6151a823f5df0d4e3409acf3b597f95e9e1312f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/1b2bfe563fb933dbd876eb302be836ae8462a314 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/c8292cb8febd13b4d4443f52687265ef61dab9b8 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/495bb89c807dbcbf37bfacfad19a1bb851e46e03 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/8fb833a5cdc4aa144d329a932e9ba3309ba395f2 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/81c25a5125624571d8e0984afb2f605148ce0f32 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/9f65a2a3a32836573ed8c7766c9bbc019d23ab44 |     
    arm      |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/df1b178f065237fa3fa7d61428c9518ce70e71ab |     
powerpc64le  |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/44fe49927aedefdf2eb60096d2413e7213ed504d |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/b2675b60415f7b231f32d5aa093f3f344707058f |     
   x86_64    |         libidn2-2.3.2          | NOK | http://autobuild.buildroot.net/results/15339f0f3813976d15030bd625f7f053ad886503 |     
    arm      |         libjson-7.6.1          | NOK | http://autobuild.buildroot.net/results/1e66dff705bbb38e7e0f0e5864ce794b4345dcc6 |     
    arm      |         libloki-0.1.7          | NOK | http://autobuild.buildroot.net/results/32b52f86630be59de0789f8bd09d66d88c21dee1 |     
    arm      |         libloki-0.1.7          | NOK | http://autobuild.buildroot.net/results/768727160beaca5df3ef18be29cfbaa3ced67ad5 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/0d7bd0d4f8280880d1c5ce4394cd991af62ee85e |     
  mips64el   |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/f4a10c8b69503ee93d52092bbaf9bca8d54c3e93 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/062ce28bb8d5c929f0d8a347c902ee584fffc1d9 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/a948153c20e27dde3ea92ca977f8fb97495431fe |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/eac9b34b1fccc87d77d2a50013b4f033bec9aaac |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c62721b7c6469f2bd2b74f56b0acacaa997815bc |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/dae382e135abefa312e1ced373c140b7c07e4be5 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/a66979911d2e180668f02a0ae547b1929673446e |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/d8f2f790d614804adc933888d4494b4b376cdeb6 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/6e3d60a7fe534d07a928497ee83ed5b7ecb816ef |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/38064ae58776700df39993e08e275d10d1b16bcc |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c91a35402f7c20eb38ede8331fd6fac3a16799e3 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/ef8fe31f86879c1321ff874324271044677d4841 |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/76c49e9584488900db1654414f5ad0111ff5419b |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/3375e32ba9e4b4c26e3e02b8d5e6acee71a8dbae |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/f27ec4c89278b9425809f751ec7cbf7e35ccee5f |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/4e906ffc3cca5f9be35d40f7b3412039f95a4d57 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/09d5779620ac74617f57e2b7d2659a63cefed2e7 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/fd338dcfba61db0be7f5153f2137412fa6c593fa |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/17da0ba43606ea3f0648069a7f227a2b00514036 |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c68dca0fee978412b4def849c61f9823efb91d69 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b5fb2cdf02aa28d18f476fd83d722eb22dbfd260 |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/d86585ca1a6f40ef48a6c5e85c6e8286b9cde450 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/218cc42bed4babae3bd37903c041f6cfa5ea4fd4 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/11b7043e127871996d41534df212a3aefa39e736 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d2b5c580c077c38821b005277ba8974789a0dd64 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8ef2d65cd9e3109243062a44c89e36746428cda5 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/78c8adf4f4884377bee438f555888fa9c4e1fb96 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f829b31e9512bd372bc0efd485bf9962246ca91b |     
  sparc64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b725cc3cb0be80d306bec4cceffd1c0e43017547 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ad869111d40cb32e92d61cfbb90c4919f1cdc2a9 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/63032e3e30327254cf8fc4a017dc47e94f57c7b2 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a50d39059836f09b5be11b1c3ff836d7a840d8cf |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8228ae3d2220085766f845914f5aa32156c19267 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c4b545722f2ec3365eea616a8e2823d6ef10dc4d |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7b8ef1521e7cf7a6d1c3fa29e21b30460c6b4c71 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3de51d2c6093e268fcff0c724ef59ca12fd3f869 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/335111aef75517414cf5dc74a080ca6120cfe0c7 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/06e7b16a88479a8412879a6b4ca28817ebe69f79 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d6587a03e316e3f4e7c2c7c68b9ee6f20142e3e4 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2c9c5b5f35825363fe8c9b407bdc67846a03b60d |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4f4697a49e8de4fcb04c59327e998159b3b21794 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c92b97561e23e88e64f57313f34b36ae3cfd6750 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/dc81ed92141e0ca06122a83a1cb8c4da28270c84 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8a26eba550dde061fa5bd0b0ac58b171b5c93f75 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5ffdb5db74a7194f3109de0506913dd2e9e29921 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8b4f405acf348e0b786e215766e096e74e88535f |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2b92c9ade49f2c3c1c33aed72c0277838b5fbe2e |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ef1c3951f21ac536ff778f1cbd6422573246d082 |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/181a7c180dd9ceebe66f1e4a94be414096d6098b |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6c5316b0954de02718a93518a361558a720eb39e |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d33f4eaef41a6a16497cdde4536114946928ca31 |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9719f88714e50736c94ff92eace46e365798a37e |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1f9bf775c57752172423725b700344ec25b5fa9f |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3a6c2f5041ecc31c5e63be4259ee417b2c8f5f58 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8b9a99a16caab82ab8a2d8764d622d92198daddb |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9c0c4c19042c7b8f5895e76bf638b5c3eff4123b |     
    i586     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/04b73ae806e95c749e5fdf6ebf161b97f29bbab3 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a677515a6d51bdcc0ab12b87f67457ac94d79b04 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8f2aa17b9de5728258d892a81b66e4afb4bbdf4e |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b10f8ddf7a4b0b172f27e5037e0495b18d8424e1 |     
  sparc64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e2246968a510bdd5ca8c601c02fda46653b3a944 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/956ea45d8bf5ea60b8ee70dc11bc16cd8c28a0bb |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7af4026e93d151e340102b3cfe9e6bb6953158f1 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/631dcf31a64d1cc7d4885be7012245aa4feb083a |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/67d1c4d6a7e2d454fb6ea75bc4e3be8e35121227 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f3877661bbdea05f8ff8c211bc94f97e34d0c5d2 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f5b8f7213602e4bc6e4fd205ef0b6eb4ffac443c |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f09b447ded1aafa04778b6574cd1a8316d01c785 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a1e523fb0d79e969d7413c92f9ad9b8f6d499b6c |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/29ca5a3054bc0f7fdd82308bc2f22b6980d53f3f |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/81cf347d7ff77d97992e0a27a6952094a493d2b6 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/15d5eb3fcebd4785c09f5132ae00fd3d502296e9 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/3ce4547772a6f7cc1caccda76447993f6f2d1213 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/60c3a680565b9536c5ed8d658fcee70f70f2b154 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/5abbb674fbad57d822e9e9cc864162115efb765d |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/db9d6760697e5e8c6b96d0ed6237222a02be4974 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/a3f3c913f575c9ca01bf9fae972f55f8d2716f7b |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b60c7daae695593f58158024817106747f352ccb |     
    arm      |          libodb-2.4.0          | NOK | http://autobuild.buildroot.net/results/64b38a903b2a44994e4644574b206dd0e6a535c7 | ORPH
    arm      |          libodb-2.4.0          | NOK | http://autobuild.buildroot.net/results/cfd5f92f0aa923815edba5fbfcd5b7b312d9d40e | ORPH
    arm      |          libodb-2.4.0          | NOK | http://autobuild.buildroot.net/results/6193859a24c2cccf987e7258a14d8ede9eaaad5b | ORPH
    i686     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f5beb3404074f900813759824cc3d6fe812cec8e |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/77bbb14837d893ec2dc816302de5697dfffcabd2 |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/25d98067f8b761d903df3cced6ee9805517201f4 |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b704cd36c0106e59ffa0abf509a38702395f8fc8 |     
 powerpc64   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/10d3d674915983683258ed6e079f3379e7f7f3b5 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f60b8c12fe444c4a6854d1657b2f91fe8e5104ba |     
 powerpc64   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8acc268a0f694c860d9dff73e5d339c39bb8b762 |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/67ff935dd1d735a97b859cb423a47b8a72e3bb4c |     
   s390x     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9f8e5283da2e9a94cd18f476b7bd12289806db2b |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/dc40de735e9f50c07e099c0e3f0e147df4f86735 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0fc14fc6bfcb523fea8ee28a893d79ad4f9fddad |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/25c208203bd2beda325bda9af0d3b40cbe395c9d |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/aa61270509bc942edbc12b1fa28b3615700a7962 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/51fd602c94ac6704c4a120deeee867b3f0578952 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d32c6f1cfb76d5eaffc37906eb23d6b34d9dc15f |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1b044b5eba4a5cec0ce7bba444712c0d8d1c8229 |     
   s390x     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f3a866f0e2c1781af7d9552f1fa3a60e75a24d36 |     
  nds32le    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f10b488a8e8b4f112a7e69a6a9da54a0781d03d4 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7f2ce6569abf67bf574d3822893859d838c9aecf |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f53f872cdd350cb8e7472d399b0e321168bf54a8 |     
  nds32le    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/25ac50f0fe0733031de3695de0cbbb0025f73d29 |     
   s390x     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e7b41a26dce836ed4e3a67f5d56a4aa0df0ba4f3 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ad28ffc6c99cb62bc543f72179304f98267f62f1 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3e81709b03dadf0a445d31e9549674f6a688290a |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/02fa084bece4a66af518c7159e0a61c5f3ead1d6 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/fb5163e63c9bbfd38d6942b545c5663d0974ae8b |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ba154f074157e08177c1a729e61bb763bc111101 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c93ae7ca7363a6919477334f36aa52f8063a44a1 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9e71607dba8784159c941b2c4f6bf17c68602455 |     
  riscv32    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e2d394e401f17ad238e54c0ef4a7c0d49df57260 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/12f124a6a64fd1620adb9ac22802c5804eec6097 |     
 powerpc64   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/85cf5eff269da3162f029f4e70fc29cc0ff985c0 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/632d4576a01f6866ad38f56677b3bbdb7cb7717c |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/22194cc8d1767c8173cf5020227c77575e2a029c |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/16d666a944bcebd64aab90da2a233a7500492dff |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/5f24d2685c5b9054f0bd9ce7938bfb2de91bbee2 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c8cff637f6264bf2ff805f091bd1f218748c3dee |     
  riscv32    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9f993ea9fb58a240ee321ee40045065c07a241ed |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/58d0549ce42bd0f7b59cb2199a5d3983f51adf7d |     
   mipsel    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/8162190057964fecf7c16ea0e0cace77cbfcd071 |     
 powerpc64   |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/f4222833f84f1740a32388b1bae517a16ba5534f |     
  riscv64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/e218f07a29e6f40812fbfc2950049fa61fbd267f |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/b4febda75f970bf9d6d7d88e8e9dcc230bd2eafa |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/3121b0ce619fc8c8d9b02ce87c3179b6cd58d2c6 |     
   mipsel    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/8acb6feecdd94d4c103773df269c8b871ca501dd |     
powerpc64le  |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/b0e53c72402c958c6d010bffad7ea0b80e4f6469 |     
   mipsel    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/0f1518817d4030d38662f5989ab807125cbfe6bc |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/636f8658848edd06470a692899b549b86b99c13c |     
  sparc64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/702e13860e6896aedb749748d0d9682621d36009 |     
   mipsel    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/50e7a305850232711c89b6f87bf3555dbfc4f7ff |     
   nios2     |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/5d963a63189de380a767b54db5efa06fa0fa3936 |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/04b87ef3ad8860e549e7649fe609433e81f18ef5 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/0a3369643a5945cb2b4a71633da22e09f2420c67 |     
 powerpc64   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/a5f6d999e14b62dcd07300947b6ce8a3b3528175 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/e85a23398db7b7a98d0e8e6c0f091e76bf480bfb |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/bd22a039f312632a76bd4b0e515eedf407007361 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/cd74ac10b26cb91f47677cbe35292324fceb621b |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/b7efed0986c744a410476c3c90cf4ac0cc09f0e6 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/7de37bc276c8241e09f74fccb414cf48565f155c |     
  sparc64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f9e2cc6a8a2f4cdd4da781f569ae65811bbe7a11 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/9916559bd488364f5364003b467b1a2229b3a4f7 |     
 powerpc64   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f7093b1faf1126a21e3fca376ba694f3b66f4f41 |     
    arm      |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/b21af26bbd5dfb79f14e481112bdcba5448e4721 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/79d703a85e60d0485607aa6aaafb35523919f7de |     
 powerpc64   |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/e39be4e172280adaa835f3eff8b2d13624001768 | ORPH
   nios2     |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/e177343fce79ffbba197755f0ba0fb2c3739ad0c | ORPH
powerpc64le  |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/6ec2fefdcf5901dbde97bbf84fb8698fcd24c57d | ORPH
  riscv64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/034e8c865ec22d94ba82b3d1ecd08f0cf4969b8b | ORPH
 powerpc64   |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/76a46ab78513a308df975c6b7f0db775322f5ce6 | ORPH
   nios2     |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/976eb7ad2cfa949f662b5ce977624930ca5d7069 | ORPH
 powerpc64   |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/1b6b218dfd925c461d94de63bf7ffdc31085fa40 | ORPH
   nios2     |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/03e364a227f3e23e30d65581d13781dc4f1151a7 | ORPH
  sparc64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/3caf15a380732982118677cf8b95aa6fe2b1e158 | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/3de43b2c2df03166c08a1c24d33bdeaa1cb6cefb | ORPH
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/d180df7dfcac147b79b120cca517c0e22674bbec | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/4adca1688bc725434c00228f1f91f02a54729d41 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f9cc0bc7c52be10aef066c703b2c61afadc154fd | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/540441916dd601598511945f1c9a89630567ba7a | ORPH
  aarch64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/c67bbcebec0262c1305e569d957e575e379b5398 |     
  riscv64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/f0c7c82bb453e23fe074ef620dc0292fa03541e4 |     
  aarch64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/0f21d5edf51f6447d4c8fd703018dcf5eb6d02b6 |     
 powerpc64   |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/aec7b2530554b60b243e322d831e70f2db24b97a |     
   nios2     |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/34b5f25b1f291a37d8661b3ca8e207ccb515eb90 |     
  aarch64    |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/85bf7b4dad73a748bf439e63874eb64d9a53088f |     
  aarch64    |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/bf1294777fa6af0da7d6f6968daba11664c3c622 |     
    m68k     |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/084f9fc4b38c5b96f93c8005a3bec08fee0c4ba8 |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/18a1a45a0fda7fc95e9d865b4b8a90a99494717e |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/5b6b7b1fb14ed6452bb97ad76bbe4af1e10863d9 |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/2a576d0156c251b54a03e8f410c917d32a3fd12b |     
   s390x     |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/5f5ccc16cc4401cfe7f86a2ad0d3ce20249190b1 |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/b2ce623adf8cb58dfa79370de5870080e592457e |     
  riscv64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/3a2d19a4eda9a9611f1ffa2a2c506beb63f5b4a5 |     
    arc      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/ba17146e37bb696299e6ca26a597e6c823b8cdbc |     
   nios2     | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/263ececdfa7e97b65c538e36600cb732a674533a |     
powerpc64le  | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/1a07dcdf1934aa6af73145117805675c8b781cfa |     
    i686     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/971fce17f7061f97091360bf910c418e6c8318dd |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/d2846376067e442506e73a40aae6f1ee6944728e |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/b0f735e0af406d12798aa33f93056aca6c1f2571 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/880f1127c1c9ad3b4ec905c5c56a7cd175ae5f15 |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/a4aa488254b6314cab8457e5aedb5e10161fd43e |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/18524145ef732dd72b2a2b120b3b55d357090434 |     
   x86_64    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/d94ab344d64075ecca68096f535d4f6b83d70192 |     
   x86_64    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/c97af4dba8219dbd7e46dde2bc41af9a393dabee |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/64792eca689c02ff75523d6eb25922b6c1dbb219 |     
  aarch64    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/f0ac3dd78855cdd018ac857a30c470f7f246b953 | ORPH
    arm      |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/a7a778993f0d3dd90da7368210fa687d187c776d |     
powerpc64le  |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/b2ce0924af67b6f9ebb95826b851aa5323d0a650 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b304947c5e7b1a6ce2fd1e50c00e8388a96a06ad |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9c3099cc8d00b97184a2cf5f40477214469fa8d1 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ee7104e614f434374a7d8d6b3a148b3ade19a7bf |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/bb7eacddc53d5bd1c58ac2863289d0411b8c7031 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/0389ab071b8a7c7196ba5761001f6afb2d7c8e29 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/04500fcdeaa12bdd6059b91f12927e90b910b0ac |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/361f29d9e40a41b73fb2765e70ca646d4c08cd8d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/826b995646d70327bdfe53083153ff9554fb1a13 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/a47aa2edf66ce6bd627077627a0b9bc24fbd21b4 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7b54292eb7a334d88f422c5a203dbdbf6b4d7257 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/8f99a91ece875bef5025cd13e2005f2f4644d1dd |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/f5148adfad91bae770e0a7a9a3da248902842fa6 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/4c240c8833c81a738156e15b984403d993e3f294 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/7da650e25a0eab780b2de8a0cf504588d75acf7f |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/e01f3dfc61042a332f5609567ef48ac2f892cb95 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/36555481168815460094bf9e85a2102acd839a2a |     
  powerpc    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/42cb1f2925497d24dc1e3349ecf1603f3a6bc022 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/d45534d2c120b38a269c9da665521a14e6c21385 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ba957ef22c03316a47183bc26996c2768d0b32d2 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/fcb2274cc9e3ba790822806cf74dbb268cb8a820 |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5f9f801aa165d75c5489538d9ceb437412f30d18 |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/be6b566d6edeb61299af47256b8a9f2e834df231 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d42806f524e7eba0cbffc0e1a95957af8abc053f |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7b6f467b632747221df87ac871a004ec9582a76f |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b2606ca2f3cf682d800b21957ac598dca1a7a65f |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5afb0a49e720b8038332fb4bc19121925c09684d |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8569c7d54f25d7728779cd8a2d672c357b8cd8a0 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/97b261e38503c211a71be2ed89adfb8715a2eee2 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/237968f47f58fa60fcee4cdc4a60cc5bc0d88384 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a4dc52d0effa00590103e7876e2a040483335845 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2eb995a61194841d557642b248ade5983db25b06 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/474e599e6b815efa66f562ec2c068dea4aec8f40 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/86cbee88569530a39bba03e18a7f4de86b0a478d |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/083068b18904085b340cb0145fdc7980a6445ac2 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7ade6dea4e4fa05c52e1a6ee43d08e4b9f57df95 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ac3ebccb0151ec3b758f5b338ff1f8091fe12bf1 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/fd87c3f97e9d36c5f038fa5e673785c1e344dd0d |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e066f7cd45dfb7a29a3ea14e2e5fcc1e27f1cb8a |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/06fb48a1cfbe8b4b4ca0335c3a9f57f07d3bfaa9 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/530dc9c9262ab72e10adf5425145b9a8e2031269 |     
microblazeel |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ba87430dbace71f0c8b6114868f535437b392336 |     
microblazeel |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9e00787744010f9f2fcdab0b44d92894007670bc |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/84bba7d76bc02a76d72e00d48367cd49ea81ba24 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7daa978dba6ec3dce6fd59351e6991433ebbc335 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c83c65fa6ba0485b497122c455eb1eb1cf932cf9 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/462164bf7e9ae04ff449424e409e55ab4913dd4d |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/74865e1685792c8c66e55e85503426aa8023b38f |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/51b7b991d9a1a9dd57014420985c81447899bbf9 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/63faf6362d35e8de9866862e6c435a396fcaa756 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/f25ff4a6cae76e223d8f12e11335ad6a7595afa6 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/913893593df50004256e2bcf3db1780f694e811f |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/550ad9c74666775858887050ea83a8618797de79 |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/caf0a69121d49504db63910ce1df347802065cd9 |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/294d11f8c4330bcfd9412f47f21df22d4f2b6e82 |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/1cb6b19cbbc2b829a038a9a70b6734c084e81c93 |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/c0eb120f5d14798b4f88b90eaccd3bc1f657c00d |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/a028299b612a0ca6d1a69757749a8b9e37094954 |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/996bb74445cfbde0e230b2185207d91d4ec46dfb |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/624b6dc0793d0263f46831ed0f29fa265ff0e41f |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/5eb2dd5d6bc0540443a52f0b9b9568af01892a23 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/65bad834738d5c5b1176e8847777b3cfd95c4351 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/3146237c356e5649163784fb6628fbbbc7c61153 |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/2c5e77600cbf5009e69f057e7a2dc164fc8b0466 |     
   sparc     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/ec8ec029dc0d7d7d294f8ade81ee53ca2fc3c54c |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/60ea3bdeddf71270468d6177ccf95a1dc6b68dac |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/ff93a63cd084043db5f61ac5ea2bbbca4f0e6859 |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/cac3392373d05d78c299d07d8080ae4938773401 |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/438155f831d8a44ec6e0f7020e8783b48d2c8df2 |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/66bc1ca1a05e1676c4e65ef7364ba1415bdbc723 |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/5bacb3c38dc1012f9445a0c23e59336dcac5abce |     
    arm      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/57d8dc6c7d873412360ab7d899ab3d900ee87123 |     
  riscv64    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/ff1b2bf681a826fc85968c4d3035045d3e06f8bd |     
  powerpc    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/3b8621546ad1fb21aaa1f9745f2ba4f38cf64670 |     
   mipsel    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/5d3799090a7b4c56a579c5817a7957c2992e1c36 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/87e7a1b1048adec7ddc5fef0d8cd84eed8ba980c |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/5115f5ee87f402f5809e98c0d5e8c64a516d7648 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/762c4b0cb640fa601e84d25475cdf6805443eb16 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/f056f1dbf5c923985dac8832081848f85d8c547d |     
   x86_64    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/eb3807a32e5c0870112655d919d54d40d5c7a491 |     
   sparc     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/16fb70230d4ad93e082bf6fd0be945c2b097986f | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/34c17e55439cf263737074b3bf2ae6ba12742614 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8f09dffd0e452dc6a1bfa4c2d1a0571a01106570 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e43c37a5d57b648d44ea10d061c3e0109c38ef18 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/761b14bc7bf02d27aa459c3ee07e136f62da8d71 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/60399dc6aa3edd54ae7800aa604766602eb8e10f | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/64530ab9eccbde914d2b1938faf9d0774a53800a | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2e81e7fe723410cc6909906e9340f660582e0d5b | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/47fc7478a72e4387591279a2d245218a36f4a691 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/0841fc238d6125d74c132498607412f134846682 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/9ab2c6ea48638425871a1def46cd73326024ee35 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/e319fd25312f60784406c537aad40f39a4db2fb2 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/822859114a4b41c09842a0546eabdfa76d5ff66c | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/e89f483f24383ea4d32ff5b34d7f8a1d117ed60e | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/d39a57b7d16b898171f9df1dae9b9180e461eacd | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/e00bfb5d478861b580b42e4180b329d4bca33f48 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/127850b63372352c28ba9914754034f8969e7846 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/99bdd62a6a7eaf5ac76a569a060394dc1c04f023 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/d26eea67b33834bc5bbade40a1a7998ec7ba6937 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/90a6692251d718722a86a7da1b43397670e2fc7f |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/86ed10bcc14a8bd6107209ff345e11112e6e9902 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/a6bfa335c98031cb6e8878eea0d0e2b1332f5a6e |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/19ae62093f7f44fbfe7788021a02916b9574b591 |     
  aarch64    |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/e1997186556c4137f488cf1eee7f00a36affc2a8 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/b2486dd69df3318a2b539172512f94d667adac48 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/9baf1db89d70a70bbc194ae328f4ccccbd45838e | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/96100024ba05fe893d6ab3df958815a81764456e | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e2cb336501ce94ad57fb38ffd022ff011239d3a6 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/50064b87e3219f0af1e202cf42222d2ff5d569ff | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/4f5a4070214369db16ddfddda6def5d32a5d0c9b | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/fccb07b2c6de3fc0f3161b8153d8460c333d9ffb | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/9a02a98f14918e6cb63db00949afbf1f98ee09a7 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/3628e579900a87509543115e1006ac4bf54501c4 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/efd9c47b4668da3d7ebef10cfe10fdfa5f1a11ef | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/6f15238caf47ef413520e6ff939393658188c034 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9ec7b531df3f1de6fd4e24279f61115362e80092 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/cdfe1e16d1ee77d6b79838728f1c49790cf2f38b |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/683736d4b98a848262f11e5a67b5b816b0059ee6 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d85b34ae681f5376d081c7f5e74f6c8139e95571 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9d22baffd53610c8384fffded0521b3d0d5d7018 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b9a2923fef29fc916eaee174281a495239640717 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/15d4854807c1bf44b93611e65868c27cefdf4cb1 |     
    arm      | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/05ad5cc1f593704ef032f3c5278695247450b94b |     
    arm      | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/bd8b874f7f3f45a8b0863ae6725c58aea1ceda44 |     
  riscv64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/56d1ec172d0d857d6a968397b7785f961fad1043 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/bc8f663d67495af8d7178cc6505425efcb9222a5 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/65b9acf4413000499fc1a6e34cd2c40d51fa8951 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4e3ec3207eace394cdf5c65c4a625e8aede90c65 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/eca8be41172614a45fb8db2a33a91d6bf8e28002 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/ff6a8dc9930b18cb620d78e650478030b1c7ccbe |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/fecf493287eabdafd57b82aa844f1968cba79900 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4fdfbfd2891037efdab99c4a34ba9d30d3ab1acd |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/ac47b56b6655c1243a37d5692292bf158d298c22 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/dcfd6962c15a1ca3bced82ac76f70185bf32f469 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4b566f5f22e0ca66d4a34c6be28c80abba89aaf7 |     
   xtensa    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/538add4c70563108dda08371f1ca8b137007d085 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/200c12a682e91046fb711a402fb30568286bc766 |     
  mips64el   |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/45211f203ac27def69bb0bcd48f0db114fc6bf14 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/332ca4b337c36ae84197624314802445e0e1d922 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/3ac652e6486d68da9b430b84a58a8d04679193fd |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/84005210770e6cfffe886a21a6e0de73036efcfb |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/53e54c302583a6361a96997d1ccb4b98eabbb735 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/1fe37180c13b5d6a2910bce4a536d5131ca6a984 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/9ba3dfa9e0f2e3010acbeb365aae701e2b4de6e8 |     
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/4b93cba068245461433ccadbe77ac0345f4f6320 | ORPH
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/68c050a032855f35e1a643525ddb64b1c30dce44 | ORPH
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/8641bf610d30e7e9e7b809f2a2dbbad91d6499b2 |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/cf41918b64e0b7615fe550101c60d52f36546ac9 |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/bf8081855c85115dd47b43757c8dae873e64e791 |     
   sparc     |        pipewire-0.3.32         | NOK | http://autobuild.buildroot.net/results/cbce4fa3b424f2d905d71ad532cf2109eb306664 |     
   x86_64    |        pipewire-0.3.32         | NOK | http://autobuild.buildroot.net/results/ca3d454972170f64a5395dba5bd3cd72b897a66b |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/233066856c5b59089a22052cc21cd852dd4965c7 | ORPH
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/998f1990bc93618008a6ac8cb06bd25610df84a1 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6d0e76321e89f1d18e60be0fc17f3b4362fbeb51 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b27c44af2f1ecb38837d763cc971a9f727ca9b39 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/506f1e10b577bb965d4cc0dec8c6a834973a28ae |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5c89fcb9ce3bf5a298e7a24321112f21c402da13 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6ad9ad47dbc50e45d9a2fb025ceedeeed9741435 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9b9bb34b5f3d5c1e4c2828645c365d755a515652 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/035041ec3383dbd9de3854320ce3b4b868d472b7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/149779f2614039884b97a7f759bd7221d3331c52 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fa509853e70fac2103e418445adf7a382bf1bf66 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4028f3ed45b8d5c8699eb3a09f8e5c78e2371cee |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ad6471d058a569ccdd6e603538ee25781719c8f5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/58256606562c70c713c9bbb657729ab72cec3f56 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/02b8263766ab89bbe8302c4c397c9ddf79b32073 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4bf4fed7181165465b2667edd830af4f1d5b8196 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a7e56b7420f5ce934ac98b0e633b55dc5d9429d1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5afda636922fac8d16aff0fb3dc0b889495555e8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b1e5d9c2ebeb5fcc58a816c26db1957750751d4b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/74cd31fac293fd25f1ae2bb71754185d8a9fdecd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2c9b72359532891e092202bea70ca78632720fe0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/81a7b2003444ffb5e1340dae857251ba4481aeb6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/81e419adea986fbd737690348cc31fa9c76d22d0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/40e264ad4b4c8fc06dba24c43ec6f56b75659e43 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1b54d965779b344a4dcf1280870227fdfa53ad7a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/dd57bff16fa4e6ee9e22b19883048cb32e750d19 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d19d8ea3565b8b1cd460661dd3e6ad330f4d8d96 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b7396dea78801aab925cd0b858227e401ce69a47 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d2a0aab76c15d90c9a09f15f9034cac1432693e3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/15ef2251e69641b10cac4586baec02dde2039066 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a9b479839fa49a1d6a881df7e276c6b28c3f5f6d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/73d540c06a24ee899e8c0cbc39cc7c6742b90288 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a9e4fd85d7af522fe45892e3db7ea4185599fc99 |     
  powerpc    |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/f1fa6cedb3eb5fd99e17b5a1c96110ddca666303 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/61147438d9dfe877be681f93cb08b7459132b817 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/efb91d3d6371d9e3933aee4122961dd6697705dc |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/4b11182511fe074b7d37db5b8d6c23a355cd5afe |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/31e08a84c8b1833cf8762bcb4d9db3ceeb11dd23 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/6e7d06fdb17c2e3f1e18dcfffbd0401590ba91a6 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/c84d003e5b180d35d67744574a086cbc8a945a24 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/19ffd5b8e097642c9152de53e01c30a3b01f7677 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/96dc3d4e42ce4a678e55f0f3222d0de28c9d4bb2 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/01690ff7bed235651411f7d507dcf4b2b1058994 |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/83a27c22303ad4cbe2e77a2b4de6173d1ba571a1 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/7f53a0d24ea4c040ab68884f9f50e02c97c63666 |     
 powerpc64   |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/fd399ac3252e43fa6d0b3c8013040f30aa1ea0f5 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/71c6fc5b46bc1cd88cf761391452023974cabdee |     
microblazeel |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/3378b6d2781e90d4368d8c609f9ba90759afb321 |     
   sparc     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/75c0401c95e58619a150e8ddad342f6cb6e89da3 |     
    i586     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/f1f2107422e601edc06d3da4ccee46cf9af43a54 |     
    i586     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/36638d1c3952a7397897fcff5d5ea9837cbe24af |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d18b161dd8b82334a94cbc9e275bb63b8b648cfd |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/c031c3d544fe8fb7f0d2262b5dc89bc1d43c4418 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/41680103bf3dcce773832dc6e9e2793460cad85a |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ed9ef20fdb6545c413604346e3e124cac92c7f16 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b1d8aaffcd70ef54d73b4497ac509d511b070284 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d2a3cb05a66ac27a92d106925818ac65cb871975 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/702545a60d7b678e345db69d512dd98610cebda6 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/6d6d8449dcd024de35e7efa37e8e76f135cf741b |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d592583243369c3264c7a47e717347d59a6acb90 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/554c5b1fd55aceb39891a3ad3b350d103962fde0 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/32d944dd6010c3166448cf636026d833bb3f1075 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/e32055363db5155aeaa1ec40e4ee41c086b8387d |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/6733a37aa3b31bf67c5ed8b222d9de1696b00df8 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a47dda7230258d4c4c3f8145370385f8b6eacbc5 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/e43eb615e404a90cafdaf1a0303a07326d302dd3 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/c88344ac6340f2be66e10ba62be8300190682601 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/c451bceeed70aaa2fb82e4e52e21d064fe5b4f7d |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/4516df22b85b545570b0fa3a1fc2b438f22a0668 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/60b96961725350d503b2d0a88266fdfd22e1847b |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/1aec6d928ea438a7179c258a26a47ceedb929362 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/59f26417ddee764294846ed68c9fd02e8fd97322 |     
  riscv64    |      qt5websockets-5.15.2      | NOK | http://autobuild.buildroot.net/results/58e8bbfa8ae82314c612297ce79661c395d96db3 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ae04926b425d283acd16d206ee61871b42113739 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/4db3149953004b3d1c2e53498ba16254db0c71c8 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/2a21ab41560d73f2df128bf44eaf499a28a58a22 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/6dbc923d7f31ed76064a935333747b3a29a87c78 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/21fd201292c7dcd6dce68763637cfa0c9b824cb4 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/803ba1ab4dbdb6516ef8598596b705976237cb72 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/5918497b31810b534bbddf6fb9d2632b11de1603 |     
  riscv64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/c586cb7bc230e5d4dc598baa301a33f678b65796 | ORPH
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/aabe6450c1b1c6a5b5c03f2e81d4ff97ab3045f7 |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/ce45184da2ef306ebc0d47351f666089f676577c |     
    arm      | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/6cc8b6c4f413e0a8e1bf57b3408062b20fae2dc7 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/84e312124a05084a4d3adfeb78e8355c65f371c8 |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8e63af2cc4b6373f27b484b90f65749f2977ef83 |     
  sparc64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/9a894d9de2612c698932a6a4b672cda43a8a99e9 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/e3fde17ea752b1001b29db6ba453ba704d328f88 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/46c40a04f585312c3870c4ce32e490b1b0cc64e8 |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/3c3a7e264a806f3a401818c6551beca19ae912be |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/fda8c9359f2e534f8e4b4222950687d357f23606 |     
    arc      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/2b3da5a67e1d467b8a001c6826414e5150cc06b5 |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/acc50dc1aa6a8aacc20d6f9a0b69a3a1e0886226 |     
  mips64el   |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/83973e2773bfc0495f8939d2a87179a57e251a44 |     
  riscv64    |        syslog-ng-3.33.1        | NOK | http://autobuild.buildroot.net/results/84423db5c18819632a1c3602f3d4a0fc025e3e04 |     
   xtensa    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/d39344f0433f67c731f4bdd2b4902a2413f19fb9 | ORPH
    arc      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/e05a3f85b980ca660e5bf7bf05b5a9213319b18c | ORPH
  mips64el   |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/89121318614b59b5bb5c422d65ca152a076527be | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/4de4e4c913c6b80da318fa35cfb00782c96b4af8 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/06029752b8fcc30ee0e1f06cdb0834afeb296894 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/b7ac0415eb4bf363c45297e751f8f07973c774da | ORPH
  aarch64    |       terminology-1.9.0        | NOK | http://autobuild.buildroot.net/results/b9122eb49b70dfe840feec119023c8e0facb2bbd |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/b4c74d6b270f613bf013df1c47d018f64ab5e214 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/ccfc18367c42a1d6e4a5476ef7a9d6e0fe97b5f0 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/56cc3715e655963c9dbcd21447b2e256a8dbe9a0 |     
    arm      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/ae0bd82ce89a54f039a93e3580be4f75593c4506 |     
 powerpc64   |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/722b19b067266ed60a8a7f206c3f4e439cac2b96 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/0458fb1e25d3c1c0a44826ae4201bb8b258c5099 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/45cc30a178e754d23e488fa9706607c6d8d794ee |     
  sparc64    |            unknown             | TIM | http://autobuild.buildroot.net/results/3579474542f55c1189949a4387376e8a21ed04b9 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/d96e62db8b315d572124210d721234dad63ee59a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5f0277a39aa0eb6089157c1427192a529a1455ee |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/67e77ce7496e5bf8ec4696fa2f78b649c789d122 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ff1159a5434a3d5a905cc5ce77d968817e0d4bd3 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/784b79462282b1d73639615d6d306b21f06c711a |     
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/00827943d644d7e81f141c38a9d9979b7560c3b2 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/65dcfa195803aded9ddca49189781cf1fb19b49e |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/47c8a6ee5871895f88e76be1d398086137e0a340 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed43dc3b270da8e3652a025e4fd1146d87a1db87 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/2e00b007a3adeb9150fdeb0df7ea626dec545d3c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e29b5e1ae05dba0b90c2086230f323c09c0c32b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/31dcc99f53855ab09dbf1c533afbb455e2e79658 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/395a51dcf1872f79cfcc383ed1efcec7e822c23e |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/375c7d3dee0f199f65c29da2c3466f0dc9c48982 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/57b6106c073262b7e6c3f9125444ae47bbd7d88b |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/df642963cd8b21ac0fd31c950c1c54deb1977aa0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dbc781bcd36d3e0e0ca2afa576a1106d8d362df2 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1bdb39867a298a9c98a7af2686cbf51b46e4cb53 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2210107176bfa8997d60961275013edd16508e3e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/74d870a380273d4ef78ce19a1b1186702a79a4eb |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/728a38cecf5350095f04cf6b221c2b9b72407576 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/018bb19f36711c27dffa7b129db73f7e2e66f73e |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/41058008767c09196f00eed48b95a8b3312cd091 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/7de219c88fb54a38d64d96f83409d23d7983376d |     
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/65beece5421123c552ea1a771e8a780abd4f2cc8 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ce7941aebe53ff7f45ea05bf50f53945daa72e97 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4908a600d1865e09476418686db1f180f2ff1cdb |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/53183a0360ac64535132e934bafd7b055fd2c785 |     
    sh4      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/224bb60a091a4ad7d9b4c940f75166e328cfc554 |     
    arm      |           vdr-2.4.6            | NOK | http://autobuild.buildroot.net/results/3dda387a765f7980c0bb567aeb0f0d86328ae876 |     
    arc      |           vnstat-2.7           | NOK | http://autobuild.buildroot.net/results/9bc8b7dd35b9e108b300aeb5d6bcfbb2aec8bce9 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/38759de5774f5282853b281019d807ed70445bfd |     
   x86_64    |        wpewebkit-2.32.3        | NOK | http://autobuild.buildroot.net/results/d58cc4f2bffe946ef2521905b69fa72f5748d88a |     
    i586     | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/bef85a6a09bdd1d1a5035ee7baac1f2d2e7e1a2e |     
  powerpc    | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/bb7d1bcc6bc3c52a58ebc3af9d0a63423b81e12e |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8b093c90636fdb8a16dbb40b475f8f847bd2590d |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/46c00af040be696aa4895703247268f96d5b1773 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5410743ecfa9d6e8ae6e07131b3bea14b1b5258e |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ea7d23a1a59556bf14ac142948d6eaa0a2142aa8 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c0da9e9f602b366eb2bd3827f9cafee9eef63a06 |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/d4ee414b2104d528ac3e7444c081426069873fde |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/27c5913147b0a3a78e720c354d24919d1b3b1eb7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7d1521c6f7c04140d67aaeba266e18ccfa28c65f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0d7825601d264b85f0e0d7b667ccdc650b19c5d0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e6af5f24e5445933ffab3ea7dfee69902aba3bb8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/621d2ae0f4971f3f43898e79255856e062387426 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b0cb1ce568332facdf29a28aa400fb771778b57a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5201a866bbd68e533dca9a866c7fbb7eb491043c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/45704bfe4ae43e0fe275dc5ffacc5f669c182bb0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/55e77785afdeda1f20f4306da7f1807d3f52c5c9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ac6ff1d1d684535ab5f9a98917f175898c9a2fdb |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1a7256cce4cc8137e5a09b5e57d472ff8ab47135 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9b65629f410c64c0a76575dce7310a18bfd2cc6e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/697f2fe967e9f1a796a38f97d170f640729c7deb |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/dfdea7957555cde1f4aa6703e16d273effd61da1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3d4e8fc72dbaabcae8760bd8c95d23a533882611 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d0882f92731d5a800e70d5d695bfb1243e0b83f6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fb19f9e2297de97e0ac27637fb4fbfd354b6887b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/011b66f74f596b410567a1ceb069bae88debb9d6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e432c888c8dc33e072aad8600675d4618080c9cc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/87df21bf1fd283dd0cbf8f24bee545ecd7748187 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/566f1137fb5e32bd3aac43a3cd0900da29b123fd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/47c40414a6f2ce4766c633ee484dd817f271a8c7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0d8b2aef24ad67ca939c3f248bfee5e58b9021e5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6d52b3cc5dc50a64503ad4a345c29683a451e8f0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6f5bf0d30baf4f53b8da05e87f2e889f296ec0f0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9927496d566a3ef80096b1dd2e9be6c576668578 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cedd0d5afa08db337e41952390f5d99633957eb4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d31410480c8b9317f06fe1e1a017b69f7407c01f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c1650c1101e85ffaa5298ba9e4c726cd58464441 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4fb12650d5369ba58e7db5ade4bd9d393202256c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5b043bd13d5ce17faedbb45ea11c6b3bf2e54859 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/ccc15ed61ad994a84c33e19c1ee1d702463a244d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                    htop-3.0.5 | 50
                  exiv2-0.27.4 | 19
          libmodsecurity-3.0.5 | 14
monkey-f54856ce250c4e257354... | 11
                       unknown | 9 
                  zeromq-4.3.4 | 9 
                  host-python3 | 8 
               cutelyst-2.11.0 | 5 
  gobject-introspection-1.64.1 | 5 
                 pixman-0.40.0 | 5 
               capnproto-0.8.0 | 4 
                 dc3dd-7.2.641 | 3 
                  gensio-2.2.3 | 3 
                 mesa3d-20.3.5 | 3 
                mono-6.12.0.90 | 3 
                 openal-1.20.1 | 3 
            erlang-jiffy-1.0.6 | 2 
        host-sentry-cli-1.57.0 | 2 
            qt5location-5.15.2 | 2 
                rocksdb-6.13.3 | 2 
               apcupsd-3.14.14 | 1 
azure-iot-sdk-c-LTS_07_2020... | 1 
                       gdb-9.2 | 1 
        glib-networking-2.66.0 | 1 
                   gvfs-1.44.1 | 1 
                 libcoap-4.2.1 | 1 
               libtheora-1.1.1 | 1 
                    mpd-0.22.6 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
               target-finalize | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
tvheadend-febcf9818d7c37fec... | 1 
             util-linux-2.36.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ed80f4ddf517137f050a804a0f8c5a60dec1107f |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/a558c03de656f64e096215d7214bd421a2165340 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/386e2b49011bb17f72a84d926b33b499635bb392 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fce9b1534cd974f87edaf60f7d37b9163e19300b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/999be756ad8914d80c211387b8a42168d958d20a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7b4de3be44acc49efecda19d01c31fa691755cd4 |     
    arm      |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/eeec506c0163a4d4c87621838e3af96a8f048283 |     
    arm      |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/6d9ddefcc532a18f2a2fc32e2e4a40842885a950 |     
    i686     |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/6764d0c5bb992d287cfc3f2b53fba883ae8319ec |     
    arm      |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/07f3abbbeec3e476c1d9e4c02ac45ba224982e8b |     
  riscv64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/e6588a945b778fd6352552a0c546d3bb9c292795 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2b5fdc52c3c427e58f41f1cd2f2108d5fc067dcc | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/031eb02ee00cc4c3181839807ed46cadd8cb4c2e | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c1b7268145cc67607a2a92fde0e6caace78d6996 | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/98170a3edd5e1b07e3af61b0b7f9f9020b568127 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/80eeb164f69347e8e4f6bcbf058e7acc6645f279 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/508f6f9af60e55f5ab05f1f6434b76838ec30319 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5e761f1d16020d142839bf2ed628ab4390269399 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d7790bfc3596e97e814cd5fc1b4fd4b7f31900a3 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1f1e97d10ef43dc5819f4eb1005f063f6952fefd |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0bef3425b5337188e5990e3f911053516dfb2db6 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ea97e936461b964524f6a9ceebfe859a0175f76c |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/339c7f6d476c524d503e062b5fb76720f98c21b1 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/136c96e60b5b0b9326a962a182fdaadb6d157d15 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/82a7c33a6cc8829200a53b41dbbab93909f7ba75 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/287e36c18056b20ec0b437a8d4be31ed32f3d9a3 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4c9b4036c7267e591dee205a2630378cb51a156e |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9d2a3b27c0f044d19dee0d22188197df447072f0 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/65161aa6bc2bdc742025aa7d44027f81265d6721 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/afe0baddb1933fa11941df91f12b57dcf6ec6cf5 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f8d80674a7be7fc39b3676d5a3b92d130c4b7a9b |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/191049944a4cd86683c5e4c495bc0c3c086cbf1d |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3118caa8d5abd230ad2a52792f2ed086be1d5581 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cebe095a6eeff58b9f98bf371f90ced54f0ee93c |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1dae2c0367525e3fecea206227980c821d2e1208 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/b6584c3de7c7ef776237e6e044e719ad979e06ec | ORPH
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/c34e346ad444cad7508e4184c9cdbf7475fd8e0d |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/e6506cd4d59308b4365d464bda1b512f18159152 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/4f9fbb672a4bc508b5649067d2c3c63abe2df30d |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/760981495e2fb4890c4bf8978b5acf7a63760c63 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ce0107e3fe465691fca4d2416bfa06bd86543c92 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/cb20b0fd44614e687b2df901c40d9f83f588647e | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b5679637077566e5fcb14e2f8c49321813532a12 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/935a23b4222876fa16a8bbf62b8ec666bb7734b6 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/cfd8b17273d4b52bff7df58d12e2c6c86eabd688 | ORPH
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/263d2d8edf5f29a8b82fe40df7271d89ad3d7547 | ORPH
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/aff639d5eb9157bd3d4f53cb075411ce950c7cd2 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/062af02f6d406b8c89831b218b7c561efebb6475 |     
   s390x     |          host-python3          | TIM | http://autobuild.buildroot.net/results/e9329370ef8b413e6e4209d66f40fa1f6e8f529e |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/38129dc8a0360dd83df2057ffff503b2e4e6c6f2 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e9f67c045e8ea0c867623fa9242e7cca7572fa2f |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/b1231b60abcf7ad78aa5dcfb5af14dd8445db538 |     
   s390x     |          host-python3          | TIM | http://autobuild.buildroot.net/results/164bd629ebb29fe8f0786e95b5b4b6c148d7ea15 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/943715f595e284766b06b63ce7b54175b4804dd9 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2db9bd8148646d61b15123bc1ff89a14dbb30b7b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/683554303ce22cc511e6bb9427df9edfcc9e6a49 |     
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3b67d5077223613198cd693594556059e89f263b | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9fa78be64fe7430a4c44b5f208e7ec232d7456cb | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/53a58edd5d94fc52aa2e0a2be301023637c97628 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/32f53d6c438506c6472277dc8a34a6af1f093cd4 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/764f71d3bd6703ea867bfe1681bc56b75c1d357f | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/19dfd3cdefa8c9a7d5b3f51e31ff418dc426b456 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f3a88547387fba30398a0cce62b08468affe7a09 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bc8adeefedc369326a727c043b02a2cc57aed585 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f715223539e0d362e5137d6bbdc700072fea027f | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c6f039bacdbb96c96f9b6c747eca48457f70d434 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/237f959b8c263f0e10078e9e6d044188097f84d8 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/099ca2ade1874f9852e7180f6b707ce1b8926ee7 | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5f0c4cdd034add78a8109eb97fa16945b0f4792a | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bda162cb26347a8a802595f79f1c34c250ac0fa5 | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/94fea0f04d549bc8410ec5d06e016ff13e5ad12a | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ad61da69f398a9337bd32828dda2d6b8d0cc05b5 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c7183ab627208d7583368a88067ea55ea391dc9e | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6ff9591d20b919a4050ab577d17da4f0ee0760b8 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/08621a96f71426c957e97f2226870a49aaaf800c | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/dca8b2520e22f9ea992b55a984317471e8799533 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/534837122cf46db961fd581129d2a13d459b88bb | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/59fba2efc523e69a05bc3bbc5e15cd55ec2a54ec | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f844687b475c1fa16c69b83705a774cf796f7288 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/93f1b2c9bf274bfbf4fb01586b97c087062425c5 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/94478691d29cbcd3fd252d7ad322293eea5a7591 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3c73457bb39bd2f2ebec0eda302b187db3dc9418 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e276faafc041aaae1d16611c7ae72babc25fa1a3 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cc6afda91bdf333485cba05c52b1cf150b30f7c2 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e0adc15412c1d9de45b3a3ad0687cc17c232aee5 | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/eb227052822b3e4e5b60d02e2048f2b26803f1c9 | ORPH
   s390x     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6b771d0276266f9f1579fe8706947bef6e78848b | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/49629e0a5387e5a22bea28129c8065bdc163a39f | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b8ee9e646e1f4989e076ef035ba4db15e7aa9598 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1d3d3525ae5abfcc8918fa3f1003c6f8120401e7 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6406b39ab5e14c6f3ea12d350448eee538d2be72 | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0a042896ac7665f913d9e5fc1d937f081979f644 | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/18f060b025ab292b2906be84e5cb92cfae67ad83 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c332b09a1641bc4f555ff4c9072b6d85105be569 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8b9433d6be5db6b814d27b48d13cc002e7364664 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bdc3e70a1747bed16909411a0a504c5b40a1fb7d | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/494cf99e64b0261b05f0f1e99cff5c5e93ad58df | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6e9a2a5b7bc5bd66648fc6dcff923e13d3815010 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8848a7427dc17a862788b037728aa34a911e4160 | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f434c4b8758e66044c281a3327bd4c360824054e | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/962450b769f95f7a3e65a7542b2996d58dc27dc5 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/20fc2b65c607296e686662274663a82b8ed42194 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/760311d4be44d30956f4346f6c57c025b0dd7aed | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/95a4eaf3e0499395def3a576130604dd8eb85872 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/70b106dbc572ce829fb9f9ef92d91947e51672b6 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f3614254c936f4ece8ad742f6827ffdcedc32359 | ORPH
  riscv32    |         libcoap-4.2.1          | NOK | http://autobuild.buildroot.net/results/0cef32f45caa14c240f38e23474c85010e170aba |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d557b043c0ba90294022f0e61ab5803afcde982b |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5c7b353cd0929d2d50a091300d53a92de7b8dcca |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d5a2d61f6f8ed1994ecc95c5e25a564e6d94c9c7 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0bde184569c32c014b45513b98e69a43ffc03b04 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bfdbb0be3524a81c3ecd801428771748168d05e8 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3ab12f4a4e0cfa0a82329fe55cbcb448de04c50b |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f9f1a7653ec555aba99574bbbc584c0ed5916a6a |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4b625be03f811053c211e5a8e3c687863074ac65 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d3b07d3f64ee046128d25d441cde8d5d8f7ee1dc |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8d4513c3d78aed15cf8ab4a58c0daa93f58b03c1 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7241354fe83981ce54242034b7388efbdd436df4 |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2ef9eca18cc861854583a7bc9c169f91fcb3f199 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b079dda7f276aa6f674e62df2dca903d93235a1e |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/94cf8cd6fd61b819ae31a056681cd45ce73191ef |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/221750e7992cd9788b2185bd02b01ad190695557 | ORPH
   x86_64    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/0254f7db7486b732e927e65d4c3876f9a5e384ed |     
  riscv32    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/07c4bea57d64e91d544592326236123e8e291c1e |     
  riscv32    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/d8964a82c2466538475bb8a8bd1b84959476dcbc |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f13eaef77bec7e2f9f02d741b53696ad50b466d5 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d094adb2d50985679c92b1d1b1d54632429617cd |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/5ba60553fe32f44353389a18ad9471384f892135 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ca4184e1ac59e2cb6417d66e7950fbd6386caba4 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/90ee58a0474feffbd5fb07cb4459bdf3b132e86f |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/4fb8a8ef915241f9b653ce7f7c436e140310c87b |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6d112ad973f8ebea850c6116f966e2e32c190b25 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f166d27b5000c852e7dea98db05f84ce7058b44f |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1335278763ba8f2030fee05b00324e2a78d11f07 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a9bcf99dbd45bac618de9161e6ac28452ba4f044 |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8b24eb1af0b12f7cc0e28fea605984538b51a051 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ce83c736a28cf64fefabd52fd50e59badf2d65f1 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/6943005320e687414d409418d222fd3c67930527 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/fce571da59f8beb8fb5a28d5829df16248152181 |     
  mips64el   |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/f3f7313e297e0289ded56da8250ce84f498befe8 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/3ce39e95e434d8af23756b2f8dbbb9c5cb825cf5 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/93aef2b6c7d8a832cbc4d5ce6e84d4099f769374 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/869a59915cfe591cfee37a313df443076b958d98 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/01102fb095431e9f5a0ba44ee46e8287eb3f5f91 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0b9f0686b655fbc72ddd33e0cc27c404e1fe01b3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/70b65142a196688bbfbd288dcb1d338c44594adc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0ab1911509730bb01ee62ffc5449230909594713 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c6b1357970a5a7d0bbb507deb8d1891a684510c5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e6c41bac463308b9a3597f7fb828d526b44642ad |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b0c4af1e0eafbb5228fa95d4eed51133c1525c20 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/f3220f0fdee33c74c73a6d4d9317bc764c81c934 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/cdfdcf28881f845470493aecec743e6d529e96f2 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/717b959c9eaa4a5c3d447a2549bab2375fb45ba2 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/bf4d3fdfbac4ca97de7301a5bcdf2d719602b0af |     
  sparc64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/49d5b77adc9f2576bd764306b0196deb10f6f28b |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/3ae51ffb932c1e85bd9d2f98c0537860faa41864 |     
  riscv32    | tvheadend-febcf9818d7c37fec... | NOK | http://autobuild.buildroot.net/results/55b9e4294ccdbc8916d32693340b32ff59d51823 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/057dfc5ce968fc0c9d61e7d78eea1f687b6ac9e2 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/385e7e1e525842575efa27a2bcecab22d64a2a65 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5677fa7fe8bbde061b525361fdcd3d802e508539 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ff31d7ac5348d9ee2b70f8c27fc96822a8b43436 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/be94e9706ec6f063037665946df5422e0e006e5c |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/204419aef02dfd714ee0269b025c439e03a95e39 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/91185d6d48763c6b655bf59e7386344eaffe1e53 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f302b3f3ae0d2ed581f0bfa68bcc9a1b80e00af5 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/43c3cbea57f982cec47a030ccc2386c68bd88514 |     
  riscv64    |       util-linux-2.36.2        | NOK | http://autobuild.buildroot.net/results/3f6307e0ccdf51ae732e4179d9fb8b7b4a72aa5d | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/85fe13111d5a3c1cf085b601e9aa727047562895 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ae1ec94a2359aee2e8eaadd8842998431ff5bfac |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fa68b77b472d18ff20307102eb4113930984604b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7c8098765ae0d14df466ee329be2557dcfd67df6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1f136786825d252fe5188f16fcd77b1721a92be3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6d133aa4ce5c5454eb2daa82c0f33ff62d0cf4c4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cca38d2e143d84c209351c93f6cd0f2bb497ab53 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/da57725b53d668e57fa6c502b87afb5be91d4dd4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b9746a585d435f2f945470c2af46d4b199dff5ab |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7b309f35b5475d9de96ea00881ae1fe5044424be |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    htop-3.0.5 | 57
                  exiv2-0.27.4 | 29
          libmodsecurity-3.0.5 | 15
                  host-python3 | 10
                 pixman-0.40.0 | 9 
                  zeromq-4.3.4 | 9 
  gobject-introspection-1.64.1 | 8 
                       unknown | 8 
                    mpd-0.22.6 | 4 
            erlang-jiffy-1.0.6 | 3 
                    ffmpeg-4.4 | 3 
        host-sentry-cli-1.57.0 | 3 
                 openal-1.20.1 | 3 
                 openmpi-4.0.0 | 3 
                xenomai-3.0.10 | 3 
               belle-sip-4.4.8 | 2 
               capnproto-0.8.0 | 2 
                haproxy-2.2.14 | 2 
                 mesa3d-21.0.3 | 2 
                   sdl2-2.0.14 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
               apcupsd-3.14.14 | 1 
                      bmon-4.0 | 1 
                   bullet-3.09 | 1 
               collectd-5.12.0 | 1 
                 dc3dd-7.2.641 | 1 
            docker-cli-20.10.7 | 1 
docker-proxy-55685ba49593e6... | 1 
                    efl-1.25.1 | 1 
                       gdb-9.2 | 1 
                   gvfs-1.44.1 | 1 
              irqbalance-1.7.0 | 1 
libcamera-3a1f67a8031ac5ad9... | 1 
               libtheora-1.1.1 | 1 
                mono-6.12.0.90 | 1 
       network-manager-1.22.16 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
           python-pybind-2.6.1 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.15.2 | 1 
            qt5location-5.15.2 | 1 
              wpewebkit-2.30.6 | 1 
         xlib_libxshmfence-1.3 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/eba19228aec76a63ef9881d1c69cc0967bf59879 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/66c49c5062730fd6bac17219d5fc15428558ae1c |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/8a4645ae62f840599f82338ede2c12fb795d02a4 |     
  riscv64    |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/b843a0a6c40fa93d95d51840094b562799160f56 | ORPH
  riscv64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/0b3fc8988c2c99f27de80a5f3fac5c35d33e8f49 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1d9489a578658c33cd3a9ebe8f4231bae1bba1be |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/312c245a123b2b118613f7e9dae5aa165111df83 |     
    i686     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/9977579b97e3faff656ffb5f6f2e3eb1d7c0ea2f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e0b9c501814c12505f16f1853baf1963e824d73b | ORPH
    i686     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/7474ee0074dc1ca2926d706446e4b54db774a9e8 |     
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/fd010b61befaec21a7045d0cc4fdbe94e0031310 |     
  aarch64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/9fa56e61502e0a5a2b67be9d0300c4dbbe89eb4c |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/dea41f84221a82dc9f0d29561a68d2a19c825a39 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3bc8fdc8226a2017497809a226be279f793c47a7 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8a7342e836d425a41b75eeafdb4fdf15dc350053 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/46f0deb8344f099976366140539c035f10def060 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/56207655aad2da18ff4004ca671d37078a6d4b7f |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b725ca9931084645e6cbf53b7832d225b6d06e4e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a335cadff270f04b818336ea993cd3aad1d3124d |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/641cca68a117e93c4ade40db1209185470b6f5cf |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/891d104abe74d88b31c23d4d04b2c1827db13170 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/26608b28411ad19c9ac0e74acab6d554ba615eaa |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0072564e2d900f080d3b50569a57ccef6c298b5c |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b7ef1fa85d4d28570e2ac415963ffa246738fa91 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d36988b7889de3ea1b214d4d98bb3c6d5741eafc |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5f0f0198a7e96624f5b6ea9795a93a5f630214e3 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e4e68a9ec8bc7d85412437d06e9475760a1d1bea |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dd9a88325bc8e527abb3c9ab66a9bcd151946e27 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/38d8bc07a3e7309a1c0c5dc317ee8cb81fcd8b79 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/89b24aafee0679e0b4786f308141b56b495d9de1 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5710f4099e4c3a935dbdc566477febbc4a15c98a |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/22a1ce31e9715d5c265e66b9e05de84481dddfda |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c5a63640ab8ea64cc83c8cac89dc4fd364b48dab |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1038959bed1366c288c4a2e3c821f168033ef6d0 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d069fc4a77b2cedbd0220ccca63632a2a44a68c2 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0b887a60763896d64f6e59c813270928bcf228a5 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ba37fe0e3d823cee852b63e6cc4ae3b411b6e518 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1b787424dd94176cc11033c34c9eccbc14837729 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7ee77c82cd33b765525c61b9c24995b4aecb000b |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cf4cd705b605fadfbb728466d04b1115d8ccd451 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/db273eaaa8c90a6a80bf719b22945a2595417ba0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/28511662429ada116ffdfa9ace27f648cc18b792 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a415d6a7e6868aa8a055f5f686e91fe34990be41 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dc95d083dc4dfb021c5018c507c9105c2270a74c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/10c0881552ef221b33ecaf6bc19492200a18551d |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/06f5b52f84a9e1aa35793ff8192852e19b25ea91 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/498862b0a6590068e5351aa0bd174fdff2d91e3a |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/ec57bed38980f170ac12ea03e01d1a1359d39c71 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7535ad744c09be1fa1bc328c4e2d20a4eadbda96 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/91bdbe1c024fe3f091c69b823a883e523669a889 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7af22173ea85ee3d1097c6dd7ea34765c9007077 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d461ea445e31cf78e73f89a343a34e4cb7b51c95 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/cd7930e56737e442c07ac732aef440e088d32269 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/16c9ef030bef4bd736f45c62c09e5349dd25dda0 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/dced0417fab453476874957240b9fa0ed044b23b | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/c38f963bf6d312cc88b8ad7b1040390f997e5655 | ORPH
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ef2b6de96850aa744c94bb1659451245176b44dd | ORPH
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/9c182e9a2101542b23f6e4a917865f18099a38d7 |     
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/4a35d28d35ce7afdc67805b00887926bf5893da5 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/8ef1d38ea7da3cc91e5f4d2ef11c5f6ee06819bd |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/57a4535ccb6c218a49cfa505114dd2426d0e1647 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/585c6a07b88e76c61f4a13860d365f51cc29b966 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/cf07a06e3f262957723cc3166853c1f7644a9a2c |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d93ae607959b24ba8738edffa3635a712a9baddb |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/898b68ced1501341990c9872b7fa41a123f071f9 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/37bce41ffee6ac975520c5090e0b59486e4ad7c8 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/22b02d9a6e0e2b91c7085884a5b73041865823b8 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/0af1e5994f7ebbe9511e17d130e0f7f6797bc2d5 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/3f81a4a8618bf33d9c40aa318c647e173705b265 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/30444b0937db4da16527ae517a46bf0307e7a25f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a0a9d2a2adbc0a3e5b30dd075ba19526ebcf7665 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f6a11572794aa3cc0da4f6a51630afc46d979e80 |     
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/55708cbf09f9526c39ebdc03a863e1f25daadd17 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/54eb06c923c2d1d18a8d979f89db09aa6d94ddfe | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/93d6fae3e7981c2ffc806547fda4639a7d4a52a0 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9673698549cfc877a9ff51f3666172a1bd1bf7ab | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ba9c7f64c2869ab54c668b62678289a0a2e7928e | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b0ceb6e310592cd4312eb7a95c39cd2c90add7d7 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c4ed9d1b3197fc708e3ee6d26b39b49fd462f222 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7faaeab5c2f3900327b37402dbb556177bb85370 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3a44cae85d4cd4e8eb024443c51dc5457802b5b7 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/45da47b64b806219bd0f24a48612c3cb7c76ffb3 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/be98a84f5cd20b1272aee307fb7e230137a08386 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e72ad9693e85987305902e48937a2fcacd15e0a8 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d16c02b11af413d205638d8d3daf3250b63d89aa | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ac068ae54dac943c35ab9647cbd83db294bd9fb6 | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0eeaa8759b60b77f41aab3f15315a745efcd1e5e | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ec850d90df019a63a4ed8b7fc61aec0374c25b25 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5bf76e941f0158071c7a59c63c5e081957897094 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7b906b563c1d810132b920e0d9a45a1883f1e72c | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/58305e02b3fb673a1ebc550457a6d457f10b93a0 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4afbcd98160037c60831ea7bb6e6381ed33d4594 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cd2ffcc808761408316596a151b30dee0e0ae1e2 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d23de0b39bccb25439ebc8b094593addb567fd4e | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/dd97e6e5a4e43650de673dbc5169ae88fd7df01b | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/14ef151a6350ca894569646b0331093c3a1f2a4a | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ebe8ef079af330b270a9a5ab778abefcd815ea0c | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9fb5c2092400797e0ff129d9cf20a41553b0ae4e | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/868e9ae596bc4ff50125041f12837c599e1ed827 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/44ee499947378eaf02fcbb24280f2cd8530ecc2e | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9b405e885a1893e156dc29f6e531138650468b9b | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5f4c3b58262bc2c000a51b8fed749c0d049ad631 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f320e69411cc28d5b4f2f41a5874f28632b0f1a2 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f815d3feba430e7c69347ce85d4daa8ddd3d5e97 | ORPH
    or1k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/57ab11bd9ef2306af8065d696a1d4b68c581d0fc | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4d93de6dec898aecc6f88ebd3b401467b71fcf48 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c19d37a5fedf5957df62de828b54995d4c59cbaa | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/404bd2bdd2a2abf9be7292e54005caea106428f6 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e03879124035b411979305b534862a4085911f14 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7d20f156e06fa4f939c77d7da45db2fb5f8fc5f4 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2a4c7d5c78d58524ebf205a118e044aa86cfd20a | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4cd34f2e0d301e2a4ca5d637ea73f8d4e92c988b | ORPH
    sh4      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/63d4fdb7d7f47ebae3e40b63f55b3a7ebac91a95 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8bc95c83ee25bd1cfa755332e2c6f1ae1870c0a0 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7f2a4fd0552d3b53195c4e098abe46b202fd7e51 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a7ac07227899b7965e96a9b0c27ec47a24e3a973 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8fe6d3756f918e487ce50bc79aeeeab5c2f5a1de | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b80c82955c3bf25c17cf63d6ae19570a1485f710 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2478d5c84e863267a0c416f259fc97747b22a03b | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bbd5200b8f627735be0b1b9110dabc6f5dea92eb | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d1d5687be821224c7e7912923d4a90c84b414e36 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b02a5716b665730eb086c375ecaad93f3f288e97 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b680844fdf882bbcf9ca8a6eee64b2aad603cff8 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9e75ae612aa75ece1005bef04473adf264bbcf4b | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/49e024be3b52219f0f7df8a6e929386ff68bc6dc | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/45be7995ed07601eedffb0a42d4c9a81d731061b | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9bb0916b04fc762ca2e754f2b07e806f4e593d08 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/53c75359713d6e9da9fb92e918a57746b069e095 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/274b9e28b2cf3ff2dbb0f9b7cd31773e8c11cc4c | ORPH
microblazeel |        irqbalance-1.7.0        | NOK | http://autobuild.buildroot.net/results/b2d302b913e7587c70056a554f2b498fff02142d |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/690e42fd214db043b4a99f89fc6cdfbe2bfa2bd5 |     
   s390x     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5be3147040b663c19d101950e3d45234c2a297d2 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cdab56f53a2a39fefb28a1c72559eb5ddd686c6e |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9d2540d9c493c5a7f57fcb7cf6b0bb695d7e45d9 |     
   s390x     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ec4bfef680506b9241f2250d13ccb453a5037dfc |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bb116ba0aa6612814d614c53f11d0a807b2cfe71 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8f61e7464a7dc42d53432ab7ae307c2d8700544b |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/67fe76d8dbccc52fa54f71fd8bf0766f5b9f69f3 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/fb505c3eb97666d6997cebe01cddde5cd2f68d75 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b912d5925387ea54d47f4429fbd65a3ddabdee70 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/431e1beeaaf47050585094873b809e10fd7545f2 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1f050524e39f41337dacbf446e9ed32298c8cd6d |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4f01afd6e9a9d988d952b1fe6cc430f26cf43f9b |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6f0a6fce2931b37c9badf555e8b728713607b642 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3e9b1f2198f39e8601f36ec17fc9845e87849da2 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/fb2c00833baf67cf56178c48df398473e05d4e69 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/7124dce519851d16835940df3f38634d2119bbc6 | ORPH
    i686     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/aaaa66f7880f98ae38454b1e0260fc1a62806eaa |     
   x86_64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/04beabb7f1da10420d8ca7005d025f66167708eb |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7bbf81dc98c35957d14c441162d656fe7794e589 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/0a08ad434fdffa752d2d04eca652ef6f25bca6b7 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/55ce81ddac8c4e25621aa27803e02a30107bba42 |     
  riscv64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/da56932edc0bd117db49b222354803ca732a5478 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/32de516322de94920a9bccb4aee805c75aa918c5 |     
   nios2     |    network-manager-1.22.16     | NOK | http://autobuild.buildroot.net/results/7be286510fde1bf6bffbaadb9fa621278cd67ec3 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c38c5201d86fd114a2865aed6a4df0ffc548c27a |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/1797f2d86ddff9a18f2608510a1cdb08da83e4bd |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/40c9b1883955c0f5ff376b2abee247f41ff4a9fc |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/6a86182cf3ea3e3bb7cfaa735bdca4a24ba378f2 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/871273551dee7bde76713b1c5b7f869f7ea7a86c | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/1ae209a093f099a93882141e7fd1c698cd40f21e | ORPH
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/5cca1c03a6c075de54eaa7c623b350ccf40b153d | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a246af24638b03c5534d1c3785c869d9231a6754 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1fd0eab5d63de7e62d27ad542e1244bfb7c84511 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4c91c136ab64708cdcbf9027d5541315b293741d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8f7eab73c385b6d70bc3352a7e074ba3080e1eca |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c59b888434791d6b20d0d12e2db45d62328b9525 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/048ab6b11866c129e4d81b74ca560fc1101083d4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7428dc7ac814b280d7a49ecb301dea7ab2f5fa83 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/11ad3c22036cd9257a15f1a5d366876b7c48ebbd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5ad05c0f9ff613518799143a527bf0de7edb72d7 |     
  aarch64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/7242a3d9036f592b55836e352867a746c9a57f13 |     
  sparc64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/ff67a5708d604688a564e4f304941b4e2925b0cc |     
   s390x     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/3c97512cc190263ce47825ad0a60f48959f60638 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/47e2ddd78e7293214974a46b0fa474dd08f3e393 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/a2a8ae3caf94cd2095542ee8350ab5927f8ccc4d |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/ec431b42ea0e3301c3367d7886ec1fb25190fc35 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/b5b6e744366af025cea14259f3ee60d25045e5e7 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/0af957e4fea5d6d87359a4dc13e37477249dc0a1 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/f2f516075ee3deca645b2306d77d9ca96dd4aea8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/bccf38933cf50186469ae65379cdc1130d7c8ec7 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/423d8e80ee86e71de632d60be1a77950447dbf72 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a3ac294a113afa0e23cd58a27f3880af72c18ece |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/1b8f404a4dfbd49957f95e10ee02717bce762b3e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6f6657bf0fd29652a2cb3e3630cec23e60e245ce |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/8827428124c1df46e85173424727519b4540406e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/74d4dc04d53ae46cf05549bf59df6c44a7ac010c |     
   x86_64    |        wpewebkit-2.30.6        | NOK | http://autobuild.buildroot.net/results/de1baf31796a3b29cfc6ef6e0c45a8e3cbe75f59 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0675bc9930c2b3879bf23e3196ba83a816231514 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/bd54f03323f5fb536f9417f02e98775f136ec171 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e8cb084fa5a8cab1aeef830aeb89e54377f991e6 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/91a6cf4f4233c49064e57b73cb59d5ddd1899608 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c7008c7fd1502b08b72ea0e0f8143b9490fd2ee3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0e010d6b559c4b6d4edd34ad16e946d01f9c3387 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4cba3b5e3c15d18219c1f5d72cf5d8cc287878e8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/93e6df15bfae07865452255a0974f7d5cf194393 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/05caac13b08c3f7da01aae593bc7806f974837d1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b1dd8b2f5217319d5d4802e3ecbe8983021fcee5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3c3758111f8731ce71366eadc105fb0044d6d3d8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/211af4e6afcfb4d486d33fdaa7d45851e5723ae2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c333f4a24a6918a5e9cf673dde9ae0dcf1c2519d |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20210730     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 40.1.1       |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.3.1        | 4.5.1        |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/00037 | 1.2.4        | 1.2.5.1      |     
                 android-tools |  DISTRO  | https://release-monitoring.org/project/13989 | 4.2.2+git... | 11.0.0_r39   |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 10.6.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.14.1      | 18.5.1       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.40.3       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.36.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.1        | 3.0.3        |     
                      autoconf |  DISTRO  | https://release-monitoring.org/project/00141 | 2.69         | 2.71         | ORPH
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2019.01.06   | 2021.02.19   |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.4       | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | r1450        | 6.3          |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.10.2       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 2020-12-09   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.10         |     
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/07137 | 2.0.3        | 2.0.4        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 19.03.14     | 19.03.23     | ORPH
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 5.1          | 5.1.8        | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2021.1       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.0-alpha  |     
                    berkeleydb |  DISTRO  | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.4       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.31      | 9.17.16      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.35.2       | 2.37         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.18      | 7.18.0       |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.75.0       | 1.77.0.beta1 |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.0.2        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.17.3       | 3.0.0-alpha0 | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.11         | 5.13.1       | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.09         | 3.17         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.8        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                          cage |  DISTRO  | https://release-monitoring.org/project/21171 | 0.1.3        | 0.1.4        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.16.1       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.301        | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.3          | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.34       | 1.4.35       | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.5.0        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.2          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.2.2        | 2.4.0        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.0          | 4.1          | ORPH
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 11.0.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 3.0.21.02.21 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.16.9       | 3.21.1       |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.4.4        | 1.5.5        |     
                        cppcms |  DISTRO  | https://release-monitoring.org/project/21334 | 1.2.1        | 2.0.0.beta2  | ORPH
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.3.0        | 8.5.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.3.4        | 2.4.0        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.4       | 1.28.9       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.0.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.2        | 1.4.3        |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.11.3     | 0.5.11.4     | ORPH
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.10.25      |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 1.7.1        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 3.3.3        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.2.9        |     
                         dav1d |  DISTRO  | https://release-monitoring.org/project/18920 | 0.9.0        | 0.9.1        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.20      | 1.13.18      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.16       | 1.2.18       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 4.11.2       | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/11312 | 0.6.5        | 0.7.0        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.6.1        | 1.7.0        |     
                          dhcp |  DISTRO  | https://release-monitoring.org/project/05584 | 4.4.2-P1     | 4.4.2b1      | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20200327 | 1.3-20210621 | ORPH
                     diffutils |  DISTRO  | https://release-monitoring.org/project/00436 | 3.7          | 3.8          | ORPH
                       dmalloc |  DISTRO  | https://release-monitoring.org/project/21417 | 5.5.2        | 5.6.5        | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.29.2       |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.18       | 1.9.1        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.15.0       | 9.18.1       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/00646 | 1.46.2       | 1.46.3       | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6          | 1.6.2        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.16         | 1.17         | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202105       | ORPH
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.3.9        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 20.07        | 21.07        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.184        | 0.185        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.12.2       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.41         | 0.42         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.2.15       | 2.3.0        |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 24.0.5       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.21       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 1.0.6        | 1.0.8        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.13       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.29       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.14       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.8        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.43       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.27       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.0.44       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.13       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.23       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.47       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.4        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.28       | 1.0.32       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.12       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.9        | 1.0.10       |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.12         | 5.13         |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.1.0        | 1.1.2        |     
                         fastd |  DISTRO  | https://release-monitoring.org/project/17116 | 21           | 22           |     
                       fdk-aac |  DISTRO  | https://release-monitoring.org/project/16208 | 2.0.1        | 2.0.2        |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.6.3        | 3.7.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.40         | ORPH
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.11         | 1.12rc2      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.11         | 1.12rc2      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.5        | 1.3.7        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.2.1        | 2.2.2        |     
                           fmc |  DISTRO  | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 7.1.3        | 8.0.1        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.15.3       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.94      | ORPH
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 7.5.1        | 8.0          |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.7          |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.05.00     | 21.07.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.8.0        | 1.9.0        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.10       |     
                          gdbm |  DISTRO  | https://release-monitoring.org/project/00882 | 1.18.1       | 1.20         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.6       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.4        | 2.2.8        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.8.2        | 1.9.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.53.3       | 9.54.0       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.1       | 2.32.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.66.0       | 2.70.alpha   | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.66.0       | 2.68.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.4.0        | 0.5.0        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/21445 | 0.0.8        | 0.0.9        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.13       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.8        | 6.2.9        | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.28       | 2.3.1        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.9.2.0      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.7.1        | 3.7.2        |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.16.6       | 1.17rc1      |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.21         | 3.22         |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 6.1.0        | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.38.1       | 1.39.0       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 41.alpha     | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.18.4       | 1.19.1       | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.18.4       | 1.19.1       |     
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.0.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.18.4       | 1.19.1       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.18.4       | 1.19.1       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.18.4       | 1.19.1       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.18.4       | 1.19.1       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.18.4       | 1.19.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.18.4       | 1.19.1       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.18.4       | 1.19.1       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.18.4       | 1.19.1       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.18.4       | 1.19.1       | ORPH
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.2.0        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.1.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 3.0.4        | 3.0.7        | ORPH
                    gupnp-dlna |  DISTRO  | https://release-monitoring.org/project/01283 | 0.10.5       | 0.11.0       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.10.0       | 0.10.1       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.44.1       | 1.48.1       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 10.11        | 11.0         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.21.6       | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.345        | 0.349        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.4.1        | 2.5.0        |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1661         |     
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.12         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.36       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.11-13    | 7.1.0-4      | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.1        | 1.7.2        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.20.11.0    | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 21.2.3       | 21.3.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 21.2.3       | 21.3.0       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_490        | 3.492        |     
                        ipcalc |  DISTRO  | https://release-monitoring.org/project/07555 | 1.0.0        | 1.0.1        |     
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.0.13       | 2.1.3        |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.11         | 7.14         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.7.0        | 1.8.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.3        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.24         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.14         | 1.16         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.17       | 1.9.19       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.10      | 0.11.3       |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.28       | 2.0.32       |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 2.2.0        | 3.1.0        |     
                          jose |  DISTRO  | https://release-monitoring.org/project/11761 | 10           | 11           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.6        | 2.1.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.3       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.9.0        | 3.9.1        | ORPH
                     json-glib |  DISTRO  | https://release-monitoring.org/project/13144 | 1.4.4        | 1.6.2        |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.6.0-0      |     
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.1.4        | 2.2.2        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.84.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.84.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.84.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.84.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 28           | 29           |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.7.2-Matrix | 17beta1      |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.0-Ma... | 20.0.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.0-Ma... | 20.0.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.0-Ma... | 20.0.0-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.9.0        | 3.10.0       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                     leptonica |  DISTRO  | https://release-monitoring.org/project/01549 | 1.80.0       | 1.81.1       |     
                       leveldb |  DISTRO  | https://release-monitoring.org/project/09338 | 1.22         | 1.23         |     
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.25         | 2.26-1       | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 0.2          | 0.4.0        | ORPH
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.10.0       | 0.11.3       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.5          | 2.6          | ORPH
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.51         | 2.52         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0          |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.4       | 1.10.7       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.1        | 4.3.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.14         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 5.2.0        | 5.2.1        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20191231-3.1 | 20210714-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.1.2        | 2.1.4        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.1.0        | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.4       | ORPH
                       libgeos |  DISTRO  | https://release-monitoring.org/project/13493 | 3.9.0        | 3.9.1        | ORPH
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/21361 | 1.6.0        | 1.7.0        |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.1.0        | 1.1.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.2        | 3.3.4        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.68.2       | 2.69.0       |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.15.1       | 1.16.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.26       | 2.5.27       | ORPH
                        libgta |  DISTRO  | https://release-monitoring.org/project/01564 | 1.0.8        | 1.2.1        |     
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.3.2        |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.30      | 3.94.0       |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20210224     | 20210624     |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.37         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.10       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.19         | 0.22         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.0        |     
                        libite |  DISTRO  | https://release-monitoring.org/project/17367 | 2.2.0        | 2.4.0        | ORPH
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.3.1        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.43         |     
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.17         |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/07470 | 1.5.2        | 1.6.0        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.10.0       | 0.10.2       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/13148 | 1.9.4        | 1.9.5        |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.2        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.43       | 2.0.1        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.7        | 1.2.0        |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.1        | 3.2.4        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 5.2.0        | 5.2.1        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 2.1.8.201... | 2.1.9.201... |     
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.10         | 2.11.1       |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.6.0        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.2        | 2.0.3        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.5       | 2.51.4       |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.4        | 2.5.1        |     
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 20200710     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.2          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.2          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.6       | 3.0.7        | ORPH
                    libsndfile |  DISTRO  | https://release-monitoring.org/project/13277 | 1.0.31       | 1.1.0beta1   |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.72.0       | 2.99.9       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                      libsysfs |  DISTRO  | https://release-monitoring.org/project/04928 | 2.1.0        | 2.1.1        | ORPH
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/01733 | 2.3.1        | 2.3.3        | ORPH
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.12       | 2.0.4        |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.12.1       | 0.13.0       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.41.0       | 1.42.0       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.11.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.4.0        | 7.5.0        | ORPH
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.21       | 4.2.1        |     
                     libxcrypt |  DISTRO  | https://release-monitoring.org/project/16436 | 4.4.18       | 4.4.23       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.1.0        | 1.3.0        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 5.0.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.51.07      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.225      | 2.0.7        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.7.3        | 1.8.0        |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.22         | 2.23         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.0-alpha  | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20210511     | 20210716     |     
             linuxconsoletools |  DISTRO  | https://release-monitoring.org/project/01827 | 1.7.0        | 1.7.1        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2021.07.20   | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.11       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 2020.06-a... |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.11.0       | 0.12.0       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.18.0       | 3.18.1       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.93.2       | 4.94.0       | ORPH
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.31         | 0.32         |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.3        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.12.1       | 2.12.2       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.6       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.12.3       | 2.12.4       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.3        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.41.0-0     | 1.41.1-0     |     
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.6        | 4.0.10       |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                            m4 |  DISTRO  | https://release-monitoring.org/project/01871 | 1.4.18       | 1.4.19       | ORPH
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.30      | 10.6.3       | ORPH
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 172          | 178          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.9        | 1.6.10       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.1.6       | 21.2.0-rc3   |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.1.6       | 21.2.0-rc3   |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.58.2       | 0.59.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.40.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.14         | 1.16         |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 9.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                    mjpegtools |  DISTRO  | https://release-monitoring.org/project/14612 | 2.1.0        | 2.2.0        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2021.06      | 2021.07      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20201225     | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.16.6       | 1.16.8       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.11       | 5.1.0-alpha  |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.3          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.28.1       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.90    | 6.12.0.122   |     
                         mp4v2 |  DISTRO  | https://release-monitoring.org/project/98413 | 4.1.3        | 5.0.1        | ORPH
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.22.8       | 0.22.9       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.5.0        | 2.5.1        |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.28.2       | ORPH
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 2.1.0        | 2.2.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.15       |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.26       | 4.0.34       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.93         | 0.94         | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.15.1       | 1.16         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20210731 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.1       | 1.31.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 1.1.70       | 2.0.0        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.1        | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.32.2       | 1.33.1-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.15-dev   |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.6        | 0.9.9        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.44.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.21.1       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.22.3      | 16.6.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.14.1       | 0.15.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.132      | 390.144      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 470.57.02    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 1.14         | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 1.31         | 1.32         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.12      |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.17       | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.15       | 4.5.3        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.31       |     
                       openjdk |  DISTRO  | https://release-monitoring.org/project/176098 | 11.0.11+9    | 18+8         |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.5.0        | 6.6.1        |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.58       | 2.5.6        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.1        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.10.0       | 3.12.0       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.3.0       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.13.0       | 3.14.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.13.0       | 3.14.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.13.0       | 3.14.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.13.0       | 3.14.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.26       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.0-alpha  | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/02575 | 1.4.2        | 1.5.1        | ORPH
                          owfs |  DISTRO  | https://release-monitoring.org/project/21559 | 3.2p3        | 3.2p4        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.22      | 0.24.0       | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/21376 | 1.1          | 1.2.0        |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.49.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.3          | 3.4          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.12         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.3        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202107       | ORPH
                          pcre |  DISTRO  | https://release-monitoring.org/project/02610 | 8.44         | 8.45         | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.36        | 10.37        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.32.1       | 5.35.2       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
      perl-crypt-openssl-guess |  DISTRO  | https://release-monitoring.org/project/17375 | 0.12         | 0.13         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20200907   |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.90         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.012003     | 1.012004     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.0.9        | 8.1.0beta1   |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0beta   |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.5.0        | 3.5.1        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.8.0        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.10.1       | 1.11.0       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 1.2          | 1.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                      popperjs |  DISTRO  | https://release-monitoring.org/project/141557 | 1.16.0       | 2.9.2        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 21.08.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/03694 | 3.1.2        | 3.1.3        |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 13.3         | 14_BETA2     |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.3.9        | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                          pppd |  DISTRO  | https://release-monitoring.org/project/03703 | 2.4.8        | 2.4.9        | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.17       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.8rc1     |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 7.2.1        | 8.1.0        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.17.3       | 4.0.0-rc2    |     
                    protobuf-c |  DISTRO  | https://release-monitoring.org/project/03716 | 1.3.3        | 1.4.0        |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.14         | 4.15         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.7.0        | 5.8.0        |     
                          ptpd |  DISTRO  | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 15.0         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/05749 | 0.75         | 0.76         |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 2.2.3        | 3.1.0        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4.1        |     
               python-aiofiles |  DISTRO  | https://release-monitoring.org/project/12743 | 0.5.0        | 0.7.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.7.4.post0  | 4.0.0a1      |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.2.2        | 0.3.0        |     
               python-aioredis |  DISTRO  | https://release-monitoring.org/project/21938 | 1.3.1        | 2.0.0b1      |     
              python-aiosignal |  DISTRO  | https://release-monitoring.org/project/41889 | 1.0.0        | 1.1.2        |     
              python-aiozipkin |  DISTRO  | https://release-monitoring.org/project/56569 | 0.7.1        | 1.1.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 1.1.1        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.4.1        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a3      |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 19.3.0       | 21.2.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 21.3.1       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.10.2       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.9.1        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.4        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.3        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 3.1.7        | 3.1.9        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.11.0       | 0.12.1       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.16.50      | 1.18.11      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.19.48      | 1.21.11      |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/44268 | 1.2.0        | 1.2.1        |     
        python-cached-property |  DISTRO  | https://release-monitoring.org/project/06048 | 1.5.1        | 1.5.2        |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.4        | 4.0.0-dev.0  |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.2.1        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.4.0        | 5.4.1        |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.2       | 1.14.6       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.4        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.3.0        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.6.post2  | 3.2.7b1      |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.5.2        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.1       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.1.2        | 8.0.1        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 4.8.0        | 6.3.0a1      |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 21.3.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 3.3.2        | 3.4.7        |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 1.0.2        | 2.3.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.23      | 3.0.0a9      |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.50.1       | 0.52.0       |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/05621 | 2.8.1        | 2.8.2        |     
              python-dbus-next |  DISTRO  | https://release-monitoring.org/project/81985 | 0.2.2        | 0.2.3        | ORPH
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 5.0.9        |     
             python-defusedxml |  DISTRO  | https://release-monitoring.org/project/03821 | 0.6.0        | 0.7.1        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.2        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.2        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.1.1        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 1.16.0       | 2.1.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.17.1b1.... |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.6.0        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.2        | 1.9.6        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.16.1       | 0.17.0       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 4.2.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.1.2        | 2.0.1        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 2.0.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.5.1        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 0.14.3       | 0.15.1       |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/41138 | 1.1.0        | 1.1.1        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.7        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.36.1       | 3.40.1       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 0.4.16       | 1.1.0        |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.1.0       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.2.0        | 4.0.0        |     
                  python-hpack |  DISTRO  | https://release-monitoring.org/project/19034 | 3.0.0        | 4.0.0        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0.1        | 1.1          |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 3.10.0       |     
             python-hyperframe |  DISTRO  | https://release-monitoring.org/project/19035 | 5.2.0        | 6.0.1        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 19.0.0       | 21.0.0       |     
            python-incremental |  DISTRO  | https://release-monitoring.org/project/15162 | 17.5.0       | 21.3.0       |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.1        |     
                   python-ipdb |  DISTRO  | https://release-monitoring.org/project/12710 | 0.13.2       | 0.13.9       |     
                    python-ipy |  DISTRO  | https://release-monitoring.org/project/19783 | 1.00         | 1.01         |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.25.0       |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.0a1      |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.1        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.3.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.3       | 3.0.1        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.0.0a2      |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.0.1       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.3.1        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.9.3        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.99         | 1.2.1        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.3        | 1.1.4        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.3.9        | 2.4.0        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.4.2        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a6      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.4.0        | 8.8.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.0        | 1.0.2        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 5.0.2        | 5.1.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.45.1       |     
              python-netifaces |  DISTRO  | https://release-monitoring.org/project/05644 | 0.10.9       | 0.11.0       |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.4          | 2.6.2        |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.22.0.dev0  |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.0        | 3.1.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/11718 | 20.9         | 21.0         |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.1        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-pathlib2 |  DISTRO  | https://release-monitoring.org/project/12723 | 2.3.5        | 2.3.6        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.4.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.6.0        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 8.2.0        | 8.3.1        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 21.2.2       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 0.13.1       | 1.0.0.dev0   |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.7.1        |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/13204 | 1.0.4        | 1.0.5        |     
               python-priority |  DISTRO  | https://release-monitoring.org/project/19036 | 1.3.0        | 2.0.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.19       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.17.3       | 4.0.0-rc2    |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.7.2        | 5.8.0        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.8.5        | 2.9.1        |     
             python-ptyprocess |  DISTRO  | https://release-monitoring.org/project/06446 | 0.6.0        | 0.7.0        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2021.1       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.6.1        | 2.7.0        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.20.1       |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.9.9        | 3.10.1       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20200910.1   | 20210626.3   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.8.2        |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.1        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.9.0        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.7.4        |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.2        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.18.15      | ORPH
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.9.3        | 1.0.2        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 19.1.0       | 20.0.1       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.11.7       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.4       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.4        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.0       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.62.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2021.1       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.1.1        | 1.2.1        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 22.1.0       |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.1        | 1.3.2        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2021.7.6     |     
             python-request-id |  DISTRO  | https://release-monitoring.org/project/21598 | 1.0          | 1.0.1        |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.25.1       | 2.26.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.3.3        | 0.5.0        |     
                  python-scapy |  DISTRO  | https://release-monitoring.org/project/04764 | 2.4.4        | 2.4.5        |     
               python-schedule |  DISTRO  | https://release-monitoring.org/project/21600 | 0.6.0        | 1.1.0        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.1        |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.10.2       | 3.0.0-dev.1  |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.17.3       | 1.3.1        |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 18.1.0       | 21.1.0       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.1.10       | 1.2.2        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 57.4.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 5.0.1        | 6.0.1        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.13.1       | 1.14.2       |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.0       | 3.17.3       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
         python-singledispatch |  DISTRO  | https://release-monitoring.org/project/12013 | 3.4.0.3      | 3.6.2        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                    python-six |  DISTRO  | https://release-monitoring.org/project/04027 | 1.15.0       | 1.16.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 4.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/07203 | 0.5.4        | 0.6.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 5.3.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.3.0        | 2.4.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.2.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.22       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.2.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 1.1.2        | 1.2.0        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 4.1.1        |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 1.6.3        | 1.6.4        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1b2        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.62.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 4.3.3        | 5.0.5        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 21.5.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 20.4.1       | 21.2.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 1.1.5        | 1.2.0        |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 3.7.4.3      | 3.10.0.0     |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.7.1        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 4.0.2        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.2        |     
                 python-uvloop |  DISTRO  | https://release-monitoring.org/project/12762 | 0.15.0       | 0.15.3       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.2       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 2.1.3        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.20.4       | 2.21.1       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.6        | 1.8.7        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.1.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 9.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 1.0.1        | 2.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                python-wsaccel |  DISTRO  | https://release-monitoring.org/project/07278 | 0.6.2        | 0.6.3        |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.0a1      |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
                   python-xlrd |  DISTRO  | https://release-monitoring.org/project/15107 | 1.2.0        | 2.0.1        |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.4.5        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.33.2       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 5.3.0        | 5.4.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.9.6        | 3.10.0b4     |     
                  python3-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.2       | 1.14.6       |     
               python3-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.6.post2  | 3.2.7b1      |     
          python3-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 3.3.2        | 3.4.7        |     
                python3-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.23      | 3.0.0a9      |     
             python3-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 5.0.9        |     
                python3-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.3       | 3.0.1        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.3        | 1.1.4        |     
            python3-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.1        |     
                   python3-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 21.2.2       |     
                python3-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.7.2        | 5.8.0        |     
         python3-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.9.9        | 3.10.1       |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2021.7.6     |     
              python3-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.25.1       | 2.26.0       |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 57.4.0       |     
                   python3-six |  DISTRO  | https://release-monitoring.org/project/04027 | 1.15.0       | 1.16.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 6.0.0        | 6.1.0-rc1    |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.3.2       |     
                         qt53d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                     qt5lottie |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
              qt5quicktimeline |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
              qt5remoteobjects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 6.2.0-beta2  |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 6.2.0-beta2  |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-beta2  |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.9.1        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2021-06-01   | 2021-08-01   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.2          | 20200710     | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 13.0.0       |     
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 6.12         | 6.13         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 6.22.1       |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.14         | 3.15         | ORPH
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.16.1.3     | 4.17.0-beta1 |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2106.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.10         | 2.1          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 7.4.2        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc95   | 1.0.1        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.52.0       | 1.54.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.52.0       | 1.54.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.38.3       | 0.40.1       |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.14.6       | 4.15.0rc1    |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.2.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 20200710     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 20200710     | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.57.0       | 1.68.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.11       |     
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/04801 | 1.45         | 1.47r900     |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.7        | 4.0-dev      |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.1          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.1        | 0.7.2        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.8          | 4.9          |     
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.8        | 1.1.9        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.4.9        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.2        | 3.4.7        |     
                         snort |  DISTRO  | https://release-monitoring.org/project/212335 | 2.9.17.1     | 2.9.18       |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.3-80... | 1.13.4.69... |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.36-9754... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                        spdlog |  DISTRO  | https://release-monitoring.org/project/15599 | 1.8.5        | 1.9.1        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                      squashfs |  DISTRO  | https://release-monitoring.org/project/04879 | 4.4          | 4.5          |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.15         | 5.0.4        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 3.7.1        | 3.7.2        | ORPH
                      sshguard |  DISTRO  | https://release-monitoring.org/project/13819 | 2.4.1        | 2.4.2        |     
                       sshpass |  DISTRO  | https://release-monitoring.org/project/12961 | 1.06         | 1.09         |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.20.9       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.4          | 6.5.3        |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.12         | 5.13         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.12.02      | 0.12.12      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.1        | 5.9.3        |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.5p2      | 1.9.7p2      | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                  supertuxkart |  DISTRO  | https://release-monitoring.org/project/04912 | 1.1          | 1.2          |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.2        | ORPH
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.27.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.33.1       | 3.33.2       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.40.1       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.4.122      | 2.0.1        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.4       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12         |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a5        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.2        | 1.2.4        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.3        | 4.3.4        | ORPH
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.4.6        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.14.2       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.3.0        | 2.3.1        |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre18     |     
                      tinyalsa |  DISTRO  | https://release-monitoring.org/project/21382 | 1.1.1        | 2.0.0        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                      tinyxml2 |  DISTRO  | https://release-monitoring.org/project/04976 | 8.0.0        | 9.0.0        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a5        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.2a         |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.6.6      | 0.4.7.0-a... |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.0        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.3.2        | 5.1.1        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.0.3        | 3.1.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.9.4        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2021.10-rc1  |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.9.4        | 0.10         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.1.0.1      |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.4        | 6.0.7        | ORPH
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.8.0        | 0.10.0       |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.36.2       | 2.37.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.36.2       | 2.37.1       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.3          | 0.5          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.3273     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.16       | 4.0.0-dev    |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.64.2       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.0.5        | 3.2.0-beta.1 |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/05120 | 0.9.1        | 0.9.3        |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.20         | 1.21         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.32.3       | 2.33.2       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.2.0        | 1.2.1-rc2    |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.5         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 6.14         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20210219 | 1.0.20210606 |     
               wireguard-tools |  DISTRO  | https://release-monitoring.org/project/62381 | 1.0.20210223 | 1.0.20210424 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2021.04.21   | 2021.07.14   |     
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.13.0       | 0.14.1       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.32.3       | 2.33.2       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20210218     |     
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/15025 | 1.1.2        | 1.2.0        |     
                      xapp_xwd |  DISTRO  | https://release-monitoring.org/project/14950 | 1.0.7        | 1.0.8        |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/15900 | 19.1.0       | 21.0.0       |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.2       | 4.15.0       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.10.0       | 5.12.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.32         | 2.33         |     
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/17165 | 2.0.4        | 2.0.5        |     
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/01777 | 2.3.3        | 2.3.4        |     
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/01778 | 1.7.10       | 1.7.99.2     |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2021.4       | 2021.4.99.2  |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.45         | 6.01         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 1.20.13      | 21.0.99.1    |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.18         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 367          | 368          | ORPH
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                          zbar |  DISTRO  | https://release-monitoring.org/project/13689 | 0.23.1       | 0.23.90      |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.0.5        | 2.1.0        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2020f        | 2021a        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 1.9.9-b1     | 2.0.5        | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2021.1       | ORPH

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-3487    | https://security-tracker.debian.org/tracker/CVE-2021-3487   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                    containerd | CVE-2021-32760   | https://security-tracker.debian.org/tracker/CVE-2021-32760  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2019-14318   | https://security-tracker.debian.org/tracker/CVE-2019-14318  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                        docker | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                        docker | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                        docker | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                        docker | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                        docker | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                        docker | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                        docker | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                        docker | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                        docker | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                        docker | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                        docker | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                        docker | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                    docker-cli | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                    docker-cli | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                    docker-cli | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                    docker-cli | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                    docker-cli | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                    docker-cli | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                    docker-cli | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                    docker-cli | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                    docker-cli | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                    docker-cli | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                    docker-cli | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                    docker-cli | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                    docker-cli | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                    docker-cli | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                 docker-engine | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                 docker-engine | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                 docker-engine | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                 docker-engine | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                 docker-engine | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                 docker-engine | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                 docker-engine | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                 docker-engine | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                 docker-engine | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                 docker-engine | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                 docker-engine | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                 docker-engine | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                 docker-engine | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2021-29221   | https://security-tracker.debian.org/tracker/CVE-2021-29221  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                         exiv2 | CVE-2021-3482    | https://security-tracker.debian.org/tracker/CVE-2021-3482   
                        ffmpeg | CVE-2021-33815   | https://security-tracker.debian.org/tracker/CVE-2021-33815  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2001-1323    | https://security-tracker.debian.org/tracker/CVE-2001-1323   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libyang | CVE-2021-28902   | https://security-tracker.debian.org/tracker/CVE-2021-28902  
                       libyang | CVE-2021-28903   | https://security-tracker.debian.org/tracker/CVE-2021-28903  
                       libyang | CVE-2021-28904   | https://security-tracker.debian.org/tracker/CVE-2021-28904  
                       libyang | CVE-2021-28905   | https://security-tracker.debian.org/tracker/CVE-2021-28905  
                       libyang | CVE-2021-28906   | https://security-tracker.debian.org/tracker/CVE-2021-28906  
                     lightning | CVE-2020-7747    | https://security-tracker.debian.org/tracker/CVE-2020-7747   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                         matio | CVE-2021-36977   | https://security-tracker.debian.org/tracker/CVE-2021-36977  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                       msgpack | CVE-2021-23410   | https://security-tracker.debian.org/tracker/CVE-2021-23410  
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                         mupdf | CVE-2021-37220   | https://security-tracker.debian.org/tracker/CVE-2021-37220  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
               network-manager | CVE-2005-2410    | https://security-tracker.debian.org/tracker/CVE-2005-2410   
               network-manager | CVE-2015-0272    | https://security-tracker.debian.org/tracker/CVE-2015-0272   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2020-14145   | https://security-tracker.debian.org/tracker/CVE-2020-14145  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2021-34552   | https://security-tracker.debian.org/tracker/CVE-2021-34552  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                   python3-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                          qpdf | CVE-2021-36978   | https://security-tracker.debian.org/tracker/CVE-2021-36978  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       ripgrep | CVE-2021-3013    | https://security-tracker.debian.org/tracker/CVE-2021-3013   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                          wget | CVE-2021-31879   | https://security-tracker.debian.org/tracker/CVE-2021-31879  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2021.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2021-36217   | https://security-tracker.debian.org/tracker/CVE-2021-36217  
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-3487    | https://security-tracker.debian.org/tracker/CVE-2021-3487   
                          bird | CVE-2021-26928   | https://security-tracker.debian.org/tracker/CVE-2021-26928  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                  bluez5_utils | CVE-2021-0129    | https://security-tracker.debian.org/tracker/CVE-2021-0129   
                  bluez5_utils | CVE-2021-3588    | https://security-tracker.debian.org/tracker/CVE-2021-3588   
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2021-0129    | https://security-tracker.debian.org/tracker/CVE-2021-0129   
          bluez5_utils-headers | CVE-2021-3588    | https://security-tracker.debian.org/tracker/CVE-2021-3588   
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2019-14318   | https://security-tracker.debian.org/tracker/CVE-2019-14318  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                        docker | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                        docker | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                        docker | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                        docker | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                        docker | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                        docker | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                        docker | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                        docker | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                        docker | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                        docker | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                        docker | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                        docker | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                    docker-cli | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                    docker-cli | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                    docker-cli | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                    docker-cli | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                    docker-cli | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                    docker-cli | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                    docker-cli | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                    docker-cli | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                    docker-cli | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                    docker-cli | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                    docker-cli | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                    docker-cli | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                    docker-cli | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                    docker-cli | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
             docker-containerd | CVE-2021-32760   | https://security-tracker.debian.org/tracker/CVE-2021-32760  
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                 docker-engine | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                 docker-engine | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                 docker-engine | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                 docker-engine | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                 docker-engine | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                 docker-engine | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                 docker-engine | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                 docker-engine | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                 docker-engine | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                 docker-engine | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                 docker-engine | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                 docker-engine | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                 docker-engine | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
                       dovecot | CVE-2016-4983    | https://security-tracker.debian.org/tracker/CVE-2016-4983   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2021-29221   | https://security-tracker.debian.org/tracker/CVE-2021-29221  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                         exiv2 | CVE-2021-3482    | https://security-tracker.debian.org/tracker/CVE-2021-3482   
                      fail2ban | CVE-2021-32749   | https://security-tracker.debian.org/tracker/CVE-2021-32749  
                        ffmpeg | CVE-2021-30123   | https://security-tracker.debian.org/tracker/CVE-2021-30123  
                   flatbuffers | CVE-2020-35864   | https://security-tracker.debian.org/tracker/CVE-2020-35864  
                    fluidsynth | CVE-2021-21417   | https://security-tracker.debian.org/tracker/CVE-2021-21417  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-27645   | https://security-tracker.debian.org/tracker/CVE-2021-27645  
                         glibc | CVE-2021-33574   | https://security-tracker.debian.org/tracker/CVE-2021-33574  
                      gnuchess | CVE-2021-30184   | https://security-tracker.debian.org/tracker/CVE-2021-30184  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2021-34558   | https://security-tracker.debian.org/tracker/CVE-2021-34558  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2001-1323    | https://security-tracker.debian.org/tracker/CVE-2001-1323   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                       libyang | CVE-2021-28902   | https://security-tracker.debian.org/tracker/CVE-2021-28902  
                       libyang | CVE-2021-28903   | https://security-tracker.debian.org/tracker/CVE-2021-28903  
                       libyang | CVE-2021-28904   | https://security-tracker.debian.org/tracker/CVE-2021-28904  
                       libyang | CVE-2021-28905   | https://security-tracker.debian.org/tracker/CVE-2021-28905  
                       libyang | CVE-2021-28906   | https://security-tracker.debian.org/tracker/CVE-2021-28906  
                     lightning | CVE-2020-7747    | https://security-tracker.debian.org/tracker/CVE-2020-7747   
                      linuxptp | CVE-2021-3570    | https://security-tracker.debian.org/tracker/CVE-2021-3570   
                      linuxptp | CVE-2021-3571    | https://security-tracker.debian.org/tracker/CVE-2021-3571   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                        monkey | CVE-2013-1771    | https://security-tracker.debian.org/tracker/CVE-2013-1771   
                        monkey | CVE-2013-2183    | https://security-tracker.debian.org/tracker/CVE-2013-2183   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                       msgpack | CVE-2021-23410   | https://security-tracker.debian.org/tracker/CVE-2021-23410  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2021-32055   | https://security-tracker.debian.org/tracker/CVE-2021-32055  
               network-manager | CVE-2005-2410    | https://security-tracker.debian.org/tracker/CVE-2005-2410   
               network-manager | CVE-2015-0272    | https://security-tracker.debian.org/tracker/CVE-2015-0272   
               network-manager | CVE-2020-10754   | https://security-tracker.debian.org/tracker/CVE-2020-10754  
               network-manager | CVE-2021-20297   | https://security-tracker.debian.org/tracker/CVE-2021-20297  
                        nodejs | CVE-2021-22918   | https://security-tracker.debian.org/tracker/CVE-2021-22918  
                        nodejs | CVE-2021-22921   | https://security-tracker.debian.org/tracker/CVE-2021-22921  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2020-14145   | https://security-tracker.debian.org/tracker/CVE-2020-14145  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                       openvpn | CVE-2021-3606    | https://security-tracker.debian.org/tracker/CVE-2021-3606   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                   php-imagick | CVE-2019-11037   | https://security-tracker.debian.org/tracker/CVE-2019-11037  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                         putty | CVE-2021-36367   | https://security-tracker.debian.org/tracker/CVE-2021-36367  
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
           python-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2021-34552   | https://security-tracker.debian.org/tracker/CVE-2021-34552  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-urllib3 | CVE-2021-33503   | https://security-tracker.debian.org/tracker/CVE-2021-33503  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35504   | https://security-tracker.debian.org/tracker/CVE-2020-35504  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2020-35506   | https://security-tracker.debian.org/tracker/CVE-2020-35506  
                          qemu | CVE-2020-35517   | https://security-tracker.debian.org/tracker/CVE-2020-35517  
                          qemu | CVE-2021-20181   | https://security-tracker.debian.org/tracker/CVE-2021-20181  
                          qemu | CVE-2021-20196   | https://security-tracker.debian.org/tracker/CVE-2021-20196  
                          qemu | CVE-2021-20203   | https://security-tracker.debian.org/tracker/CVE-2021-20203  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-20263   | https://security-tracker.debian.org/tracker/CVE-2021-20263  
                          qemu | CVE-2021-3392    | https://security-tracker.debian.org/tracker/CVE-2021-3392   
                          qemu | CVE-2021-3409    | https://security-tracker.debian.org/tracker/CVE-2021-3409   
                          qemu | CVE-2021-3416    | https://security-tracker.debian.org/tracker/CVE-2021-3416   
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                          qpdf | CVE-2021-36978   | https://security-tracker.debian.org/tracker/CVE-2021-36978  
                   qpid-proton | CVE-2016-2166    | https://security-tracker.debian.org/tracker/CVE-2016-2166   
                   qpid-proton | CVE-2016-4467    | https://security-tracker.debian.org/tracker/CVE-2016-4467   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       ripgrep | CVE-2021-3013    | https://security-tracker.debian.org/tracker/CVE-2021-3013   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                         spice | CVE-2021-20201   | https://security-tracker.debian.org/tracker/CVE-2021-20201  
                       systemd | CVE-2021-33910   | https://security-tracker.debian.org/tracker/CVE-2021-33910  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                    tpm2-tools | CVE-2021-3565    | https://security-tracker.debian.org/tracker/CVE-2021-3565   
                   uboot-tools | CVE-2021-27097   | https://security-tracker.debian.org/tracker/CVE-2021-27097  
                   uboot-tools | CVE-2021-27138   | https://security-tracker.debian.org/tracker/CVE-2021-27138  
                          wget | CVE-2021-31879   | https://security-tracker.debian.org/tracker/CVE-2021-31879  
                     wireshark | CVE-2021-22235   | https://security-tracker.debian.org/tracker/CVE-2021-22235  
                       wolfssl | CVE-2021-37155   | https://security-tracker.debian.org/tracker/CVE-2021-37155  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2021.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2021-36217   | https://security-tracker.debian.org/tracker/CVE-2021-36217  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-3487    | https://security-tracker.debian.org/tracker/CVE-2021-3487   
                          bird | CVE-2021-26928   | https://security-tracker.debian.org/tracker/CVE-2021-26928  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                    containerd | CVE-2021-32760   | https://security-tracker.debian.org/tracker/CVE-2021-32760  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2019-14318   | https://security-tracker.debian.org/tracker/CVE-2019-14318  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                        docker | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                        docker | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                        docker | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                        docker | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                        docker | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                        docker | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                        docker | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                        docker | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                        docker | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                        docker | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                        docker | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                        docker | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                    docker-cli | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                    docker-cli | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                    docker-cli | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                    docker-cli | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                    docker-cli | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                    docker-cli | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                    docker-cli | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                    docker-cli | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                    docker-cli | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                    docker-cli | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                    docker-cli | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                    docker-cli | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                    docker-cli | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                    docker-cli | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2021-20496   | https://security-tracker.debian.org/tracker/CVE-2021-20496  
                 docker-engine | CVE-2021-20497   | https://security-tracker.debian.org/tracker/CVE-2021-20497  
                 docker-engine | CVE-2021-20498   | https://security-tracker.debian.org/tracker/CVE-2021-20498  
                 docker-engine | CVE-2021-20499   | https://security-tracker.debian.org/tracker/CVE-2021-20499  
                 docker-engine | CVE-2021-20500   | https://security-tracker.debian.org/tracker/CVE-2021-20500  
                 docker-engine | CVE-2021-20510   | https://security-tracker.debian.org/tracker/CVE-2021-20510  
                 docker-engine | CVE-2021-20511   | https://security-tracker.debian.org/tracker/CVE-2021-20511  
                 docker-engine | CVE-2021-20523   | https://security-tracker.debian.org/tracker/CVE-2021-20523  
                 docker-engine | CVE-2021-20524   | https://security-tracker.debian.org/tracker/CVE-2021-20524  
                 docker-engine | CVE-2021-20533   | https://security-tracker.debian.org/tracker/CVE-2021-20533  
                 docker-engine | CVE-2021-20534   | https://security-tracker.debian.org/tracker/CVE-2021-20534  
                 docker-engine | CVE-2021-20537   | https://security-tracker.debian.org/tracker/CVE-2021-20537  
                 docker-engine | CVE-2021-29699   | https://security-tracker.debian.org/tracker/CVE-2021-29699  
                 docker-engine | CVE-2021-29742   | https://security-tracker.debian.org/tracker/CVE-2021-29742  
                       dovecot | CVE-2016-4983    | https://security-tracker.debian.org/tracker/CVE-2016-4983   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2021-29221   | https://security-tracker.debian.org/tracker/CVE-2021-29221  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                         exiv2 | CVE-2021-3482    | https://security-tracker.debian.org/tracker/CVE-2021-3482   
                      fail2ban | CVE-2021-32749   | https://security-tracker.debian.org/tracker/CVE-2021-32749  
                        ffmpeg | CVE-2021-33815   | https://security-tracker.debian.org/tracker/CVE-2021-33815  
                   flatbuffers | CVE-2020-35864   | https://security-tracker.debian.org/tracker/CVE-2020-35864  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-27645   | https://security-tracker.debian.org/tracker/CVE-2021-27645  
                         glibc | CVE-2021-33574   | https://security-tracker.debian.org/tracker/CVE-2021-33574  
                      gnuchess | CVE-2021-30184   | https://security-tracker.debian.org/tracker/CVE-2021-30184  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2021-34558   | https://security-tracker.debian.org/tracker/CVE-2021-34558  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2001-1323    | https://security-tracker.debian.org/tracker/CVE-2001-1323   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                       libyang | CVE-2021-28902   | https://security-tracker.debian.org/tracker/CVE-2021-28902  
                       libyang | CVE-2021-28903   | https://security-tracker.debian.org/tracker/CVE-2021-28903  
                       libyang | CVE-2021-28904   | https://security-tracker.debian.org/tracker/CVE-2021-28904  
                       libyang | CVE-2021-28905   | https://security-tracker.debian.org/tracker/CVE-2021-28905  
                       libyang | CVE-2021-28906   | https://security-tracker.debian.org/tracker/CVE-2021-28906  
                     lightning | CVE-2020-7747    | https://security-tracker.debian.org/tracker/CVE-2020-7747   
                      linuxptp | CVE-2021-3570    | https://security-tracker.debian.org/tracker/CVE-2021-3570   
                      linuxptp | CVE-2021-3571    | https://security-tracker.debian.org/tracker/CVE-2021-3571   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                       msgpack | CVE-2021-23410   | https://security-tracker.debian.org/tracker/CVE-2021-23410  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
               network-manager | CVE-2005-2410    | https://security-tracker.debian.org/tracker/CVE-2005-2410   
               network-manager | CVE-2015-0272    | https://security-tracker.debian.org/tracker/CVE-2015-0272   
               network-manager | CVE-2020-10754   | https://security-tracker.debian.org/tracker/CVE-2020-10754  
               network-manager | CVE-2021-20297   | https://security-tracker.debian.org/tracker/CVE-2021-20297  
                        nodejs | CVE-2021-22918   | https://security-tracker.debian.org/tracker/CVE-2021-22918  
                        nodejs | CVE-2021-22921   | https://security-tracker.debian.org/tracker/CVE-2021-22921  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2020-14145   | https://security-tracker.debian.org/tracker/CVE-2020-14145  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                       openvpn | CVE-2021-3606    | https://security-tracker.debian.org/tracker/CVE-2021-3606   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                   php-imagick | CVE-2019-11037   | https://security-tracker.debian.org/tracker/CVE-2019-11037  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                         putty | CVE-2021-36367   | https://security-tracker.debian.org/tracker/CVE-2021-36367  
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
           python-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2021-34552   | https://security-tracker.debian.org/tracker/CVE-2021-34552  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-urllib3 | CVE-2021-33503   | https://security-tracker.debian.org/tracker/CVE-2021-33503  
          python3-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
                   python3-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35504   | https://security-tracker.debian.org/tracker/CVE-2020-35504  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2020-35506   | https://security-tracker.debian.org/tracker/CVE-2020-35506  
                          qemu | CVE-2020-35517   | https://security-tracker.debian.org/tracker/CVE-2020-35517  
                          qemu | CVE-2021-20181   | https://security-tracker.debian.org/tracker/CVE-2021-20181  
                          qemu | CVE-2021-20196   | https://security-tracker.debian.org/tracker/CVE-2021-20196  
                          qemu | CVE-2021-20203   | https://security-tracker.debian.org/tracker/CVE-2021-20203  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-20263   | https://security-tracker.debian.org/tracker/CVE-2021-20263  
                          qemu | CVE-2021-3392    | https://security-tracker.debian.org/tracker/CVE-2021-3392   
                          qemu | CVE-2021-3409    | https://security-tracker.debian.org/tracker/CVE-2021-3409   
                          qemu | CVE-2021-3416    | https://security-tracker.debian.org/tracker/CVE-2021-3416   
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                          qpdf | CVE-2021-36978   | https://security-tracker.debian.org/tracker/CVE-2021-36978  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       ripgrep | CVE-2021-3013    | https://security-tracker.debian.org/tracker/CVE-2021-3013   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                         spice | CVE-2021-20201   | https://security-tracker.debian.org/tracker/CVE-2021-20201  
                       systemd | CVE-2021-33910   | https://security-tracker.debian.org/tracker/CVE-2021-33910  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                    tpm2-tools | CVE-2021-3565    | https://security-tracker.debian.org/tracker/CVE-2021-3565   
                   uboot-tools | CVE-2021-27097   | https://security-tracker.debian.org/tracker/CVE-2021-27097  
                   uboot-tools | CVE-2021-27138   | https://security-tracker.debian.org/tracker/CVE-2021-27138  
                          wget | CVE-2021-31879   | https://security-tracker.debian.org/tracker/CVE-2021-31879  
                     wireshark | CVE-2021-22235   | https://security-tracker.debian.org/tracker/CVE-2021-22235  
                       wolfssl | CVE-2021-37155   | https://security-tracker.debian.org/tracker/CVE-2021-37155  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
