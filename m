Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F046C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 07:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A75161076
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 07:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A75161076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3CC4282B;
	Sat, 28 Aug 2021 07:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyNurvn24heD; Sat, 28 Aug 2021 07:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 354414282C;
	Sat, 28 Aug 2021 07:05:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4BD11BF398
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 07:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B424F615B6
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 07:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKi1f7Mn7BmL for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 07:05:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11B7A61560
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 07:05:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1059DC0009
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 07:05:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Aug 2021 07:05:39 -0000
Message-Id: <20210828070547.B424F615B6@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-27
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

Autobuild statistics for 2021-08-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 39  | 12  |  1  | 52  |
  2021.05.x  | 41  |  9  |  1  | 51  |
    master   | 204 | 24  |  1  | 229 |
     next    | 36  | 39  |  1  | 76  |

Classification of failures by reason for master
-----------------------------------------------

               capnproto-0.8.0 | 2 
                    ffmpeg-4.4 | 2 
                 openal-1.21.1 | 2 
                    qemu-6.0.0 | 2 
                 dc3dd-7.2.641 | 1 
                   delve-1.6.1 | 1 
            erlang-jiffy-1.0.6 | 1 
                       gdb-9.2 | 1 
 glslsandbox-player-2019.08.23 | 1 
                harfbuzz-2.8.2 | 1 
                librsvg-2.50.5 | 1 
               linux-pam-1.5.1 | 1 
                       mongodb | 1 
                 opencv4-4.5.3 | 1 
           python-pybind-2.6.1 | 1 
                qt5base-5.15.2 | 1 
            qt5location-5.15.2 | 1 
                    ruby-3.0.2 | 1 
                       unknown | 1 
                    xen-4.14.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/596d06c6e46dba355e486995c63acc6490dae333 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d589423f98974b89476129388180dcb9bb516afc |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e0ffdf2093c44c145d4d87b4d1ec24946c6e90b5 | ORPH
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/c860115832de2eedd84d3367d6853b8056788cf2 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e6f45c9def3c6962a868c3bf6f16cf9af943bd7a |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/78f6c3717602993029ce0885eb47ec7cd24adea1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/85cda50a944c29cb55001f021919a4899e75c95e |     
powerpc64le  |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/766a42128e7635b8acffdb33d75e85b4c3df5896 | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/752bac67d67a3f8dfac4ed3ce3137b43172d31b1 |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/a89a5e5588e187f3356770d1ec918bccd724d710 | ORPH
   x86_64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/96f1f58cf858f0f0dc929e7e6489aaa126aa915e |     
   x86_64    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/268e19b352aee9cf0b5840424303b97f204e3ac1 | ORPH
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/f3923837d88bdb282bd758bc627be53a8a313c78 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/58c1c8826ab4353a960857c3c60034da7339d577 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/66c1da49bf9db55f8661c9ca1b4585dd92b9e593 |     
    arm      |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/50dbbd95d5d5a6b39fe5a6d26c1960b719701bb5 |     
  mips64el   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/88bcb61610122edc30e76a153f1167b5de601cb9 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0865be32fd7c0c643e530f6f1f0fb161ed03d19b |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/ffedfc000029072d5d724e98ab4551fe973658ce |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6f65a1ab91d2f1edeca236b4b7b589bea5c42c5e |     
    sh4      |           ruby-3.0.2           | NOK | http://autobuild.buildroot.net/results/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5a47a50433857234b061e2dd872d46d6b8d859c7 |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/136ce42f44bf48d3db4eda7b1548bf7ac1b97d51 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0448e3ac00ec61e49fa48c2d226d00fab794e6e8 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
azure-iot-sdk-c-LTS_07_2020... | 1 
               capnproto-0.8.0 | 1 
docker-proxy-55685ba49593e6... | 1 
 glslsandbox-player-2019.08.23 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                       mongodb | 1 
monkey-f54856ce250c4e257354... | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/d8b404559d823dd0dbcc1ed0228072e2f2354eaa |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9058d6a6a5c13f91cd4e72058d7d89ddd8867250 |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/dc1be1b7eae691de25e335876a881ab124501a56 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/31b3fff9748300e293b4efb5615176ccce48dd15 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/463b06e7a0bde8ab4562feea04a658290e1cf513 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/af1e65f0fbae32437e1b451661cc86e60290987e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cf5e0603488b90847686ae0ca9ea6f3a13ee74b8 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/54bb0ae11863526518a02e8f4731eae4d4e96f11 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/80df387393333ce37bf706b7676619e37d6b0027 |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/e3eacb1aeef7bedeffbfad2a46d81f48e017f7b8 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/09259b85f860454bb6dfe8a653d9e6331a0299d5 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/393639dcdca91a2adfe1a3d75b3d1dfe1ec4fb6b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e32e42955f12274cdd7e4f3fd16e8ec70a831532 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  zeromq-4.3.4 | 2 
                 dc3dd-7.2.641 | 1 
                    ffmpeg-4.4 | 1 
                       mongodb | 1 
                  ndisc6-1.0.4 | 1 
               pipewire-0.3.26 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e445eb5f7706fba71b3f03851b2eb1bafbf8882d | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e6a280e7b1806eb5edcd0896e9bc752358f13f0c |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ab1d3216e549a2ee1cf8c7e874c20ced6f261cc9 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/629c2305bc3b6829fe870184c5e776f0817b0ffa |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fdf5fea5feb967be8032adf1a7bcc55025971ab5 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/923d2ebf6a2039e1441188834b77ac9e75ca70f0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b6ef802506a7ebc7a9330505c4e88d821dd6ef0e | ORPH
    i686     |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/d4477cfa56b187f919adc0dc981c5b5c69cfa6ab |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7e34375bffbf34585c3b4fad37e54958d1740d2d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fe1cd9d00b561f6d2ae085aa12ee4cb0f4fd3ae9 |     


