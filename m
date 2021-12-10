Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460F7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 08:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A58304254D;
	Fri, 10 Dec 2021 08:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zm5C3fulphPz; Fri, 10 Dec 2021 08:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE16342532;
	Fri, 10 Dec 2021 08:07:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22CE21BF844
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 08:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F58A40190
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 08:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7abd86KA87ht for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 08:07:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9465A4017C
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 08:07:43 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9582A100008
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 08:07:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Dec 2021 08:07:40 -0000
Message-Id: <20211210080746.0F58A40190@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-09
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

Autobuild statistics for 2021-12-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  |  4  |  0  | 32  |
  2021.08.x  | 36  |  3  |  0  | 39  |
  2021.11.x  | 11  |  2  |  0  | 13  |
    master   | 78  | 12  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

                     frr-7.5.1 | 4 
                  assimp-5.1.0 | 2 
                  zeromq-4.3.4 | 2 
              host-erlang-22.2 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                 wavemon-0.9.4 | 1 
xdriver_xf86-video-mach64-6... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          assimp-5.1.0          | NOK | http://autobuild.buildroot.net/results/49beb264b8454b9af092278074c4087013692052 |     
    arm      |          assimp-5.1.0          | NOK | http://autobuild.buildroot.net/results/0cc9cab2761591af57d6d6744a0dd61b7c60e935 |     
    sh4      |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/64ec4b7a0c858a5b4c4aa67efefd35d3c2dc687e |     
   xtensa    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/fb0a20388b7779cea414df47f7d6d7625e5e2d57 |     
  riscv64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/215bca0a728c4fd4a13ec2023a35768386f9c66d |     
    m68k     |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/49d2616c736f21f051dcbe440f0fee040c9d3e98 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0d45f4d7f206d261fd725c558e7c246695b7953e |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/80c25c19fa9a28625bf4b6499ec1f54204ae3397 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fc9294a7bfde56887f41132c776463783ece5001 |     
    arc      | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/f984ddca75ad4a487964392a919f28ad64138e4a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d8fbd167952c7d0376fde5ad3acbb9a782530436 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4f28d8d1635fb603b7fd39c7daff8c91276e8d5b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                libkrb5-1.18.4 | 1 
monkey-f54856ce250c4e257354... | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/9e7dc6b15e1abdf4e62a18e7d6c14e0781e14916 |     
  sparc64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d554f23a1856f23035cd3a5a25f5070d58a4c949 |     
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/5e6b755b991eef1cb83ddaffbfcca745eae3ea6c | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/662796ae5ce422cfe7256927a72d5dc34b1a2c0d |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
                  ndisc6-1.0.4 | 1 
           python-pybind-2.6.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a77a3a6a88504a37a1845f1f11f792af127ec544 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1a7d0377ecd53e1bed2934ff33152b3cad8c3d74 | ORPH
   xtensa    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/2f83dfb346998581843dcc9d31e481093e1d1bd4 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a99c19e3eaef7c94110ec3a8199c42f58b2084ea |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/52d2f4d26c98df1874dc4047ae03ab5ff4b179b5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
