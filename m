Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF87C4338F
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 07:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319F26128A
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 07:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 319F26128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DED71400D9;
	Wed, 25 Aug 2021 07:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSW9vOeL8hLf; Wed, 25 Aug 2021 07:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D20D4010C;
	Wed, 25 Aug 2021 07:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F10F11BF5D7
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 07:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEE6B80F0D
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 07:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifE5DU1-XI6p for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 07:05:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B390480E86
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 07:05:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2C80A240005
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 07:05:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Aug 2021 07:05:32 -0000
Message-Id: <20210825070540.DEE6B80F0D@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-24
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

Autobuild statistics for 2021-08-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 37  | 11  |  2  | 50  |
  2021.05.x  | 40  |  7  |  0  | 47  |
    master   | 206 | 27  |  2  | 235 |
     next    | 37  | 35  |  0  | 72  |

Classification of failures by reason for master
-----------------------------------------------

                    ffmpeg-4.4 | 3 
                mono-6.12.0.90 | 3 
           python-pybind-2.6.1 | 3 
                       mongodb | 2 
                  zeromq-4.3.4 | 2 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.1 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
docker-proxy-55685ba49593e6... | 1 
            erlang-jiffy-1.0.6 | 1 
              host-libcap-2.51 | 1 
                host-odb-2.4.0 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-21.1.6 | 1 
                     mtd-2.1.3 | 1 
                 openmpi-4.0.0 | 1 
                  polkit-0.119 | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/48fd1d63e7ca6f5d7d4ec5c940b10d5768686aac |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/00c936cbe1ceb07084001b2515f530d99f51f562 |     
   s390x     |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/18a93e153838bac1d6cc7db0b041a085b43c34f0 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/341c3983512c7c24f4118e18e7cb0e06694d0afb |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8f98e6793bbd8c62ee8ea385c0b2b44cfa81a658 | ORPH
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/85771bf46b30b253fcb64f2e1bf96ac88545b181 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2b7159191cec3a6b71f4300968df2515b87e9209 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c4d5eae346dec073eee24ac2b835e9a370acb79e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8b2a930a265371fbfbdc8c78ed3e4b16cb68b59b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/cc0b1caf431271012c399409b8e100b9294d3ebc |     
    arm      |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/1cf9919362661d56b46d7a1985fe69c278ae32a2 |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/63b1257bc2540df7a818cdd0dca098c28ea00a9e | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/eabfbfa40dda2c5d9f370e7d95f56ba8591b1ee0 | ORPH
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/9ee0160f8aaae33b16a968f0f2f66f6d574608cb |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/237aca4a84038c624e387db8640b41272b67bc44 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/784e5997ec079b5e4148bd145904e070f52ac853 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f5307d1eb15135254f4b75fbe04abcdc9bc6bbaa |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b8d4fa0d496f5074e7d417b98880ee948d77544b |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ff1bd23554a61a4160226778e204e737d054d799 |     
    arm      |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/2d42b0a626367e4051d0e2aadcce39e974fe09d4 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/cdc326989eb85d0b5c38df115e587ccfecaaf461 | ORPH
  riscv32    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/ebb05e04ff1c7224f978460a836e92c81f73ba77 |     
  aarch64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/387280d311af0f96a0a6cf3ecbf5c2221a778f29 |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/65f797410c1bdfcb816db6aa85e0cd8c5e1f6842 |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/ed8ad4c205cd239a8e2c5c5c97c00c604213c781 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/099da5ee029e8d7d6e65d4b59a7292e97da8318b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f2a5e241cd00f4117b5641ab8c12d0f9aa825c27 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/324caaf888071c1657acd0a7faa8b0b141336f8d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c3e2491584ff053165a4581fe5f7cf34d429d00f |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 dc3dd-7.2.641 | 2 
        host-sentry-cli-1.57.0 | 2 
                       mongodb | 2 
               capnproto-0.8.0 | 1 
        glib-networking-2.66.0 | 1 
          libmodsecurity-3.0.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                rocksdb-6.13.3 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7ce6de318b74cf7ada93440cf5976c64d9030b37 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e6f5b4f59923ce93572bd1e67a64d15d908c69ab | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/35c514e5b4d68e9ed8b59511baa0f663e7398736 | ORPH
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/50f7d1203236b229fe19c0e03e75271c59f2b60a | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/35d16ab2234deb5cd817cfbe5d929c8a4b611227 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9d2a2498c0f6e55392f15fdef445f66860fb9740 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ba287eaf97c76636a819424cd98d48f3647ae416 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/51748f5a40cb1ad9b22b1b8c55e77c8e79f7e545 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/644b5f897da5365ede4136b9303e3088f11b7768 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/bb790abb779eb3a28ef9757171e0807bba41cefe |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/88580a42b65918b176a24228d1a3c41c826f87f5 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/db9290476f7f72f411632f4ac2674daf604a2729 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9280c2ba45899fe2c69436e813eee60e601ba452 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
  gobject-introspection-1.64.1 | 1 
                haproxy-2.2.14 | 1 
                   httping-2.5 | 1 
                 mesa3d-21.0.3 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/3540b5af64675b715b8f81dc9d986b1daf346839 | ORPH
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/e30bcfa9c29af2ee5c992ed0d5527bda5719beb7 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/55549b5f54209b498a0778471b9ee9571a1c7677 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a1df63abb66d1bc526fad34eda356c5fde2c56c4 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/d71cb8204a3e69df08345684fe79210364297cc0 |     
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/f7c04a43b07aa8d2009c0075e91e67c7a65be3c0 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/4e6470ebc9f5329765688ec9a9ff0ca4178f2a1f |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 13
              host-libcap-2.52 | 6 
                harfbuzz-2.8.2 | 2 
                    mpd-0.22.8 | 2 
               capnproto-0.8.0 | 1 
                   delve-1.6.1 | 1 
                    ffmpeg-4.4 | 1 
                       gdb-9.2 | 1 
          host-rust-bin-1.54.0 | 1 
                  libbpf-0.4.0 | 1 
