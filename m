Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B849C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 06:19:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB76060F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 06:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB76060F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E2360602;
	Tue,  3 Aug 2021 06:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWYeMqEFOOQF; Tue,  3 Aug 2021 06:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 406EB606C8;
	Tue,  3 Aug 2021 06:19:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94D7A1BF35D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 06:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F35F40261
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 06:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEXmzjZtJwtc for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 06:19:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA0644016F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 06:19:08 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8CFCE100005
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 06:19:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Aug 2021 06:19:05 -0000
Message-Id: <20210803061913.6F35F40261@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-02
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

Autobuild statistics for 2021-08-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 455 | 125 | 18  | 598 |
  2021.05.x  | 458 | 111 | 20  | 589 |
    master   | 1694 | 827 | 91  | 2612 |

Classification of failures by reason for master
-----------------------------------------------

                  host-python3 | 86
          refpolicy-2.20210203 | 40
           optee-client-3.13.0 | 37
          libmodsecurity-3.0.5 | 36
openzwave-62444b0f979c337d2... | 34
                 pixman-0.40.0 | 32
                  zeromq-4.3.4 | 29
  gobject-introspection-1.68.0 | 28
                       unknown | 28
                    mpv-0.33.1 | 27
            erlang-jiffy-1.0.6 | 26
                  libogg-1.3.5 | 26
                    qemu-6.0.0 | 23
                     gpsd-3.21 | 21
               capnproto-0.8.0 | 17
                   gconf-3.2.6 | 17
                    mpd-0.22.8 | 17
               nfs-utils-2.5.4 | 17
  system-config-printer-1.5.15 | 17
             libmediaart-1.9.4 | 16
                harfbuzz-2.8.2 | 14
                librsvg-2.50.5 | 14
                   erlang-22.2 | 12
                 mesa3d-21.1.6 | 12
                xenomai-3.0.10 | 12
               libfuse3-3.10.4 | 11
                      gdb-10.1 | 10
                 dc3dd-7.2.641 | 9 
               libgtk2-2.24.33 | 9 
                   libnss-3.68 | 9 
              libostree-2021.3 | 9 
                mono-6.12.0.90 | 9 
                    ffmpeg-4.4 | 8 
                  mupdf-1.18.0 | 8 
                 openmpi-4.0.0 | 8 
                  polkit-0.119 | 8 
              open62541-v1.2.2 | 7 
kvm-unit-tests-kvm-unit-tes... | 6 
              libsecret-0.20.4 | 6 
   openvmtools-10.3.5-10430147 | 6 
                 openal-1.21.1 | 5 
            qt5location-5.15.2 | 5 
                   sdl2-2.0.14 | 5 
                      tar-1.34 | 5 
               apcupsd-3.14.14 | 4 
                   guile-3.0.4 | 4 
                   gvfs-1.44.1 | 4 
                      pdbg-3.3 | 4 
               pulseview-0.4.2 | 4 
                 rtl_433-21.05 | 4 
android-tools-4.2.2+git2013... | 3 
             bluez5_utils-5.60 | 3 
                         glibc | 3 
             host-cairo-1.16.0 | 3 
                 libebml-1.4.2 | 3 
               libtheora-1.1.1 | 3 
                libvips-8.10.6 | 3 
          lua-lunix-20170920-1 | 3 
 Makefile:740: target-finalize | 3 
pistache-f2f5a50fbfb5b8ef6c... | 3 
           python-pybind-2.6.1 | 3 
                qt5base-5.15.2 | 3 
             s390-tools-2.17.0 | 3 
         xlib_libxshmfence-1.3 | 3 
                    zstd-1.5.0 | 3 
                 apitrace-10.0 | 2 
                    bird-2.0.8 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
docker-proxy-55685ba49593e6... | 2 
                       gdb-9.2 | 2 
                 gerbera-1.8.2 | 2 
 glslsandbox-player-2019.08.23 | 2 
                   gssdp-1.3.0 | 2 
             kismet-2021-06-R1 | 2 
               libgtk3-3.24.30 | 2 
                  libodb-2.4.0 | 2 
                 libqmi-1.28.6 | 2 
                  pango-1.48.7 | 2 
                      poke-1.2 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
                      apitrace | 1 
                apparmor-3.0.1 | 1 
azure-iot-sdk-c-LTS_01_2021... | 1 
               belle-sip-4.4.8 | 1 
  binutils-arc-2020.09-release | 1 
                      bmon-4.0 | 1 
                  boost-1.75.0 | 1 
                   bullet-3.09 | 1 
              containerd-1.4.4 | 1 
               curlftpfs-0.9.2 | 1 
            docker-cli-20.10.7 | 1 
                    efl-1.25.1 | 1 
                flannel-0.14.0 | 1 
             fontconfig-2.13.1 | 1 
        host-environment-setup | 1 
               host-llvm-9.0.1 | 1 
              irqbalance-1.7.0 | 1 
