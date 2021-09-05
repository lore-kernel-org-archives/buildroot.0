Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F12C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:58:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B744F60FBF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B744F60FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8693481911;
	Sun,  5 Sep 2021 06:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUhI5PdZpLyz; Sun,  5 Sep 2021 06:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BFF681947;
	Sun,  5 Sep 2021 06:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FA6A1BF5D7
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C5E240505
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9hx4Wh3qnlk for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 06:57:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8372540506
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 06:57:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 910A840008
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 06:57:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 05 Sep 2021 06:57:47 -0000
Message-Id: <20210905065752.1C5E240505@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-04
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

Autobuild statistics for 2021-09-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  |  7  |  1  | 49  |
  2021.05.x  | 40  |  5  |  1  | 46  |
    master   | 193 | 32  |  3  | 228 |
     next    | 43  | 14  |  0  | 57  |

Classification of failures by reason for master
-----------------------------------------------

                  zeromq-4.3.4 | 5 
                 dc3dd-7.2.641 | 2 
            erlang-jiffy-1.0.6 | 2 
                   gssdp-1.3.0 | 2 
                harfbuzz-2.8.2 | 2 
                       mongodb | 2 
                  mupdf-1.18.0 | 2 
                suricata-6.0.3 | 2 
               capnproto-0.8.0 | 1 
                    ffmpeg-4.4 | 1 
                 gerbera-1.8.2 | 1 
 glslsandbox-player-2019.08.23 | 1 
               libglib2-2.68.2 | 1 
               libgpgme-1.15.1 | 1 
                 libvirt-7.4.0 | 1 
                 mesa3d-21.1.6 | 1 
                         mimic | 1 
                  ndisc6-1.0.4 | 1 
                  nginx-1.20.1 | 1 
               php-gnupg-1.5.0 | 1 
           python-pybind-2.6.1 | 1 
           qt5webengine-5.15.2 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f7919d1d921ad5ed78eca895c9b4691c864d908a |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/cbf195077416ab9862c02dfbdf15bd94abaf4007 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/21c38eea0cc83c4a195154fbbcd1ee1725b09df0 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/14ed3250982c73310c10e5bc77078853fec675bd |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ff03745431ef31690e6a0090d8d7c32c728de588 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2998e1cf0cd33f7c1864553186e06c89d7d0df99 |     
   xtensa    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/7061bd6e7f69c782827ef9c4b1bf657f0577301d |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/237a74f4cbea8ad8942f9516dcf0750acfd59af0 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/a077b7676fb9a51d0428dc09a7f8ec554d7c28b7 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/60fe8449695fc3a41b44d275a8187ab75c6b1249 |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/319551136cc7a5e7d4d389deebe79c099d255a96 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/252256087d395f93c5b365c0989ffc8e85d15432 | ORPH
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/cbc0913fa2cc486deb64b07b5b13341a5a97025e |     
    arm      |        libgpgme-1.15.1         | NOK | http://autobuild.buildroot.net/results/b11094ddd35263071b7dd453a6590c5b684026ff | ORPH
    i586     |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/dc9af7a677af7e53c1240ebbee5b0edc84c8cf52 |     
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/149638efb0f457f09a1716ab550cb6399587dd75 |     
  riscv32    |             mimic              | TIM | http://autobuild.buildroot.net/results/d51d787143fe8b629c29b5d0673d0378dbbb0d06 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/24dffcfe84172bfea1553ae7461000e73ad2a777 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/286ab644e4c6c6eb5415f51c4a28437351f7a53b |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/5e5fba300576304c9b2c6998f6e0fc1b4b69ad10 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/eb47dd4bc809f9fe12c0dfd00bf229e4d68d8945 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7380c0d3f5a057885c353d71ff49310bd4b89907 | ORPH
  riscv64    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/8735d20ca7ccf4eda2f79f9400bed70474855b40 |     
    arm      |        php-gnupg-1.5.0         | NOK | http://autobuild.buildroot.net/results/e41b9ba4bb435647db6e4262493fb3d4de7e2b6a | ORPH
  aarch64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/b6e9d39e73e167891004f1a1264fde4d2cffc7fd |     
  aarch64    |      qt5webengine-5.15.2       | NOK | http://autobuild.buildroot.net/results/7ad414cf04114ffad006b213f2f91c5ab05be790 |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/ec253915d656f219aae27a04fccfd60c000269ee |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/28d2237de9279d5b753c034dd95ec74e9778d832 |     
  powerpc    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/02bf4288a03c1ee9de126925f8897da6bc9c66d3 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/534c72d13fb374d40d5d31001a227ae194ec77a5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a8470d215865084d8c352fcfbb382f0cb326b5bd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/73bd9843142a711f6d42405287ffa498e17411c0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/315fdb1a13b61e3e62040a761154d3133d898436 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a864c699b72b0d59a58570a92d8ebcb2683fd8d9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/05663211288663b57d6c813c8580b32ac78e2fc4 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 2 
              gnuradio-3.8.1.0 | 1 
  gobject-introspection-1.64.1 | 1 
          libmodsecurity-3.0.5 | 1 
                       mongodb | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/add58e990b366530af26f6efb6f2076d488533e0 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/318d12087717bce656b351c26b51fe0e06919a60 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/a558bce30c5eb16c6048d3dc9532056f20c61edb |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/65949f101ed1a0b793d902f4c36d5e013f3883fe | ORPH
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/dd2fa0aeb5515e65bd853aa68fa67d2912542b12 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/40df07ce42f79e4d2363da101557c39f2ff0e906 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/811c2d713f9d5b09f17c069f3de737b85f297742 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/688170b43926ecc4321d6a75be2ef2d5d2bbc819 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

   openvmtools-10.3.5-10430147 | 2 
            erlang-jiffy-1.0.6 | 1 
                       mongodb | 1 
                  weston-9.0.0 | 1 
                    xen-4.14.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4faad10b1274307bd0301fc6a18b09dcf4333ba0 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/7830592c0c1900d2d170fed06e74d590e5a9814f |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b01c6b3d42dcac5c2d679de429d128544a754d22 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/cff08c01aaf99a9fb85e592f7d0eca177a0de2e5 |     
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/d94af1e88ec88f068749bc6fd5af565971763bcb |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/537d32057144182fab0a4458a25ad1d202a96707 |     


