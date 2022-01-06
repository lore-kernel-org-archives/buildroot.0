Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16137C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 06:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A736B60C13;
	Thu,  6 Jan 2022 06:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJvf5M1s9KxW; Thu,  6 Jan 2022 06:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A383560F38;
	Thu,  6 Jan 2022 06:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCE061BF215
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 06:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F5340291
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 06:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGkoH80p85Ih for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 06:59:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D25DA40139
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 06:59:34 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 90DE31BF203
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 06:59:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 06 Jan 2022 06:59:31 -0000
Message-Id: <20220106065936.D6F5340291@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-05
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

Autobuild statistics for 2022-01-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 67  |  6  |  0  | 73  |
  2021.11.x  | 29  |  9  |  0  | 38  |
    master   | 99  | 64  |  0  | 163 |

Classification of failures by reason for master
-----------------------------------------------

                  xxhash-0.8.1 | 12
                  rygel-0.40.2 | 6 
                       unknown | 6 
                host-file-5.41 | 4 
              cryptsetup-2.4.2 | 3 
             host-libsepol-3.3 | 3 
                     mdadm-4.2 | 3 
                       frr-8.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
             ksmbd-tools-3.4.3 | 2 
                suricata-6.0.4 | 2 
                 wavemon-0.9.4 | 2 
android-tools-4.2.2+git2013... | 1 
                    bird-2.0.8 | 1 
                    efl-1.26.0 | 1 
                   gstd-0.13.0 | 1 
                   guile-3.0.7 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
          libmicrohttpd-0.9.75 | 1 
                 mesa3d-21.3.3 | 1 
                  ndisc6-1.0.5 | 1 
                nodejs-14.18.2 | 1 
                 opencv4-4.5.5 | 1 
               openipmi-2.0.32 | 1 
                   qpdf-10.5.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                rtorrent-0.9.8 | 1 
                sg3_utils-1.47 | 1 
                    sslh-1.22c | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5c34c4db4122594d4a33b42f2ab29b0005f45f26 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/7c873e00ecb154ebd7070d31554e2ad908dddf95 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/8fc16173fa495b4c9536f285da8c8fb0180d80c0 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/338d49a38f9ae0e1c587925569383b1273ecad5a |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/69d83271fe06cf82ccde27d64c8b947e3b888fc5 |     
    arm      |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/249e485cf93135e0bc48b4fdfea9daba9cbacf72 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/031511608153e3f52494ce709f73dc4d1c52d71f |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/a4285d79815ab441bda9058e47846e19867f8719 |     
   xtensa    |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/7a9edf71a709c51672b8756d997bce4b6970822e | ORPH
    arm      |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6ab28825a1844358670fef8235ae50afc9e01359 | ORPH
    arc      |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d4e9a50b64c6f2768cb23feab188bae50d7caa77 | ORPH
  riscv32    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/0447ecb4b424ccea38f004851b9aaa36a465596e | ORPH
  mips64el   |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/f9427462f1cad39a71827ee1be6fcfbd25543d00 | ORPH
    arm      |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/64e3f0bebaf4b5b70dc6c4a432d48a10d7350b8c | ORPH
  powerpc    |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/841777ac25cd7d928f16a88eb839ba3712d256cd | ORPH
    arm      |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/95ac0e73e3269cd917885d9e76b5d185dfe4fef6 | ORPH
    arc      |       host-libsepol-3.3        | NOK | http://autobuild.buildroot.net/results/77f1a65462748e78b3394587c995f2ecdad303e3 |     
    arm      |       host-libsepol-3.3        | NOK | http://autobuild.buildroot.net/results/fc727efc0c658aaae55c83632a91af83701f0c49 |     
microblazeel |       host-libsepol-3.3        | NOK | http://autobuild.buildroot.net/results/cc560919755e4559bfc01215deb8db65833c7d5f |     
   xtensa    |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/33783381177cf57abee850395f1c17b4767b2c48 |     
    arc      |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/adc2a5095cbcd5fc9736b52976fdc0cfdf7efe3a |     
  mips64el   |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/fa88c5bc1924dfb352d9b8dddbb7fdbb192a6b07 |     
    or1k     |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/1320dc178f0170b42e4c861247d4531ddcf270d9 |     
    arc      |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/2762e8729ea781cd659de23b7946a9eda09a45af | ORPH
    arc      |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/d7bce4874987695cabf3961db2294f2119000912 | ORPH
    arm      |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/c0f216b7aadb794110409d03dcef7fa58e833cd4 | ORPH
    arm      |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/20469984be330dc93d2873f540a5145e923facd3 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/1a48a65f0eba63e25bc654104f5b608e60921630 | ORPH
    arm      |         nodejs-14.18.2         | NOK | http://autobuild.buildroot.net/results/37d59def2590726853c9a107eeb4a2bb8a9212da |     
    sh4      |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/8b2e99ed2866fa85b388d8f86f036b7fa0b7f1e8 |     
    arm      |        openipmi-2.0.32         | NOK | http://autobuild.buildroot.net/results/d2fbfce984930d2ece1439a3a2b97afafb16859c | ORPH
    m68k     |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/b5eff0f523334c9f34b02a418a172d1eccc536a8 |     
   x86_64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/e94357924c031ab677863edfdff7117ae0c83275 |     
    arc      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/10fc9016013931c58238240216c5950b23b56b30 | ORPH
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9f2b3adde62b0bd4135d9c6a41549374de11c81e |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/3ddba8cce20a209f5da43ea75cda6deef9fa3669 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f941a1a06d7a63dfeb397dbaf8d1b22bfda816b7 |     
    m68k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/1986ade783dd8ebc5ec9bf7ea6d07cd91b74095b |     