libcamera-3a1f67a8031ac5ad9... | 1 
                 libjson-7.6.1 | 1 
                 libvirt-7.4.0 | 1 
                lmbench-3.0-a9 | 1 
                 midori-0.5.11 | 1 
                    ncmpc-0.45 | 1 
                  nginx-1.20.1 | 1 
         nvidia-driver-390.132 | 1 
                 opencv4-4.5.3 | 1 
           oracle-mysql-5.1.73 | 1 
                     php-8.0.9 | 1 
               pipewire-0.3.32 | 1 
                   poco-1.10.1 | 1 
                 python-2.7.18 | 1 
              python-pyqt5-5.7 | 1 
               qt5webkit-5.9.1 | 1 
            resiprocate-1.12.0 | 1 
                 ripgrep-0.8.1 | 1 
                suricata-6.0.3 | 1 
               wireshark-3.4.7 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c370c1621dbcbd250742a5ff5cccbf0d429d61c9 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/02ab0d2abb152b96d11562a4c1ab88096185cb72 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/269fb0d26c0c1577215bf69d69e56592fae8b81a |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9772594cef2932c95d4c4e8695b75dd1389720ad |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/712140f62e698287f5698314a93962d676d88e42 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/1150c4dfc5fd7c0cb2f62b5df515db2441cb9e69 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f7d6ba9136f91a932aa9e33f64aa0613df1b74b3 |     
    m68k     |            apitrace            | TIM | http://autobuild.buildroot.net/results/82c226ce9d3381592e12d25570ee8fa88b9af9a2 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/fc03959b93c14534d1adecefa7d5584d79a9d9aa |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/b0903d585b3cd47dbc9151d190135133c32c41bc |     
    arc      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/7d454fec9036ee9da5f08bba71b6bc166fef502c |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/deae92bb855b7e1323ec80c577e74f7cd5546ad3 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/2880fd17cfc18dfda7a88da425db507b8d435c1f |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/f764da6a7211eab6394562329861d2246bfaa04d |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/180f3f266d92f5b7aaab081885a9f068650a6260 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/8a8b96d166bedddc6a5148f4c1d69a1abbd0d043 |     
   mipsel    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/9f91d530c22cad053d89a7bf54c4567d3012d05e |     
    arc      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/444eaab22b140b26a730c7fdd4bada71a8d6fef2 |     
 powerpc64   |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/80b90e1b6fee99ed7bf4aed87a14311a12469993 |     
  riscv64    |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/d456dae2fb76e824d0e4b0cba6c9d0669bc99bd8 | ORPH
    arm      |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/29cc415772fcc0a2a62036168844b08fbdef9bab |     
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/6e652b09d3d7f188de69bbffcd33245a92736e95 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/54590b6462a149cd3a143f2b537ecf27212025f4 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/562ecd4f253f25c480027c76b858aaeaf0245e8d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/cd03d37f153c1637c40fb172aa4e0de7b7679d91 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1d107cbae00cfbf82b5d15d5f07317f1de0b14bf |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/658fefe3c254e4741626652e54421e9a85c38cba |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d22c2201ee1d1a5687e8aa4b3ad0ba5c77e8af4e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9f8c302590f016c7efacec0cb65eb76c3c723650 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d19d70b6cd03ff51c6893be65a24c0a1395a088d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bb33343e709b8d660e7bf117d8bf6d9b0aea8675 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/60881ec03d1757cc1b8ac8d714e8359dae7dad2a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/accfc53a180096e4bb34bd49c27714f8f7b5d81e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ad3663a7d83a3f6ad1ed6881feccca7145bb5440 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ecb1c115b5350fd8e049bf27a3eab9998a014558 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bda6469cc84487ba19dba7296293608b09df31f5 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/01724b5f4b68ebcd34036136df62001c94112c5a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a93196b1de51c723618b637bf1a3b9113aa1d8db |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2aa2a7f624532158af1002e498078a3c15649aa7 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/35a6911ec88e4fc80f2b4b8505fc33142620e3d0 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7e5dd79b48abde09bf4633b196579da5561f9fa1 |     
  aarch64    |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/76e401938492705bc4b1c5f1631f8726dce46f44 |     
   x86_64    |        curlftpfs-0.9.2         | NOK | http://autobuild.buildroot.net/results/14abea2bda1340400f68c3c0ff053d39d41f3012 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/53b0e60963e9d859690504ece1f925aac86fbaf3 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a1034c6d022a3a71267dcddf7ec0c681cd5400cd | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e200edf495a82f11bce63b2b4f770711333a1a10 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/48291f424724c7d19268f6d3fb13188518523366 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/609e9790c5c0e43bc4f3a0827f36d829676fc267 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2d03e04385598d6a3e1b88e0e783d4c3472d9956 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dade355e53f713ed70a382725f412e964079ae8a | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2a9f5dafa2acef81da994d11eb11d9bb57a21605 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2919e9846724e4e598ad8e30f79d8856792970be | ORPH
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/d22d6c59191e4300de56390ec8cac30627c5844c |     
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/bad9df1184f55dff78e88db4a48628b75b87be7d |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/03f9eb4054286b7c2d833bb8ad4ba202f3785867 |     
  aarch64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/0ff27b1fb6ca86245ef2576a0d96e30c8229a3cd |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/79f7e1c6372829358180392a4a397c1fc7b8ff1d |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/5ad41e586caa8972417ba348efd7d6b56aea880f |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/963cabd31cdd55b6309ca5ca6df5bee541c4413f |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/c429179bd95f7f4ab0e81cbbbcf71e45ea2f2bdc |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/a5779e22c41eb63b8400409f26f96b924fdde1bc |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8a4bc40e6b784dab7b147f7611a51cb42477989f |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/43e94e818fca287680845ff5ee2b2f2ce5a3e187 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/da4d0294dbc6220e94e5c70963ef143605974f3e |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/dbda0edb96b053d9dd6e2eb97a871ed24d11d240 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/976d6cbb30e5264aa9c347a02b0a01fa4cb3946b |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/d5effea38ac22f099b6d8f29806a710a399619b1 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/9096eb687053cce33bd03af0864cf30d0b862254 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/048e26481cc095f233453cb378fe972c61dee1e0 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c07cc6ce5d82bb61b01604662b9154bbdce47710 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/52fefe810ebe1ef1adfbfe08cc6f4b27d2f2f4cb |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/48520980da41fc713c7427ded9e2d536fa1cb1df |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/067895a74f15f61dfa69791945497f2961856461 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/cda8d52f5d90554e5a5b5583285124d8542c0344 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9707660b9a568423b0586d6138729be92e47f7e0 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/eac3f7f139ca86795f68a9ab530e00f90d9bd2bd |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e7872d05af3b54b88e54e45d2d48e6a497c21f0b |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2b6944c42d5178b12540939d867d667bdbe0a5c7 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8b1102c3c900d5221e20a0b09ceef710b9598144 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4e50953c32abe6f0ccee1879f8511dcff4a39793 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3000960f6de1874f56a2e18a85fb25da0535a7ed |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/90275c1798bf8a2b0bc061c11b12f27190c15489 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6703f9ccd39972736a2cd0b58cc4fea1b404c635 |     
    or1k     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5ea99c385abec92cb4b62b7dfcaa956c243f9a15 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e37cbcf5f8fdb6c76ac46f007ebd9fe1022bb5e1 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4f5efee7d79c8d6f218c1b2f79700ba04ae4eb17 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/91c9a19d7e83b5a5a4b175901361da703ecae65c |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/70b0ad3bde72781409729ebdbf1cc41273407d9c |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d73d70189d60974145dd7d329e8e964da21d680c |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/221aae94c50b453c00de3705958cc9913da5ed49 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/81c6cf915ef2852a67584d49d311f4a036700177 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/40780697091bc472501b2b1cb9d58c5fc10fffa0 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ed2aa3adc9e4501cb52fd7e942462b2b0b3af434 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9c31a5234bebc9e7a955f0fe21b9f50b87461f82 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/4f683d66a0e042682b8add2599ce79f3030d9120 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1b43828c6ee9042af19a62a3a8d6ca98ad5a2473 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/37e1c49999c648f5eaf6dbb4fd415fe9da5ab254 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0fc2ec17ec588895dd7e211afb111bb233d0d4cf |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e16714c3ba541775f07d130e8e512ea223ee2ce5 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1ebf80a778ea6cc88fa905efa5821d8eaa6148e2 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a8755494c04e56c3f1907e256acd170963ecd3d7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8378618507fb475eaba95904ab2946bb9fad96a7 |     
    i586     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/dafd74c6ee7279ea5ea1f2b3b7d63b1e21519dba |     
  riscv32    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/3b0428412ce33703a33b6cac6d2ee8e06df33957 | ORPH
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/9f3323dda4639335388afa92d92e62f54db6f790 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/db4732f7965cc239b8e824341dc59ae5a4e092d8 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/872745c711beda7bc3c18a4da97ce0325c577b82 |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/ddd6d877cfafd350a5898580ecb0a30d75de002c |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/bd8dda698adffd761f40373d033d995f12cb19de |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/59f905c9ceb1ea72dc7c47633623db7a06402c57 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/729368ff839c1763e3783857a54b21dc13390971 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/1417af303cd2533bf6e996bdcf747107bf9fd0a3 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5c8ae036012ccb0702b12a0a81d84ee081efed55 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/15168d234df44cc1889f1febbf665429ce34dbc1 |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/52cf020cc38f0d5557f72b45ad6333779836f36c |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/fc5538e6ec608124cfe8590098b73314cc9b41c8 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/f5a7f7a3ebe7bd15c2fe875b6d87e7e6720db902 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5071cce72528a802ee4fef14cc4c51ac99e8b180 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/408afc126c9f2e0de19d275b23ac3e15cd2d41bb |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/7009f240be1c537ef75e98cd8ccd9831c70e51e6 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5ca1026fb93c10e7f1718c1aa6d3c0d5f013d825 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/7cf949b39b216bcdcddb0c8fb994709c087efc83 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/68cc3c1709d360357cec6befe35543ea8d13df98 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d64d55ef27fccfba655e7a45c21a2d17d87dda98 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/10b750e4b2a1f925dd802ffac3e08284c076ed84 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/fbf416a8e4e3fe680b6b60b392394e212eefcf1c | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/5c8bfe8fb6c9cae85572859658638a2693a0cb00 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/075eeec60cefbcf1b16300026eaced8d88e741fc | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/888692750847bcb1a447e7072d1039f567fd5b8e | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/e74ca6874f40bb8996c74d2bc3640d8c946ee23b | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d36fb478dbfa0e19a75eef5c857cd13cfc7ecafc | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/efef942ce4117b7d8c8f4a2246a7e1f5b409b624 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/5543b04ee82e8fc87ad29fddfcfc0cdf5c1f3b89 | ORPH
   mipsel    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/ce3be758268c2819b5de2b4fb18c7ccc3e423c0f |     
   sparc     |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/7e0979deab827f694566038cc0e3bca2943f21d8 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/4b1bb83b3ff7838936acd07a9ae070ab6f40fc61 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/f5f99e066a091e53ab3f615db9b4dce2b0871959 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/0720eabbbe96bc6b79309c60177ba480025fd95a |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/b10bdf77e2250b1f9ca9bd8161fc13cc222da64d |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/cf2a7a37ca2606bc9a451e1f791d461a17174fc3 |     
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b6de8b90e7e1df2d9c553a733d542cb2fb6326f9 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a1d61c26ab8b96bd72f1e4f785ac0a4e82ad7166 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/8765e7f10aa88ff0b40d07843a5b38c9bb8fcf5a | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/0f7cb8469a607f05ba87b79089a7c9f7b8184d51 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/ea195ed0ed0408e03a6cf9ed2a61a27442379809 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/55b62197d93127b1477d1056b79266008ccfbd54 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6d0c5dfd3f97220ec67942155ea0680f75ca9dcf | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/0add29c05f9508585e6826ade55d3864f48b13f3 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2c6f7676b7d8e5ffe10b6d8dc338dc9dd1d22be5 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/28f0c60e8f65e0c4280a26ebd94efe30381e7307 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/1ee538719e8dd0655a549e4dd7a6b5e2b46c82cd | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b3ace97f4e83cbbf847cf6fd56a4028a767fb630 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/be4b6f06bb8f504876920ea12a1ec557c658046f | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/c5207c8591859557a2b7754bc87b030587484b5c | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b38cb5c469b80ab84e219499ca736e30565a039b | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/8fa646dd5e24e599011caae8c4222e8183984dca | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/48b977d7f994eb03afe927119e0fe7c4a4ff5bd5 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/9e7b3207c5dbbe920b8fe2b236f376817be44815 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/025424e4ef5431909b3e30f22f77f70536da995d | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d94968d084c3e2d2249fcf72aea7eda54b52c4c5 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3bcf9b3d6e3c4a32c716513b8b664ac76e0bb555 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/9b836627d495773c00349db6652d76ec430c6995 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/75aeaa8c8b7392466ce0105aa5e37f022608cf2b | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a51a9f811a103831384ad2693561fc384ecda3af | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/bf51c356064a88fe1251f12b568ad2b034c4d15f | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6a8df1f50a183ecc5438a5b05137053ead84191c | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/933b5ff7d1b73b5bb235c7793e5f2ce81c6c9d53 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/0b94c616551ec737ec0c8b3b93326c7502a46c22 | ORPH
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/86f2a997bba87680c43442427f338f4dc07973fc |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/f48a17daa085f3f5ee7b2f117a81c900a8a937e1 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/782a99526988a783c3e61dcfb6ee0eb62dd79647 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c5f1c9c49151be058c27892c48817a45bc0d1b4e |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/5061bf4ca72648d337932858b2fe8df3a2e357da |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/f6ff2e7635bb8f308ae0bbba0536681d9c45d768 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/5a38e23bed4dfef4dd16f10e66f79f89ccb0c70c |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/419f3d3dbddef31fe844c66e378952014acbf5e0 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c04f6749129f98e65253ae48fcb8313b103c2757 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/916abd28d19f21ee1556add692669bf17b74ddb5 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/559127dc83f912f7992cf40317d98635224fe8e3 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/49f4c006ba0031ed75ebcecd39125dd9e1ff8804 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/b4de346f256446edb0873d3d1ae5005832604ec6 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/348dc6e3e550d2b275f3c97e8da05fab03b50747 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/fd3a43924f859c8ef688a71e77d3de9f795ca708 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/cd1ad50d45879b8ac1a8042b07444038da5518ac |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/b028929ee9e7876095a85a9f8669fafb6c41b117 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/d84e03692f243330063ab1273652a3e4fe3f568e |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/2ecd83bb8def55f39638439be9e13701dea47107 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/336b6152d0ab008bbcec2800943df6ba1bf5c59e |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/4ed3a8d5dc4f14e294e38836430d64b10f49b2a4 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/4884f75a3a63124afcaec9601777fea9e5492255 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/6d3fe4a603bad12da7159233df7b3dd9f38b57aa |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/1f2aaab0cdd497b092eab8d091d55ef968f38b36 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/a4ca892b68c5d03de6f854750946000ac4bcfac2 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/7fb984319b2742aea8d9811dec12b57f0e69b878 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/b287a9b6d4221907ba7647c96dba655ba240a17b | ORPH
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ee0c66de90cdbfc7e7c5f1b8d2788470aa50ec72 | ORPH
    arc      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/3ac0660208e07dc4cfcbec3c5c3355707a0a6174 | ORPH
   xtensa    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/02f58616af27e721eca1b179084c8ef7b3d238b7 | ORPH
    i586     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/d8db41ede12e7aa507546f8050da70cd4ec8e3af | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/3c1f8a4708e82dfd13039a7c2ec869b4527c0e19 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2237fb927d4ed347d5f13827eebff2cb571024f2 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/6ea9bd16c997a546ed413b76c71e9222ecb2c994 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/5c296fa079010ff507461e799c1d1b0b421a4c99 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/56245fade9093c214fdedd48ccc8657dc850e4a2 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/47177d06221cb87212d969082e10a85c94ba0062 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/32a4d10b594b04b4d1602df8210b7e72c2bd0069 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/64bc429bc40a6b6ea40228ac21408f198b9c7b1e | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/6797282c466fd837ef09ce1e8eac6fba01e26b50 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2f1db5fc19035736daa07de0a3a0177373b581e7 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/26d6d68b97abc7eebb33c001fe9cf0d6e34da522 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/83b43cc9a848d093c61191c5736becb0c33a7d63 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/b8240b67f0d129da4821181331e09182a3410421 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/65326d579356132b658079123cb703d6cc4c83c2 | ORPH
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/2d9d847d5066ac7a42e2494cb5d3aca6cf017953 |     
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/8b58f4cfc714cec65516b7fa7bda98ba551d03a6 |     
   mipsel    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/2480e4a69b2f93e39acc76a1f2948c4b5539e484 |     
   x86_64    |     host-environment-setup     | NOK | http://autobuild.buildroot.net/results/d326ebd012f5dc15a1c00d3427f47945f5c9121a |     
    arm      |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/8c2557a52eea0b674a6ec54844a0e8ce77e59e0f |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/5deb0e9f2da3c25d38eb30439dfe4c8e50812793 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/17cfab18e1909450f432deb429bb7e920e39b183 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/4927714c312535dc8e10e4d8c6d9d3e74105dfe1 |     
   s390x     |          host-python3          | TIM | http://autobuild.buildroot.net/results/266d50bb56c60ecdbb521f00cc3305418517dba8 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/01604b7611389faa7edb39d64f52b73a9b620edb |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e731c9421dce772d957ef1972dae2dd65d3a6464 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a454da465b638f1ad9a1e274aeb17783b3b2ee31 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a1c849a1bd70558e6d1539c60ade6fc31915ff95 |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/4b09e7bde103d0c433af521c425e489253ca7ff9 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/9fb2a6e5836046eb01deb40b56713837cda82269 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/2b384232b88404d640db967b25963f7f99fa4343 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/d23d1293cb8a0b6c3a42fd491ab302254e44d2ea |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a4e5ede0e925e71ffab0bd98066ac42670f7517f |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7c9c6c9aeb2fb8650538ec50dd6135a100c9d32e |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/73c3d6b389d8f0405419c601d7e41409938b3842 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/448f5f3e7c068aa0bac72e48d3458fbb40a771b1 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/9dd61c1b323593d7eeae939a5c73b6f82fd90e13 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/c378f2c7a8ba5c859ef2042e20c24b3dbb2e50ba |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/ae20ec4fa750ebe6642a87624df30b81f1974778 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1ed91be660f15ad8152d834beb1a04b7c55cd822 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/ceaf30ba0dec3c201833e56ce91de2b73131f49a |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a802a57d336fe1ab8106aca724857ab2b7c02c70 |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/67c5f77b9736adaeb0b32e85b43d9c1758d5731b |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/5cfa730d061bb277c7c92a315bf8ea296980478a |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/24507ce603d8bb2ffec8b945b64f3339a35e15e5 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b476970fb67e0385bdef04e241ad232181066e36 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/6ccdba9b829d345f3a37a11d4e0b9d15c691ab9d |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/eac27bfffffa8a6df17b8f84a4a29f945c63a6e4 |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/20c9cf99773ea4582808111345f30ae23f7d7470 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/52f163b5eb7e04e6fc914c266a73afc4b7538b9e |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6914581e9e133879c7c6291b36c02a47a18c47a9 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c25e8d9bb0e776794a87e062e61395c2269b2356 |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/7b53ec15039d90abffe493fa046e5fe537f22377 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/c0ac3d53fddb297ec77edb965f323975761df7c8 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/abc75b19df79bdba05b352cd97c4842a6f0fa243 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/95b884c76c56472e8b8dba51267244d07ef725cc |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/98e5864f31bf09713566900ca78aa3f408bca8c8 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/0a099702be765a9272eb15ca95c522fa6e3e74aa |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/dfc7426bced6d5b8e2b147529d0d5afc9cd314bd |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/1701ee25944a08dbb30c52b4b0438333149b19dd |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/301eb2d14356ec93241a6acb7e5f41d38a833610 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/33cfb3a4ec0112fb74aaa39df935ae82dfc11716 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c90582eb393fe62893596d3f5b597afa6470517e |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/70c5146717240fe9399a8dae1486502dd27f5ccf |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/d33400e062f55bae02b1f9e2e45cdbcb84e6c47b |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/c50eedcccfd8cad981f8a91683e55dcddbd10071 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c8c861e00f61077776a87287384160e36de54e67 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/2d6e2cf81a5e1e74b00f40985e2bee0573dad284 |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/f22135c3ecd7bb1a4dd217d645676bb0d9092bf5 |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/3116a9f6e4bbaf35142480d4d2ba682e6420eac1 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c4d15d0ff50103d5a7ad2a47ce48e28ab51ee1b5 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/12d15e2bcb2e6568693dfed83e8b69b48eadbc05 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/f673c524d2f9e338a05574a5c7ebd7ad946d6087 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6c4ebe91e1887efb7099051343e82f8811e1a034 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/8b0d3bd44a246a207b6df1e16ad22a0c17907681 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d362027296119fb6cbd820f27688696de0d18c37 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/211f341b27cfc4fbb7c0b5023f8532a148b57788 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/be4ba98a00dcd91560f7ce0ca751c33e8b69c1df |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e370db2bbd0ebd4d42935e67e555091e7b7a9561 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/91a148753264e8ca1c46561a3a27c5e8cc909cea |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/479f1720df1024c9a447a101fcb5f445ea32c65c |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4b09c2d6d346639cda789bdc46b8b0891e7f1b19 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/5abd37f9e77eb5b61703642e2de74f9aefde9f6c |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ccea0bfbcc1e00ae78d92599ea16175a951f68ab |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/b07b64df8f56f3b3aa958e12a5eb40b57043fd6f |     
   s390x     |          host-python3          | TIM | http://autobuild.buildroot.net/results/44082aaafdd515fd14203df0bf60666e88c4902f |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f20eb3a4f4e109955ed5e3cf992429a6946d20d3 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/790d468ff562e039b27fe44d92754d9ec12794a4 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d4847f1659ae3a19fee053449bae640ab18774be |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f03fd965cf7da9cdc1f0f32bf739f4e43d7e317c |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/f81afacdd48b3f9bcf03fc2d1ea600d04334531b |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/5f303ffa64c602ed16cba9a5d7358a2869a641a1 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/d4960d05554888172eea73e4d62d55a445721935 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/5b06f561b3eea96d7ca71181eb4936d7d28c3c61 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4bc414b286d7e130c6c2dbe826f688b884510767 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4acf2a7e4e410a8a107b04f8619a66379f946ebb |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/3fefc7fe9806f916e23f8cb4d6a9f2eff3c0eb63 |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a532431d3639704d61a6234e4832719202e23fb7 |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/957cc8f14c371fd27c448c7a23e420e8201c0fdc |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/ae6c4ab292589a4e4442dfb0a1286349a9bf4d29 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6eb2d3ed501c323e260293d6dd8b5ce3b3509caa |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/f7e13fa0ae397feb2748b5302bd79e9a28ee9d9e |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/35f25c6ba84c4d6e2354bba61a88f31d7f733fcd |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d8658425cac234d0c5d98de6c362f1701b4b2aeb |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ffe3dcfec66a242190c20c6873b6fad8e96ab687 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/031bbb1ac04fdae29893997389b5a12b5b3d57b7 |     
  riscv64    |        irqbalance-1.7.0        | NOK | http://autobuild.buildroot.net/results/0bb0d427bd40f671e9f1f038821635e2357f7aed |     
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/a9ed7e9d89de9fadec94920b6f6624047f305bb0 | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/5c209253d9b598f23632a997884fe34e6fd3f98c | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/95a22f6800c341b0fac22e8809225d3453c73f8d |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/1af2386528e25299c9e7b7a708d8e3322895d8d0 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/583496c09c04edce73d333a24ee38358c2f81cdb |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a1c0e168734024f946fb59935169f294bcc799b3 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2cbd9b7ce3d7ca169164bd1b642fbd7c2dc2c6a3 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/0b3641777fd05b36f3e8eefa2628dd7ff61290c1 |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/bf33b5086ebf5435c7de006035e95d3a630b6093 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/bdea40bc7fcabf5bf80643582b6ef468ce001259 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/9828927454b125394829be8db6ef115507c278c4 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e55e1f2cf4205548f1922f837d24a205ec7bef43 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/34f1da4f6b67927fa8970b843bfdfbaa020dc305 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5c538ec995f39f2c370970491d2f117fc15e1b65 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/1eb48867233d8c275106d014cce4abc86832b756 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/d23e49851155feffee3958f8b4cdb89d9fa8ea01 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/22269f9c7d1fee9c946c3da7291bcbebb6ad6d1b |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/6ba83fb53a7dae876d8d0238f12c04af20039994 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/941259aced1eafdfa2033f92b02e352b507fafd8 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/478922d6f0033f2a5d149b777d56eeffaeb67e7f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/6619fed602dc3530ed3f10142408692ba5d45a78 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/b827aa6bc279522800c3355e3832d59886382d7d |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/c3868ce9077c43b50a2b7e0741f600fc9f261f9f |     
    arm      |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/343e167f73b316a145d178e8d07f4097ca8a9293 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/f75dc5f2a8c79fea5508c38ba7786c23a3d657d1 |     
 powerpc64   |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/31730adddc04669dd9c168e38ed6f6109114beef |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/99b1d5cf51529538ccdc7c6c57a11d5731d539e7 |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/56982206d8da61af946ffe5d8b36e5a3ff9eb81a |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/fc52d17f73bfedfb4b96d284b125d74802c21d77 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/f2bc09440d563e6bac060b34abd4c143380600a5 |     
   nios2     |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/b60f0752e4468a937fa57b38e1872306f84b20fc |     
   nios2     |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/465c775fc2255afba901964f2ba1f2fc1a8faeed |     
  riscv64    |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/79eb8c51098b3e2254e9274be5d2bd9688ab8a91 |     
   nios2     |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/6834a1bfe63c1c4543c36ba288ed9e52ec6df097 |     
    arm      |         libjson-7.6.1          | NOK | http://autobuild.buildroot.net/results/10bf8ac1818c9e52306f18c89ddea71a8b911396 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b82b626589b785bebd3125b7ced75314e28d697a |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/dbfea52766e2e4f24741e294d4237ebd2b102489 |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/dd45f5501b28955183bb4baea6eafe8732d4d8de |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/f11710256f3ffdea1708090d1c68b443b32ee905 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/68c1ba9842b49bd54fb91e4691810a1b3c07f488 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b842851a39ffc513e43b39a20bffd46328614de5 |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/ed505f5676b8950b1370d83b13b4c32ee0670913 |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/3fb0f5e9a513f70efd30b28517591236bcb49008 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/fde3a1da894c244a81905af09eec3885be8d2221 |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/e754a6da936a1de02226bc79bf721c06a2e6cf8a |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b07c0bfdeb5cbd3a36dce76d69da5043c0e3f5d9 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/e2cf836ecbea88a08396e86e0ec627a1703677b2 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/f7d3d3b2480f8f8252b6e516387a07fee3dcebdb |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/cb27acc6f383f2065d24ef7b7bf369ec3c9d66de |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/14e4edafd9f0d8d22dfdcbfce863c9b88763037a |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/931d32e6f36ac534deee93f907b45b04c0955ff0 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c86d3dd5049b2403e1d8e12a053428d962262443 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/967fb0e861d4c04184cbda47aa88d84e2f3fd783 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/76c0efd40eb143af60ac85810bf470a888b5a51d |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ab6e3aeee993a29741e76523159e94d572c1bd4b |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0d12b648126422d21759346656b0476355d5662b |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cd67fb9080f11c4a4c52163461cca48544396b91 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4c61c716d54a4d5ba8791c56a395f1fac4a2fd22 |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/76018d15181f6cf0cdd327d7925c9129dbee111a |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ac7e0d78751ebb8970fb66564cd2b78723eb3446 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/70865791c49c48468a928bfcc8f8a40c5362671d |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/47753d45784c066a1c8ebe981d24a40b7ec1f076 |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6390288e211ff3a88d8ae8686bb515ba1e45703a |     
   s390x     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4d118159ac9e00decfb2c41c2ba7aced1d95c899 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cd6b86a562466d9a8a1a6f78ae92d90bea0aae9a |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ecdfaa110c02ac6502f6200fd92883e5f7258ef1 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/63a5ac0c4da6a391766d89b0726fe0a7be49b9bb |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8589156f63dc989e6f5380e83f2e2887ef49283f |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/73d2d89181b2338a39036bf91751e7ddbdb3b94c |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a0d854945514c2f3d6042f3cf97e6930ea0bdae4 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cf887426f3470ce40f87a16e90c25143f9095eca |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4172456bcd331e5bba5c45ddf11a3bdd6da26a2b |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8da8f9c1851a4bf69ac84923254c3a64d2a6f859 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/31a6386c106a4f5bc3ca263db7f22448c35077e0 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/015d700322cec197f0a3b1a278355e200c46378c |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/edce8bdfee391ae04331ff5af89e2b653b0172cd |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/40bcceb9fe1d99bcdc80d0c4b4281f2f7a9657b4 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/570152985a77089ccc90097c4a02bc48dae6afb9 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a45d2b46ae1788b708cbc3d4c8c8a8a66ef0f47d |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/479c90f5c61beae19bee1f593a828c2ba4a5ed77 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/dd9f0e00394d0a69d52bb65aeb41a05f297137d3 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c9dd5e8d444ac717758b589e8cdb2f4552d68687 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7d647f479ac6615daf23ea836bf303f9c60bfcd2 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d25caa29469008742632245fb7d338d62607de60 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f300c3e001358fe8f1cff254eda6e50688eec615 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/384836dceacf171c3831b1d3633dc84efdfbcd64 |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8455cff1c6506038dffdf18eb13b62e7160ea3d6 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/24863e1d25d85c370012035850bc8d5e6b83d624 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/a9ea1302547b2f907c19759806cd7d0bf99a9a96 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/e490aa3c4bd6aed0dfb1379e396da61b87a7067b |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/405aeb6fd4edec6fb70e8b7292887cf7a627e963 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/fc10a6196a7d85077904fd051734ca306b8bf586 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b315beed20928a2d6c42ae3195754189cca814f3 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/39227c44aae6fe19eecf43bfd82245d08c58f8a4 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/7c2ea82a7e99115f896aecfe9b7ab590b2606729 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/70b6c4d75264e4a54c7548f806bcd1a1e82cda96 |     
    arm      |          libodb-2.4.0          | NOK | http://autobuild.buildroot.net/results/f014a8286ff3530fe3358cc941881c06be1b0836 | ORPH
    arm      |          libodb-2.4.0          | NOK | http://autobuild.buildroot.net/results/be0c0a5789540deb6b9f5577fb526cb6798e94fb | ORPH
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/12e84ac659329ac06e53d26bc2658673c28b1c54 |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/12b74523f15c32f2e7150807dcbd7178c0a0c058 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/74725c874ffc3f44cff433414cec0bb71a32501c |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ddffa57e32d6984c31c31b83d8c345eaa0747677 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8f4c639759161d9d5cdc66d79df25d24bea8bd9c |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e14ad5f5e1ff4063f888c67d6ac798e061fb1ac2 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a40b2f9b3b7673b2cbc087ae4853a557c3c71b35 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/61b1847a6fa9c93fa4ac6a6b83d6d75058c175f7 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e85d2db512eb26073485e75440c37a4af995164c |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/bd8405cf1722403bf36606ff7bb36e3fb1506ebf |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d3737a452232d1e008bc84e5e0553223b0cb4110 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7f82cf8dc65b8c2b15f7f0d558abefbb337a6c00 |     
powerpc64le  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9e6f8b2806e8f2bccaf6e4c52a4f760627344117 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/2167e478307561365c43d82756f7f414fa84e0c4 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d746b03e6dedadac83ccf0724a1b991d54756a4e |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7560d35915ed78aac6c4b22685a4195e96f7c207 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4669226bfed6861977005fb7e7147eae6d99da80 |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f3b4bdf3ef7d2aa0a106bee6fb39a3782d52050e |     
    mips     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6c89544a756017e99ebc1e6150ce3c1aaab78727 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b05c1ac1f07f7d3f80422ba962842cac2d1142d6 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/fcf198bfa2bfd9ea03ca78658b76036bae171a5c |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/2bd500706b5f65863ee0fb07db04ee3dcf51317c |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/71968ad8eb7bc4f134c9848845e28cc0dbb20ebb |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d2031deca2831e0ed40936196b04c709dee216ee |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6d0b94b5cf106b4593923c5467d2e784588bbcc2 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e4aa746929e88d1edc12b6f17cb5c8a136e078a8 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/b4e2e58873135d6751f359741074a00fd144fdd3 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/385b947edb94e1dc543912c7748cbb7684a024e8 |     
  sparc64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/1dcb54093c8e3af76f0e08dcb2a8d7ddea3251f8 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/51a54c28e159dd6a13b090195bf86b803d285f17 |     
   nios2     |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/5d38cee930fc6b4d15ba7565c7ea0edb4fb1cf4a |     
