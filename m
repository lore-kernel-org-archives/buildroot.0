Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA8CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 07:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F02B5400EB;
	Fri,  3 Dec 2021 07:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXY_6kY9In5W; Fri,  3 Dec 2021 07:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B2C4013F;
	Fri,  3 Dec 2021 07:51:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B78BF1BF2F9
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 07:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A61566063F
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 07:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xkPIumDt-pzL for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 07:51:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6250060639
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 07:51:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B24724000A
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 07:51:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Dec 2021 07:51:27 -0000
Message-Id: <20211203075132.A61566063F@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-02
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

Autobuild statistics for 2021-12-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 54  |  7  |  0  | 61  |
  2021.08.x  | 58  |  2  |  0  | 60  |
    master   | 96  | 14  |  0  | 110 |
     next    |  7  |  6  |  0  | 13  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 5 
              host-erlang-22.2 | 2 
                       unknown | 2 
libdbi-88b8477d57153b9f736d... | 1 
                log4cxx-0.12.0 | 1 
           python-pybind-2.6.1 | 1 
                 wavemon-0.9.4 | 1 
              wireshark-3.4.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1e1161a37135e5482141ea09e23764ffce4e5ea9 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6ec66a29711b6e0b721f0c1f8d67b85b4c77bac3 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/f7cf28ff11e85615106bf9d5c181789829d2b892 |     
  riscv64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/6d393b6121a11bdf2805b73e6c023f114e3c72e0 |     
microblazeel |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce |     
    i586     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/08e33c04085a480ed1563e003325a7cf544d6d7f |     
  aarch64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/bffd137589296b0406ab32822194fa0283d27f5f |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/85eaabde09d3adbb329cbf1e7d914505fc432608 |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7c0b1f7f0cd94a794eac175fdac2f35a3e1c6035 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/6c285f8ecac563eb31c166b1c4a864924f96d608 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/621d30ccbc8bec20f69c87be97736b18ef4405e3 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/68627afcb0b1278b9cf643d09daf6e35cdff0556 |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4ac77d81721879ace3783fb528e5a2cdedb40d33 |     
   s390x     |        wireshark-3.4.10        | NOK | http://autobuild.buildroot.net/results/41c9cf6378792e329abd1672d14e5515e23bfa72 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
            erlang-jiffy-1.0.6 | 1 
monkey-f54856ce250c4e257354... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1309bcaa16d28fda66770c5d81e860134df9e3db |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6674612509a9f25ecbf8bb75f91df6c5bfaf468a |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1fca6749f4b9744868bfa3f2587beacb4e0fe9a9 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7d5452a6151a72c77f11ccbc374d244d2519970c |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/95bcec66f784fe63a98a4e15e7fab2d1f4009162 |     
   s390x     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ac44017f20f56859d24bf99089cad9b206c590b6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/86d2fcea223d2382053415a78ce93734315d5a65 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
glmark2-c493520253fbfe3676c... | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c1b244fddd19d8104aa1964cd278da1b0d75e48b |     
  aarch64    | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/3e7c1da2d4da648f4642083203244cc33b284a9a |     


Classification of failures by reason for next
---------------------------------------------

                  assimp-5.1.0 | 2 
              host-erlang-22.2 | 2 
            python-ujson-4.2.0 | 2 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          assimp-5.1.0          | NOK | http://autobuild.buildroot.net/results/84b050828f73caab59125dd9b19d3106a3ad3b58 |     
   nios2     |          assimp-5.1.0          | NOK | http://autobuild.buildroot.net/results/c6e703bc367c58853005a2f0410354c55d6366b8 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c6ca871e17cbc6fca1d4b90f2e4571ebc95dd46d |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/55a850addab804db660e82bbb03e97760aa2c309 |     
  riscv32    |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/f48ffe29a02b6589ea63094e7637cd6111591173 |     
    arc      |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/33336a40e7b8d7a47a92594805f050738d68dbfc |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
