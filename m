Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A5FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 05:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4BA160720
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 05:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4BA160720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 910E9605E6;
	Sun, 25 Jul 2021 05:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSb-NXp3Rx0L; Sun, 25 Jul 2021 05:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 790C460647;
	Sun, 25 Jul 2021 05:47:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32D841BF4E2
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 05:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F8DE403DA
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 05:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebqz5v9HFtVQ for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 05:47:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0FE1403D9
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 05:47:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A9A20100004
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 05:47:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Jul 2021 05:47:47 -0000
Message-Id: <20210725054753.1F8DE403DA@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-24
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

Autobuild statistics for 2021-07-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 17  |  7  |  0  | 24  |
  2021.05.x  | 15  |  6  |  0  | 21  |
    master   | 50  | 65  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

                  exiv2-0.27.4 | 11
        host-sentry-cli-1.57.0 | 6 
                    qemu-6.0.0 | 5 
                       unknown | 4 
         host-gcc-final-10.3.0 | 3 
              alsa-lib-1.2.5.1 | 2 
            alsa-plugins-1.2.5 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
                host-odb-2.4.0 | 2 
          libmodsecurity-3.0.5 | 2 
           optee-client-3.13.0 | 2 
                qt5base-5.15.2 | 2 
               apcupsd-3.14.14 | 1 
atest-895b0183a89c15f5e2305... | 1 
              bluez-alsa-3.1.0 | 1 
             bluez5_utils-5.60 | 1 
                      gdb-10.1 | 1 
  gobject-introspection-1.68.0 | 1 
           gumbo-parser-0.10.1 | 1 
          host-rust-bin-1.52.0 | 1 
           libinput-legal-info | 1 
                libmbim-1.24.8 | 1 
             libmediaart-1.9.4 | 1 
                librsvg-2.50.5 | 1 
               libtheora-1.1.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                     php-8.0.7 | 1 
               pipewire-0.3.27 | 1 
           proxychains-ng-4.14 | 1 
       python-matplotlib-3.0.3 | 1 
                 samba4-4.14.5 | 1 
              swupdate-2021.04 | 1 
              tpm2-tools-4.3.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/966699f75a7c90de438558c33f84f72e8999ecc0 |     
    i686     |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/3cce06a44823ce9b6a66702081436fd3b8393d86 |     
    arm      |       alsa-plugins-1.2.5       | NOK | http://autobuild.buildroot.net/results/bbc94255ab03704d11045da6a97335ae210f9d41 |     
    m68k     |       alsa-plugins-1.2.5       | NOK | http://autobuild.buildroot.net/results/0332feafb62ba5c27e3ecc271bdb4b684a920ed6 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8f7c444a61a9dedd20c641a0f90374a17ac990dc |     
    m68k     | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/807b403ee0e8b2d3d67fa2049657d666f741fcdb |     
    arm      |        bluez-alsa-3.1.0        | NOK | http://autobuild.buildroot.net/results/1eb295c0f943c5cecf58da4f7ef8c5dcc1ba7505 |     
   nios2     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/418d756f09062edc92f74f2a81a96950245a99f0 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7714b92a32ef7972c08604ff8a0a44ea31400349 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/116f202c6516045a6bf56a9f59d2c3443d9b21f3 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/46be0143913a2726395f927805b740f227396102 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c21ce1a2acd2b00c45acc7d326914e82c16a3744 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/017400d7e39a508bfcfda21150844acafa5b18bb |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/51b910d9cb1981c367cbe6ec6eb5e54b6b6d1f7e |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5b1ddec431c4ab641a84bb880fe1287df2649e3f |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/abdf6bcd79b9beba8390e4adafaebfc9b7430dd8 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e7e9e0fc1d580fa7074790fb3f5a424fd08ec55e |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a13f87d6507d6c88215f1893e7308a0098d9302a |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8575ac9c1983804c0b577de924db1b80e82c4bdc |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c59c7c32b8d95d3834f1e210272064148dbb7bea |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f2ca280aaa062e4a60db2c768e69095a9a365ee7 |     
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/5ddf659753de4bc62b6453549c5b62b4d103e0df | ORPH
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/fbb5293b90f413aa6d35654e1ef83deb3499477f | ORPH
    arm      |      gumbo-parser-0.10.1       | NOK | http://autobuild.buildroot.net/results/571796e2bc260275338dd6a786543f3f30eb94e1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/225b73a364954bfe2281885dcb77bff233ed4654 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dded6405a602aeefd46dd023a970dbfed6d75bd0 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/259a2d8d1f20d758398368f1794fd4fd85481cfc |     
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1a9167910ec3c60e152034e5d105393527ab7360 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/fffc5f62753a6ca4167479bcb2ade46fb1e37a8a | ORPH
    arm      |      host-rust-bin-1.52.0      | NOK | http://autobuild.buildroot.net/results/26792f4541483aa06a0a5469e293516ebe29cd8a |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0bfce45d6189cb074da8badaf054f6aa0a8e2e04 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a85ada83f27d1614e9be63fdda03e38d13a11ee7 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a13db85c0325cb692b64867b97e58fc04a5b1569 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f19c18653f3733817f595cb4cb2f5d099daf4ce5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/529a4ef28468878847861476f0d018bb52376438 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7c99c33062c32c6dda96b87aaa0889c64bfd3412 |     
    arm      |      libinput-legal-info       | NOK | http://autobuild.buildroot.net/results/b82d53ac70737488dd780a7112fc7ea0153768ba |     
  riscv64    |         libmbim-1.24.8         | NOK | http://autobuild.buildroot.net/results/8e973fdb8e0679e4a3d1483504d14561f66cc40a |     
    mips     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/a6374db6ba309fcdaf0ad265368a3e59ef4b8c63 |     
 powerpc64   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5a2f44fb2c4b3370e49d6951786f17424462eb23 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/74a128b39f1789ee029c2825031bd8f34e10fc01 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/334a3d5cdf5adc77e8b109735458bfdec4350bd9 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d4faa34266a323499ceb5dc377bc50329d88bf8d | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/2f9864e996bcb5f4826b96785bf8508172ee60eb |     
    sh4      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/043eadc89b355fad404c6a992df5d82487f276d6 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/843cde619ac37af32b3bcd96522b263264799440 |     
