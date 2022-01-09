Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1FAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 07:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A862081417;
	Sun,  9 Jan 2022 07:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_XFKwUJWrAC; Sun,  9 Jan 2022 07:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B39681418;
	Sun,  9 Jan 2022 07:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5D91BF473
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 07:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5796960A93
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 07:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5zWzx035dVD for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 07:08:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAB4160888
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 07:08:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D18841C0004
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 07:08:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 09 Jan 2022 07:08:08 -0000
Message-Id: <20220109070813.5796960A93@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-08
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

Autobuild statistics for 2022-01-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 59  | 10  |  0  | 69  |
  2021.11.x  | 26  |  2  |  0  | 28  |
    master   | 114 | 53  |  0  | 167 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
                  rygel-0.40.2 | 7 
                       frr-8.1 | 4 
          gstreamer1-mm-1.10.0 | 3 
                host-file-5.41 | 3 
                 wavemon-0.9.4 | 3 
       host-btrfs-progs-5.15.1 | 2 
               poppler-21.12.0 | 2 
                rtorrent-0.9.8 | 2 
             safeclib-02092020 | 2 
               apcupsd-3.14.14 | 1 
             bluez5_utils-5.63 | 1 
                    efl-1.26.0 | 1 
                     file-5.41 | 1 
google-breakpad-7515ab13768... | 1 
                 hiawatha-11.1 | 1 
             ksmbd-tools-3.4.3 | 1 
