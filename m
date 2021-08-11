Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA63C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 06:53:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 215196056C
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 06:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 215196056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98F0831CA;
	Wed, 11 Aug 2021 06:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7wXn2D6mj5k; Wed, 11 Aug 2021 06:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D42768364B;
	Wed, 11 Aug 2021 06:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B81AF1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 06:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7E2640493
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 06:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Phi9-l1gsJ4f for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 06:53:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3056440490
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 06:53:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 30DB424000A
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 06:53:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Aug 2021 06:53:02 -0000
Message-Id: <20210811065310.A7E2640493@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-10
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

Autobuild statistics for 2021-08-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 33  | 10  |  0  | 43  |
  2021.05.x  | 45  |  9  |  0  | 54  |
    master   | 200 | 50  |  3  | 253 |
     next    | 35  | 32  |  0  | 67  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                    mpv-0.33.1 | 5 
                harfbuzz-2.8.2 | 3 
          libmodsecurity-3.0.5 | 3 
                       mongodb | 3 
            erlang-jiffy-1.0.6 | 2 
  gobject-introspection-1.68.0 | 2 
                mono-6.12.0.90 | 2 
          refpolicy-2.20210203 | 2 
                  rygel-0.38.3 | 2 
                       unknown | 2 
                xenomai-3.0.10 | 2 
                  xvisor-0.3.0 | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
                    ffmpeg-4.4 | 1 
                      gdb-10.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                librsvg-2.50.5 | 1 
                lmbench-3.0-a9 | 1 
                 mesa3d-21.1.6 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
               osm2pgsql-1.4.2 | 1 
           python-pybind-2.6.1 | 1 
                qt5base-5.15.2 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                   sdl2-2.0.14 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                usbguard-1.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a0090a4b64a94e61fb64f1673c535c4d625bcb33 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b7bca7336166d1764bdcec8880c25d1491a95e74 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3e0069213a6429fe56d7d8cd53f080b33ca6299c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0d92b91b30f154c85f9c6fa28710f9453d81c579 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/aead9323a663f109dd564210ffbc5018566a3f8c | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/795710c458ad2f294ad1fc0607cc320acc498275 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3770b57a5d4f2fe3e09dfcdafe6abcdb6eabd7b3 | ORPH
    arm      |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8fa467fb2337ece54fa734907f3c52bdace67047 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/556c29f95f195f52b3e21968c1467d49dd6d8c19 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/67aea2b65bf5b309e2f764718056a186e1bbd751 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/03c4f2a10aeb85b8ecc782bf03c2972cfcacf8df | ORPH
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e4315e9ddc4a6fd5757f8186ffe77a4f6fd4e7b5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d3734c3322ba3c61a5aa7c88affa805f2e5e005 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0ef22eae9fb27ce41a761df7d3fc135a3b179c19 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/17bc45089f7c83db91746739f7c3dc83bcc70539 |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5081de41aa0b5fddb030c4d1470e95e417fbdda0 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5590ea1eb840a14fbf2da6661f6235d85025e3d3 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/53ebb04f3732947d64689ca6cc7684187b920a31 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d4680c99afe8d6e039d730076d584667a8b22763 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/fd342951887dcfbd1195d0d24d373f5be8a50230 |     
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/bdbd8ef4c2eebed2bdde3ef8a7f7efb1e79e5714 | ORPH
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/78b819f26a9df8f2d4922e405febdd326b6ea251 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/6a243f64bed667e398ba69eb49d70bd4743f3cf0 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/e80a9138995db44909626c6a05e800012ae33074 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/948064a5df3bad4e553ae0d71193d70e2d37c215 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/75bfbf8fb3b99a623a070b0006e6706a1a9b8721 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/15ca33ab16679e8cdee82358148fdb079bf60c62 |     
   s390x     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f57f44189b274398082fe60060362909984c9954 |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9818714e33aed7a65b7606fc8657d14a8ef62fb9 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a2d80adcf03aafaadc948f98f58870debe42326e |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/642dc1f7dd2c719b82eb6a9befcbda47f23f35d9 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c5eee6cd16b727274a0d5ad56bbc699a60993268 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/763f30cc0fd985103dae045808bc97b6145307bb | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6c6f2961b214734ec11f62ce8749d0f69cfb3d81 |     
    arm      |        osm2pgsql-1.4.2         | NOK | http://autobuild.buildroot.net/results/69528232ceba128a2e60aa778bb0943fdefc2ed1 |     
   x86_64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/f49b40fc27db993df70fc1ba95a2e6043d9b2ab4 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/8eb737d2e515e1f5a84832f59bb5cd3893aec031 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/84fb733a4945ba248e326eae86d7ebb8df4e68fa |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8d525ed4957426f65e552bfb069d55eb24ef81f8 |     
   s390x     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/733436f26ff6087ba28f8f9abe0ecfbad8302390 |     
  aarch64    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/d64a0350319577ca22b7bc85d7706c6eead75bc5 |     
    arm      | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/ccc9562e83fd2bd312d21b3124be42dfe4b7e850 |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/af3606710db7fa258b1a8d02b675a1314b353681 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/d6ffdf7a1656f3fa234fdd77459bcad74098e244 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9f2db6d190685e5c518a453bddcc326a9742fd4c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2a2578b1756aaef5ddb05ed2c92a21c384b07102 |     
    arm      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/1c4e0dab5917e5559a97f7cf7a99e30a2b561fc9 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7b9fcbd29cde7d0c6bdbb70622a2d23f27ac4b0d |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a1ebb34ca149e9ef1becdc724dc882afa76368e2 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/9d910d36095e64189dcdbe74e97e6e5c65fb2195 |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/4f1b36a934ed98f7f7c577dbdf8bb6518fd43b4b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3fbff2b272c2baeb81a8ae05a0301a113519baf4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f29f54fcebe0b5416b1d26d667e520444c262181 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 3 
               belle-sip-4.4.8 | 1 
                  gensio-2.2.3 | 1 
          gstreamer1-mm-1.10.0 | 1 
        host-sentry-cli-1.57.0 | 1 
 Makefile:753: target-finalize | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/688c8a72177da10fad03c83e2fbdf248ee7a5e67 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/029b1aa3c63b76f014ce6f550421f3f5a39a1298 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b4bf295ae64cc7fb0952b186d333bf8df6840c11 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e9677fca60c3a190794f7d70c80a5470fb1bcc41 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/d2a327b9c27ed4e08fe82c896e38d889b20ccca8 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f60e1feb3b15b6385c2688285e937de1ff7a1aad |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/017688db11895e0b5d21c302562d7c1bde37a43b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d556e744596480e843a7ab604574271512506940 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c578c38a5f40f6e390dfe961eb0b6616bacfa998 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ef6f01e6804bb56cd0235246b545cc637dbb63c8 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 2 
                   gvfs-1.44.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
           python-pybind-2.6.1 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/af8802e72a5ac4eafa76a119bb43a2a7e5bd2d18 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9e2bb930bf036d159c9ef3f86b11f39e47b2089e |     
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/fa2242a62cf2282f8bd8a3ac64df47e7a635e14f | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/049af50a10b17447af1003b6cd61e28426cbaa74 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/e7ece1926e1e0327151a264f766bcefff17e8b6b |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/8fc86981199ca776487508addc0e4281bf8abb6c | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/878f0d226a071f5431b974847b84b3b20e80509b |     
  mips64el   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/f78b5312803ce3f6bc12b3a835a19c5205b3a1c5 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/beb4e901eb9f04a5c1bca2a44c7f89f449974169 |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 16
              host-libcap-2.52 | 4 
        host-sentry-cli-1.57.0 | 3 
          refpolicy-2.20210203 | 3 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
                harfbuzz-2.8.2 | 1 
                librsvg-2.50.5 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/916597b43bef9b43537215fe8fd7ba688346ca6c |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/6a0e96452ef32050588ea9312ed8abe715923ff6 | ORPH
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/eae709e3af4491d09690aaf1de8011177125594f |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/fc0dfccbf8fee495f8e64b5c5c1c8b5cb4752e8f |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d764af24fd57a9fe1b7724269651a63ad97164bc |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e34b44d0b2f3b085cc91fd1d9532eacee0430a5a |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2c55ab0bd0cfa600986fa6f81baaada434f43e0c |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b04b746ed3e810e97ff82599e743f0115ad5dadb |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c506db663cdd70e068af8ef05472e923e02c5968 |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/01679e52ac36c508b03bf9496acce231cb5e5fa6 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d00f51b7daacbc82f1b1b06ff478188f01060636 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/954582152ece030bc56a96014653d25238c83991 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/606a9b0d552700a2ec28c7fe9f9ba09b70e2fa77 |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/46398bc690cab1d751f3da280f1487928014933e |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/bb06af93e225761fd83461f6dba48832f58bf90d |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5dbda8ec5f0490e25df4586e71d7ad4e39ba254b |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/76ccf81fc1d7a5eb7c524e50e9510c2cba030ed0 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/6779ac5fa54b0d1e759583ad33ad5d7f6ff62908 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/96305233f7c2151e8091dbde220093685cf1e6fb |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/19eb61d2d94f4d90a08caecd8e843eade98df88e |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/6e7073661deb79bfd2da3dc3d63be878d1247e74 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4e2c223a675659cae41327529ef6f4f1f5f94338 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/848db330a7c3ae1ddfe1186f7c652a50f476d6c6 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/cc1464334e94d4e753a1344bc9e61ef199d24645 |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/934337f0c91a0dac059db1c93b2b10b67a44b7eb |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f82aafdb08a8047432ae454e3fbf5ab8d2cd0d82 |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2602c24c30281d142b58a7a27f4ef2c6cff97f93 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7a0cf082dc05697835239c0e588c3f0efe6cda2b |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/46f5ab269bba1f370f5e5064aeaae61916ebe6b4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a7db4615babd4456636609c8521694c0882fb799 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/64381a52be812495479284fe8339a288a1d7cc0c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7694beed6239ca5144b0d61721706e9377e424ea |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
