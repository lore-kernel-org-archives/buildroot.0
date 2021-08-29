Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DBCC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 06:58:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050D160F38
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 06:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 050D160F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA88660651;
	Sun, 29 Aug 2021 06:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUoY-Vq1-z2m; Sun, 29 Aug 2021 06:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B0FE60674;
	Sun, 29 Aug 2021 06:58:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D87E1BF293
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 06:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C35E400B8
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 06:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8igCzgPFfp6 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 06:58:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA45640499
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 06:58:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AC48D60004
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 06:58:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Aug 2021 06:58:15 -0000
Message-Id: <20210829065823.4C35E400B8@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-28
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

Autobuild statistics for 2021-08-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 45  |  7  |  0  | 52  |
  2021.05.x  | 41  |  8  |  1  | 50  |
    master   | 185 | 30  |  1  | 216 |
     next    | 40  | 23  |  1  | 64  |

Classification of failures by reason for master
-----------------------------------------------

                nodejs-12.22.5 | 4 
                    ushare-2.1 | 4 
                  zeromq-4.3.4 | 3 
                    ffmpeg-4.4 | 2 
                 apitrace-10.0 | 1 
               capnproto-0.8.0 | 1 
            erlang-jiffy-1.0.6 | 1 
                      gdb-10.2 | 1 
                   gssdp-1.3.0 | 1 
                harfbuzz-2.8.2 | 1 
                host-odb-2.4.0 | 1 
                 libidn2-2.3.2 | 1 
               linux-pam-1.5.1 | 1 
                 mesa3d-21.1.6 | 1 
                       mongodb | 1 
                  mupdf-1.18.0 | 1 
                  ndisc6-1.0.4 | 1 
                    qemu-6.0.0 | 1 
                qt5base-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/c514d17730335d4551f88632d7e8944003450293 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a575750ba1facc0fb1eec975ef53217936b4a4c0 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b8d9f0e4db9f3c67b67d2506ea636c013172e560 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d146932e9a850904f2317635cdca5deede9eb470 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/38aeecd9553c6850f4e1baa57e0c2af685d67d28 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/734bd5dc6a7842b22225394428041fb9bb3ff33a | ORPH
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/adf5e0f9c6fa9671c1581c916e1ae31b0a04dbf8 |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/7cd0cc31d75b73a27fc8d7294ee6bc8f97f2aec2 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/aee8aa369cb5c8b610ae7121ce069099820fe05e | ORPH
   x86_64    |         libidn2-2.3.2          | NOK | http://autobuild.buildroot.net/results/682ee0d02bf52afd2e22e28c3acffb61fd039355 |     
    arm      |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/64d817d99925dc2545b30a8632ac6035240db88a | ORPH
    sh4      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/460150c3b2693ab89e9929bb639c0f8ff355b241 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/9ca457cd5473b8e85a5a12c1e10ef2f57c163f32 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/39091478c1ff859968bfca2925994c9ddeacf47a |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/834b496e0f5cfd174d20ba146263347dd41c354e | ORPH
    arm      |         nodejs-12.22.5         | NOK | http://autobuild.buildroot.net/results/27a36870dfa8235c8234f0a181c766a64e6fcab6 |     
    i586     |         nodejs-12.22.5         | NOK | http://autobuild.buildroot.net/results/f9d2815b903405be6fe552ea39d7c35875bb004c |     
    arm      |         nodejs-12.22.5         | NOK | http://autobuild.buildroot.net/results/0cd262b8c3293ca5f8c3390842b3be11db551969 |     
   mipsel    |         nodejs-12.22.5         | NOK | http://autobuild.buildroot.net/results/a0f867d5e765fc1aa052de5e53ed350b3b20743f |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/fc2d7a3be8f84b34b8f1946da1caa93e796599e7 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/054cc691e7950c928d9fbcf6374087b4f9b120d3 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/3d46319a9df4dbdd20f1b5ad8cd041f948355551 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/b39ae49451c77ffe2b80cbb54b8ce2afd363f3ad |     
  aarch64    |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/b96d3f6c721d66d375b7d49b89eac87ac879e860 | ORPH
    arc      |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/6ab2555b419355f01310f230fe612f2a3699bbfd | ORPH
  mips64el   |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/19462271006027b2a6376a9d7abeeeae572a6332 | ORPH
  riscv64    |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/d2ffd85cc08a1bc77b9a5d18626ce38c2ed148ff | ORPH
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/690384d40099bedf0ebf9450584987552757ebfc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8f3553250c32029db930a085c07d6d1f7dd647e4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1353cf16149367fc692f3abe4fb94f9491ade822 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bf96e025ae9d110d3c9efef2a310ba6142b3c5ae |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               cutelyst-2.11.0 | 1 
                  gensio-2.2.3 | 1 
          libmodsecurity-3.0.5 | 1 
