Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639EAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 06:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C962641BDB;
	Fri, 17 Dec 2021 06:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOeUS0BoJW7o; Fri, 17 Dec 2021 06:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0264641BD8;
	Fri, 17 Dec 2021 06:55:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4CCE1BF33E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 06:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9DA540B51
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 06:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RaIrgDyDh4q for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 06:55:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED2954042B
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 06:55:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EE9B12000A
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 06:55:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Dec 2021 06:55:08 -0000
Message-Id: <20211217065513.A9DA540B51@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-16
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

Autobuild statistics for 2021-12-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 61  |  9  |  0  | 70  |
  2021.11.x  | 22  |  3  |  0  | 25  |
    master   | 100 | 25  |  1  | 126 |

Classification of failures by reason for master
-----------------------------------------------

                 wavemon-0.9.4 | 4 
                       frr-8.1 | 3 
              host-erlang-22.2 | 3 
               lighttpd-1.4.63 | 3 
                 mesa3d-21.3.1 | 2 
                       unknown | 2 
                   iperf-2.1.6 | 1 
                 libqmi-1.30.2 | 1 
               libtheora-1.1.1 | 1 
                log4cxx-0.12.0 | 1 
               luasyslog-2.2.0 | 1 
                  ndisc6-1.0.5 | 1 
                    pppd-2.4.9 | 1 
                          qpdf | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/69e533daa2f4c7171638681ce0b4a94fe0757d68 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/18429db3ae4079f57c4d4d7c6c4225307756e2bc |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/4cf3133176c162db5638620b6b34e13a68d295b8 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9a20672baa72ce744a4ce5537347eb0350e28b14 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/62315f75398a39aede4b4f9f64f2027228412504 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0a412d7795949f91c739a5c390bf2f275925ee7f |     
   x86_64    |          iperf-2.1.6           | NOK | http://autobuild.buildroot.net/results/d3888725d4112624412da8773a976cfb1ad6a9c9 |     
   mipsel    |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/15818b6de7378cd75c59b1d6dc732ed9a20c092a |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/27276938ccbe994ee1146021391f4194c8c26eea | ORPH
  riscv64    |        lighttpd-1.4.63         | NOK | http://autobuild.buildroot.net/results/af9091c6522cc12bf20488b2d2ef6818aeead111 |     
    m68k     |        lighttpd-1.4.63         | NOK | http://autobuild.buildroot.net/results/74b45d73d7eefb219b645f2f5c28666a0d30a7d1 |     
    arm      |        lighttpd-1.4.63         | NOK | http://autobuild.buildroot.net/results/5993e9a3f4d15a07d6e3864c76101ab537b53420 |     
  riscv64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/f5e9f7c41e4c21e70f0bc4d6e1c6dd3d525e1b2d |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/03ec4d15d80546c37ef1a5fe691ebc75901ce772 |     
  aarch64    |         mesa3d-21.3.1          | NOK | http://autobuild.buildroot.net/results/794a513a2ac90fb5ef1996a7b3d0a67e6a1bf295 |     
    arm      |         mesa3d-21.3.1          | NOK | http://autobuild.buildroot.net/results/ee24b81fd74c3f351f795bdb955b4a95e8683bda |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/5236b6a5dc8bbd65b32e4c2dfd65db80174eae5d | ORPH
    i686     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/ac789af9a294596ebc19dcce19ecd601fe445767 | ORPH
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/f70c0f50369d549229e2226326ae5c07799c3f06 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/4dbce5e4a4a42210f0cd025d0fca651dcc20c7af |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/154583c25b23389d57492e4a42bae25d2b7abdd7 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/78ff24d52966eb1fe67e3080e8dc261cc643d192 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5a063ae5da41254967f87efff605dcdb12a0c050 |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cbdf3e0cf0bee8f1b076581768c24155afc320d9 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a91c54a3668b0e9b313b3fdec917651209721e49 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c3a20959823f0b89b499eaab40acacc7d0f12240 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
monkey-f54856ce250c4e257354... | 1 
                 openal-1.20.1 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/11bfcebf825a8630565ea1e2d8b53a6e26505a30 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d55b6e73cef6f273f2c5625dd3b2cbf34455f33f |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e893cb22cc520ee4ff7a6b6a3746cf9ca45762b0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5c0f23be868992a3881141499bd93ebb6e33896a |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/3705e67fb8c2b837f152e20178f62661fb9bea9d |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/52964607f579206839120e4c4d5006bb339128f4 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/442a21a462dd6f06b632dcd4c02eaf1ce68b2cb0 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/0649a77761bb63239ed00e7c382458e82cdba3e4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/255eb4860b3ce554c27c50934094f6e49a282914 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 1 
               luasyslog-2.2.0 | 1 
                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0f4c7a3538d71873fbb1c735fa2a8eb46d38b40f |     
  powerpc    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/00555ccc23014b9afca2c4ef3bbab5f8d84ea6ef |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f111d7848367aa63694403565dbca20b2d604c09 |     


Gitlab CI results for 2021-12-16
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
