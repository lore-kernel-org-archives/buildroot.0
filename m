Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA35AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 07:59:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E87661A55
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 07:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E87661A55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE998405BA;
	Fri, 19 Nov 2021 07:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmM3XecukPtH; Fri, 19 Nov 2021 07:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D77B402F5;
	Fri, 19 Nov 2021 07:59:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FA711BF2C4
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 07:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A7BF405AA
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 07:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0UkQLvpYixH for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 07:59:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FCA1400DF
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 07:59:51 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 75296240007
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 07:59:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Nov 2021 07:59:48 -0000
Message-Id: <20211119075953.5A7BF405AA@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-18
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

Autobuild statistics for 2021-11-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 57  | 16  |  0  | 73  |
  2021.08.x  | 42  |  4  |  0  | 46  |
    master   | 65  | 17  |  0  | 82  |
     next    | 18  |  5  |  0  | 23  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 8 
              host-erlang-22.2 | 4 
libdbi-88b8477d57153b9f736d... | 1 
                librsvg-2.50.7 | 1 
                samba4-4.14.10 | 1 
                  uhd-3.15.0.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/60e5c4e6508af2d0cd347d42bd79a6b0c18d8e9e |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8673dd9b1adeef9c6196b785960da205e489768f |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a935d36c7a16c9410b9e94dfc43b70baa50edfba |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/55699d53b975624ab9c057a63d2ccf01459a50f8 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/cdf710efcf8b19c55b9bac61381378ad28e1c4b2 |     
    arm      |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/02cb23dd4a873adbb6efa3222a8c0c36feacd539 |     
   s390x     |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/284ec86d2b94206d7f237e3eaf7d0da579fa0547 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9d740fe69dbdaafddea363a9b50aeacb6c16091f |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/07a2405dba6527e4495754034aa9e1d1e3da2330 |     
    i686     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7ae0540129219670bf912b57cebc4a70d445d020 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/45fca3339abcde39017ac23c2ce4bcbf324bbbc4 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2f380342086dcd2aaacfc355cc0989914457e6c2 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c12efa05b011ab8ccc43ef80243137423f754ad5 |     
   nios2     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1e8292967a7daa66be0503c7e339efae31c149e3 |     
   x86_64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/51cbeabb1b6216291ebcf73aa88359d02cfab31a |     
   x86_64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/67987547717f65e7cc87730b7b7d2b86491b3064 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/732938fe14726807131ac5c1f1df7b1ea45539fb |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 6 
               capnproto-0.8.0 | 1 
            docker-cli-20.10.9 | 1 
                 mesa3d-20.3.5 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 
             openjdk-17.0.1+12 | 1 
               openldap-2.4.59 | 1 
                qt5base-5.15.2 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/76b8515e73b63a71de4cd624898938d9787be2e4 |     
   x86_64    |       docker-cli-20.10.9       | NOK | http://autobuild.buildroot.net/results/c470373d2f608538b44dc6bf0f88ac180ef097ee |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2c35e8116519d5962cb6a401215f95b175dc795a |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abab44d5c23bd78d16140bcc26c2f49f04981faf |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5f50de4ea7b1314e07cc2a5e34f406bcdeb4e21b |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fadfd1ec67dc9bb214d096850b201cbe4f9fab6d |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8174e9378b5e14d16c5f6f3126be5b357c51cef5 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9e89a174c4b226436bb18d25376c682332888cff |     
    mips     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/2c89a299d3909e0526ee26ac777a8a8e2851d424 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/488d04f3b9dc1a03aa80be074e696d0a61ec33f2 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/e6c5d479a7eafd36ad1d572105e8fd8d6ef1041c |     
   x86_64    |       openjdk-17.0.1+12        | NOK | http://autobuild.buildroot.net/results/e60e13712eaddcb6752bbb5fca6be80f5daa68da |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/3f2adee041d218fa24e9af1f4ace71b8e298efb3 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/0b31e0172e1888326847401590258455ed591109 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/c9c652f5df037b48df67c6b2ca3f80d1f8153f6f |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/97e0825fa1d04c555f977415c407b85183d15303 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

              asterisk-16.21.1 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/83130281a7b025ba12bbe35ae82f1c180138482e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf4135a91e90bb85345f118ed58ce48ab03771d7 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/0f80e07cdb997fe29849f7164d29ac41e546c4b6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/41d017e41330b8428b22d345b92f6d4cf137109c |     


Classification of failures by reason for next
---------------------------------------------

              gnuradio-3.8.2.0 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                 libv4l-1.22.1 | 1 
                   mpd-0.22.11 | 1 
              tinydtls-0.9-rc1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/9dc4e4cc4f68f00e15bf2d0bf852e2161b0cf922 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/b93f4d5fd8c3a2ca9ebb55cf855699b7d6c18b01 |     
powerpc64le  |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/43864dcc4298e6f0b92dafdb389803eed8459bb7 |     
   sparc     |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/c111261cbd64abf1e51d6bcf78a4865eff4be8af |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/400201cc0119a70766bff4e9baf900ce133f2afe |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
