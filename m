Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF4BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0845840B25;
	Thu, 27 Jan 2022 07:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jISBKmvYGxG; Thu, 27 Jan 2022 07:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A77D140B41;
	Thu, 27 Jan 2022 07:08:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A45721BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 936CC83386
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRTDK5Pq-1eg for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:08:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5FE483155
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:08:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0CF3724000C
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:08:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Jan 2022 07:08:44 -0000
Message-Id: <20220127070849.936CC83386@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-26
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

Autobuild statistics for 2022-01-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 57  |  8  |  1  | 66  |
  2021.11.x  | 23  |  2  |  0  | 25  |
    master   | 86  | 42  |  0  | 128 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 7 
                rtorrent-0.9.8 | 6 
             bluez5_utils-5.63 | 3 
                       frr-8.1 | 3 
                mongodb-4.2.11 | 3 
                   gvfs-1.48.1 | 2 
                log4cxx-0.12.0 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
                  xvisor-0.3.1 | 2 
                    efl-1.26.0 | 1 
                   guile-3.0.7 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                libglvnd-1.3.2 | 1 
                 mesa3d-21.3.4 | 1 
                nodejs-14.18.3 | 1 
               php-apcu-5.1.20 | 1 
                    ruby-3.1.0 | 1 
                sg3_utils-1.47 | 1 
                suricata-6.0.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/034d3d7519596e36df6cf0ebc3e87e6b192b81d0 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/78c0705dba994b2c164f3367f458c98dec49a2d1 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/a434711259e269e1423523d0c5be6711385a2b85 |     
  aarch64    |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/7e13979851926975b842f4c71379dbf81d012674 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/06c2ac8a1124011cf7d8e654bcb828af6db1f2ae |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f2d89a5e45fcecb0b7d014767dfd182cae1e9f10 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/4fe535c71fb37015fc99f3151a52e9b7641220d7 |     
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/3db47d5f101e62942c8dce777a3929cf8f22eb1b | ORPH
  riscv64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/127999dd2ba3b1c3d39eae36a99b5c4a63a50422 | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/87d35c2635b0a9ef63b77c357701865236764d09 | ORPH
    or1k     |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/e6040c4d40cf234ee72e237fbd9c52682279d19c |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/9545f3127c862a7265c09153742dc5bff2272559 | ORPH
  riscv64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/8e2d33d8bc1739b29f8a230802d4591165a1a0fd |     
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/7ee2a4bf27568acd91790f1283ccc066dcff46b8 |     
   x86_64    |         mesa3d-21.3.4          | NOK | http://autobuild.buildroot.net/results/eba070b876c77c55f09c4d82f321e70c4cb7bdeb |     
   x86_64    |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/88f6a03bce1b58af926d18011bf5449170eab2b3 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/6ed9143a7012a574f067edd7c969f1c1d3d46d91 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/766b3faa902ef200121841bd5675506a4992b213 |     
    arm      |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/2c812e012d2b8552924d646c682713d9120e8100 |     
    arm      |        php-apcu-5.1.20         | NOK | http://autobuild.buildroot.net/results/9816237b8c3465e4bee21a0377da47ca62c890bc |     
    m68k     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/a0dc157a54f95afa0d5c452a0fee22a94f9069ad | ORPH
  powerpc    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/6be860d79ffebe7021c3c927c7495720ea0e060e | ORPH
   xtensa    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/03c95c866f0b8c50e494489130207c8e73c77616 | ORPH
    sh4      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/142cdd994669313ff8ba4430512cecfa262a6750 | ORPH
  powerpc    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/269ede899ab28baf162cb153da91f567f050369e | ORPH
   x86_64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/1325e438682e583614363e3e8c29aa89a1dddeb7 | ORPH
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/faebaad581aa673088bf89d1a14b431f08b35765 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6c48ab0803ceb130d7d5ef979e3aeb84e6f12f30 |     
    sh4      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a458af58ded8c4cb517e40ee61f2052379684a14 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/bb87ff12e37bba83dbf71614d36de3f9e64a2089 |     
powerpc64le  |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/417ff7a87e2b3c61c7cca037ac57286e1a987d43 |     
    i686     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/54cce5841655d2bc9ee34ce460efbf59c7786be3 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/0238056e8c4577d63d810fc1ed3d1783354855b7 |     
    m68k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f8b1b57b52b75a6431fc37030ec64fdc0fe4c042 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/1e73576d1c22c54f4ea61ec663ca80de2f6bd3be |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/3d44543167319e99b1848a622925ce47cd4a9af0 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/17d26f8c18066f8290ba249f3c591e0a0a6753b7 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/11ca4ece89703ce9c4f283bcc1b975f56626202b |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/77dd568e94f275af476a9324f5288afc6282c791 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1cac8cf2a5956c273a73905eb14c97cb2b75c2d4 |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/cd245e455299b91e204f07196f3f3169e4179772 |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/3ba3bbc6cb558df75f2d79b15614ab650d09e9b6 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                 openal-1.20.1 | 1 
                       poppler | 1 
               qt5webkit-5.9.1 | 1 
                rocksdb-6.13.3 | 1 
           uboot-tools-2020.04 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/1a16d6ce541a37f43846f274e41765bb1f413601 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/120ff6ff5342805b1320f27fd14974a763a4a71e |     
    sh4      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d432f159c7ebe7299b806de29d829f8ddf90d00e |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/420448b66e8fe5f6d939d51db234d5b74d472da2 |     
   nios2     |            poppler             | TIM | http://autobuild.buildroot.net/results/356fa066273a47c9a1344fa214e7e56b7d2a3187 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/1c232d49cddd291c442db823a2e4ed6df77f7a35 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/a9d88f994d38bfe6fd027a2c9a82ec31a1b0a8fb |     
    arm      |      uboot-tools-2020.04       | NOK | http://autobuild.buildroot.net/results/1a665b8fcdf9b42e7abe82e9c1034fb21790066d |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6e01511da93de5a182a2d0a8f503165c0005f922 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6bc5fd15805eebe43def686d377a1409dd548567 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7d3ba65c101be258879678379480c97e6b213f4b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
