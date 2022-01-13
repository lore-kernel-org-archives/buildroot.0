Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4401C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 07:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D13A8190B;
	Thu, 13 Jan 2022 07:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJ-1wzGV-xwE; Thu, 13 Jan 2022 07:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2438C814B4;
	Thu, 13 Jan 2022 07:11:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 568ED1BF5AD
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 07:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 371F0415E6
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 07:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0YRmPBfEt9Ot for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 07:11:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B128D415CA
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 07:11:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C6B7EC53C3
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 07:06:49 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2F6B4E0005
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 07:06:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Jan 2022 07:06:44 -0000
Message-Id: <20220113071133.371F0415E6@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-12
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

Autobuild statistics for 2022-01-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 62  |  7  |  0  | 69  |
  2021.11.x  | 29  |  8  |  0  | 37  |
    master   | 111 | 50  |  0  | 161 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 6 
      host-riscv-isa-sim-1.1.0 | 4 
             ksmbd-tools-3.4.3 | 4 
                  polkit-0.120 | 4 
                   guile-3.0.7 | 3 
                    vtun-3.0.4 | 3 
                    bird-2.0.8 | 2 
             bluez5_utils-5.63 | 2 
            btrfs-progs-5.15.1 | 2 
             drbd-utils-9.19.0 | 2 
                    gcr-3.40.0 | 2 
                 samba4-4.15.3 | 2 
                    bat-0.18.3 | 1 
                  boinc-7.18.1 | 1 
              cryptsetup-2.4.2 | 1 
                       frr-8.1 | 1 
google-breakpad-7515ab13768... | 1 
       host-btrfs-progs-5.15.1 | 1 
host-gobject-introspection-... | 1 
                   libqb-2.0.3 | 1 
               libupnp-1.14.12 | 1 
                log4cxx-0.12.0 | 1 
                 mesa3d-21.3.3 | 1 
               pcsc-lite-1.9.5 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/c2dd780f4b0b7ff7fde3289cec4ffc2ed254f72b |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/d4cdcb7da3c038a55d306c2ac5621e40beaf4ae4 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/072068f83a62630eb9ba79312b1960b5c459d32e |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/c918b7e9ede9545749f958d33b2f79bde6b7c30e |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/ca37e3f96909f2f3da5d2a54fd3d5783c06cc9c0 |     
  riscv32    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/62160c222a5cc38d728b9d1cc177dd39ef602032 |     
  mips64el   |       btrfs-progs-5.15.1       | NOK | http://autobuild.buildroot.net/results/30a96db548b53d14c38b8d368bb252ed74e30d4d | ORPH
  powerpc    |       btrfs-progs-5.15.1       | NOK | http://autobuild.buildroot.net/results/13d570c7318f2ad7b05c2fb196f04ecb86f1bcc9 | ORPH
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/c2abf60c045c69c7ecbc71df19348de6b3e10139 |     
    arm      |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/307780e79cc4c95a19562cebe91b2204bf9bc970 |     
 powerpc64   |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/1968724aa0b3d9560c877329f7a12fead1fdf0e4 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1e467d0960206b56a33c0a108e0e76387db09604 |     
    arm      |           gcr-3.40.0           | NOK | http://autobuild.buildroot.net/results/cdd5c721544d6f07c51be536e414fa474f4b907b | ORPH
  riscv64    |           gcr-3.40.0           | NOK | http://autobuild.buildroot.net/results/8cecd33d7772b19d60f70a097dcb1623bb3ee7de | ORPH
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/2de13e5fcb9e08ee53f9a2a9907f5c9ea03dad23 |     
  riscv32    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/59715e297ef705b72ca20684f466ab03a86c707e | ORPH
  riscv32    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/7ec31a52659ea37af7f3d118787914fd4e7a6b25 | ORPH
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/ef724481d44f43539055260af795dd88a6f86f28 | ORPH
    arm      |    host-btrfs-progs-5.15.1     | NOK | http://autobuild.buildroot.net/results/e1efb2b9038858df20ecfb0a91eb5519683b44c3 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/95e4a23c16f6bd96566dc497663f38a0858c5a6e | ORPH
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e9658a6cf9feba9473ec3ed1225974bb83feea42 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6339da1618a1b0fec3888c7a5e21a2a07adb6e4b |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/d35ff4a0ca0a8463121d717a9727e0d863ca83e8 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6c67db526d31c7e4c31515068d7fa0fc9cc6e72c |     
    arc      |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/73f3b0d74835ac6e20898f7c4cb69e1f6f4a2e9a |     
  aarch64    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/6932c83e2459176d37397b9aadd7679f56497c19 |     
    arc      |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/3a38fbfaa719860d230d6687f25941202bf3317b |     
    arm      |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/3da7ce45b3db98dd81ba41ffd097820b13640f8a |     
    or1k     |          libqb-2.0.3           | NOK | http://autobuild.buildroot.net/results/bdd35eded20f61261a98cc50681dac3ccdd3cf53 |     
    or1k     |        libupnp-1.14.12         | NOK | http://autobuild.buildroot.net/results/6448543da06072830417181a49c6cf52f131ffbc |     
   mipsel    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/820b1be882335481584f5d57b3490eda978e3107 |     
   mipsel    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/e97ad48f20a325f5757754a8be2bdb613c86e4ea |     
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/757cbbbfeddd460bce6f86c1f2f27eea0fcd53a0 | ORPH
   s390x     |          polkit-0.120          | NOK | http://autobuild.buildroot.net/results/70243c99f84c4a663ca3d8823572abd97bc53b79 |     
  aarch64    |          polkit-0.120          | NOK | http://autobuild.buildroot.net/results/e03385e21f905785a07c105e78eb8a91a81a9819 |     
  mips64el   |          polkit-0.120          | NOK | http://autobuild.buildroot.net/results/b2d2b27844b32b3609e11005966d85dc0dfb7a9f |     
  powerpc    |          polkit-0.120          | NOK | http://autobuild.buildroot.net/results/0de79cd0ba25fdd466f5a27d9de3645d99d3632d |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/743c25004421363ec79cef28640c3ee636a6bad6 |     
