Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D0C4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 07:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2D9241638;
	Wed, 12 Jan 2022 07:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gplraxzTudsu; Wed, 12 Jan 2022 07:09:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF88E41639;
	Wed, 12 Jan 2022 07:09:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1CC1BF38E
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 07:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64A2D4054B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 07:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1HIrMAClQ8e for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 07:09:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57AF240186
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 07:09:55 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 502E21BF20E
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 07:09:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Jan 2022 07:09:52 -0000
Message-Id: <20220112070957.64A2D4054B@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-11
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

Autobuild statistics for 2022-01-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 67  |  9  |  0  | 76  |
  2021.11.x  | 26  |  9  |  0  | 35  |
    master   | 78  | 70  |  0  | 148 |

Classification of failures by reason for master
-----------------------------------------------

             drbd-utils-9.19.0 | 9 
                       unknown | 6 
             ksmbd-tools-3.4.3 | 4 
        python-pyparsing-3.0.6 | 4 
          refpolicy-2.20220106 | 4 
             bluez5_utils-5.63 | 3 
                       frr-8.1 | 3 
          gstreamer1-mm-1.10.0 | 3 
                libglvnd-1.3.2 | 3 
                  rygel-0.40.2 | 3 
                    vtun-3.0.4 | 3 
                cryptopp-8.6.0 | 2 
package/tinifier/tinifier.m... | 2 
                qt5base-5.15.2 | 2 
                 samba4-4.15.3 | 2 
           tinifier-legal-info | 2 
                    vlc-3.0.16 | 2 
                 wavemon-0.9.4 | 2 
                    bat-0.18.3 | 1 
            btrfs-progs-5.15.1 | 1 
              cryptsetup-2.4.2 | 1 
                   guile-3.0.7 | 1 
                host-go-1.17.6 | 1 
               host-qemu-6.2.0 | 1 
              libsecret-0.20.4 | 1 
               linux-pam-1.5.2 | 1 
                mbedtls-2.28.0 | 1 
                 mesa3d-21.3.3 | 1 
                tinyalsa-2.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/15a9cf2aa8430a4bebd8158e927c281546cb65c9 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/b50d796c443371c14792b81e9c3e032bd859fc2b |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/fb8aa5c0705596cebb058b2c8045926dfa70a249 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/1b5af409c76708a4a92280f2f09cae0a620f934d |     
    i586     |       btrfs-progs-5.15.1       | NOK | http://autobuild.buildroot.net/results/eed8a4b3043dfd851710206c7d8053213f8b6600 | ORPH
    arm      |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/dd8a0c44a60733d8cbe503a2aadbc2ab90658e7c |     
    arm      |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/3b9bc115d4b9b93033fd84d4780a811fe9514f0a |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/888ba0afbd0da0b791e39773eb192319e4e65eac |     
    arm      |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/ca008268443235d3f2db19e97bab7f57d576d2ed |     
    or1k     |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/33d873317031b09dfcd626cc9745c3565919cb2a |     
    arm      |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/24cd2d2b494e215990c94bdb053e6bcefc3ac723 |     
    arm      |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/68005d98331f60b567f4ae396af48cd4d562d051 |     
 powerpc64   |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/ab70984a2f3fc01b028ab27371e7ca7001a6e312 |     
    arm      |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/5cb46f3472da8fa51cfc7a82cf77064f5143a062 |     
  riscv64    |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/bf3b2067d1eb48287aec6d7cd44da3bf11a93aad |     
    arm      |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/5e0c47e5c0ab1bfc9874dcfe48313da69789de0a |     
    arm      |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/3172057672e33315ceb36732ba9ac59d79a86a48 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/b709eec5b78ffa60d9d81e98e2e25cd3234978a4 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9fefef4acf1c3f43544c164b2ee1611e9148d47f |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/a9f32f9a09f31e5aed6e2deba1c624b2eb074abf |     
    arm      |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/15beae9ce27e5778bd00a4cc77096394583c5f0d | ORPH
   sparc     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2c6ee2af3b4cd125b4ffab3bdecc5be22a1fb84c | ORPH