libcamera-40f5fddca7f774944... | 1 
                  libest-3.2.0 | 1 
               libupnp-1.14.12 | 1 
                log4cxx-0.12.0 | 1 
                  ndisc6-1.0.5 | 1 
               pcsc-lite-1.9.5 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
         rabbitmq-server-3.8.2 | 1 
             tpm2-pkcs11-1.7.0 | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/89405f6a1516c8eb30cba204753113d635c12db6 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/5cb75bd1fe0e21c53db9fe092d59d392f85dd933 |     
    arm      |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/748bae634f8f968447473efccfb9546d20f435d6 |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/9e7868be00f2cd18205b2ce664be95f8b9e2b063 | ORPH
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/b6afa559edbea07a73571d84cb6733f07c2fe234 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f2c10861616442974e441f6315a813d93297a2b5 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/a901769c168d704b30ace5be43f9cb8ce4d34502 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/2b4c58ec3fb0567de0fb334a24f86b6815406fb4 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/f923a7262425961343dcca992007458b2ec7746f |     
    arm      |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f55df28f1b7174f7606a75f00090334541c0873c | ORPH
    i686     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/cba0f064628ce842ac21aacb60aad767fd62440c | ORPH
  riscv32    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8dd0ef5864a66a4b13819c855b6b349d3db840fd | ORPH
  aarch64    |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/51f5c021e8e67ffba1a0d1e77db5cb1dd6ea0474 |     
    or1k     |    host-btrfs-progs-5.15.1     | NOK | http://autobuild.buildroot.net/results/03235edd829436d784a9b214050cc97584f372fb | ORPH
  powerpc    |    host-btrfs-progs-5.15.1     | NOK | http://autobuild.buildroot.net/results/3677d943d048915c0fcd81ab9666dbf792962f4d | ORPH
  powerpc    |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/47c7d17c343dec2a8a534d15f44f53ab3aa06f41 | ORPH
  mips64el   |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/9573e8b01d8f21cd89a67475daabdeef533d31d7 | ORPH
    arm      |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/c35b141140c0bd600753b9596482ceeb1935e49f | ORPH
   xtensa    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/a1806b5aede0c92ff13b4846157dec654abe217e |     
    i686     | libcamera-40f5fddca7f774944... | NOK | http://autobuild.buildroot.net/results/3155e9c22d3789efd16724e9d0098909c6be4876 |     
   nios2     |          libest-3.2.0          | NOK | http://autobuild.buildroot.net/results/5a12f1cb4153834078522b6068ff24ac0300d51d |     
    or1k     |        libupnp-1.14.12         | NOK | http://autobuild.buildroot.net/results/585ea0a093280a522b5aaaf0947b9d4588815eef |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/be07b31f6b8ecb49921be154a30aab3721cce94a |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/ed78a5c7621b324944fc2121306844127c7a95a9 | ORPH
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/ba29ee57ff8a329c05f7a29a97a18a9768b6237c | ORPH
   x86_64    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/67102ac2716b3cd19c092fe6381dea035a213a12 |     
    arc      |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/9610685ab49a9739a8cc4c748da64d07647c4668 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/eefcf9badadbbec8c756c8161407f51f421bb7ee |     
  riscv64    |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/e6c743af815948f90960e294a615af4294bead82 |     
    i586     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/98e698ce57ea85737fc72322d036a76495dda75d | ORPH
    arm      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/30e60c354c918acbcec23ccb74b8a7d3ff1fce1d | ORPH
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/910b583f1e2007c19ccc9470e98bdea4d32e2440 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/1f7ca12def09125503898d95c11ddb8cbeec6f0b |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/42319fbb0a43f2473127447ccc4b3585b5b53b3f |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/830608ff93a7bb3600de3e6ffabd1dfabf880867 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c02ec04c71a4c1c3d67666a9a6f267b1987f5feb |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/45396bce4f40bf01d21c044be0ba4384bebc97c6 |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/5f99e3fde4402e1324e5a453396c71c8608420b6 |     
    m68k     |       safeclib-02092020        | NOK | http://autobuild.buildroot.net/results/a481ee2d26a094358b0298617cce691be3077f22 |     
    arm      |       safeclib-02092020        | NOK | http://autobuild.buildroot.net/results/fc9e4dd08b653af1fd988323eb20293d5dbb579c |     
    or1k     |       tpm2-pkcs11-1.7.0        | NOK | http://autobuild.buildroot.net/results/51009a0e648813833f5102ac3f9ab8979ef91929 |     
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/bf78e4be9b9d9ca7d32f922d72ea6cd39a78d3d8 | ORPH
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/e32211fbfbbd5b614f582d12b988d48a69ae85ca |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/234779f7136c72af997a09d61b9201762834b1e6 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/60c7eff8810c4d0bc057cfabed2e0311dc860ee9 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/ad8691bef1cbe03de2ebf7574105948d103a1ec4 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/4abea4e63c0a9244a8aa22e3d2cfe48dce877540 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/093729bba8788bd4cbe33fd7a651028d6a23c485 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/3b71087f743d4d0b23eb4ac52cd741eba0370d87 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/41cabe55edf3c0e8321f77066a47b454d5ef8caf |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/776f0bbdae9db3dd940f4b29858c21c9fc325e32 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9486bbc10ceff9fe9a3de00dcbc280b14de2433c |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0dc3298e1125708cafeb56dd95ffcfd035ea2ca3 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 2 
                  ndisc6-1.0.4 | 2 
        glib-networking-2.66.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-20.3.5 | 1 
                 openal-1.20.1 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/fd6dc9122a2d6d88afb92d1ef0f193b98ada3522 | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/55b24023a7f28af397499b4f8e33a67d889b6d07 |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/a85c36357e364c6370e76b7ea5e947c6099520cd |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/92c5e7a376afe3161f330b2e2267b1bf89f9d7d9 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/623c67cb53a1b62f7d3be9616936127cbbbd2809 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3d641651e7b4a869461d02eff169df1b5bbe9d6b | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/90c75c76205cd84d72c4d527cea8dca41a46c330 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/012d4bd6c596593389650457bda967e7c9eb7293 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/09d43fc0bd1a8df8b8a4ae740836213149df3991 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/4ef4f5e434ee4a52c508540732cc50f2a6a0f747 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                   libnss-3.73 | 1 
                 libqmi-1.30.2 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/ec1be36aea617d496b21c92d18593b9675dc8b18 |     
powerpc64le  |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/e17210a5131de2ad56fe539944e39bba02c05847 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