microblazeel |           php-8.0.7            | NOK | http://autobuild.buildroot.net/results/751fea989e4c0136d0bbda0f5487d55d387ee5f3 |     
    arm      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/20cd863cb3c83b85900e80de02d485b780288330 |     
   xtensa    |      proxychains-ng-4.14       | NOK | http://autobuild.buildroot.net/results/fd01df6eb9a37257894740d44a33eece9123355a | ORPH
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/b0fcf1ea64c1156efece7eb5bd010cced7d0d4ec |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/44fa730f1776b011f7225eb91be2c5dcef238d07 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/84502409bd825965368e6538183948f721b02a42 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/7cd72100043cf78fa0b8f21928ad34e7a032d751 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/1e76ca38402d593bc8765ce5ca176745b273b1ba |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/1ab4253ba61b44c9ef4260224caf710f34f21753 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/d98e587b7a774174ca9977fa7e26f0f5229bfd28 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/cfed1f09087a387cee1f0f5f261ece1bf4e72bb1 |     
  riscv64    |         samba4-4.14.5          | NOK | http://autobuild.buildroot.net/results/2e6f516eb485c7dde527496ba0ffa53cbd1ee6b3 |     
  riscv32    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/3702a3afeebd368de4ae5be63fdf35f9ded9e732 |     
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/1e4f1edc7f10fd8c1114bd25b7fb34ea29c1ac14 | ORPH
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/b8de954490c335766350265f18b361e6675fef71 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dd9edba749639b17ab71f8769371b4c27f9f2891 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9d3024deb63fe629233b2f31337734c970cf4ff9 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/48cd22e072d5533981534ed4e495a8dd2f7fa933 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/30d209ef9af5c036d922083fd350d0c7e24ab749 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                  exiv2-0.27.4 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 hwloc-1.11.13 | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1931afd987ca32938ea507b9bfe89f1f1d216aaf |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/f049327c6148e68814ea5b3fa8e11abb2278877b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/538f96e048919bdf543ef4fd802ee6774714084f |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abc1649457a4582eba05df2fed5cdafb591f2573 |     
  riscv64    |         hwloc-1.11.13          | NOK | http://autobuild.buildroot.net/results/a321bc5e354dd459129d8e96425157c7d610398b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/270fc3aaaab96ab76a626bf57eef0f4e512e903a | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c3fd9fba9185bf98cc4802c95a21d2eaf7a079d5 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 2 
                 dc3dd-7.2.641 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-21.0.3 | 1 
                mono-6.12.0.90 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e1d0896ea8c8dcd3b0249a2e9656d6d628131953 | ORPH
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/c8e1ee8b1e86ca492805767111ef43d2e4a685a7 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b6451331a8a20e789819605651fe9641084c74cb | ORPH
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6cbc2e0aae2218387cc50ed9b9df87884a3bae46 |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/292562de91ab23579eef5ca8c859c4c4a99b6fdd |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/88c0ab2a3665650b7afb18de975052ccd4388f98 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