powerpc64le  |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/57a79135620628cdbeaadf13415c7af1950b9cd7 |     
    arm      |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/0942e41647172e25f588eff606de48a939e0c3e0 |     
powerpc64le  |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/e24ef029b45045741eb33a3bacc99ae057aae4aa |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/979c6f7c769e64aeed28bf84a1ad3c6de2aa0620 |     
powerpc64le  |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/a09f9f7a0a339f033f6c432d9c65a7331a301062 |     
powerpc64le  |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/723c85f0d45d35a5bde6f1b6d47f96eb46b81268 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/58d170c86eccebc8db39616af35545e4006133b4 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/c41e849cdf82b095f1ec0eb00ba84decd4bb39dc |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/8d641310c52942568ed42002c5aacb1a100075e2 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/fa5712e8f64464ed84c73be5a30efc4e3c931fcd |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/2ffa7e56b56ba9cd5cd50dd9aae4cc3b6f23f626 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/3ab1d09718247bb64b7999a8db240aaf4f71c0f8 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/44ba3fd69f95ebf387ad63c0d9df8bfd4a55bf4b |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/b2814788847b8007a72284b3870823f083efef87 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f010f6b6bf58b107fa18a7106fda37494123f0e8 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/d4dd22638afce00944086c61cd5586acb9b50a85 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/85ceb1ae12fa02c9873c1b047872de7ccca376dd |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/d5cf273edfb1a5cb4be47f7c16ea42d3de4722ac |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/945bb65b0b350ca535ccc109c2c98fdbe35a1530 |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/5eba81e8f529dba26d020d46472fa34b71dc9ac6 |     
   mipsel    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/ac61592b6bb2b64a4f8ebd10d14e9da177cbe751 | ORPH
  riscv64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/3e733f0bc530e5d8404b75e586f3ccd72e9cc142 | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/992d496f0c1c14c58899e7c1d30aff2d9d012c57 | ORPH
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/30c9f48a28e89916e03bde59349462c44fd36ef6 | ORPH
powerpc64le  |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/3988e239f241075876ce515a7b47a62a320ba5c3 | ORPH
  riscv64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/55035b00be74b9182f58fd180ebb5ebd2b54532c | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/554a2472dee4a8d487857cf684b79fb61166e5a6 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/da51c1cc6d5477e3c4ea6fa74818168d1c6ad607 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c0448b2635b77bd054231aabcd4845957d1cc6de | ORPH
  riscv64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/9c023c37a6cbc045f1e00866ecf1496efd4c51d8 |     
   nios2     |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/336957d65cea82f917da4a6fdaa5c6aefa206f32 |     
   mipsel    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/12e5e686248e471899cd0746698c04b161609f3e |     
   x86_64    |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/9729a50595c5d9ccf13dc71b7367bba9ec6408d2 |     
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/37b1d82af087fabfdaa3b4180fdf03add4969f31 | ORPH
   s390x     |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/59602fa952002c7b54a4dcfbc635939089e1883b |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/24f795fe9a87ee2a8e71fa229e96c6b6d2392152 |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/001bc339071b74eb5e772b6706c8c265dc55390c |     
   nios2     | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/c93e21fdbdecdeaa394538e441ff2a8db77b40ae |     
   x86_64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/d4033124f41c783f5d7b4e28107741d7c4464f94 |     
    arm      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/ed2a5c83fc925ca7c2d0a1e7cde67bb0e38231aa |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/abe105db4551975a4eb946ab28762e8f4a581a9e |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/dd236454252444e012a2516ef9b540975af5f293 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/f0a0439fd2fdd6598df86726be80917b84ebb21a |     
   x86_64    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/fe37d419348c04282e9394bbfa97ba54cee6c374 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/696d55016f36f16e69af2d9a478240399bcf1f07 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/3e0fc6ad62a9525cf7763f28f7698ab729f1b6a7 |     
    sh4      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/7c74893e8bcf27a10e44df9c0a0a86523bb0d181 |     
    sh4      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/3445f2383b4b309f424bdd86d27b913f56090cf7 |     
 powerpc64   |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/378f212e8a37bd5a00b007c059775100e4b4ede8 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/16538cf0ee80a836f9a2819d5dfc5411ed8034d6 |     
  powerpc    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/d2b349af69a8c5c8e83aedf568056a15a1472df1 |     
   mipsel    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/37f5d532910bc3f95f98cc6cc3fd7c37f2d18b59 |     
  mips64el   |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/be1915b7ce3b71022d2a6a05d268367bb3a07cc0 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/921325986ea69e84fefa35a0b54767fb4d0b04fe |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/31416abf84b0b052eb5835ffaab93a589dfa589e |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/638511b3fc9eb9fe4009fb63d95b359b7295c4df |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/74c47196f1b188b031fdcf3cf0029a55fb481f3a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f40c6f0c7c90d2936a61153b3c7c420d468596e3 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4d0df625cf13751cc6e081ff927b82772332e013 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/39350977a999e464b747826a520d983bd2f014af |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/62fa0fe9e41a0e0b593bca486e3002b3a9b0f71e |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9a6c14ea9075158ee594717b848248b0e1fd782a |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/833848408bf9f33b5dd3c1698911e5a1c2ac790e |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/2784a5fae4d16913681cbeffe27319431702d4b1 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/05b092429431e58898340ef91e506d55808aed18 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/98a4bbbdffaa72338f4bb755f0a2bb9f563c3b50 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/412d4cb779f8ca802339597ab958dd37836ad10f |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/f198b57808db7ef6c39b39e2926d6f7a54495325 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/c71e2f3f42c9679f06735f0fc9f5bd57917d4500 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/3416d901ca4ff5b297ddebd4735ad22032496409 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/52243340d35d976aca82989dd7b27802614c21db |     
   xtensa    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/b2271cafc3a05f06daf91f01a4051202a6451db5 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/75b6a84584bd9c544c81de7d7aa43ea91fb489ec |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/464ebd8598462cb80187bc72804109d361cb6b35 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/aff9a4b9b3c99511dbd2501b81dad05689bc7eff |     
    arc      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/cce93da6bbdba99818ff2e6055d1b42817348db7 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/cbd34399d3d8cc1d1b9c247477fb549c6ad6effb |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/12539e596d2416411dae5053f82e56b8360e9fa4 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/a200dedbb99b797f984927d33269483b91af8658 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6063370dd36c9bda2c912cfc7fc452ae88eb9ad5 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/980da95373fff81f043bf4e823e269d529ae4d24 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/24becf1464f3dcf56c9d4e423c77ef4b4e5fbe60 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/561c9ecdda3bfb5142cd8c79a1d4e440ba160424 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ef3d3670b0a83b4885c5e8544f791f1b417a16ca |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/77852de9c16c78fd338804689b984f4fd813b8b6 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e957013eac6836fb01cb469005f52ba123eb10e7 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8f2ef2ed0614b4c52bb9672dc809829fe36b7582 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c1f52d8b1c5d36986b9b1688153c651bcdc0acb5 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6665afbb7363f4d629d0111ff5890d7758aa5c81 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/88506bb8d3299ecfbf60b5949fc5623b7bab53a7 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0e4ee951589982f0d9fb8263bb3f56c7f2899152 |     
  riscv32    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f0647d0a4e0ee4df813f6da3d985920b1b6fff57 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f41036e4579ba903990bee9de1c43a5dd5d1bcc2 |     
    or1k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/aa172d1247d905903982de9837394d87fece3001 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2cf3f3a739147748a6bead99ff267cfe8b31bc5c |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d53eb7bacc423b7e3eacb011c2f0b9f20bee1cc4 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4599f22190367bd869f5326ff0901e705ba77f4f |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a9fb9316a886aadfcc866e4a172075a0ca71c3fd |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a86ca03b3e9b67beeea36dd51f38069f8e8b7d97 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1ee0d6aa65916a0b06e6e3f4faaf668f2cf42923 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1dc95173d3a69bf2a477072f07f9c78b584e01b0 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b1a230a2062abb05fa64d2301212c5493c069544 |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/de927fe680f4a299e177d499252fcd11bd123bdd |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/019bd393236fe3a5c7068aa69bdcdbc8d8ea8b5c |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e0f9ea8429e9be74491ba312cba79bb5455f4a6e |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c5f33f4e1e4db69d5f6bd81f13d5f0c4f208ccc1 |     
   mipsel    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/909513dc9ce2def4879cfcf750c4a234af6cd578 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/c5a0f48981bf9c0929beb11b03e6c57fdac92f48 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/9b2919197a7a8f895abd5603e25b8aae9a9e7549 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/ab976e96588ac77389dffb8b4aa0031bdf1064e6 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/53370244c0d7d75fe1fff6ebaf47a3cd81bf5972 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/1d1e4a9a1f3fc18915951d44ceba46f8e90e7846 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/c7a4478c7b0ea5593de02c84f82a8020d0f5f257 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/d484e361598eee65db0cfb9859359fcea991fcff |     
   mipsel    |           ncmpc-0.45           | NOK | http://autobuild.buildroot.net/results/adeb725392723c8178d15d2185089c94d13e7def |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/afce255d289e3602aec2027e36dafdcc059dd5d5 |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/2f5b40463fecbae69048007a26a1966b3832a492 |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/8021ca8650f01be53e97101e51d244664b0e6439 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/a3802a1ce07f24a7bde9c31ebb5682cdcbca78e3 |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/1a378769699f3aaf50d2a5e074f65158ce30cc71 |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/3ed2764f1f77cc58748868fae8f7f5a93646391d |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/7e928965fcf030a0c0f594958f17f244e7f76a6b |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/db29fd9a89a52e148b1f58e9665ade738c6f9c2d |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/700f04226d12c288764bc6339188f14ccc16fe22 |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/a68f630345df9ab138b513bc35f2a3219f500508 |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/1c1032c73163abe9ab0620a4e186bc6d2e7ce52a |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/46ae692647b99d440d7831463820ee87c1b42811 |     
   sparc     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/9ac6d7691b6ac798f3488b80593777155a4199bf |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/7e4e608c75506216873fbc285714ef76b1ea5c6b |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/aad5735a78eb26c57aee8928d26325893da9c5a8 |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/01c65c14e441a33dcbaa03425ef7100bd7709e79 |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/7a4014614e4c707d4b06862abba6fccaa132345b |     
    m68k     |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/4a70915552f5afe964d5cdea83dda819ef466bc9 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/c7317798e28b8a9de2fd6dd3df31a474b4242986 |     
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/883e12ff5fac4e4c0ccb1db2372963d2a5e1baaf | ORPH
  sparc64    |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/f0187b3f2d62e955fddeef4e90f84ba4fd642bd2 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/b4bc3df6a04228dace7f3f8724ce8b7bebb30296 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/911811de81d8abb2a31feb8f27af1592641c6fbc | ORPH
  sparc64    |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/d2c46664c432c8e6bc4525e3adbd55077f02bb62 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/4aa81b88ec34727bcd27e0d337001fec086e345b | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/0422c353aa567be45b44b8c684406b06985b908b | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/0d05c673fbf08be3c664a6bec5f7c1ccfcdc1d17 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/52df27ffc9f6a7dafab9d00fedc706621e536db2 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/5b8be965589d4d8effe759beb9914e11eaebd5af |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/24758cc3fe69bb1cbc6944cbc8c02c43fc3d5820 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/1a95b1230b63fb210bbcd20931844a458710f641 |     
    arc      |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/fec8728a7b4ead5516cf604f4e6cfdbf7cbbdb69 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e11c5b51df96289319f0f23bd59dc1ad19584d67 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/87353390194b4db781c1c0c225c546f2e4ca9d25 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/539213fb79401a93383c35e14d5b2b16876b9a74 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/a499639c93eea06e34e0427f2794803de3e26232 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/24408cf328f416c438475823df3cf3da12ca896d | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/ef06903b30dc531b669dbec54813f113fcb8c192 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/6d89944629532ae2b3e921ce27b6aff63cdd1145 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/75a8f03b1d6bef318dc35505e9e100f067f6115c | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b4b04e9bde815d798e03894ab757597612aba5f1 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/dabfc8cd641c2b366fd5aa413d8d692ba23ce223 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/090198b53cc54662c73ad321791d879a982c06f7 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6605395d3d9cdb363056777d6f5ce225383997d8 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/04fa91f1888a2eb2109a97880fd313cb99152c1d |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8e6d55650d727beb439401de52f990256eec0f7d |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/156e030279b2986bbb6fcab934924cc97a29787b |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/83ddf32261b6a5df99a46801c84adc3eee420361 |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/df126fe190ee607f401c60342be5aa57ffdc56f5 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/2664eb8f7eed9f9a0701a41bedd81ff2f43430dc |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/e36c3a1fa64994aca59e2e39a8dd4e401ed5f87d |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/e5761640317695e60be96b0b92d4cd7490bad8d9 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/a88b196f0f08f77668ee8c9f9146514d4c50e0c1 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/f8ad9e104fdd3ee414ff73a688ab142d5ee7b887 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/f49c7cc869ce067bf4a90afa7f3b2a4f962ebbaf |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/e51243393364339934ce0db23e4381db966618c2 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/ae83ddeef1a61beaea63ce6fecb80f91b0a84633 |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/90d8b48c2659378fcf2ddf282cecf641fa0f1dd3 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/35f938bbba12eb198ce7623aa4245118ba1177ab |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/c40df888fd7ba92a86c19a02a3129519ad1b306f |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/e55882619c982a8d473f3eafa87be538da4b7c78 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/47312e2760201497dc3b09e3fa1b0e20e9cda1a9 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/0200b9ee41f6bf9d36af85379ab4c42312291f05 |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/ecee7d49e506fa2894b8a9628e2b809910bfbc15 |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/0f39ff5e085470749d2d77db165b9a463e300e3d |     
    or1k     | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/e217dcc9b45d490726f95d808a2a4025e6358e2a |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/30eae1928829834dcf9a68e59851cd2a78004d02 |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/c233c7ed870a27fd9a2b0741dc28d15ac1040238 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/a6fa8371510bfe428726f4ba23f2675516fbdb76 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/4e5277ad5fe35272984c9b4f7657174886aa5342 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/9a036c2be9d5fc61eb42f16a578f9df923ba7e05 |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/f0b463ed81d7b5be4b26f771eccbd250c097bb24 |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/a757867c0383cf5dcdc9946b2850da9644258c48 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/c377f875d290c987c858980b924022c546fa4d46 |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/4c2fdfdff04db4be2f7429099015721e377aa9ed |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/b5338fdb459f1a59ec642ec3d85c028efab6c77a |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/c3892b0576a3d08f4a28253a7dc8a01b5034bab5 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/db40b5f720839cf3f78143d665978fca299e2ac3 |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/161f53574697016ab8bdb91aaaf4a2be5410ebb0 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/45fad82f42f2b2dd6e336d75f423a1230b451e28 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/35e28342d88389e212a6933bc937afbb17054307 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/8a4449dbfc95d0169d1af284e7cccdfe2fec7746 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/903d89ec47475af29297d7f8dfafc4be8bedb2b2 |     
  riscv64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/57c9e4875904d5fc35531f37613a3730086d1c0c |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/5c9ef1c462cddc2c1d3198738a4580b99e09f8ae |     
   mipsel    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/a1f7134ec8a0a5f936995d04fc66636b09654785 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/2b6c06a82c799e26aff2f0baf903416efafec7b5 |     
   xtensa    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/aab2c8ae38c505cb9cf0b88131b38fedc2b3f8f0 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/038cfa6756eb6318e881803279c02d18cc472c2b |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/169cf630866cb84d711d68877bb83c897e1d2814 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/bd270a6793df499d5f52959e3de17f8a92d88305 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/db5ba7f4c4efa596d1646fb86100ef3a3bd3b059 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/f832dd442ec489d0d53504f0ac9ff01c4fdbe703 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6198ad4d95d4361182398a81e59e1193bd3b65e8 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/ff5e181dea86cbf7a7b8e600f03874809d27c0a4 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/26c135d7030c86da700940d6d4a2ada3ad0c049f |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/7169b92cbd572c7c756d3a17e88e597a875d67e6 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/ff00bd4526db640c307975f80ef7a88c51e65e3d |     
   mipsel    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/79bf60cbbec79eab1e851aaca65eb9307ff6b3cd |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/e973efed537c51cb945e27f05ecb1a39ae65614a |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4c1d4ab12e0e6b7e79997a444d672e6b25de9fb0 |     
  riscv64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/120f7f99a9e921c034c0214eb5d3098636cce0bd |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/2c96fb61b8578fe9ce01ac1bdb7858f00f648912 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/f3e1952ebff1a14438fd7c68299ada07e291d66d |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/32e2f9d4048bb5e7ce3f2a94dbbe477f0e21f990 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/834790b3e289e3fe1125e58435fd86016741ff2b |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/cd2573525794738dbc04f25ebf4706938a8d78ed |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/0dd10aa867db66d74165af37d5c91295e5b04360 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/7be700d5c0143eb19f28fb325a3b8bb0f81b2380 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/538d5629118e4845e1cec15a2bfb92bdad65510f |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/82e29587af0e644a9e237c1e50b244b61cf81294 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/e29b2f84106dc2c265222e774d48e3cec561899d |     
   x86_64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/3e04ca8c3fc43f2ba732c57182f88e69f3fc3d28 |     
   xtensa    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6b6497795427d63881e743aa44f900a19e5a3f66 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/818f1706bf35342d1430e356e00ef12da94ef63c |     
  riscv64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/11c0c82c341840dc3ec8a13fac88357294c0a67d |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/ca39ab1a56c7b0a8be11bd4cb6dfe569c2af62ea |     
   xtensa    |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/d395e57d3db4503e58f157e024c02be6e541c9a5 | ORPH
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/d70daffe2ee0e8ae505b5a59b94dc377ec64fca0 | ORPH
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/8c484217bdd8dbfae6c81482e21e55807af74033 | ORPH
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/457b88c4ba85edb42b3a36cce48bf90712f590bf |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/bc8671e68331895b947643ac9e805b81a5a76fe8 |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/53967d0090aac4691cdce9e538957de87cf5bb85 |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/5521aeba181782de83b244826f102d7e881847ff |     
    arm      |           php-8.0.9            | NOK | http://autobuild.buildroot.net/results/d9ef9aa9425e3c9e4f03b65130fcef18bd3f1888 |     
  aarch64    |        pipewire-0.3.32         | NOK | http://autobuild.buildroot.net/results/e3bc1d9aa69af1d2cdeee7709df318fccbaa5476 |     
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/15a4d5dc8edb59f87ba7b846c1824c8c9f060480 | ORPH
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/c3036b5662e250d8c367ad141f825f049ba91687 | ORPH
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/c57e994128731215c0712a6b8192b4befa6d90b6 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/666b263f8ca506b3b4e4861cce4aa0c4852a5f17 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/faafca6a8af3e9b63ddc5cd0baeb89aa46b1bee9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e4ea3b6bcd2138d96830cd0a35f0a467c0f1eb2e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/51c5bbb6bcb8e38f5e8f8ed55b35197fd4710462 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5f9872981284f45d23b45b6dc442556320bb4aa2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/edc1af81762510006ec7e1a6ba8c18eb7c6251ca |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0d319e93d10a30072a38d4714eb11f75ed10575c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ce05bd318b1f50f2c631e103f19f7357c8ec8ab4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/44c49b32e63dd5a28ab3942a9ea481ae435658ee |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/914398e6ab0c3603b2f6d02a133d5dc3c1d24cb6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6b9f76d4486343cc08d1455d37d2209d14b52053 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1307ad5bbb6d0d97d3fce03ca3addd4354e0259a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ca5b0355d6fe43053f53b8fd41a49e8e036257f7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e3fdf832d343017635e0e8a5dcc69e4b098cd130 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7b5c6712542a0d7fcb67023d5f75dbd386527ce7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d34291e394d6f0d319563b8940fcb3e30a17e452 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fc419ccf42e91698f925db45b58f562a9ad116dd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/89fd64e679c5bfb6fbe133ce4a1fa49efa4f2a37 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5e91e9bced26f49c05b9fc34423ba6afa7869957 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5612025113be1fabdf204bd0980a4beabf7d44cd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0e561e446eac7c0baff2b310136dd6c397b2b06c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e31f6f074c134cfc45874d558ebf8fad06ca63f6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/15af17b23a68010a0e6a3637b891b8bb386c6681 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3f723b61cec9d4055b508c89a439058e6317407c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/161249067e6314468b9a23b864a9e8c04e2e0b3e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/714ee4aa237a56b3b8102a75725fbd3d5502f9e9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/717447554464a715e1bbfb76bfc4b63a281856fc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6df0c5e1d75c2db93e5554a3253bda873a22b5ee |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ed6f2466f72402c77b5e0b36f85846a309081bf1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e1590a98dbe3bfff825a33229b46e346d5c546aa |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3a2cd1fc3a10294b352a8b18e4970c0c07532545 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2698b8243ea285dec7376dfdd5d9273871715813 |     
    arm      |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/812ce301df099a932bb6d768a99b1d19a6226efc |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/47ab9a2baa349b63c98d28504fef60300ba7374c |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/3859a08b109d4d69c0f14f8c7113218a10d8e818 |     
 powerpc64   |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/02e299a01a69302ce3ae7adb8f88d9e026981487 |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/80ddc5bbc58eea288ccbf3da9cfdc6043f63d5ba |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/7e1d9e14c89c6ddec235493f51c16aaf3aa82a6f |     
    arm      |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/23dbab6066450ca1fd67b4ccb83b64802a3851cc |     
   mipsel    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/3817b3dbd58f6ae70a7a6905386c44e91a4ee863 |     
   mipsel    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/de3636e8eb357ee6420c75c24df9d37800eeeac8 |     
  riscv64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/c48e5b967b5e903ab059f2e80943ca0a2ad293eb |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/47dc0ad9803d96f66e27b48b606da1d0d4910e5e |     
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/5302fa7a844c06eb30f10b01f84be9fa3dc4aee8 |     
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/2c0dae82d79c622aa10d0f3cacfc02fcf1e3fe8c |     
    sh4      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/55c1c1a98ce62195fd1a2dd34a7312737a4a990e |     
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/54013f75cee45312234928296bf5381b8dac411f |     
    arm      |         python-2.7.18          | NOK | http://autobuild.buildroot.net/results/60f3d5f6300ce8850f0f20142b1312c062bcd6af |     
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/ec5d06d75c8ed687acd7a541c0110eaaec015672 |     
    i686     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/cdd31d4f081a9a373de96ebfc4fef1ce5fb1f312 |     
  mips64el   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/2d76dc844259e6e8bfe0258aafa58cf3d42d388d |     
   xtensa    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/a8dbadfc9e6e6e436f9bb9a8268c14d0447d1f4b |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/012723d5686de81486ba6d37aa104b85809817ed |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/27187a0eaada597210b5b1be9b85045e3a3d3776 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/3371089838a1022e2755c0ea371783e1764a5986 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/86acacd5628155c0f570302da7edaf48320bcfdf |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/beb8ae43b0b27507839f774ff11253f8baccc9d5 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9c63c063cfd288ad960c4fb37a60f9860c9ed90d |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4ebae41993805c22504d217f73ac57fd32564bd0 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0e2cedc4ccec2f2ccda492d2540fb00916abbf81 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/83ca55688ec843208816ad2e398538f4345b7669 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a4dde4bbec2a30b05130a6683f6ce472425618bf |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b5948044e1c3f8999fe6f56e5169e43c15eb0a51 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4cf9603266ec9e3cf7cbe9a5e96a400f4cc4b2b4 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/cf47380e4a6be3c8e29006502a171d4c00fd558f |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/f94456d4898aa1a4aae0ba7a738608e044ea371f |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/24ab566557bada5f413851d7c18f9c607a586334 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/e07d3ad91725bde6b219873aeaaa4ce99247db8a |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/def9dabfe50e76dac8d708470c3ed1b24078fb76 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/3298729aba7db633c288384a0af0d6dfa062ead7 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a86b1d336f4cd404493a3afd56aa6641bae51edb |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9d1a08baa5a0614176b6b97f5ca140e10a406de5 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d94770f90b9c68222a4d5dab103c85d38d6cfe35 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/511385fcaf9b4a283c9170b38947252f53950475 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/319e3935606d5b3e0ba83ba606c032d8a47d6533 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/73f8078f0fd034b48f5ba02df191dc414735f447 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/538babbdee8daab365cda48e5e92dafa6488bed9 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/aedb3fe0400346d8444c36db6ee58806ba6e1c7b |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/0038fbc852f690286a1960efeab39e67dd0031a9 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6a5f625d89a17332803b8c54c5040357740525f6 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/e7388ce5c5635df8d81cdc197b39c333717a8e33 |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/374f4b34265ae4a9e36cef5eb75b25bca9cd473e |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/26aa1d729c9c8381c36cf355f8e958d2c9a191e3 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d7c08027b9198522a31d4323d9b86dc325f3453e |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c2d394cfd6a911114f9aea2e72773a22c4a175e0 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2fac52b292c69cf08efc087a98426a10d3b8fa8a |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/dc5140cbc89c45c5dd97cc8a097ae852c8ed69f2 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/14703032e424efabc63574a8da7943eae49d4906 |     
   s390x     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4d838deb1963f8fcf061bdbbb63ac2be62025794 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0c862e1fdbd53244c3557b7bf00a72d4871cd527 |     
 aarch64_be  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5ceb7a37e8dc1cfb20c82a14b00e541397f5c255 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/676a8055ce01f4d02d977ac1c947445d575411ac |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c4089ea2c65d76f73fa2004e59dcac2021e69ae9 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c634cc912c3150e3912ac2c1f63dfbd71203c5dd |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6f82e49b1f94d94f2f5e8c077494c9f36a2612e5 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/549f0954dec99df0af2b084afe854b548067d1f1 |     
 aarch64_be  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7244dbd8e2911a5f6b0f5a38aa31409d7f35b5a2 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f162a949eb04f896e9663a9288b87798f3bc8c09 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bde34d81a04b5ea96722dc56249089dce7e65b74 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/adee14fb64a267d8b42336ac6db7f22168e5d7d8 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/500426f2c174da99a7e86acb5c2447b511b9f724 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b073d30c37f9b9a6e8166f1a122e30fffb35c933 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/14406220cd8e405759f5cf791c87135ecf364cf4 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/823eeaf85f604bb7e43b7a6e492d6bd01dd31eb4 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/75e4352f6dab107b8de8c35be2d7bdb861506504 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/96728774afb7b26acfdd12036014549852d00676 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8b9e831404b256c4a8cf9103e145fd9b8d089f89 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4bb1fd58ced2fb918c773f5bf695eb421f3d512c |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7efd568d1c879a6f03ca3e43021c1dd2b947ea48 |     
    sh4      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0202ae16c0be93d5a1afa369a66f6f3d1eac7a7f |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2ea167eab35c37f6e1a684ef7e2d0e8270f4a6c5 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/466d2d0bb24dadb83c19f60aba4475d3d90d8baf |     
 aarch64_be  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6b524227e69e5d80602bdeee1fb087a61aa539e2 |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6a1f1597cddfa005693055992615e5520ababc3d |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/11faad978fc1fe6aea0458fd21c397f60439f026 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/dfb334bdebf599449064052e3aef947fd47b5094 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e946c5bf3f5fb9be96bd221073364292f281f85e |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a5171d4b5533da3eda13157b6c1d7df1b5e19d11 |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b1b0c9f22126752130fbb298cc21542991ff11e8 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c3af3a5e0713c1c6b0124ca9c48dadbd9bb26e14 |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ac3d3d8453abf88ab7b03d8843f0e8ea09b5363a |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e6fca71472137e131667b0da85d43dff318acdad |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d650a3d228ca6a0535df2c6f63d1e75dc71be74e |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2bc3e7af615885851f6e3985a68641e5ae4b562e |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/242f5eae06cad458c8811f69285aa36272902bbd |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ea135e523c077436b9533ddef909a55687362f8a |     
    i586     |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/83274082879f9599bc106e12a253f4b9229ea00b |     
