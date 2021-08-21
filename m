Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD46C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 06:58:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA071611CC
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 06:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA071611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EE9A40203;
	Sat, 21 Aug 2021 06:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6jCK7fmrgjH; Sat, 21 Aug 2021 06:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F66B40206;
	Sat, 21 Aug 2021 06:58:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7552A1BF844
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 06:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BDBD60623
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 06:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y62ahTe0FXFh for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 06:58:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94F90605D6
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 06:58:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A73B7240006
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 06:58:24 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Aug 2021 06:58:24 -0000
Message-Id: <20210821065832.6BDBD60623@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-20
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

Autobuild statistics for 2021-08-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 72  | 20  |  1  | 93  |
  2021.05.x  | 82  | 14  |  0  | 96  |
    master   | 59  |  8  |  1  | 68  |
     next    | 54  | 82  |  1  | 137 |

Classification of failures by reason for master
-----------------------------------------------

                    mpv-0.33.1 | 2 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.1 | 1 
                   gvfs-1.44.1 | 1 
                host-go-1.16.7 | 1 
        host-sentry-cli-1.57.0 | 1 
                       mongodb | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/1e34f4d169fce117ae1ca0b6400123d055db313f |     
   s390x     |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/31398848f878654aae180328daf7d859da16e6b6 |     
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/170e4802b7b4e8e7dafa95ade549e8fd05e43bfd | ORPH
  mips64el   |         host-go-1.16.7         | NOK | http://autobuild.buildroot.net/results/795f1d9d90025bcffb3790e40a38fef32163cd72 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f1a4aca79b07b0fa4fc11c993dfede07b99dd291 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/b972cc59024414cdd12bcb428de21575b66732de |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e12c591fde23e2e578d43a1023cf6417cc715b3c |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ee745e5da32556a6a7f13a9299d57e084e4e55ac |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2e7c67040812a2c2cca497fb2b559ef926d31906 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  zeromq-4.3.4 | 3 
               capnproto-0.8.0 | 2 
   openvmtools-10.3.5-10430147 | 2 
               cutelyst-2.11.0 | 1 
            erlang-jiffy-1.0.6 | 1 
        glib-networking-2.66.0 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
             kismet-2020-12-R3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
          libmodsecurity-3.0.5 | 1 
                       mongodb | 1 
monkey-f54856ce250c4e257354... | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/17cf6a6f1978357daca24bec1e21277b41ff5a4f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1d20088bc86d5994e13b93bdfb0db7c1d7ae44c5 |     
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/63b33081346381aedbf813e3b0fe3aba03882496 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7b5e347234651915ce4d036beafda96a9d99d7b1 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/988f958191cf302a737d47ca602bf0642e2163e6 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/94dabdbfa6e5b251acfce0b74776adfee8725c46 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d7c27be39ddf079be45da3e202460d4bbc215fcc | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b47edf82bfe587be47efd6fb1541c5cd2680c8a2 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/989fa4c968e8129d366939423918cb3920d2c5d1 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/23a7b29d46448a8a38c2f728007cfc3b50771d9d |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/f09b742ade19a4224fd6447493e87df6d27240e7 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/fbcc7df3c94005941f81168339618b6a25555cb1 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/67ee9722e34e52e1a40070b958bb17bb43108843 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/f3c9774a08f763c8830074d83f43949967cad0ba |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b0d60eb41090c42fd0a3ade05d47976500042a83 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9dc41d9c58806be81e1d89bc082036406682a559 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6acd58ba206650504ade7f4aadb08d3fe1c0cd32 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1a5c02af83102ef3590f89b17c1b206915f39425 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fbd2b955fd9e84452396ec654d5a84ba2ff70f9d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4b371a9e245f338c4b00a5de849aa2fc98e2914f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/71005eba9e4ea31b1b589ad51c1c6a7add9230c4 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                qt5base-5.15.2 | 2 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
  gobject-introspection-1.64.1 | 1 
                   gvfs-1.44.1 | 1 
                haproxy-2.2.14 | 1 
                   sdl2-2.0.14 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/38db979a32c71472c2e306145be9f15156fdc940 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b05a7d0539e59ce888c61dacfb5115e30f342cc1 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6dbcaae1ce403af3cff80ecad090755cefe4f0ff | ORPH
  riscv32    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/c5ca29553ba7e11a8e400ba8589557204389fb5f | ORPH
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/890bdbfc447077faed3ffb4f836da13291f2f3d5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/850d6a410e98bab03210707cf2753817eef2e7d6 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/440de9fe02431b3c9791b0a1005dcea719fe0238 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/48b966602397a556fc0b6ceef52cda0ce731c94d |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5102d1f9bd69c30055c311665d1bc38e63301cd9 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fb8dd24e4d0866179fd6b084ca09963b2b7a9c96 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/404884a4704833a3d39566a0b8b403b393d5186c |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a6ab4e36ed0c947efe0db8af7bdb7c4f135c9047 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6ff98836d4d6618f439b36e4bd703392b670f042 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/33c897f6a04cc01e4e64a75ed316fe8105106cfd |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 17
package/sdl2/sdl2.mk:163: s... | 14
              host-libcap-2.52 | 13
  gobject-introspection-1.68.0 | 5 
               sdl2-legal-info | 5 
        host-sentry-cli-1.57.0 | 4 
                    mpv-0.33.1 | 2 
           python-pybind-2.6.1 | 2 
                  zeromq-4.3.4 | 2 
                   bullet-3.09 | 1 
                 dc3dd-7.2.641 | 1 
