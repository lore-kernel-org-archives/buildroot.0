Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F65AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 07:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2DD260AC5;
	Sun, 23 Jan 2022 07:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-3qPz8BJXmd; Sun, 23 Jan 2022 07:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8525B60A78;
	Sun, 23 Jan 2022 07:07:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAAD71BF3F9
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 07:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D0874040B
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 07:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqiWh8euqvfa for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 07:07:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E05EC403D8
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 07:07:43 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE16B240009
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 07:07:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jan 2022 07:07:40 -0000
Message-Id: <20220123070745.8D0874040B@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-22
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

Autobuild statistics for 2022-01-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 60  |  4  |  0  | 64  |
  2021.11.x  | 14  |  6  |  0  | 20  |
    master   | 101 | 53  |  0  | 154 |

Classification of failures by reason for master
-----------------------------------------------

                       frr-8.1 | 7 
                rtorrent-0.9.8 | 4 
                  rygel-0.40.2 | 4 
             bluez5_utils-5.63 | 3 
      qt5webkit-5.212.0-alpha4 | 3 
               apcupsd-3.14.14 | 2 
              cryptsetup-2.4.2 | 2 
                   guile-3.0.7 | 2 
                log4cxx-0.12.0 | 2 
                 mesa3d-21.3.3 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
android-tools-4.2.2+git2013... | 1 
                    bat-0.18.3 | 1 
                    bird-2.0.8 | 1 
                    efl-1.26.0 | 1 
                     file-5.41 | 1 
               gocryptfs-2.2.0 | 1 
                 hiawatha-11.1 | 1 
                   i2pd-2.40.0 | 1 
             ksmbd-tools-3.4.3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               mongrel2-1.13.0 | 1 
                    mpv-0.33.1 | 1 
                nodejs-14.18.3 | 1 
                 powertop-2.13 | 1 
                qt5base-5.15.2 | 1 
            resiprocate-1.12.0 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                    vlc-3.0.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0a6f8adfb3039c0c9fd99c61ae9335c86204e592 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/84e23aad4a3e13a4e3c8b07b7193d6535f59c1c5 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8ba769e3f6be20b97df09f53b552dbf0d10f0090 |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/faa0a158234bb964597e5d162b12afb9e7235049 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/fbcedf65e737df700dba9a2d82b55329d90010eb |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/88ee3923c06c9b54784fecac9c3faf54327bf858 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/a640a352551806ff7207c17d8a0f9b0d0d7584c5 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/a5e186b98e2a9d905f331381de92bbc4ea39c7c9 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/77cc2894c7d3548cb44d2336e093664eb7205cdd |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/aa465580924e321eb3c8c79d62d6de22c41e14ef |     
   x86_64    |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/7e80d9bf86e33096111895f5ae195dee97112b8c |     
    i586     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/0ef268f01541c3ef40d5570a443fec9dbd61c62f | ORPH
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f98ab172d0b62ac2fe9f990c3a22ed5513973887 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9431a7ec2667c6a50d6cfd2bd9e45e2eab3b2f29 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f968fbfb8c2956aff26f8c10bcf182a9e2ee110e |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/4b83d98fa89269e04079af73a6c2bf7d5d3afe72 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1480f602385577c1c18b46c7ca8ad37f04c8c78e |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/b59b5d8df58511dd297ebf8852a796e11e0ff765 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/646255d669197b0731189f5249d08b3d6f799038 |     
    i686     |        gocryptfs-2.2.0         | NOK | http://autobuild.buildroot.net/results/6c322f7b3236f615d0ca56244ca028c40bbcf2ca |     
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/4664aeac00cf7ea2bef754a06f1376fdb6683430 | ORPH
  aarch64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/b8a07851379d892ab831dd28ceb0a279d5eaffd9 | ORPH
    arm      |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/3ef4ef1284d4bd1bfaf516f0879143082da303db |     
   x86_64    |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/733c8f2e0ec561db66559ee461ba3c38df3b614d |     
    arm      |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/758390c38868d08facf7bda4b13150986fed59ba |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/cacf3dac9a94c04cdeb627388fda01a4f24e594f |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/41c84dffecb093cb6fc8ccaf79fbb08f499184c8 |     
  powerpc    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/7b396421cd587b7c527e4cce895d094c18e96719 |     
   x86_64    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/9850737277f777d4aa5746164ac20710cf417ad0 |     
  riscv32    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/df730ebb102a6da14e3b3c133e383e1f7db47aff |     
    arm      |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/623b7c94b8f36cabe08fb7f152edeb8ac318eac4 |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/51ba392394a98cbe90dfedb0b227ccf57c95d2be |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/7645900c4a5a184d099063e64aff04fff20e5b49 |     
    or1k     |         powertop-2.13          | NOK | http://autobuild.buildroot.net/results/35dbc51e5bd6ec25fec1d553e59925bda0340b1e |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e7c685744b1f1bebb7fec9835bda534a72b7b7c2 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/7664afd0545f4f60a777269ecf0e5232dd126589 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/24e734291d594933bc89003863333c17c2684479 |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/1e86a2743d840ef2683d02f94c9af39472693332 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/e00f28b7c00e5fb71e9cef436c91ed6b2adea043 | ORPH
    arm      | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/40430733edb30a5370bfea9c270c33672231df57 |     
    arm      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/f54ba9169baae8740102b203d8091d0f465fb6e4 | ORPH
    sh4      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/66a98d8fbc081f7013fb5839d525b4fd07ad0f07 | ORPH
  powerpc    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/1dd0e246b6ea7dc0e232bd98921740fe31f7bcdd | ORPH
    m68k     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/a3d9078a0e139ef03a700ef4c8b0ca8bdeed516b | ORPH
powerpc64le  |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/99175e25fde107668c0e13fa34ac9c875b2477bb |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c9d53823e696be079d54f1ec736606bf336fdc58 |     
microblazeel |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/481f477e81dc8c7d36ce810803d2ba1ccb0eca6a |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7ed9dd22399ed7c4cf03027343baf3ad52c3cb84 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/edaf3348d4cf28b7aa43084f92d51c1d381ec0c6 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e32b11f232a58a977093a23da1f4a2ff072c29b7 |     
    arc      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/843709019c8ed7d280de9818b38649f480f14984 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/50f90e8dd634bd295c51dcf11e85129f40339db2 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9e5c93f198ed84d4d4b08ff00c1cac2a79e10860 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  gensio-2.2.3 | 1 
             kismet-2020-12-R3 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/058ed8e9d50d1ce27b32a2b2148b22f0f6be4ecf |     
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/5d5cdeba409da4195953af8943524865030637d5 | ORPH
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f53e3c29709406670df21c48347d20ac5ff99c9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f399b238ff5bcf0ee0bf4d1d89ecd15c60867ddf |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                   libnss-3.73 | 3 
                log4cxx-0.12.0 | 1 
                rtorrent-0.9.8 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/3cfc0d6099af195822db9c75ba7396b87ca759ec |     
    arm      |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/2b1f0ae9f8d1b90f326f88b9ff1c9c88eaa0c5d0 |     
   nios2     |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/e48e05026a6f96ea34f4c0b1fd2b6ac9d1fca2b5 |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/fef786fbc6f7235425faf6d84ebd546171f18f41 |     
  riscv32    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/43fb1c983d29929f217fdd65458d3c06c65883be | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/09550611052bbee402c81ee7ec9283753aa0f6ca |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