microblazeel |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/1e9c7f5fe117e84a33b704a3cbdfdeb8bf8cb281 |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f9434eff4f7dd913bb076d313556d7ce388ec09d |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/ede0b87fc571b6ab5fc7820cfd4fb937258db160 |     
    arm      |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/a99a0291d59cbb38f78e7715b817879b830f7bb9 |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/ce5748005ab564f01ca853a91ab8345934ad7965 |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/9e6c249aff2f887be495f7b07cf0d33378325f62 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0bfc0eaef4318b2bf4ca6acb8aa491d8a5a29853 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/41ba220cf5578da9a2dc620947a1292bf02e736f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b5f9b92e82b80352fedb84246879291559f0a8a4 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f43f75390ed13fdfdafea281bf2de94f78b6a202 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4f05c462c7633d2ea25f3bf91f9e9d81505775d0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/10e3df5124bf128dc5dad1d346dfa26770622c1d |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/97e2c5112ca99b4935a25cf457650ba0ff5e205c |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0bf79e6a0699faddf3a95bf8beae7c1fd73fcff5 |     
   sparc     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/1927d514c2b2607b835b18710881f3d9eca8b151 | ORPH
   xtensa    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/118ff013af46c984c9886590c37a58343524f2b2 | ORPH
  powerpc    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/3d924975ad7bfa7b5fe6a3c10b29d115b3e6f0f5 | ORPH
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/bb5bb1b413882df4c14a494b0764c6c45c9cd9d6 | ORPH
    i686     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/6a3fed60835b4c11727e1340ad67b909e06ae56f | ORPH
   xtensa    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/4b4b3ce17c5947104d00d135f30745a524fc7a98 | ORPH
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/5595b21a711b482b84e582fc9f56e5468c9eb6d6 | ORPH
  powerpc    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9f2de7ff56fa8299b86734c31cdb7109098693a4 | ORPH
   xtensa    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/54710f0e7a87c4727e347dd1ba112af3f1630b55 | ORPH
    arc      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/db8771c1b87284d2421140ab90872c29c2bcde12 | ORPH
    arc      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/6e77ca6f27067c2a18206b0decc557b9946f3252 | ORPH
   sparc     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/b396e5a8c96417802cf62ef80cfe43c1513731a3 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                qt5base-5.15.2 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0c179d0a73a90fb909a644f8e7da95fe42982a99 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a5b0f9a0e5feac089a756fc644eed19adb3dc9e3 | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e662ce28adc59f65b4196eeac0c05ff83b4c2177 |     
    i586     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/215f7c809ffdc299f3b1a7d2f136e30df627c6b4 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/1ad57d1c2d333e094cf19a0cc13330436eaa9304 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/12c35e4b2300c06ca2387bb45ebaad564b3e8a3a |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
                    bird-2.0.8 | 1 
              host-erlang-22.2 | 1 
                 libqmi-1.30.2 | 1 
                log4cxx-0.12.0 | 1 
                  ndisc6-1.0.5 | 1 
                 openal-1.21.1 | 1 
                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/37653c4495535948a144dd2aa3cd829480ae65f1 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0c54c3e8216bbc46c157d869403ae8d33753a257 |     
    arm      |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/1498610256923e8d10f500d36ada245383ceb2b3 |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/6d0d676d652f4c7578dae92646b9287d0b65558f |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/4a382bd2c960928574ef6f2572f0de1fe2b08c41 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/161a63a40e56dd317a695091ff7f93531c5e56d2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d2ed51f0508122d7a56c30507800d5f323ebfd19 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/46634286e31bb978eca22ef65730295c04655de4 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c74b91b4f85446d5cee429d48cdd4bb2c820354c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
