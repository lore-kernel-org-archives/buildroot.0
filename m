Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA583C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 06:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE19416CD;
	Thu, 16 Dec 2021 06:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tvx4kRhaOK3; Thu, 16 Dec 2021 06:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5123E416C9;
	Thu, 16 Dec 2021 06:56:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BDCB1BF40D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 06:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0454C416C9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 06:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LM9CCq7ccrvr for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 06:56:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E364416C5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 06:56:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 816041BF20D
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 06:56:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Dec 2021 06:56:15 -0000
Message-Id: <20211216065620.0454C416C9@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-15
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

Autobuild statistics for 2021-12-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 54  |  6  |  0  | 60  |
  2021.11.x  | 24  |  1  |  0  | 25  |
    master   | 96  | 32  |  0  | 128 |

Classification of failures by reason for master
-----------------------------------------------

              host-erlang-22.2 | 7 
               lighttpd-1.4.63 | 4 
                       frr-8.1 | 3 
               pcsc-lite-1.9.5 | 2 
                 wavemon-0.9.4 | 2 
                 apitrace-10.0 | 1 
                  assimp-5.1.3 | 1 
                    bird-2.0.8 | 1 
                   iperf-2.1.6 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                log4cxx-0.12.0 | 1 
                 mesa3d-21.3.1 | 1 
                  ndisc6-1.0.5 | 1 
                  nginx-1.20.1 | 1 
                opencv3-3.4.15 | 1 
                    pppd-2.4.9 | 1 
rpi-rgb-led-matrix-63e3e7ff... | 1 
                   taglib-1.12 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/560f85bd1f187087faee4a124170eeb8d8c5d1a3 |     
  mips64el   |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/fab7098c3183b547843174cbf7f27a13e2cec60e |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/d465e89983b21d49a3a7d6f38a7e44441442f393 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9c4bc39bff3480ec7560cb85873c79df1e8a133d |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/010592d3cb5d05c2f3bfb4cf5c57ae7452af5344 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/fbf33e6917fc3f2f12aba4218d9203c4d25c8f46 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/aa8fe940489a535030812a08b109039a15ba5984 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/56dcac73eecd0d7eefe59b91a0b4d0779a17ecab |     
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/52a17884bea3b8fdfb28a95a10825f58cdf2fd51 |     
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/34c0cad0ac7cb5630d2aaea9900ef4d62b5fb1da |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/68c704cb3cdaf3db228e39b68de465eda03ce55b |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/aa08bc59947e8681edfc64f1067996c38b9a2efa |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d4574ede03afb8e70e9abef7b6c80597e04464fe |     
   x86_64    |          iperf-2.1.6           | NOK | http://autobuild.buildroot.net/results/d40c9d7ce7248409ccf78b11e669cf6a56389064 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/8b840841eadc57d3137c15902d76f2139cdc53c4 |     
    or1k     |        lighttpd-1.4.63         | NOK | http://autobuild.buildroot.net/results/8933ae8ab8823cbbe5808a10036681d43d83a023 |     
    arm      |        lighttpd-1.4.63         | NOK | http://autobuild.buildroot.net/results/7b644dce244a1aa4a193a3196059a56b2c4c7591 |     
    m68k     |        lighttpd-1.4.63         | NOK | http://autobuild.buildroot.net/results/b8cacdab0bbeb1bcfbad59437cfdf8e76685ac79 |     
    or1k     |        lighttpd-1.4.63         | NOK | http://autobuild.buildroot.net/results/eaeecd60353ecf566b682275e1d2b3d305b4d8f2 |     
  riscv32    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/09bfe0664cb6678c2208efadb0471da8208b40f4 |     
    mips     |         mesa3d-21.3.1          | NOK | http://autobuild.buildroot.net/results/12516130797928d17fa3b6f0e55d68e9af67a414 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/81a3c7aab3110aec1111073c7100d0712c2e1823 | ORPH
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/78b82e7581d2bdab025179ac33472d1f852720ce |     
    arm      |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/ac57409dd2d74127b5756b4ac30ed8ac9417a9e0 |     
    arm      |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/d7104bfbb36a71954d5d113807e35644d4c1ec52 | ORPH
  riscv32    |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/9ef6de466e0113a53976674f1675fc4e5adb3291 | ORPH
    sh4      |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/c45d34bc9ed2d824fc4c6500123010f29a57d290 | ORPH
    arm      | rpi-rgb-led-matrix-63e3e7ff... | NOK | http://autobuild.buildroot.net/results/cabb46d37ddcbfa9d3db6486badc5f1a2e44d9e1 |     
   sparc     |          taglib-1.12           | NOK | http://autobuild.buildroot.net/results/387feeb6bcc190b3908e405ba5f8a888d7e1f348 |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ae1610b17e78155c4f4bbbf238beed5d56d97e4b |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ea550afd16ffea9dbfd3496ad48274ef1400d79a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ce1543377425582a9248d936c7d505d5e1015829 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               cutelyst-2.11.0 | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                opencv3-3.4.13 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/7d856110b06c43d0f1d7d1017f6d10edb4aca5c0 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d96963fd708216f7fdca02554583555161dad8b0 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1956cfdd586577288891c9d17eb20510c5e52067 |     
  aarch64    |         opencv3-3.4.13         | NOK | http://autobuild.buildroot.net/results/9df38e90d3caa2e10d72784659da5f3698145196 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/8b8a066363fadc8716f2063e0a031410a8680792 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f35e076d81fd454593bd3c06ffe0e3e9e6df09b7 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/bed8ef214cf1c350dcff75e8265b81720f802ecb |     


Gitlab CI results for 2021-12-15
================================

Detail of runtime-test failures for 2021.02.8
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1884445457  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