docker-proxy-55685ba49593e6... | 1 
            erlang-jiffy-1.0.6 | 1 
                      gdb-10.1 | 1 
                   gvfs-1.44.1 | 1 
                harfbuzz-2.8.2 | 1 
                     host-llvm | 1 
                  libbpf-0.4.0 | 1 
               libgtk3-3.24.30 | 1 
          libmodsecurity-3.0.5 | 1 
                   libnss-3.69 | 1 
                librsvg-2.50.5 | 1 
              libsecret-0.20.4 | 1 
               libtheora-1.1.1 | 1 
                  polkit-0.119 | 1 
                poppler-0.84.0 | 1 
               pulseview-0.4.2 | 1 
          refpolicy-2.20210203 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/6a11861204e24ca3b40b80db91de95a18ce5dc51 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2c6befd8f55aedfad5a14df7516753a971f26f8b | ORPH
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/882fcd2ef8e31ee88b9c3875870b7ad07eb467b9 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9865eb67cc553f4b64f23421b22c6d101b0527d2 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/ff00333f5903bd6afc55e30702472df544e11ad7 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/7c1ac889047d71c964ce430da34d60163548cedd | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/bfb013b16749c8dc0448d51153d8df28ef379852 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/dde04cbb4456a2844d16570272e3e71549ab4282 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/304f43f813b375f718660af9a84eccb09a80ceba | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6f2fc37cd014363f3e9ea230ca8171c3bb57535e | ORPH
   s390x     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/aa9a5603970369be6403a70b5085e994cdb36515 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/53a7f85895d94b6a93bee75d126cec951ed27394 | ORPH
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d80cbbe52c3716e7b6e4e1f1e9672c6698644ec3 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/be4b59faea7470de19c022e64e6103879572b6a1 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2ff74fa352ba3c50388205e452dd35bfcb6f31b9 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7ccef46ba600100302c5a3e114ba889489158445 |     
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/90bc77cd5c5fc73fc9d76198887772b5db87d711 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2ab80e175efe31d7680cbf173bb4e3898e923bd8 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8d5d3f5e2e0a0b2e1f06b04a04dd719de3e5c655 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4b2c7fc2f6ee1fcf6e01ef6eb2156331d9ea4ec9 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/93a1ef9c87a8a5d0695221dc85e0181104e229f1 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/cce74d9b9ca3fd8b891fb2ba407fb6edce5b5612 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8a453bef9d019378fbf6a2ed6f392f34e8891354 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d9a2c77e356c35d59536fb36f311bfe60422efee |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4c10140e26603d1f7036ce4e88a723fe63f5a1fb |     
    i586     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/daf8e21dd74c68ba79df7eee1689197451d2b472 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b2a3a341eecbb34a417c6b8fe6e6bad8a12fc5bc |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/351ad6367bd02505fa01ba36648161d7b79c86ab |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f29b3221dd0d3c29a6a86f26ef93e8ce78c475d0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1b7c2cf3a886be463c0867da7275154e764d7634 |     
  aarch64    |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/8baafe4a048d1334fc41d6b486d2a1c5e2595689 |     
  riscv32    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/bb34a465fdb9200f3a5778a62d6a2f3fcb95c04a |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1ba9e3cdeb6b2f5ac6a122a088cdae7acdf7c489 |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f8a4b4139dbc183e8596923166244be30b3fd68d |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b00e2909919b39392d6c78b9789eb46aba7d37c3 |     
  riscv32    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/995f179d6107d9b5142dc2419f130d03b375df7c |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/eece8a03c6cff1a72d3fa74586a8e1dabecd916d |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d1d5b8bec4d211bcd1533dccf1b5e54f4dcc8262 |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c6b4b397ff9c2436fdc36e4dbcc9e5815eb603b9 |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b4ccb140091e97d63a8315808cd4792ccb6dfe45 |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/629766f12be56236dd7a503718dfd75e4d59802c |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ad3825db7c146bd804382a92ad938c79ff14c067 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/7fa4e06f58675e35df3fae206583833e11c6f017 |     
 aarch64_be  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5b89a60786afdebfa0a1b734ff76960f5435b27a |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b574e1a4e17b58b67d102d9db1dd9e9d04e18ece |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4e26a3716eeb697c5c730b83391b9f38ebb3f384 |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/54f4f88e7be9d689c5f2b7ae904d0710d59d13c8 |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/17a311f452497b8ad4e1f42ab7dff8522057e3ac |     
   nios2     |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/03a104bbc6a9b3a5cfe68aee2326efad293e207c |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/46a43831d34892660b67751c2d632e641b368bfa |     
 aarch64_be  |          libnss-3.69           | NOK | http://autobuild.buildroot.net/results/e6685011fdbf563b219317172cd37ccd339c5763 |     
  sparc64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/d8cd6c46e582214bff14a33cd64fc8887deedf40 |     
   mipsel    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/0b9ed4555825e9d1e318f56541467800fed2a3e3 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f376b7cf4c316f3192559836a350818e3f8b29d0 | ORPH
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a5ce5aa8ac69174ed3577f4d595d5db2662115e4 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/54438519b78c72ffc9cf61b657c778b48d002717 |     
  powerpc    | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/0d607b1e81fcca7f01c8243df28b9c3d59040711 |     