powerpc64le  |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/dcd737a4cb315e4bf1525b9b52fa3727befcdc4f |     
  riscv32    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/db011d6a124817bb603d33a6b4571046abf84bdb |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/20a99570e9df86173074c6f8f6b1fe244540d755 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/31ec8edadd25f2cfec66b7ef02423fff6a3b699b |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/eadf56f38dfd0e6c8242c957d0eedcc5a4ec2433 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/e6038719a8a4276ef7e9d3a68699911b37de28d8 |     
    arm      |         samba4-4.15.3          | NOK | http://autobuild.buildroot.net/results/5417abef2b9aa14a01400f48fb308519c618a94a |     
 powerpc64   |         samba4-4.15.3          | NOK | http://autobuild.buildroot.net/results/c1e2ebbaec6e6871d6e2ea2222d6fb9c79187c4b |     
    arc      |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/1f710e331e32c808796fc524f844d636d7de1746 | ORPH
  riscv64    |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/3ee8f9ee55e51af38e9dbe7b9840c9589d88a30f | ORPH
    arm      |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/bd8dda42fb51c821d54742488d088e9bf144604e | ORPH
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8518113229f7e0c0af978246d57638c19fb53474 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

             bluez5_utils-5.62 | 1 
                   cegui-0-8-7 | 1 
            erlang-jiffy-1.0.6 | 1 
        glib-networking-2.66.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-20.3.5 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       bluez5_utils-5.62        | NOK | http://autobuild.buildroot.net/results/68ed580fdb328e3d83a53fa131bfc77362afa5dd |     
  powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/c25526ee0b8fef36a36d0b385617519e27803208 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c4315cf66a4f247804e44b2bb95a972b85825495 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/60c996364269a0f6a14d6c34a8b9ae521c657203 | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/afc061bd98a0798ac8d3365fc8d26acc95787d9c |     
   xtensa    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/581273576b75f2c89b825b1fa78b2e6565c53806 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/a6d57724d0b5e4f8ddc1b4a7549d6fda59d91091 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 3 
                    bird-2.0.8 | 1 
                host-go-1.17.3 | 1 
                   libnss-3.73 | 1 
                mono-6.12.0.90 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/a4e9fc5f8cbc0eddb16f3d32507b95ea764ba9cb |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/de56a02b34e8ba5598b3a3139c0a1568c1726b5b |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7ce1e639b4eb17b0d8fe1eb00887fc49e4f77836 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4ca3501d84a9840d155f0ef6d7403d1595e0faf3 |     
  mips64el   |         host-go-1.17.3         | NOK | http://autobuild.buildroot.net/results/8f815942d6c927e69d9dcf23b00d54b1706336f9 |     
   x86_64    |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/787e66fd3f2c6ff68ab7d3b6fcc23894e6362405 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7785ed0d745a74fb290fdd34715c9f93baf91532 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/58258163b8488ed83af381fbb21d18357474247e |     


Gitlab CI results for 2022-01-12
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
