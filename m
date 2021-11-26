Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCEAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 07:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF07606BE;
	Fri, 26 Nov 2021 07:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvmEwtzCnXIr; Fri, 26 Nov 2021 07:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53977605E7;
	Fri, 26 Nov 2021 07:56:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E79A1BF395
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 07:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D54D40445
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 07:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXwXqd2xLtmw for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 07:56:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17AB94043D
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 07:56:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F2C2A20005
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 07:56:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Nov 2021 07:56:10 -0000
Message-Id: <20211126075616.7D54D40445@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-25
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

Autobuild statistics for 2021-11-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 63  |  6  |  0  | 69  |
  2021.08.x  | 53  |  2  |  0  | 55  |
    master   | 96  | 13  |  0  | 109 |
     next    | 16  |  3  |  0  | 19  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 5 
              host-erlang-22.2 | 4 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/05df3179b18315db1c9f031798c15e1eba0dabdc |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/12140aca05f095936a7a5704578a65c5b6c1207c |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c6c11f372f30a24012956c69aeb5e66392203e01 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7c8aacb6e8a638f8b7aecce7b2a018a1e0b37afd |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e5cdbb0bc2101d84a6fa4f07ffb5e16f85049d7a |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/df614256e61cf226a41ef01392a499a9b4fad17e |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fd8a13dd07e4de085bd2b9f6f73caec244655067 |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/bb9a6dc8f84bf10e8c6bb410f31610f1056e775c |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fafa7a6695c9e8bd7dd3f4f45987720c8edcbbd4 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7e005185b895d8c719a8b370c1654e93baf979f3 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4009caa1430346cb912dd9d000ed07ffeeda4531 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/930fe4d6f0b4a3ebb4fdeee1295c3bcf121456e0 |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8c90dfd5110d8d01a2fb5bd7bbcf6ef9b65416b7 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  ndisc6-1.0.4 | 2 
               apcupsd-3.14.14 | 1 
        host-sentry-cli-1.57.0 | 1 
                  weston-9.0.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/75623126881ffc1b3b51f5cdff18bdffaef2deb0 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0224b6d4c03c6f4684afc22a578e0aca73bbeb4c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f6bc05718af1f9146e6a00d4b46a76604842d0e0 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d7b2a83861da2b3b64740354f79873fdef4a9367 | ORPH
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/2b4aca02ba7c93279bce1cdaee705775270a3216 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8de372e9c6f5e588b99501128bfee77d4322130d |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

              asterisk-16.21.1 | 1 
                 mesa3d-21.1.6 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/0ae791e20687746e82e62b794584088bb9dd0b5a |     
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/fa1ddb7b1f06dfb203d6069af376b8c7c258d161 |     


Classification of failures by reason for next
---------------------------------------------

              host-erlang-22.2 | 2 
                    bird-2.0.8 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/be02fb8e0256c19939f2f9726a91a9162370a00d |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d7d6ec00dc61c8b143b25ea66b8e1caa575bd7f2 |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/bb73cc23e86564395c4d402fbb32eac43ad74506 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
