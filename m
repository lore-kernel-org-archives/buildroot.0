Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28CAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 07:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D86E403A7;
	Fri, 14 Jan 2022 07:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RA8XwNwzI0NH; Fri, 14 Jan 2022 07:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C017F403B3;
	Fri, 14 Jan 2022 07:04:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 686D81BF322
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 07:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55225415AD
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 07:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tvaKtO4fAs8 for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 07:04:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB426415A9
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 07:04:01 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C2C4140004
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 07:03:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Jan 2022 07:03:58 -0000
Message-Id: <20220114070403.55225415AD@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-13
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

Autobuild statistics for 2022-01-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 64  |  7  |  0  | 71  |
  2021.11.x  | 24  | 10  |  0  | 34  |
    master   | 100 | 64  |  0  | 164 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 10
             bluez5_utils-5.63 | 7 
                       unknown | 7 
                       frr-8.1 | 5 
                   guile-3.0.7 | 3 
             ksmbd-tools-3.4.3 | 3 
            btrfs-progs-5.15.1 | 2 
      host-riscv-isa-sim-1.1.0 | 2 
                libglvnd-1.3.2 | 2 
                   libqb-2.0.3 | 2 
                 mesa3d-21.3.3 | 2 
                 wavemon-0.9.4 | 2 
             babeltrace2-2.0.4 | 1 
                  dnsmasq-2.86 | 1 
docker-proxy-55685ba49593e6... | 1 
                    efl-1.26.0 | 1 
                   gstd-0.13.0 | 1 
               gupnp-av-0.14.0 | 1 
                   gvfs-1.48.1 | 1 
       host-btrfs-progs-5.15.1 | 1 
                 libwpe-1.12.0 | 1 
                log4cxx-0.12.0 | 1 
                nodejs-14.18.2 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
               poppler-21.12.0 | 1 
               pulseview-0.4.2 | 1 
                rtorrent-0.9.8 | 1 
                sg3_utils-1.47 | 1 
                    vlc-3.0.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       babeltrace2-2.0.4        | NOK | http://autobuild.buildroot.net/results/f9ea3f142d7ccce481cfc6daa47ae641c3f11402 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/881d4d30080eeec4de252c0c06b7914ea5f7d6a8 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/eb5c4d9f8c0b915bc46f4ef8ad9e89a21b6aec24 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/e2d5ec0be1e760bb361958c6ebf1e480b900c259 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/e28801b8053e9d2a7a9609a6bbf415c17a206788 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/d79f46c3c7be7e52fa4642446b15b27a8ebdd32a |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/23bddbd290d13196c6bd0d2514353d0eb2604a4e |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/542f372a0dd342a1b22371d21ce347c0ba88a8e3 |     
  mips64el   |       btrfs-progs-5.15.1       | NOK | http://autobuild.buildroot.net/results/e0526b8591a20c5db13814fb166d459b87bb1ea7 | ORPH
 powerpc64   |       btrfs-progs-5.15.1       | NOK | http://autobuild.buildroot.net/results/b630dbd078656a974c6ac9645b2e87279ef2adc0 | ORPH
    arm      |          dnsmasq-2.86          | NOK | http://autobuild.buildroot.net/results/ecf26d37f2aefa35e584a4f23f053119b4fb4704 |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/36ebb9ace8b69120e696ccc1688c5d695125f462 |     
   mipsel    |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/03c24622c043c949ec7a743f9515f70ef9421594 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/c37813bda8f69c3b8eabd9a77f63998f0511d407 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/76372be625e03d09f3f54e613d1e2a77138cbee8 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/5bc31d1e6aab27eb7f05e32f891cf40014f8cdbc |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/85ac84b34946609895e47d435aef61f410781dbd |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/bdbaa6155ff57ab01d2b4cb52de813a1ea528b02 |     
    m68k     |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/2f1214b2af494e51874e6cfd419cd4c6c5c0d3ac | ORPH
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/696e89593e9fdaa97dd4fb192e77cf87169414d9 | ORPH
   x86_64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/b0a6143f19145b00a1023271207676255427cbf0 | ORPH
   x86_64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/c7790a1799868bd03952a69d20b2c592fd546217 | ORPH
   s390x     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/64837bf9611377fe1935c6ff4e52715b58ed75ed |     
    arm      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/9922ac2d5301db3a6e9a735078914f9f7861428c | ORPH
    i686     |    host-btrfs-progs-5.15.1     | NOK | http://autobuild.buildroot.net/results/5cba551bde76ebe1749a278497a04a6d69e7b7c6 | ORPH
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/63c7c2466b8269a2708ba6a2ad7ee11b6f03e88c |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/d1ec407d3a9106be1271e4897d6f578d501439fe |     
    arm      |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/afd519cb2bd8e4505746f7f809cf309d0ca9901e |     
    sh4      |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/9794b9a72bcdc23a60f745dfb2b783d3421dd62d |     
  riscv64    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/638c303be9fa82ccb353be6cfe2a81c0d634a1e5 |     
   sparc     |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/a204953020a714057ec6690e63a3ad8ac621acd5 | ORPH
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/1dca9af43b534c537d8ab922d40ffc1635556333 | ORPH
    or1k     |          libqb-2.0.3           | NOK | http://autobuild.buildroot.net/results/6a8c4efd591929b9b22d793cc8f6249e6ae9045d |     
    or1k     |          libqb-2.0.3           | NOK | http://autobuild.buildroot.net/results/e03782073fae2b1bde84393a73be5cbd59d67d9d |     
  aarch64    |         libwpe-1.12.0          | NOK | http://autobuild.buildroot.net/results/fdca71061eb938599e356fe6eed5f58a90d62259 |     
    arc      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/6058173d7997a5632f80f33a1eba9dec47122095 |     
   x86_64    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/e4946b1c214fa30cfc63ba41755a7fb4c4661fc1 |     
   mipsel    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/6433628db38e3828f2d37cf48ac7a19d0b6c441c |     
   mipsel    |         nodejs-14.18.2         | NOK | http://autobuild.buildroot.net/results/a510dfcc34fa12a8c0911525a1ecd6bef7402fc5 |     
   mipsel    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/ff6efa43102a56bb4b87401cd425a5241f0920cd |     