microblazeel |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/932772ca2f8da646dde680ddb0b3636ea05771cf |     
    arm      |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/acae52d03bcea6078374f55ea3c002c6b533d507 |     
    arc      |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/da408ee8f29fb9acd8d39fe7f78868d1412ae183 |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/1cd7cb62aabf259b5b9cb03dc1f97cd5b9042f9d |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/0d03026f150b94ba18bc37990eea1e4db53d736f |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/03c51b94d55d03e06f0802bb051f1f1bac6895ef |     
   s390x     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/5f6437b751409d3756c9d8b451d1290097eba710 |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/579042c051afd4a9b26a19490874a25b644316df |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/d2dd790d49a4e169f95e1987a1c08207d72299e5 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/952ae0e1749acabab7b2782a7005b68a79026b62 |     
 powerpc64   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/2e0d218dfab25d5d4003619af0f59f31b41da62e |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/0a4a3539b39f1a47ec401cfe5619185dd687d761 |     
  aarch64    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/686d896f38c17479c10c6e9a130fcaa046dc1b26 | ORPH
  riscv32    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/141f1b40305ff42263629a157ddfa9250826d5a6 | ORPH
  riscv64    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/8e5117394ba4ef9e2ef7190efcb235f00fe83271 | ORPH
   nios2     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/9c2bea0dccf548ac77952ff953208a62dec60d32 | ORPH
    m68k     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/734586a2f1a8ae1f8080cb6988a02dee44578dc3 | ORPH
   mipsel    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/b86e64713c570d2a301b93adca74c1ca71b8b679 | ORPH
    arm      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/611aa629edf8a713637c3a199ee61d6797189e48 | ORPH
   nios2     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/ac2fb5873cdb1691eb6b014474fce4b123f3c650 | ORPH
   mipsel    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/fea3a5d8e202fe8fa3051e15eb27dd55bff27ad2 | ORPH
  aarch64    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/8b6421c606a3b047bc385c5d570441c77297f83e | ORPH
   xtensa    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/114bae20a6c7a46de9119a181a345e0e890ec8e9 | ORPH
   x86_64    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/2310736426cb4f88c02a0e0ef9f7a224eb1a0fb0 | ORPH
   mipsel    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/0a14d5981eb793a227a435eeb1bd2bf23ba6073d | ORPH
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/81db257b8c50a90c3ae6d260f4dd87e1b68dae01 | ORPH
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/b315a2dd991abb663a3b926f33600fc3924ee2da | ORPH
    i586     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/f1e6a50c9d327ea2eea6c8e9dbaad7732bdd92f0 | ORPH
   mipsel    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/aa28d80a45b6ce0e9c1bc5cb3906fba4c81cfba8 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/129f933ab0125cef160afb0a15e2bebfce0fa45c | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/d91bc3eeeb37e830068b3c65038804ca44b57f11 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/a83c814cbb4d063c5d7c9d21bacffb7e51dffed0 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/b2332b932b5fcf72385bf6938dce2ee05df0bcd7 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/ebf2a60a4896e23cca560d5a1ecc6af6ede27a53 | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/ea6b67c6e56baccd9294338bde3a8ed007cdf42d |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/dfaafdf65f94d549246c1be3d924685ec20dc7f6 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/dc39eefa29ff2cc0673d414fe6a918b9b2100294 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5061930c7e9b37d664216082cd90fdfe2f3ae52b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/92339263dd16511bf817f84bb82a2fb17cd5b75b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b646077a4bd65b639817fa53b6b1ec25cfd0a7f4 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/eaff030a9a32ab24e8d93a6eb7975f7331465372 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9502f503187af13bba9ad79eb485e265d9d9f9ca |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ee04f11b93ecd9bf3d9eb5657c51591c8fac3f22 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b72e4db35a76d980b662361e9ae13815e1bafa42 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/e144d4b64e9917e0249b3b014f35aee264fcc6c4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb733d2e6de3e69126f5092a6f7e40257c88ccbe |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ad89b5c94e41b912f7e166361474c28c506d920a |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b8ac182f3963f5267c5cafbf163f08efd47f1671 |     
   x86_64    |            unknown             | TIM | http://autobuild.buildroot.net/results/8e6a31441c8f187df35a707925c4efd4b4882acb |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/32c791f73f26b080a67227ec087991c518aea65d |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e8b050f50116ca19e64d0ec971362e98926ce754 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/26f63f67d9115fa92a197780b3094ff770ea7672 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/dfc795ab3176ac8d8dd0b5317a08a352195851af |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5c27b7b070e7773728ea58309cde4b5146fcd318 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/02b6ab2a4399b921538a876252dfcf4382386abc |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/024ae511eff734ce9bc049490b088b52ca070d74 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d05f0cac581b9c6ecf3ca5278db01b275fc67af2 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/22966fbb1de6ec9bc04639a39e42d519bf88d829 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b1907a00be00a84c15b92acf47413d66461a811b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/dcd8184244e26be243f5ca6bdcc96e8aad4f0757 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e91bc53c3fbcd2ed232db79dc5c947394d66a1e |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/cb2ab71752b8f7a557617a85b5f5db43152d239a |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4d8e866be96459db80792f1c44b429ec5633e362 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b0ec884273eb3fcf0a28fdcc7a32709b09172113 |     
   sparc     |        wireshark-3.4.7         | NOK | http://autobuild.buildroot.net/results/6617ee0e0046a0452a1515b89e9c704b1c125ec4 | ORPH
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ae4763657ac687df2041d9c545a43ec464a37942 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a9438e26411ab3439fcfadd0da8e49f05652f1b0 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2ffb2fb0780b5e22b6cee7f4d2a378121af8fc7d |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4effeb3afff711938a7c2e023ec4fbccb689bf2d |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5525ff635e824d2d592ca03b6e350403d375c1cc |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ea43245f5538733e23ef148cb6a2b5159f90da4d |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/fb701d74cf41ab49118b1ba2dafe1db923188c24 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4ee2b9b47f65ec81bbd85ed9de6478626817539b |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/67d1b2e11b78ffd4aa708d2c1b7c790f5ff08c2b |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/376acf90a6eac72b300d198565f579668bdbcef7 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c5c48df64ee0b40cd08998fa82695e1d78beb721 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2e51faf3992b6f708ccba7b6470962d0265c0e0b |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/3552aafccfdb7c3bd00eb8f6e6e5ab3a3223565d |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/6cb673633c318555d29d16b4aa49f205bc813664 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/bdff4d0a05009ed2d9cc5f11d517553b132d2e09 |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/2d261bd62ff54acfc9e8bdec0561320faeb02e5b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6c01d89e6f33b9c78e5b57d78d010806a71c41d2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8b973d85c96fb0e58c864c0beced73901b03e600 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bf06c98eeed936e12d576c952fd4fe11f2ed3672 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b6e6134658c5e882b40949feedc993e2498907c0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7fda4174e34eb7e383fc3df820fa0334bbd3f661 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/111d3d569dcb32d63eac54d5049acb1780775d3e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b426d2beca587404e1023b6a1d988b1009d91cca |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fd80a6086bfdf477e51f7c6707d14014d631aa10 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/77dd9fa491c20e7d6e16200616a0dd2c77ac8f23 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c9593a62383b453bf3aefb05e1b5d01aadeea5e5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/52e78db3a2a84ac7b1c36de949b618c87f6103e3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/414a2bb908eb373d136118682621b54b8247c2f6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/faee23a570496818911331332a83340a50d79b3b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e3892c3d9ad75f2cc921ef3c2f137c317d3f825d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b4956f911fbeebacb30e2259b099b2507e91b90a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/96135e7de895cefb132d3830ea56ccc0993dcdc2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/19de2c2104313835053fa02ffce439034b385b5f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9b46d5c40073b0d2fa6c053e7414306430111dce |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3f89ba05f0380de9733c886853555f77f2cf209a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2a826051e4fb28d56ea6de64ecdcc4bcf7357c78 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ea26703cfa3116174c7feb3ee70a6aab6884ce6c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/aa732aca8e1559f535c542af74832444d9c9dae0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/26933f283da57bd652b02e09948efe3895c6117c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/072a70f490ac856302cf12ee2f2ac736a6f0844f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/de46bd813cdb545924a0707936e52ded0ff5fb18 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a79398167c464922815ab850f7334586995d303e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/44f207909c7adf7f0b739ca5e8b8356a6b40ece5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/83ec5e74a18e964aedecdb011591d22294c28cda |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/611a960628c03f93ddce16196f0f8c29517aa5ad |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/a33e8abdd1e31ebf0fa5555f01effe1dc9d8b2c1 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/6f73d358b154887e4ecc951eefa14ef03c3a1640 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/d16c01d0b8bb0aac29c2e6d07bada24a467d4dd3 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 24
                  host-python3 | 16
