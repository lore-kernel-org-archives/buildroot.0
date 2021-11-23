Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3773C433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 08:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AF2A80DB6;
	Tue, 23 Nov 2021 08:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZb67CbSamAI; Tue, 23 Nov 2021 08:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A520B80D2E;
	Tue, 23 Nov 2021 08:01:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B410D1BF573
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 08:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F26D400D8
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 08:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTudx2P7VUgt for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 08:01:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5B54400C4
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 08:01:17 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 58556240007
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 08:01:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Nov 2021 08:01:14 -0000
Message-Id: <20211123080119.9F26D400D8@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-22
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

Autobuild statistics for 2021-11-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 63  |  6  |  0  | 69  |
  2021.08.x  | 65  |  1  |  0  | 66  |
    master   | 76  | 27  |  0  | 103 |
     next    |  8  |  3  |  0  | 11  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 8 
              host-erlang-22.2 | 7 
libdbi-88b8477d57153b9f736d... | 3 
               pipewire-0.3.39 | 2 
          gstreamer1-mm-1.10.0 | 1 
                nodejs-14.18.1 | 1 
               qt5webkit-5.9.1 | 1 
                  sudo-1.9.8p2 | 1 
                  uhd-3.15.0.0 | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/43ce23e35bdfe7fde4d9f5445f7c0940e53359ec | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b0688ebca1dd6ee6c401a65d264966e626b710e0 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6dc2b88485ef75049e25d52965a6f0be6c848dd6 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/049154580dd24d6a0ed5a3ed675376808eb12e5d |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6dd58508dbceca63ff7844ea8444866b3e3f6d93 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3966d361bf6e4e5245f8bd2341cccfdf6c210b94 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ac712ce871658771a8b543aaecb9944fa849f4fa |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/78d632c78ea304ed0cfe4521babd407b8a74b8d1 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/322099367bdbfbfb0c0bba6e33e580d74c7df3db |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/9e79db1c4a22ce4d2c281496534a6cfb4983ee6a |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/506e8e96860a77025fcb438d7d364b03f724f567 |     
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/9623f1b0c370d9b316d60949839d69855f50b70b |     
    mips     |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/4501f7657300e61327aa2366df5762c76079da25 |     
  mips64el   |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/8efeb59a98eab99c9c1d29ffc8ddd5e153265492 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/3b3e0f3a5fc42947743d83ff55a011c17cbcc31c |     
    arm      |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/a13862e282e03a26c236c26cf98a45409751673d | ORPH
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d78fc839e2713e01717fe54bbd61ac822e4f8ada |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/80fec8e5d7a9be0e26195c8479f1d4a77f38f2eb |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1b5f53166b51ea024f9307f7bfbee3413c8fdeba |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/75ab4839a49197244dde8e909ca2214f7fb4ad05 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a06ed452e537f9abbc509fb4fd7bc101e700ee21 |     
   mipsel    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/efc7f69fcb2cacd95d7bd9f0bca605ae43109f37 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f0e4d3a9567c6ca39c01c56d4b630d2326c38cbb |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ad2efb748f0a6e141033522c6d24a2b4d90a5a63 |     
    i686     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/aa84004cdee020757082968831a8295cc6f4c996 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/abbe9fba11724e88633a3000709bb3e48a25a22c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/44d1744d71c18ef889ecba2c0a269b8c18cd1384 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  ndisc6-1.0.4 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a67773dbfc537e0172e386508ba73ddce64096cd |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/165798bb210ebc9610396ebb1f851fc150762fd1 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/049b2ef423568ae592b21e5a569fc5fd0f918a1d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1cb7fba83de6f7461871780ec011dec6370728f6 | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6f302347f343fbad48a1242b85cce57289defd4b |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/0b91b42f7e52a7de734977d7d5d8a4b9f29d3c70 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/200248baeb265d5cc08298fe1a712b67e124d9e9 |     


Classification of failures by reason for next
---------------------------------------------

                 diffutils-3.8 | 1 
              gnuradio-3.8.2.0 | 1 
                   mpd-0.22.11 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/9e39e1aba7e473347a0ffbcc07455229a0e36e38 | ORPH
    arc      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/5a52f0264ccf59dbc16427cfa25dbdb007de8bf1 |     
  powerpc    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/01b2aa713e477db777f3c4c4df046e4d6e687d9d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