libcamera-3a1f67a8031ac5ad9... | 1 
                  mupdf-1.18.0 | 1 
                  nginx-1.20.1 | 1 
           python-pybind-2.6.1 | 1 
          refpolicy-2.20210203 | 1 
tvheadend-dbaa0f850394af8ab... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/38856c6d4c42351268cd273c0abeb85d9b59bcfe |     
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/93d104d7722aef4adb3bd00e5eff5041814ba0c1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8d7cd265609a25c6c05643a26d7cd6dc472c13e3 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/ad9520523fd1ff6e5bd8017c1da0a2983baa0fa1 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/e79a7bc8ef6acd520022d1c28f026be8f480ddbd | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/76b852027c9c47edf047be787fbd8300e79fa175 | ORPH
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/600aff5b839b48db80751cace5fa9670b7a3d698 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ba5ced5195e3c09b3544471ad65261d2bd51b87a |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b87619974837bd94f9a277de3fd00b8fade72bc3 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/fd3a342370b777e25a90792882fbd3be538e95b1 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6e4dc9e4fc806c369ed3bb86c9e03937ed7f6495 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b2c32b18901c4f61c3fedc977961262331d9d6ec |     
    arm      |      host-rust-bin-1.54.0      | NOK | http://autobuild.buildroot.net/results/289a7dfff5e2a9cee03b932ffe529fe4b1c9932f |     
  sparc64    |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/b4851b5792cdd581ba70e9454d537441f7ed121a |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/254c427b0171c44ba17ff6723c80faa75988a7d7 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/58988e50bb55a10ea43aca5c95ded292622799ea |     
   s390x     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c83c3f07f46b6d22b5c4296e7a1134457d84be11 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/30d85629e7c36ef96e5e71d20fb842f00f90f7f6 |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3325336405ff64ff803fb5d324b957e166bcaff5 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/7c155d8f08eb2b1b1fe71efdd381d4a6e62302d2 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ac7cfd9e2a00436343c63c171adcafca388ef3d3 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e7113c9834909d3d870cf9a1b8938daed48f55a5 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d9590c1942f9eb2b46cf4edd82fa52f0713a84c2 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f591ff6372ec4b64009dd92cf757666d6c7a6ad3 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/7ebeb5f19824a45aca5de76ccbdf237701b436f4 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/65abfb3558f3f9013d90336b2b0f43b015c1247f |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/91dcf7d9ec7d151179d4c0d2cd234971e37b64cf |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/aad0774bc16ce0efc7593acd27ef0ca2f9618046 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/5d518a7a8532083f82144c58aca2503833a62018 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/48a01f69a68d678c571a31255e4a8d34830cf4ce |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/9a2012f98598942eddd30f53e02dac3b11f30d00 |     
  powerpc    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/3f498636957333ac8ec87fbcc75f50c4aed61e54 |     
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/5603640217c7df9b479ad240c63229195ed02a1a |     
    or1k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7ecc9aa90d8aa2abb16738d16d8c28e968f2442d |     
    sh4      | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/0551df6eb9b33f8ce7481e2ddcf33355e1a8aeb2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