Classification of failures by reason for next
---------------------------------------------

                   sdl2-2.0.16 | 23
              host-libcap-2.52 | 5 
                  boost-1.77.0 | 1 
                         clang | 1 
                flannel-0.14.0 | 1 
                      gdb-10.2 | 1 
              gnuradio-3.8.2.0 | 1 
                 libebml-1.4.2 | 1 
                 libfuse-2.9.9 | 1 
               libglib2-2.68.2 | 1 
                librsvg-2.50.5 | 1 
                  nginx-1.20.1 | 1 
          refpolicy-2.20210203 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/e2706eb65b646ea26feed23a04e53ac08489923e |     
  aarch64    |             clang              | TIM | http://autobuild.buildroot.net/results/bd72f639b8246b2c9c73339d4ccc5fb0994b4aab |     
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/e505981a3f62f3584880880d329653a80c1c1ee4 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/9fe9c6f2a38508199a210514ff1451c042a52a2d | ORPH
powerpc64le  |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/492e474b4a58c60b23b061b92de829a8270d6df3 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/14549cd482f906ef6891ea47f2b57714ecb250e4 |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5d1ed2089430f3a611047491d0f9d57d7bc2dd04 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8b120aaf0b18a017cb1529ba7a9546c357edb620 |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9a0af0c3d74eee9477f486ef6e727f1638813560 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/69adac4934c7508c3d1fbcc6fffa366d882fa60e |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/0bc8af8085d06ac0ddab7f4bdbb4bcfe397a7618 |     
   s390x     |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/c50f0e36e6fabdc6b1b281bbfd19bf0fe657f4fc | ORPH
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/fce640544e6d10fa107361301265a905565bb2c9 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/dfb5fab21560d11071b5870098b3dc2f4e639303 |     
  aarch64    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/669d0a50d0e71f5565c39f65c3ec45b05c1c5c7a |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a8d70cad72d0997509efd08dd925efcfd8b31d56 |     
   xtensa    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/cb89eb6e0784b0c20f33f49b8e3177a78031b0da |     
  mips64el   |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/751a28f346575ad349f532e63f74d0edb64dd497 |     
    arm      |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/971b7585386d90c0568d79ccde299c22a1c6f4ec |     
  mips64el   |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/3340110aa82bad6b32babfe3eb567c37f294802e |     
    arm      |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/df2cff78e9c20d6328887823795aac459d9e5256 |     
    arc      |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/486feb17b34bf7e59f8d3457de43d3698924343d |     
   mipsel    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/6cb4f38f99c395804cc33e8ff560c38694e3f041 |     
  powerpc    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/26784de46c9b1e118926a0403e521de210cf1db3 |     
   x86_64    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/c26f49648c459913d2fe7b94a5b8ec40c036b7b8 |     
   xtensa    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/653bef6bb0c515e8f8b43d6a81b3b9c5fa351b20 |     
   x86_64    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/ad73575f88cda70c0a1cfe894beb49ed90cb5581 |     
  riscv64    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/e94f38ab8a49c9ee6e4db18177c7b9f581dd9200 |     
 powerpc64   |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/3fa85d2a4a9063ab7f392b022875b0f6bd72a8dc |     
powerpc64le  |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/39e004d95a2f55ce000b7960add0703cdcb09ab9 |     
powerpc64le  |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/025fa0890a8f7adfc0352eefed358188d9489cef |     
    arm      |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/c2e0ca8e82fc257cf2bead7c7e182f5579ccf671 |     
  aarch64    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/5dfd86b764e1a9194efe4e35827f0cdef699b770 |     
 powerpc64   |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/f1e2ed63836eead2352bec62f629e2fac1c22c71 |     
  aarch64    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/cc489cda56a81d6cb92d5db0eb48752d1138c1bf |     
    arm      |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/a1f2abcfaa79c1c7692f485f65da79ab9636f9a3 |     
  mips64el   |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/02d703ef7ddb365b0cfc79242c0add06d2f68116 |     
  mips64el   |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/70c60e6257ef8f6576ae602ae07682624629e651 |     
    sh4      |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/15ea337e85e31ebf412e90e16da25d7da0bcca0c |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/93d8e9792907dd5d5f82d135e9770d06194a0a48 |     


Gitlab CI results for 2021-08-27
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008767  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008768  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008770  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008771  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008773  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008836  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008989  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008997  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008999  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536009127  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536009257  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536009377  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