microblazeel | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/ba5ac3666707e5be905ed8b2628d4c1a830e0f7b |     
powerpc64le  | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/87f23b8477b5217a0677f6760c1aa2df7f5236f2 |     
  aarch64    | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/c09a9c76e12f9138ce114f428b079f1b4794c46c |     
   nios2     | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/8f71b5dbba9dd673322d587073ce4efe0f4df9bf |     
  mips64el   | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/56ba776776a074b6461155e7fe7716ad3ede4f0f |     
  powerpc    | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/7e79b192747ff1d6795b2cadfef17a934b2dcbe7 |     
   sparc     | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/bc2ee4735be0884906485abb8e938c50976003d4 |     
   xtensa    | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/90eed8bcaca8cefd3cacd1c2e20fd9cb261b0034 |     
  mips64el   | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/b614d79429d599ce2cd0d9c7e305ee22315582d6 |     
  sparc64    | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/850fea9908ace465cf94a6e13de7729e660a0dee |     
    arc      | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/0f3d416fb0940975b1b0d453f854defc1d40c8cb |     
  riscv64    | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/e22240964109d1341c5d657e6dd3c225b2c817ab |     
   mipsel    | package/sdl2/sdl2.mk:163: s... | NOK | http://autobuild.buildroot.net/results/c8f14e05ad8c99aa0fc202f2051d299ad9676b3a |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/73659e91a9587b2b150f18777957b2cc461882ca |     
    arm      |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/741a22cca1b411b563f465441d48799ea70669ad |     
  aarch64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/68e6a7eadfc0640c0b89b6acdbcd05c455ade762 |     
  powerpc    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/b9314bb2b41d72d482038635fdfe6ad0d20bb284 |     
   xtensa    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/fbf971e043dfb374c66f7f830eb24973bcd89fe3 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8677b00517eb03200b6ce6a95470455ea50f1170 |     
  mips64el   |        sdl2-legal-info         | NOK | http://autobuild.buildroot.net/results/06b9e16ce6c0d06fa9e6bc6c73616ad89709c8c5 |     
  aarch64    |        sdl2-legal-info         | NOK | http://autobuild.buildroot.net/results/769be788ecdd4f24c89c63fe6f9f80b4c1abf31f |     
  powerpc    |        sdl2-legal-info         | NOK | http://autobuild.buildroot.net/results/8b3ebcae55fbe1a9d8f2911717b287862f73aad4 |     
  aarch64    |        sdl2-legal-info         | NOK | http://autobuild.buildroot.net/results/854784c2e711d5f8a63fad0e84624bcee1538883 |     
  riscv64    |        sdl2-legal-info         | NOK | http://autobuild.buildroot.net/results/10e569d6e631aaa57046135bdeb6a74706c316b5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3a8b2e55618d74f45410ebdf5dc2fc92c9163d09 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c4628bf17b39cd5f8e4e4cc7eb7bd3db5fa97b96 |     


Gitlab CI results for 2021-08-20
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521690  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521691  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521692  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521694  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521696  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521754  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521785  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521792  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521793  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521856  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521859  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521861  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521942  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521944  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521945  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521988  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515522006  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1515522060  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
