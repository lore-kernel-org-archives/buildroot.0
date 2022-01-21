Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4CCC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 06:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D56B40103;
	Fri, 21 Jan 2022 06:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dxk_F8AbXRE; Fri, 21 Jan 2022 06:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12DAA401ED;
	Fri, 21 Jan 2022 06:58:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66A221BF321
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 06:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53738401ED
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 06:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYiF0bhE3nSE for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 06:58:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C61240103
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 06:58:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 74C3B4000D
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 06:58:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jan 2022 06:58:34 -0000
Message-Id: <20220121065839.53738401ED@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2022-01-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 59  |  7  |  0  | 66  |
  2021.11.x  | 20  |  3  |  0  | 23  |
    master   | 96  | 30  |  0  | 126 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 5 
                   gvfs-1.48.1 | 3 
                       frr-8.1 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
                    bat-0.18.3 | 1 
               belle-sip-4.4.8 | 1 
             bluez5_utils-5.63 | 1 
                  boinc-7.18.1 | 1 
                cryptopp-8.6.0 | 1 
                   guile-3.0.7 | 1 
                 hiawatha-11.1 | 1 
             ksmbd-tools-3.4.3 | 1 
               libupnp-1.14.12 | 1 
                log4cxx-0.12.0 | 1 
                    mpv-0.33.1 | 1 
               pulseview-0.4.2 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                    ruby-3.1.0 | 1 
                    vlc-3.0.16 | 1 
                    vte-0.66.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/c47b98659910c7c689d1d961f7b728500d796984 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/ccf41f643b7a8049c9439f27e9d5907b58275efe |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/4e2bb98d2d15438de8269c56272a59d8c5243adb |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c351826f86703570d0f428efce22074997f65b73 |     
  nds32le    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/fa90b416a219a512a482e7dc63e2d72b184307c7 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7f17048efeea993cd7bc9d6eae93ee9547f12d5f |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/51e9218d25b8df1a1dda7b79808cb9e971ae4415 |     
  riscv64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/3ae75d1820dff4e5c2c9b9055152d534c837002e | ORPH
    i586     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/8d2208e20f2bd9a7bcdc710af2b8694ad0e3626e | ORPH
    arm      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/b2e95f9a8bee1f880a586dee2747815da2b85cb7 | ORPH
    arm      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/4935f221124b905f678197d3f157fe9dee6ae5de | ORPH
    arm      |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/8fd8984bc1333c709e1c77e89e5f7db14bc1a52b |     
  sparc64    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/28376a96e86cbec4475c2e197f4f56b0cd4471cf |     
    or1k     |        libupnp-1.14.12         | NOK | http://autobuild.buildroot.net/results/6e3d9c5100bd14d5b2493129466e72c374c1bfd6 |     
   xtensa    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/1c171e503c4e9562ef8670fad8d1b90d591a423c |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/120d767732c04cf234b4f34503bbf16e57e08b96 |     
   mipsel    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/5fd00cc3fe3ddf64d9114f21314c0039b74e3705 |     
    i586     |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/1bfc49cdd3a6279af93666ef9d905c3038c107a7 |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/f55217299d5a42d828e7c95b642b49546cc03023 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ee1486b60197610f1a7af2efc86bea9abe4a416e |     
    or1k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d1b328da9dab68820adba22cd7e1b7b66abfd0d5 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d33fd6bcb9d0fe19493120d0cce6b1c10d9ad12e |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c3cdec79b7bd843d297ab4192fd2c3c66c7f13d3 |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/0709a19115a6f3dbc6856f9ab609a2e717f12bfc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0d9121e3bc38ddced115577dddf02f507aa92450 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/7eaaeb71ba24bd3320635073add057ca3fdbd9cd |     
   x86_64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/c4d17e415fd47c6490a94a812a9f51e968c7ca0b |     
  mips64el   |           vte-0.66.2           | NOK | http://autobuild.buildroot.net/results/c0d1adeffbf97805a0f669d01929a56ccc66a835 | ORPH
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/80d7e489219c49295bedb1307b33155eda76b80e |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/de7e6e4b716dbc4396240b47eb2a777a8ade65f4 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               cutelyst-2.11.0 | 1 
  gobject-introspection-1.64.1 | 1 
monkey-f54856ce250c4e257354... | 1 
               openldap-2.4.59 | 1 
   openvmtools-10.3.5-10430147 | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/04b74af572ed66e8b7e1015605e90642810d6782 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/4797658d048163234d0fa69a1d87eb0083bf5444 | ORPH
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8aac0258be9ab18f26dc5ae072a25d8c6fb8075c |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/8780ca6ac97742e93b7c9ff0685ddd9acfb59650 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d144cda2264f04d7074a3af1c5e15baa2e537a26 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/24bc8aedcc5c678429871933e40553c70dd84d5b |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a58134722c19c9a4533b398a7c6c4e070cfffaed |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                   libnss-3.73 | 1 
               libtheora-1.1.1 | 1 
                  ndisc6-1.0.5 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/281532d1c0cabdd3b7c7109d96e307fafc551644 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a24f123d9a32aced63487234c9f72ecf0464a391 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/cb78d8ecb0ab38e1b866f855e7ab29da314e1324 | ORPH


Gitlab CI results for 2022-01-20
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