monkey-f54856ce250c4e257354... | 1 
           python-pybind-2.6.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/9b0ada89108d297e11efc98410e3a653e431cca5 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/925482c6c102a256be500ef3a3602c4758fce866 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2b2775719add0fc77418c59346480601f4d591eb |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/72570e0cd522b9b913f28c0d338a9a1666210f3b |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6b19530a23f8bf1f124860c3c03e1d3bf40ee87b |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ee2e4d44744b23b5cb6a49e64564585aa9ae3565 |     
 aarch64_be  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/de26a6300e2418a7ba40d4867ba6ca2355a18547 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               belle-sip-4.4.8 | 1 
                    ffmpeg-4.4 | 1 
                       mongodb | 1 
                   ogre-1.12.0 | 1 
               pipewire-0.3.26 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/7fb6efd2e12e8b4700bdc72b9626a96f616cf421 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/00fc48283c165752e18e88d217c0430b09bb8649 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9292770269d98154139e37b7df22171903a162cd |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aff5d08aa1ece1f8c04a0b95fa18279f5a8c513f |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/a94cfee0be79078ea76e1eae73de5494d14000e6 |     
  powerpc    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/864c1b087c22efb13b9fbfd98761abfccd4b80e8 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/166877775dbb82a1f22147aab868888622aa30fc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/fbb3ef0898bd1730bd0d4198ed51b7a79c4716ee |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3e75ac7eae40fecca4d734fd9d901ab623280081 |     


Classification of failures by reason for next
---------------------------------------------

                   sdl2-2.0.16 | 12
                  uhd-3.15.0.0 | 3 
               libglib2-2.68.2 | 2 
                  boost-1.77.0 | 1 
  gobject-introspection-1.68.0 | 1 
                  host-go-1.17 | 1 
              host-libcap-2.52 | 1 
                 mesa3d-21.1.7 | 1 
                       mongodb | 1 
                    ushare-2.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/c1f15e3a0cefb7e65e5288fb4564d59a3b06a0bd |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/48cbf0ffb6a78557ce025477d93e70af66840a3b | ORPH
  mips64el   |          host-go-1.17          | NOK | http://autobuild.buildroot.net/results/6f0a0e09a0a2c3d52970e755a023682339468cfb |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3928c94526adb51c3a87016b58f030870a3ecd93 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/872c8e143c6c8c816d8be7a0ee50b028754511ea |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/34fa41ab456b4cca93f0a84a2f2eaa151718fcc5 |     
    arm      |         mesa3d-21.1.7          | NOK | http://autobuild.buildroot.net/results/4c1ee9d3527d372b68e8e3a8afaa140fb9c6aa38 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/7afa639db526fee43fb522ddffe30fba256453eb |     
    m68k     |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/c11268210d09c19301ea6532978821130fc5497f |     
  powerpc    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/1a93d433be4968ae7dd6ed5c3099781bdceb9800 |     
  powerpc    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/69bb07b27b876ad904f5b9be35cd98b2bdfbcfe9 |     
 aarch64_be  |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/4fbcc900185ceb775d7d2b7fd14129131a5d04d7 |     
    arm      |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/4f9026e94373fb31ef7e45f8b4fd55adc178013a |     
   nios2     |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/367ebe532a85573e2e417ac0238d2d828e90e2f7 |     
 powerpc64   |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/2539f79a56a97bcc6009d8b442ed206e1e9f99d6 |     
  aarch64    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/0448a262359b5f5a54eff32d73ed86b6cd5be904 |     
    i686     |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/762ce771d72cc8fe04bceecbf75de257aa4881aa |     
  mips64el   |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/22bb3615a151df1f068345b0269277eaff3eeed0 |     
  riscv64    |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/2a5bbf5a8268625ef9e3ef4463e1764d2329ab8d |     
    arm      |          sdl2-2.0.16           | NOK | http://autobuild.buildroot.net/results/272d2889006a3a2cb22c263aac039169ff0cddef |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/79d3c5cf69297ffc87adbd6830f4f81fbd9a63c4 |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/755d5274377425e4b89338d2d7413811c1456101 |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/097047084d04f81135203ee288e26f83fb8a555c |     
microblazeel |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/f8259260db07fb650c4b3c9b269f314c1052fadb | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