microblazeel |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/3479688334765fbbe4cb9620f4d3596f7d710404 | ORPH
  aarch64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/82a1eb9b63ab62d4cb1a6beae662fcaf1849f950 | ORPH
  mips64el   |         host-go-1.17.6         | NOK | http://autobuild.buildroot.net/results/0a509b6ea5b96380f54769b6a82a218669082a89 |     
    arc      |        host-qemu-6.2.0         | NOK | http://autobuild.buildroot.net/results/d78f660ca4a609a0a072b3f2e04d456bf8cf663f |     
    i586     |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/ee8cf10252470ba3ca18eeb7806d4572ddc3e300 |     
  aarch64    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/845e3286a8c74ffe909430e6c35fc0e57fe6deee |     
   mipsel    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/56dfc95f1409c9bd738a55d8195cb4a76d988d77 |     
    mips     |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/d3fe227349f6f609651e645bb52a62cdc6d98a69 |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/c15a522e0696103638a0059860a33d5c29f98c15 | ORPH
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/c5e92f0b355c91cdcebe0070499889473996f337 | ORPH
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/d4cab434d75e3e32d116e040d626704a039618e8 | ORPH
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/165b12da9c7f24dada875686fb70b395024db008 | ORPH
   xtensa    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/ce74a0b093a0e4745877175444cd4d7a7727eadd | ORPH
    arm      |         mbedtls-2.28.0         | NOK | http://autobuild.buildroot.net/results/94498587c121bdfa7d92552f994502766c8f664b |     
   x86_64    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/0e79790f4d97f4dd91311c4798be17dbe195f745 |     
    i586     | package/tinifier/tinifier.m... | NOK | http://autobuild.buildroot.net/results/6e79e832d6e0752aac39127d731021899b750d1b |     
    arm      | package/tinifier/tinifier.m... | NOK | http://autobuild.buildroot.net/results/7d25a2f37a9c9fe2b52da92756653dfd715576a9 |     
   xtensa    |     python-pyparsing-3.0.6     | NOK | http://autobuild.buildroot.net/results/7f3cadaf55eb05e1bcc8035ebb95e1318f1cb61e |     
   xtensa    |     python-pyparsing-3.0.6     | NOK | http://autobuild.buildroot.net/results/8ac5224f4b6c2c59035dbfb53541e76f58b15e47 |     
   xtensa    |     python-pyparsing-3.0.6     | NOK | http://autobuild.buildroot.net/results/1112d9fb6f822f797dad5ca95a6ab60ae9d52146 |     
   mipsel    |     python-pyparsing-3.0.6     | NOK | http://autobuild.buildroot.net/results/86107109b574a5640ee591e9b578e014b4093785 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/8edd742299ef151bb0c247483821666ff4c647a0 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/87bbab66b99e3cb69aabb86bbb86602a8f53fb8f |     
   s390x     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/d262c9c49afb5fb502fe4a0bd03cf8e09bb9b12d |     
    sh4      |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/b069e816d290459f6ccd4e397b9102a692f4264b |     
  sparc64    |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/a926e27bcd4a3dc416436dcfc3925cbb46e722a4 |     
   sparc     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/d76c128e73beb2d7f6eafdd415bd7016810c41e7 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a1148517ab0a5b7df108869b7f0f5266fcbae52d |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6a0ba5394dd8ae893435aa804f3647b9e6941ea2 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7cad4263866c9566cf592fea2f00ad4a9b0976fb |     
    arc      |         samba4-4.15.3          | NOK | http://autobuild.buildroot.net/results/60f435a9b24e0b4907766287c42f1ca6d0574681 |     
  riscv64    |         samba4-4.15.3          | NOK | http://autobuild.buildroot.net/results/5403db8ae628a54c03191b54c16d9fb28e85937d |     
   x86_64    |      tinifier-legal-info       | NOK | http://autobuild.buildroot.net/results/02260de5d46506e75b9edc682d2d0361a545125c |     
powerpc64le  |      tinifier-legal-info       | NOK | http://autobuild.buildroot.net/results/5fce7f16daca17216d786391ea0fffff856c5404 |     
    arm      |         tinyalsa-2.0.0         | NOK | http://autobuild.buildroot.net/results/14f5860a67d54eda2c492b1ba273a52d481c2a7a | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/b9901e1bce6c69f57013647527cc128d024ff193 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/df276776863b58d5ded93bf934512944305c4a06 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/1ad5951bf63fe4f2b5c09b10a4931df1dd79c4e2 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/736b119603a7939e96327245e0d3d7c1b950d141 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e2de9096dc52e242b6684c20aad548aeb77a8bd7 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a122834187fc7a3b8bb7d5cf2c6cae9c7ba837bc |     
    mips     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/756e1403005de8edce4130234774ab2399fbcbb6 |     
   nios2     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/6f6d72e1f927031c76f87291c68895125a46024c |     
   nios2     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/fd48559118993d5f86141f0b3a2c548c42912ece | ORPH
  riscv64    |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/d62427d04dd468265e2981a57eb708394653a02e | ORPH
    arm      |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/12417b4769fa29094837f76fca2e5e7c4ba0c4b3 | ORPH
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4e1cb1fb9b09aa374463aed4ff0c6b355fe6a79d |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/67c03ff8555b892bd89a54eb4ccad47b0b6badcc |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
          gstreamer1-mm-1.10.0 | 1 
host-meson-tools-0a02e2d344... | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e86de759cfb0b1c73afd84eb050fe5c5ee1ab50c | ORPH
    arc      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/bb2bb006c3c6d3c83902d90be2b1363f9cd590fa |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82b6df5a1b01489249e306e72305fe4a55787b96 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8c56ea9f82b536179f3443d507cf057b23126f11 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e7b7d1698bfe494dfcd8c9421f5112a20a04fd84 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d36384e0fb1fa6c57bd774b186831b6de15e47d6 |     
    sh4      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/2bf60016ecdb68e549911b6e712ffc91ea61d293 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/312c5aa2809f5d0e43c679a54fa247c140cf0e89 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f24096094fdebd2951fca67dc057ba78039a6f87 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 4 
                    azmq-1.0.2 | 1 
                    bird-2.0.8 | 1 
                nodejs-14.18.1 | 1 
               pipewire-0.3.39 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           azmq-1.0.2           | NOK | http://autobuild.buildroot.net/results/811cf7fe70ab39e8f9408d3ad7803cbcb20de76b |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/3cf8a099bcc8f6ec3e93b288342a95847bcc1424 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a282914cedc659f3d5cad38fac0da02dbac1458d |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7594eb3a733380be8703b7a243e7a26c1090fedb |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/70c3c80c346aa723600a2b2ef7af6a7525917a2d |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/59bdb605f108641300cf5cf4a72acb16fb46b9b0 |     
    arm      |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/1fcaf3c2f3c37e9cd578054ac84eaaa35be21df3 |     
    mips     |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/d3dbca9b909a8cfef9a8d56abe4bc7c2c7dbc9e4 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/52d98e1cec9c4ac71c9c35c2b6e22babd17c8147 |     


Gitlab CI results for 2022-01-11
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