monkey-f54856ce250c4e257354... | 11
  gobject-introspection-1.64.1 | 8 
                  zeromq-4.3.4 | 8 
                 dc3dd-7.2.641 | 5 
                       unknown | 5 
                    htop-3.0.5 | 4 
          libmodsecurity-3.0.5 | 4 
                 pixman-0.40.0 | 4 
               capnproto-0.8.0 | 3 
                mono-6.12.0.90 | 3 
                    mpd-0.22.6 | 3 
                 openal-1.20.1 | 3 
            qt5location-5.15.2 | 3 
                rocksdb-6.13.3 | 3 
                xenomai-3.0.10 | 3 
azure-iot-sdk-c-LTS_07_2020... | 2 
                       gdb-9.2 | 2 
                  gensio-2.2.3 | 2 
                 gerbera-1.6.4 | 2 
 glslsandbox-player-2019.08.23 | 2 
               libtheora-1.1.1 | 2 
                 mesa3d-20.3.5 | 2 
                 openmpi-4.0.0 | 2 
   openvmtools-10.3.5-10430147 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
               apcupsd-3.14.14 | 1 
            docker-cli-20.10.7 | 1 
       docker-containerd-1.4.4 | 1 
                    efl-1.25.1 | 1 
                         glibc | 1 
                   gvfs-1.44.1 | 1 
                   httping-2.5 | 1 
             kismet-2020-12-R3 | 1 
                 libp11-0.4.11 | 1 
                netdata-1.21.1 | 1 
                  nginx-1.18.0 | 1 
               qt5webkit-5.9.1 | 1 
                   sdl2-2.0.14 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b7479f9d06e83dfa35e4e56cf67a10a73cfbcb5f |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/fa1885244bb92830f0929db66119f83eb41cda54 |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/cd5d8c9919ec7c587782a0270141ab41fbd35aa3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/66c0ba343af15358e87a6e67641bf0baec3af2c7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3ddb8b1f6084f36d71df3d110aaaeabdc5aa9fd8 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0a7e555e9d06f4bed06c57132d5805ee6095aed9 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/904b512e7e5e0edaf721e05e87f1e5cbe5584025 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d126e5bd41db1b4546050a88dce31e37e81c0254 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4522854cf4a2b0533519fd15ff6f7ca00ade45e8 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/35c05e925ff5cb6d8309774714951872764a975f | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/21b17e0ef43132e6e47fa1b9202c878a72e53902 | ORPH
    i686     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/7440de1129f91cb102b11774537f770af00ef816 |     
    i586     |    docker-containerd-1.4.4     | NOK | http://autobuild.buildroot.net/results/4bf47846889351e33fc8cc050fe9d89cce5a7e8f | ORPH
   x86_64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/5c3ddcf7c96d0264c74d0ef735b57ede75657899 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5fa86dc40777509f095c492e23d94c321762f1be |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b54b097990913739de6961dca99f334755ddb54f |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9cab7a5efc46b73b3c82a2c39da6e108868e1fa7 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6b7976349edc533689b5c376fbcff35f4ad0ec43 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2fc68e092f27c0554d76768100c62afbcd861123 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ad3f5a233464770b9da4dabd11d9335f79987538 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a83df248fa957bff5e65f7715b10b55fff47ced9 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e4ad225b8c2178a525dab869d1972554167c6ced |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/23f5325ad39b777ed5d651ad9ec23b9e059ca4b8 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/364865eb7f00001dd6ceed5978f9e272a69966ba |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3eeab53fb83a0e1fe0a31b129c624b169c424c4c |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c9b42ba9d1a1638bac7708bd7c7c80da2182bace |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/824fba207d8296912209d8a418566943f58a3b2e |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/740fe84d4ed0f6a6bc617638a467179a5b925cd4 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/86d488a9d800211f02239e810af5be5b5039459e |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a7c80220896dbb3dae211f78786ee73f5ade3107 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/33c3905a87c8c6941ba754b5a27a544a3b02a182 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8c75caa50456fdc9f583eb99067f2f8841cbbca1 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3587c508013b228e5a079bb3a46cb8e6c3a0d8f9 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9415bd11135687dce807d0f1b7a5aa1283132070 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d9f02bbbb6630b3f36630bd9fa868c4665f6a99c |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ebe657bb0375e674141af8886b3a6a0771e2e233 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/46a160aa29adb1222b3d54434a0659e227d59e10 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a0180e6753c4fccd1516c94c8833f4206f4f91c9 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/02f7cee82648b25eb5ab969b490d0a27e8c43150 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/1413206bdd9005e2067c35088f0e26ee157bc7f1 | ORPH
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/7e238725926f5db101f635b1e4a0564fae18ea7f |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/2a103e9d0eeebe0e3bfb70def011204d8a81b17b |     
  sparc64    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/341f259e4c6df3a6fa5ea4fe8788020b8778e2cf |     
  powerpc    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/0f03bd80db9f408e2ce09c34a812c4bcae5ba576 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/b8df5ab50698a3ac06a1ea4e6e34ef4cccf6a745 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/2d6687e5157c48b0e2eea2157026d8d824f2d962 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/31638e2f5bae55565c16267a390849da2d3f177b |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b27d312e9d015eed761922b9f08181e5bfc9eac2 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d0884f8841350e0d36adca6dcf7b71dec9c17b32 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d2aa793aa58711771c86d80576eea1074dcaa82a | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6114f0d0b8473290e94fa730b734d5b126cbd91a | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/620b2ef66ded6b363ccfa851db77cedfcfefa9f3 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f2928dd01b94e8c1826434efd0d51652cda794a1 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/09f887b0ab67aba38a9e7018d8b5e9f85bcd5759 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2aff9023a1e8bc9fe887acfa7b30aebaa77f140f | ORPH
   x86_64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/62a1ad834ac8f7b67a3f171e4e378e38ae251c5d | ORPH
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a2b060986520030ef9f3260a9faddbcc49005577 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/517c15fdc4246c74f685e660f8f7b745ab3f3fbb |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6944782e8dacb64a1f10b38729307c45ce823600 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6f73ee10d1fd6b7f505e42e5ae2d472b0e3da7f1 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/404e72af47cfdaf3712ce26d9c51349791b63ce7 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/5b44824161090af5cacae80b532c6704b78f43c1 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/4735603ba612d8e70352d0cf443d839949eacc87 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/50afe1147dc56daf65bcf7c5c7e11bba6d92da4e |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/caae0c877ef4cb5d1a9dd145ed572645f0c24b08 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/cdf4f09d368d8cb8c36149ebf236391c0790ffcc |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/1171f478e776ac0711bb79b820f8d1251aecd528 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/63728d4a2bc777b95a75a56272517a1ccd3a47d7 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/aca2b5c71b85e4d856bb2a35b1ebfde9b72d7c62 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/4e5a316f21f0fada82a7cfbf6d28ef7f69bfc5a9 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/60e7376e4603e562ce054fedd535853712e2f0ec |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e21a2fd6cf323fa29b9e7cdfa9e8c7f370fed51f |     
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4646a22c9d05183939461c2a7633734ac8e3676b | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/40809a5307fe75a43cef3e74bba2a91cbf19d738 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3be88f031a6d6e1f1dee96da2923db4b91bcea3f | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1ca0a682a7118904945c57f89b02bf17bcdf07d9 | ORPH
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/ca5f3efa3a5e4cf6ef2f32734286b6cee2ffa0f0 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/19fc239bfc18e5ffb3f8a8cf7a811b556df563c9 | ORPH
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/24ccec009563ba2bc59c083377a173f7868dcc1d |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9f90f6e1de46954a78154edbb28e9a50ed2600a5 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2bb098977d509bd14a231f0eff1a0448a5287994 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0cddd1164d2442a7c22e3ca4063c5cc76605259a |     
  riscv32    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/95b3d3aa32b63c8d33a9c1441a1b558fe24f9b77 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/08b1efc0c13cf691d0f5f935aff885f881d24f07 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0eb2021e899687f1613552e484f8634289b5eddc | ORPH
  riscv32    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/99b009c00a82caf0f7f8be6c2223eb005737a93b |     
  riscv32    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/7e8fcecf8a1ed894683b67330c303f8d8efb07ba |     