Classification of failures by reason for next
---------------------------------------------

               apcupsd-3.14.14 | 2 
              gnuradio-3.8.2.0 | 2 
               libglib2-2.68.2 | 2 
                  uhd-3.15.0.0 | 2 
                    atk-2.36.0 | 1 
            erlang-jiffy-1.0.6 | 1 
              host-libcap-2.52 | 1 
          refpolicy-2.20210203 | 1 
                    ushare-2.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/81b3ca2547eebad505c0205c38b23f39bf91455a |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8f6b4e5e366e2b80ae559b8b2dba9a325be71040 |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/835e506581e42f5d8ab6340c78ab8f042e930f4e | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c64a6d810068bdde92ac0a89a87f0c36a1eda117 |     
    arc      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/d9bcb99c2c833dd7df9d4783656e890e2d7eb621 |     
    arm      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/4d068e7b5f8fff1e1fc17fde31489786746fdf29 |     
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f937f974484eadfd27515f8498ff603db30aa10b |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/5ed8443c5f2590c8a870ae5a700d77fdd226d0f2 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/332c8c9c1fcd152fb6e32b11eab8f3fb682a8f7a |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7c0cfdf2f0eaab7361a5269207b6d3f5b2e12938 |     
 powerpc64   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d0cef62db702e9b7e720b23a8b765eb38fac47f4 |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/9262a081f749a6aa91f0a1b1f0b1fa8426431e17 |     
    arm      |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/db0d9002c7038a2719a5d0efb1a2bf1a2ed0db28 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/30ab3f07134b8f93900dece48fb1f7073ca96934 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
