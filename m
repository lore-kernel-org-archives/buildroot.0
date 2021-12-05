Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3ADC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 08:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D246071A;
	Sun,  5 Dec 2021 08:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKIg22fiqxBb; Sun,  5 Dec 2021 08:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 263A86069C;
	Sun,  5 Dec 2021 08:08:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 990891BF593
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 08:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 948A1401F1
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 08:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XeCTE6epv7A2 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 08:08:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6EC1400A8
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 08:08:24 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 189F520004
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 08:08:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 05 Dec 2021 08:08:21 -0000
Message-Id: <20211205080826.948A1401F1@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-04
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

Autobuild statistics for 2021-12-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 44  |  5  |  0  | 49  |
  2021.08.x  | 35  |  2  |  0  | 37  |
    master   | 94  | 24  |  0  | 118 |
     next    | 15  |  4  |  0  | 19  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 6 
                       unknown | 3 
                 wavemon-0.9.4 | 3 
              host-erlang-22.2 | 2 
libdbi-88b8477d57153b9f736d... | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                host-go-1.17.3 | 1 
               linux-pam-1.5.1 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-21.1.8 | 1 
                    qemu-6.1.0 | 1 
                 watchdogd-3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/02c6024b5216e412d08e808841eee207d8ff9219 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ddf3710e79832e3cf9e3dc04010c310a7f7b9961 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f219bad07c69a1a7911117433057e72439ab1d28 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0df7faa5d4ef565ca28007ddd3506b56c4d05820 |     
  mips64el   |         host-go-1.17.3         | NOK | http://autobuild.buildroot.net/results/a07ac6a4823392d23fa599c375bfd54855e29854 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/7f2eeec44e115150109173b39c84976b8a7923a8 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/7a9298dce50a1976173cfac5bbe3041a510f47c3 |     
    sh4      |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/2e5d25f0c357fafc876f9e1f6035d5b917443846 | ORPH
   nios2     |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/bd073c8d208e6efa53d033b7b8d6d36d43584ec6 |     
    arm      |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/5350ed29076ce17cdd4e04c3babd42d82c6ddb20 |     
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/6d102f005cfaeba582a78a11460bf38014f56bf9 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/6ef069f1531524ead2876b68b198b1cdb308b630 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/942c26b4e202bdae6b0e425f0c5c47c01fcd4bc3 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2db14fb8d51e6ef19799e0efd623fb1466d61f92 |     
    mips     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/021b35dd8adde5dbb8d59d3c4eb3986f38d3d0fa |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/aebaaf327bcf587aada77bd312dc07d499299c4d |     
   x86_64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/80d3e855e579545a7550b07ed6f3b027934dfc8e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/071339d4cbc910b758b3f41dcc248838679a3745 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a1157d6d38d6079197c3dbeda2497103d31f37bc |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bc468cba6269beacffa011c2adde4e15d382cbf9 |     
  powerpc    |         watchdogd-3.4          | NOK | http://autobuild.buildroot.net/results/e8c150da1e6e4eb887d5872e7d8ad8dfebc8e65a |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cb38c75ee1a2c497c1b8a86caf73243b8cec676e |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c52e5abc80d7398c0941ee689cc2207c1237345d |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/15a74c46fa6eee9cfd0fa2f41f336533f1997f4e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
android-tools-4.2.2+git2013... | 1 
          gstreamer1-mm-1.10.0 | 1 
               openldap-2.4.59 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0bdcce24126babe52a4f5b58e4782f00c205f80b |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/5eec7813582ac150a9eadcd71b2d996aac4b5136 | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8e91219019fbc62d3ab61e3bcb55266c1410a9e9 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/141759052776f2f11b0e63e3eb198022b4d06f9a |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/49671a41776afd1042eff764844251ec7555c4b4 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0a661252399ab1b92e9330e0ce2b838e4b490a48 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/bc003cb3f647f2f4db0a7a863dedf4bf6fe9705d |     


Classification of failures by reason for next
---------------------------------------------

              gnuradio-3.8.2.0 | 1 
              host-erlang-22.2 | 1 
                 mesa3d-21.3.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/dac2f1ca50c3ecbcda7b6e5ea4a7aebf452a500e |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d473070cc66ca5ebfede3c4cd7d00ed4cb01a1bb |     
    arm      |         mesa3d-21.3.0          | NOK | http://autobuild.buildroot.net/results/ab44e28cb0d562643f187f3d6d433d638e430b25 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4c6675eb7c4b49d4b7beff74a6e7703fc8e7ce34 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