microblazeel |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/96e77ddba5042ba4dacb16b328fc298a4f00f49a |     
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/9a7d48c3bb1cafe537d6e5a2be3da8a447a80b03 |     
    arm      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/c8c8669281265d21fab8029b1f793fe93ef857b9 | ORPH
  aarch64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c5094c1088f21eccc8ce463fbf86282a19bc2bac |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/aa20d0b3dd74957cfd72dc314b9a40e449eaa6cd |     
    sh4      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/347f87cbc46f1207c9f075b580920b98338ea9a6 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6df8e78f518f912eb37266026de07856e9bb7b29 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d8a78ea616cdedd9cfd6c31da98ecf509acea40a |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/148c21e0207fef3afaaf0e10cfd5f3b50a7a4a09 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2972885ea76b1c9dc98b7d963b9b9ecb7721c082 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9a33fb68c758678843f439ee402ef8ff2a7d74ff |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/47f303c17b848d33afd9e41fe29816e18671d984 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/b839f8b4dc06ebf42fa9a75e4887cb27ca20fdc4 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8bc3414169520fe6a06297cd819c16b5fa614c30 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/599263067fbb2c334289d4899c0e7a07cc46de80 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/ec70ce7988b9e78cdecd9cba1ae4ee6de948e48e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7f7e97f14537db0b0fcbc48514c07876867a9cd3 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/95cd4e8faa4e1ca3c60df173232f39aa51cc4508 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/93cb507002b852523f29ba84bf42645d10f6642b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/60db7598fc7b80f983b97b66c3a3ea24ff8756e6 |     
    m68k     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/62a9d11157c283e4e1f26b6e0d097e40c9c5e29d |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3b4b22e0a5e5486b444cb0bb835c08f05255fa9b |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d5f88660cbc0854b6690e004e3c409038224f971 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
                 libcoap-4.2.1 | 1 
                netdata-1.21.1 | 1 
                 openal-1.20.1 | 1 
                rocksdb-6.13.3 | 1 
                suricata-6.0.4 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c415a502fc2672528a1a8ba1c62591e9d8ff1a17 |     
  riscv32    |         libcoap-4.2.1          | NOK | http://autobuild.buildroot.net/results/f775ea0d8062da0707cd64ba851a8cd2f87a5de8 |     
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/845e6fd2797d85cafae5bdb2fe8074e3714d7d66 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/13b16d0e88dbd87ec34e5413caa22c0cf320b0d9 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/790a270c6ccd2d4f5cf0dc329733e62124caddfc |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/0c02128071d73b026f8f23bd6f4837689946c1d3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8677a4bf0f00e7a87538fd0d2488fcf681d4c2f1 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 4 
                   libnss-3.73 | 2 
                 libqmi-1.30.2 | 1 
                  ndisc6-1.0.5 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0308d2757a677fff4a8880b239cd7f6183b87b1c |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d02000b72a5855239d7f2121158feb7c9b81edb4 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a54f1533f81ef29e8eb65045eb6ac68d6ce92ea3 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/58f5c33e930a614dfc120e07f83cbc6af284de0e |     
    or1k     |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/2f8ad346f317dbf8f3370e3e9707be29fb26e872 |     
  aarch64    |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/53189d7bef3601bc8a118697aad08135565d7174 |     
   xtensa    |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/78c6b80c06f17ffffefa50ab0615295468705512 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/4e5db1f5be1e0a1864f0246de502dff1d4b1f0bc | ORPH
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4e40ba10f6039e674e2cfdfa5d9b1c112d12d749 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3a94ac6f9bc57cd71979021b423af71dc1f4a4c5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