powerpc64le  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d44dbe551f096e4e6ebffabbe68d1d928ccfec5a |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c61c386e552dd022644724e14c745be5a9542390 |     
    i586     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f6ad885114988902dca30bdf7d72806d78fe7013 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/3b18be285272b153c7a72f04706e90e207585833 |     
 aarch64_be  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6cd854cd057beb21d463e202ae4dd8b4a2fa84d3 |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/20c7c0e05509a896b9e2d6bc3c7f3df7aa0c0ba1 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/af662dceace1e6d77d6d965f392151ef313a9c22 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/508cddf13685a49a213f037fe2a67a0452749256 |     
powerpc64le  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/950582e3ae0d70da16f2cabbb7cf3747965d0be1 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/97c6d6ed089ebbb3dd660c11a2e8a4fd21be52b5 |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/135ca56167674840ec87fd178513566699540d6d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b6b99e386be6135d5eeae6d3322953caa62b5a7d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/df032e8c3a4faf8dc1316656d6ff1d2a8af2fb9f |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/e2c8fa805a9d80624404ded7180c66bc346af409 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/57996b2ed8a698e198927f54bad0863583909fee |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/15a6eb07d32bdd41971c625eebb1d2056803916c |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/1619b11f14e1ce6db61f1a9fa6e0a2eb7c254816 |     
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/c8c2c618f3f4bd1c44ab10183d09b51fcf7ddb22 |     
    arc      |          nginx-1.18.0          | NOK | http://autobuild.buildroot.net/results/720818b7aeffbee5ed39c81ddb44d6fc72ea9614 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/cd0fcd28a94146e9e06c61cf041268c34b6fe361 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/93424999d7dcbeebcd5b97f2b32471132ce03600 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/0a243e82a463e6dbe52456f979a4cb360368c11c |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/d55ab901fb03a99065b1ab0865482a085d53a160 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/a0a3cdc784ef1e3cd40825cfe6aa4534c0b0afb3 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/1445d3c92c9c1706989ce6c336429546a374f40f |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/caa4c8dff4bbed2792522ce232afb3d693b32e5e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4be1e3d20da279896a49f5dc17d9bdc6cfbe09b8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2183d69f27a6ad4f8715463c894267d428c8a6d5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e9c9e3eef8e53abc432369028f1ba684c26ff85a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c03f753e5a19d9ebdba5e9d0394f3ec4f2ae5d3b |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/fa8fec243478b15979022eb4b209c411d4604a00 |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/0e259e778b020c43d7a1c6e6f809bbe057565546 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/e8a98794a41e3cd88f70604d9ab46c97a93d2950 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/00f77f4d8637e8a9fc383ceb32265ba4d18c9dea |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e4dcd2904c18248d1984a61382a3b2453778f849 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9f18da6d61c6f17e501079d4802bcce723025652 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/51b77f7fe122af72b75ac85fe5bfe374aea812c2 |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/6a3becc63891bfdc757e730d2a22c0e08df26f1c |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/75efc07cf4af2a03200a8dfb706c9342efb26ea5 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/5343afdef885ccc09147bf53c7347e512d6c7bd4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/59ddb8000abc737218980b45f0ac6a462f97f816 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8cdb62466d24aed333810d500fde9ce978b94c42 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/92d8b49b3d82c1e65e8389470d0a06df261d8c77 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/eb6c43211f7e2faf966aa4a51284f774771a3968 |     
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/823122019df7cb698c1f65e1590d057a4dc46b2f |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1ee87a76c80c7a22b480bd741a1c3ff424637cc8 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/516cb143ca13cf04092c0d1972954f197a33c9b1 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3dd974723eb54cfa0466ad6d6c29aafaff28efb7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b2f85a9d368cb9231074f9b06aa83684a3bc408f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8ba05d2a0737f593ec588e67bea2c34b023f085c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1b076a71c65325738ea5d169bffecb3c3ec523bd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d49dc10446dbf90c2282d631506d5a1e26192638 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1947143091204907303486e4ba369e90b43c644c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b1e6b7580a25383f4fc0d820abf5fd08213db781 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c772233a058a805b81901bef43a55010efe21cd6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/99557f16554fcf5b02649c388a9b5c15ba51202d |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  host-python3 | 20
                  exiv2-0.27.4 | 18
          libmodsecurity-3.0.5 | 16
                    mpd-0.22.6 | 8 
                mono-6.12.0.90 | 5 
                 pixman-0.40.0 | 5 
                    ffmpeg-4.4 | 4 
  gobject-introspection-1.64.1 | 4 
                 openal-1.20.1 | 4 
                       unknown | 4 
            erlang-jiffy-1.0.6 | 3 
                    htop-3.0.5 | 3 
 Makefile:755: target-finalize | 3 
               pipewire-0.3.26 | 3 
