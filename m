Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04C1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 08:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80C48400D1;
	Wed,  1 Dec 2021 08:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlvsXQTx9t8J; Wed,  1 Dec 2021 08:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5115D400D4;
	Wed,  1 Dec 2021 08:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05FFD1BF855
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 08:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0F081766
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 08:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBHz9A3gfJsF for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 08:06:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 625F981765
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 08:06:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9908A1BF216
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 08:06:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 01 Dec 2021 08:06:10 -0000
Message-Id: <20211201080614.EA0F081766@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-30
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

Autobuild statistics for 2021-11-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 71  | 13  |  0  | 84  |
  2021.08.x  | 55  |  4  |  0  | 59  |
    master   | 88  | 15  |  0  | 103 |
     next    |  9  |  6  |  0  | 15  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 4 
                 wavemon-0.9.4 | 4 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
                  boinc-7.18.1 | 1 
              host-erlang-22.2 | 1 
                log4cxx-0.12.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/cfc12bec97e1feada7854413354c738ca91673c2 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8c8d54ec80816c4dc683f78f5a5838c624bad481 |     
   xtensa    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/e03648340fe653c8a03aa3be4627584346f458d7 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/0b45c9539afb6ad6cd1292264764f77588cc53ed |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/95403d10fb4e8a871fd6b7f8a05437f01f64f0eb |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/827a801671b13ea4ae2f71e05b6e195845db4f46 |     
    or1k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/34c5b5452f45bc6a3cd842e8e2b40755eb8ff759 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/356128f9cc28045b6f546a271cb1d3e8be1cb2fc |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/29c48e777407aa729d746c9f09779b73b5ad59a0 |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f3dc519a1b33fb8dce7b0e1ef9e6d744f67755db |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8ffa26934264bf069354a4c57f6be8f95e95637b |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cda260c522313aeed86969ead584f7ae7d4967bc |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3dff977547650d0578a3ee2171217dbcf694d146 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/323a654ed30ab4b55ab3076720d57265b9fa2c60 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5d8ae491a850cc1adcd9fb09c02806742760a8ee |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                rocksdb-6.13.3 | 2 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.15.2 | 1 
                suricata-6.0.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e36198f4ed771ea510a84c50d9c972f825bf6c41 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/23959a6856e0b2375633b3660c457c32bdd876e0 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bcdec525673fabdd6433a2dae54a2cc57803bcac |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/97a6f13ad83e036bd0be8d25b31282b9c6176c16 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fdb1153be6213ce2cfea45d3e2e1040797c5a249 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3fc639630374b50392aad40cc69e4dbb19e63e96 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/090a19343983db094af12e372be96baad9a1ebd1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a6f01364cabec80b968d47e834f29a60957ef084 | ORPH
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b89248d149cf9da5885eb4932c3222b9ddd507cc |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/41aca7b0b6251608378b8f1d78cb162b9fad0cc2 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/82c709498229b48ef0da4550ad92d745d683e1ad |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/69b1ec8000f3f0364907797baf452659f06d30bb |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c2c5fc5420ee9b5f3b8e2b798d34535432bc02e6 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                harfbuzz-2.8.2 | 1 
                     mtd-2.1.3 | 1 
            resiprocate-1.12.0 | 1 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/d644032e9d73cf3efe81aad0a2008f26c5340327 |     
    mips     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/19d89e5b2e4cd7ca16b55f0a597b51d9783470d5 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/f252a0f0182e93142728f476e56dab37ae109aa4 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/b63a73f6ece7732f0c4baf1026a9000be88900a8 |     


Classification of failures by reason for next
---------------------------------------------

                   mpd-0.22.11 | 2 
              tinydtls-0.9-rc1 | 2 
               apcupsd-3.14.14 | 1 
libdbi-88b8477d57153b9f736d... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5219cf06d9bd21bb65d4991f79579fed8434c6d4 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/5a54d8ba83e6db1f470d3ece4df0543479935e2c |     
  sparc64    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/59d2d26d2b865e64a93f2206d2e156fe3c019aba |     
  riscv32    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/a74bcb5bb7a3303f572bb4bd31f34b05b7843776 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/faf1f2c1d33bc5eadf70acbee7fe8703923c254f |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fff35b922d3083c55f79fd31658ac17c9e9d1541 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
