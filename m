Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36E8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 07:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135406080A;
	Fri, 31 Dec 2021 07:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S--44MVV0CMt; Fri, 31 Dec 2021 07:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A45860A83;
	Fri, 31 Dec 2021 07:06:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 128511BF836
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 07:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2872404BE
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 07:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGvTEl3TU1S6 for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 07:06:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D7EC400C8
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 07:06:02 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id ACEFB1BF20D
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 07:05:59 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Dec 2021 07:05:59 -0000
Message-Id: <20211231070606.E2872404BE@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-30
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

Autobuild statistics for 2021-12-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 49  |  7  |  0  | 56  |
  2021.11.x  | 32  |  3  |  0  | 35  |
    master   | 100 | 29  |  0  | 129 |

Classification of failures by reason for master
-----------------------------------------------

                    neard-0.18 | 4 
                  rygel-0.40.2 | 3 
              cryptsetup-2.4.2 | 2 
                       frr-8.1 | 2 
                log4cxx-0.12.0 | 2 
 Makefile:744: target-finalize | 2 
                 wavemon-0.9.4 | 2 
                  assimp-5.1.3 | 1 
                    efl-1.26.0 | 1 
                 mesa3d-21.3.2 | 1 
                  ndisc6-1.0.5 | 1 
                nodejs-14.18.1 | 1 
               poppler-21.12.0 | 1 
               pulseview-0.4.2 | 1 
           python-pybind-2.6.1 | 1 
                  rt-tests-2.3 | 1 
                   systemd-250 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/4ed8516cb03a6447b44f2c3731b2197fd6eea9d9 |     
   xtensa    |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/6740792920a28c91f4f82a8f8c2fb525ed80410a |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/c7488438764f7a3d9ea84dfe41f9935c5ffdd258 |     
   x86_64    |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/4a840c54bad9748b5748738378a0352d02de1f7e |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/595bff7ec51daec903d5ca9912d3b7381efb6fdb |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/2d9fde0873694374daef2cc54311e7afbdd4d35a |     
  aarch64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/b017168965526cb213e115f45e41f4bff4c2cce1 |     
    i586     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/204341d9122e633210c05750aa2920c61922daf8 |     
microblazeel | Makefile:744: target-finalize  | NOK | http://autobuild.buildroot.net/results/3fd79ed7bbcad202fc7ac07252cdf57c599dac30 |     
  mips64el   | Makefile:744: target-finalize  | NOK | http://autobuild.buildroot.net/results/1f3609fc34a500cb300fe1197064817c0cce24b0 |     
    sh4      |         mesa3d-21.3.2          | NOK | http://autobuild.buildroot.net/results/efb883abf40ed47e733cb992f1176f757d352eac |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/29f5fcf11af1c44d21e1c0f20c81b58bc3a94bf9 | ORPH
    or1k     |           neard-0.18           | NOK | http://autobuild.buildroot.net/results/7bb3a40ebd1a57416bb1c02415838c92b198027f |     
    sh4      |           neard-0.18           | NOK | http://autobuild.buildroot.net/results/5d541d38d8170799c71f2149224fb90d22fc265d |     
    m68k     |           neard-0.18           | NOK | http://autobuild.buildroot.net/results/f8e26416e38c83e27e7945343f497a6c9310bfcf |     
   x86_64    |           neard-0.18           | NOK | http://autobuild.buildroot.net/results/ecced1b0746d0b04988316236f0f21fe7ed8f9cc |     
    arm      |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/41a0a5c224a96d106f83f2e2f5b0d0b6dd0015b8 |     
    i686     |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/469fa1dafc9d591df9525506eca29f11381e37e3 |     
   x86_64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/ebb73892fd7471de4f0c109554dfdc65b93d3dcf |     
  mips64el   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/0d0b7c7b59e5a159c6fa5000536fe335df3de6fa |     
  mips64el   |          rt-tests-2.3          | NOK | http://autobuild.buildroot.net/results/74766c215a6cc19cd02faec6181ccd5de49c15cf |     
  riscv32    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/882968b29aaf083354889e0915135cd108e9d379 |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d4f783aadb8b0878055d1ebdb0f2965218ea3964 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/22f9a4af8dedc5e1d9cedb048c79c68a5338650c |     
    arm      |          systemd-250           | NOK | http://autobuild.buildroot.net/results/2fcd4ad64b32cc4835866c9d99e05ab8c9bc794a |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/846f879c03f7b0885727ae429d828b0131cfb77e |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fb06ca981c2136d2672165a34c498ba9e0ab2490 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/83229745f514bf55662359c7ba6642254e0b57cc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/aa294c550690e79c581e3b92ceaba2511f3c8e14 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
  gobject-introspection-1.64.1 | 1 
               openldap-2.4.59 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b20b87844394d48d77ce313b18f4565ec15843dc | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f12728fa1eb70536b1bb00c550b8cae13695b261 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8aa36540152891a20fe3f5ca2efe1138d096487c |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82871e1741c128242e118dd151b59ac5d8caee1e |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/f267cd8fbb41f6d711a325fca75e65e249e16656 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/01c203a354af9657eab918b600c612e30dcbdbf2 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/854321f0ec44e7a7e323d7be3aa4e1e856c24066 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6ee13d72b91dd49079139a34b75be3c655a18e3c |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9b5f030b74effa3d55ddd519de3105b38a45878f |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e9c92d7be09ac5da765ec4169c23a46707f8a6fd |     


Gitlab CI results for 2021-12-30
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