android-tools-4.2.2+git2013... | 2 
               apcupsd-3.14.14 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                 mesa3d-21.0.3 | 2 
            qt5location-5.15.2 | 2 
               qt5webkit-5.9.1 | 2 
                  zeromq-4.3.4 | 2 
                  apitrace-9.0 | 1 
               belle-sip-4.4.8 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
             fontconfig-2.13.1 | 1 
                 gerbera-1.8.1 | 1 
              host-bison-3.7.6 | 1 
             host-cairo-1.16.0 | 1 
              host-ncurses-6.1 | 1 
    kf5-modemmanager-qt-5.47.0 | 1 
               libtheora-1.1.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                rtorrent-0.9.8 | 1 
                   sdl2-2.0.14 | 1 
                      tar-1.34 | 1 
                    xen-4.14.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/527a7f13a6ff076bfae095e1648ac706d99649cd |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1f3948811db7179d02fcb195d1ec050b40cc8ccf |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0e28a53d5a652eba5b4f5fb0cd9f9583877d867e |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2b2674ce4d18ea1630320385a521a7b769954c16 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/bd908afd4e28ea70ebd647d21652ff8a20719b19 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/2099131992f3573b4500bbbcc1c80687c06a5e19 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/da70554b181dc2f8ecb42e0c0c7c81336cbbf4f7 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/603afdfc03156c98783770fd69e0b103141ab3f4 | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6015187230df9c3aa7664fa5810b4c50e697a096 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5db3a17cfd127b1b36b4e1dc7eda1bd88b13e3ba |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ab037405cf612a01f6ee47a5a5717f37f92e96be |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ec9dd3f52a7845e2aa816b79d35d75205a62ab27 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f9fc02ef24328391e72c3fbae58a168160f64ec8 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8cd7a4314c5154332bad4d722ba8090a705aee5e |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0948804456ff65f38ccf0f2ec44e1078944f6e02 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e63e1c215dc002e515b25540b1331e77d25d2bad |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c5b4cce7d93ce56d6d0447bdea4066a284c756d5 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e3376cd334487e7bdb5e1f6e86d8ca1049043cb8 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e23f2ec2140913d052df83d27bda053a3b73fd60 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f8e5590a7368cd0f0e585f28c047640474734d3a |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5b8d337fab0602df37c8b6459fa9e583b56b9b96 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5771adabb29f22861faa5810888c5ee0f0db0ca3 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e27f23f246a9bda23d2963e8310dd48c113572b0 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d30b63371aa30a92f9f5987f2a603afdd4a12c49 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9afe648108a887d3de35cfeec01a86c1f019ae93 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0d02987a37f2130663be3685004e4cb2eb198775 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c8dd66472a1ecdca8397ea5abe0c26e9254af7c3 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aabbd10e8e7475a8e8c51c67c7e14d76fe52a2e3 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/afc1918c341c793351c720ed0e373b2dfc572889 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/905a18f1e3c153ca34ddde88e8eac5a34ef74900 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8fec46468fe9f0838a698d2c155bb7908e7ca9bd |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ea51cbac5038fe07676d3a226683c9ac26ccfda2 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1b96c9b069a0f1c4743f6c6957812029de8ba92a |     
