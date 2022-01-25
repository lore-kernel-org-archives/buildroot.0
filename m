Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219C6C4167D
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A3A1400FB;
	Tue, 25 Jan 2022 07:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9WiDVpKBsAs; Tue, 25 Jan 2022 07:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E395401E1;
	Tue, 25 Jan 2022 07:05:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0AE1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09FA6401E1
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtDjSVhpxWnA for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:05:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6212400FB
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:05:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D6EA0240010
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:05:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Jan 2022 07:05:39 -0000
Message-Id: <20220125070545.09FA6401E1@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-24
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

Autobuild statistics for 2022-01-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 51  | 12  |  0  | 63  |
  2021.11.x  | 24  |  1  |  0  | 25  |
    master   | 91  | 43  |  0  | 134 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 11
        host-util-linux-2.37.3 | 6 
             bluez5_utils-5.63 | 5 
                   guile-3.0.7 | 3 
                       frr-8.1 | 2 
                log4cxx-0.12.0 | 2 
             util-linux-2.37.3 | 2 
                    bat-0.18.3 | 1 
                  cairo-1.16.0 | 1 
                   gvfs-1.48.1 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libplist-2.2.0 | 1 
                   mp4v2-5.0.1 | 1 
              netopeer2-2.0.35 | 1 
                rtorrent-0.9.8 | 1 
                sg3_utils-1.47 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/56dc103362e7ba7917c97b8c172476db72cf3232 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/593b9029a08436b850ff6af87517ac195c4d5fa5 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/85593d26a76835d2ca4e6accb1d7b83ad1e9098e |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/be6fbe69a6efe464ff156835f8ee27f59a911c16 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/f39dcea082bec2979cc56ab2547e51f33bc8e6fa |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/d2b7910bbd1db5339dab4759ad1f2f2481778a83 |     
  mips64el   |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/66a50dc62e5818bfdcf0d0ecd4f599d0183d778d |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/610682d7e5c3fdcde06700828767fd67ec14be9f |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/af9e1c0d391f6e9998aacd5f00474e85c50247fd |     
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/25c3e9577a85ae30d76d3b5f6cb29805ec09a2b9 | ORPH
  sparc64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/c2d566c5d5decfc699315c6e9a57e9e0f3cd0e99 | ORPH
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/250814848233f66b7311d3a3eaa7f831e8c0c9b0 | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/ff4a829741676dbc501b70b3f6216fdc0182fcef | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/6e9bbd6ff1156fbfc79470a45672a0cd3da9a61a | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/43a1e376d2886b218b32a7d585132bac82181b31 | ORPH
  mips64el   |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/768cee9e747a008aaf42c434b0317f2ac0e3d180 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/e68e5c2600663668e62fbb85c859a97ed47843e8 | ORPH
    sh4      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/f18662c2064231bcf78d8438cce8bc0c9c261a52 | ORPH
   mipsel    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/27d4aaef1fcffb51fa82b6ad6b0fe303a6d7be33 | ORPH
  riscv32    |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/0267ff54ee82d853476ff7d6b14edb4aba308aa2 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d0daf3dbbafc6b86bf89a6fa26c14d3fe9c9dde1 |     
    or1k     |         libplist-2.2.0         | NOK | http://autobuild.buildroot.net/results/529846d9f76d810998315fa45fbffa5107e20aab | ORPH
    i686     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/65cc4ffa5be35e74ea4e2616373cce49056b1072 |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/e40cc85013721d5812229009490476627e83d0a3 |     
    arm      |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/e5e6a7c2bd0cee79cb13135fe68cecc08ad96feb | ORPH
  riscv64    |        netopeer2-2.0.35        | NOK | http://autobuild.buildroot.net/results/0660a4f767d5cdaf07b28a508101b87f0300850f |     
   x86_64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/846a91e5aeda960af08f3fccf58049c24da91a15 | ORPH
 powerpc64   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/12ebe83d6b2bc4f07b708f13489c9980e7eae705 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/42887b48e05f7fb23f80745852c3903efcea39e5 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/40b25b1c93ecaf30d91a6ad2fb434d6b494a965b |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/bc50609b429692c52e2983d44efae19cf61bcd31 |     
    m68k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f94780f625aa5e81d49cbbb894495d69d4d71d1b |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/bc8104f65deb54eeca8762ec99dce8c5e3a93fbc |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/4ae504a3ef8e8ff42d9eef6aee27e3a376583147 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/09e19e36823e78a75a1824040f6f52a67ac72756 |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6eb39050d7ea2e8b0b1910f4cc2c35cf6e7dc5a4 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7eaec1554cd5017651b31ca2dc875f9c2617ecc8 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6db5ee4f3bb6cb19bf24056ae694be17b67f9f83 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/e84e1201748035a05e2d0c8f95069d7c64816c2a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/5f75cc4a1f13ee5de46910841beb66fa188b312d |     
   mipsel    |       util-linux-2.37.3        | NOK | http://autobuild.buildroot.net/results/30285d1da000de87d8ffa514eef957b2e15037ce | ORPH
    arm      |       util-linux-2.37.3        | NOK | http://autobuild.buildroot.net/results/c2edca241e754566add0fd6b3f049c7945723cfc | ORPH
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2b564613e240e6105f64307cf2327d8403a8678c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.2.17 | 1 
             kismet-2020-12-R3 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/7b38a56dbc1705092efc8e1386e6f6119e8abd95 | ORPH
    sh4      |         haproxy-2.2.17         | NOK | http://autobuild.buildroot.net/results/a8bd3b93c475e8b6213fc0c6276fc8b34fd6b567 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0d9aa01ccf7dec1833c2c27d561ae527f4b0c31a |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b3e810f0c7228b51e8a24b7ecccb867affaddb30 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/76a0dab1ac3d841c2d7fa5d31ec87b129b9b10c5 | ORPH
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/11a18e5ce6ea4870dc027f16e1ca4e083cdd1fe0 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ef5af7fcb50bab30eebae6758109c34909765274 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/75c7c6dc8a587f076246c765c0a7c1e0d63efaf3 | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/36d0072d9870cf18604e504a445e7aba521edc8c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/409c59df06e8ef7a7f8ed50a9132d4fe9a63b06d |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/6159ee6b20e4253db3bae72a3e4cd61071792fb0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/af487bfa353492104c28a3d8686c6266843f81f5 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                   libnss-3.73 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/e02c7a0e22d8eee226e5c906537f7dfc559e067e |     


Gitlab CI results for 2022-01-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/2006799239  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/2006798984  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/2006798997  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2006798998  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2006799043  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2006799132  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2006799133  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