powerpc64le  |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a73ce3301a84d803ea99e7432bd4e2dda0360a6d | ORPH
  mips64el   |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/92690accb6a6d461ef368a11494c65be5785e21e |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/e7d848cbee3cb006df7aa4e7f1b581f5f6c0bf4c | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/15a1909e0fd02faf580489a12b815eb0a868f143 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/8536160e6e954a360442e8e1491cf723266ab095 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1ba024858841a9cc20a549077f16edbbe30e0425 | ORPH
   x86_64    |        host-bison-3.7.6        | NOK | http://autobuild.buildroot.net/results/310901eb219c95ad2792051d1bb131a78ded9874 | ORPH
  riscv64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/5b19c8313fec9429d712806449384c83f70a56d6 |     
    i686     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/79f7450574eef989da55d2efe035f94f6e18b371 | ORPH
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/77d37d2aa1da431f8cb30fd7b25c2730b6bde30e |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/d93b9cd0f1441b9ac3dbf3fffaa7d1d692ade5b1 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ef690ab3211d00c88b176509f762781a7de48617 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/529023a264bc46dd2ec7b5b360b1c983cf83bedb |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/b2eb1ea21e88b7053671fe9a1f9b67b9cad31597 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6350d3b9c9e0b4ff9597910dd72cb7cbe4050a09 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/8c9112ab80ef6031e3efd0d97790376988d502af |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/db68be9723783b3e02f039b3f49c9f7450a2336c |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/01ee2164909735c6650a74dfe537848f9cde81fb |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e3b4455bf558b44f08a5050e96d1e9c5cd71bc94 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/5f5bee3aa37531cbf37bbd66e7a7c1e799a8687c |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/806d5de3fe7c362600df47a9575323fb18929c37 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/8ebcaa039c02223d8f1e257b7c71aff71b98e063 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/426515e68758107a7e07e3614471383c3c29e029 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/1cf075b48373d7419dd92b3c768bec108b5b4e89 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/540f868179c27d7f83cfbb68c8381cfd8a249f14 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/775c71a37c341ecf50f27cd5c3f386e783212d3a |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/79fef8a95d669c29bd1db8e3a379d0563bf06cbd |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/9dd085f91ef99bad4baa286fae1a5683b72c0c66 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/d6884959f30fbac52e630bcf459db64f5855db8e |     
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4567b9466955518ad0998384661441edcbaa6ccd | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/39086b2608decb1866fc49d8c90f59994c053e9f | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/926f8341ab0d26be633890a73b45b72197f8f512 | ORPH
   sparc     |   kf5-modemmanager-qt-5.47.0   | NOK | http://autobuild.buildroot.net/results/79d9e1b6a08d80e7a30509a30725e378784d0de2 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/bc04d2a71ee5e3e5aaa8399870b502c31f34ac0b |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/110eacd86c5f2617f15f21b770d8975347be85a5 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9eb8460b01dc1dbda8ae47e3dd91ba14f6eae517 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/63e9636cbe5ea8ec251a8094f99a7d4d29c7a2bb |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3dac909bafd101c8b62d5ee25ab170dde68f97ed |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9138ae97e8ee5b0927fe8e8f0719275cbcf39916 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cec1001be514e5330430c03512775008ec3556fc |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/33a5503393ee9d2a561147c42f628456a74fec58 |     
    sh4      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7518644a23bd0ca77f1228b5a364fdf0beaa4346 |     
   s390x     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/61cf2a7fe81d47f6761c96066a7f43bacc3ac30b |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5adc4b4a0baf3256236a073281b4f32fddc1cd8d |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8d4eabb9aa455194040ae81ca9cccb7371f7989a |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/91886463fd6321244be5654df93dae2fed7e5974 |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/98c66ea10cf5c5210a3837773e19022a66f27a19 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0873742e443880b9e73f53405bd2594cdbf89029 |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0accea7df11fcb247315ad6edb11b540f4b70ce2 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d2e146edc8d3f272fa90aee40f9d1a31851b0e47 |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f5c181cf2776ed8cdb199875615ae867a53b731d |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f7b19ac2e8651c4da1675a5483f96775f71e08e2 | ORPH
   xtensa    | Makefile:755: target-finalize  | NOK | http://autobuild.buildroot.net/results/0673c5aa03c655d21a0bedd31e6765fe06767367 |     
  riscv64    | Makefile:755: target-finalize  | NOK | http://autobuild.buildroot.net/results/63ad1892d9a5f40093d29ba36b070d9e7b2c5b1a |     
    i686     | Makefile:755: target-finalize  | NOK | http://autobuild.buildroot.net/results/d9d9dac7862773c923a06a5c0838296fd77b82dc |     
   x86_64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/f9fc632106e4a8e97fd3f27201a5b3d52dc1e6fa |     
  riscv64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/c993a00d6b920d4695dd8194d16e760f49560ef2 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/63328ee99978aa9a96dd0e507abe5eb3caded7a1 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/15f0cb5e7d8fc2ad04f1591bb16fc01ef0383094 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ede2be93f8619b3cbf90f89836cd0ceaf76ab172 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/a17e41ce0d8be7b83a901ff7774682adda8a599f |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4424d9d0207e3315a5506ce6ef3d5457081f49cc |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/4d9ebd559dbcc752c88940a8a926a54a7c76ccc2 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/6cde008dafff75d5473d45beed4700288390a2c6 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/9bc1baa240bf341cad5801f52a156b6c192e6f2d |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/4d7c8801f02a9316904017d00b669cfdb82b3d3d |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/b94137c9c728e72d1b15d3efc2303b3a22568fac |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/8173777f48753552e23b5dd7cfeea22cf98edd57 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/9ea5f3135824148da201bdb937b606ab90f236f4 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/9a3dd14421bb4ae9a1238021aafda886f7677303 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/e6fd580fda96eb3732784d31041cc20ff61d6388 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/d8b3aab15b202b891c605aab03d59ccb73b235df |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/6a0e08b1e10b35daaaba454a9584cfcc7323f54c |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/5676de6fd85391b8d6832ae71a96bb4b7960c6b2 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/bd77f20ae670bb4e56fd147b4ff9b75d551ea0a5 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/589d4ac865d788048df3899b067ad6da53641371 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/fd21c47a3d4a111fb193635a83d3dd4f7210ccb3 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/f4fec2d5888678e431b1acfd39f06defad8fd14a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8c3b65e5c50232e9d9c298d68cb401e5a434c285 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4605385fca1caafb23fbb1c1004224970883aec1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b85960b27e939a3b31027872ffbd0e4f705a5a14 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/be07923c2076e6fdcd6f375ff63db51c8db25b76 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e128a2571253335380702e8449ae4afe154d6d56 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/ffc24ec480100741b9e121c0b5f4f70811d6dad3 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/afcac057880c078c30a21162ad819029534bc691 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d2d30e6eaa002efa2e908b19471061559c24cf14 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/8ca4dee04ef321bb0f016896089483a638d2d1c4 |     
  riscv64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/bd242876acac61cd2bc5fafb1943f00202305122 | ORPH
 powerpc64   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8094d0155f6b5a07e150df6f748c1cdfc9dd7803 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/7e5b633e223430915634bbf01c935aa2e3a58434 | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/dc4fb7f5ac2c3afa862eaedc485bcf0ef62a8dd3 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/31e472b8e9f07330b674d5d37dc8389180e977fd |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/c9883bb82552454ef32827d87e378ccb7389bbd7 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/8b5ed163f80a6593f755f8a8c1903a6e06d496bb |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/2aa58b19d6573d0be99ac6391d39499a57cc0e2d |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/160ec3ee6ad7db9c0fb336b268d4f920f855c12b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e8ec196960a0b01e2cad9c0609d8c6f76c973857 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a6d943bd05987dbd9b2312c1eea271c92fde1e95 |     


Gitlab CI results for 2021-08-02
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981356  |      
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980701  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980565  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981136  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981137  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981138  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981144  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981148  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981151  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981155  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981156  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981159  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981161  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981163  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981166  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981168  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981174  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981178  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981180  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981181  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981184  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981185  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981186  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981187  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981188  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981189  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981190  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981191  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981192  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981195  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981197  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981199  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981200  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981201  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981202  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981203  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981205  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981206  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981207  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981208  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981211  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981212  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981213  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981214  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981215  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981218  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981220  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981223  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981224  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981225  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981226  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981228  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981229  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981231  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981233  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981235  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981236  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981239  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981240  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981241  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981242  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981244  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981245  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981246  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981247  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981248  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981249  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981251  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981252  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981253  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981254  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981258  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981259  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981260  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981261  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981262  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981263  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981265  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981268  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981269  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981270  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981272  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981273  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981274  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981275  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981276  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981280  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981282  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981284  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981285  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981287  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981289  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981290  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981291  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981294  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981295  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981296  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981297  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981299  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981301  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981302  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981306  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981309  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981310  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981313  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981314  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981315  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981318  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981319  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981320  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981321  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981322  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981325  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981327  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981328  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981330  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981331  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981333  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981335  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981339  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981341  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981343  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981344  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981347  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981352  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981354  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981355  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980708  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980669  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980672  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980915  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980922  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980923  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468980927  | ORPH 
TestPythonPy2Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981010  | ORPH 
...thonPy2ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981039  | ORPH 
        TestPythonPy2Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981045  | ORPH 
     TestPythonPy2Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981048  | ORPH 
    TestPythonPy2Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981052  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981059  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981073  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1468981076  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

