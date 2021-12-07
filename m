Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025A5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 08:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A47F607CE;
	Tue,  7 Dec 2021 08:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwkVqmKd41i4; Tue,  7 Dec 2021 08:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8897560E50;
	Tue,  7 Dec 2021 08:00:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E04CF1BF355
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 08:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD7F3830E2
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 08:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tA3Dtf7jFYOv for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 08:00:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD01282B3E
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 08:00:12 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 98EFD100017
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 08:00:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 07 Dec 2021 08:00:09 -0000
Message-Id: <20211207080015.DD7F3830E2@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-06
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

Autobuild statistics for 2021-12-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 45  |  5  |  0  | 50  |
  2021.08.x  | 38  |  1  |  0  | 39  |
  2021.11.x  |  1  |  1  |  0  |  2  |
    master   | 97  | 18  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

              host-erlang-22.2 | 8 
libdbi-88b8477d57153b9f736d... | 2 
                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                   expat-2.4.1 | 1 
                     frr-7.5.1 | 1 
                log4cxx-0.12.0 | 1 
               pipewire-0.3.39 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/65945343167937a563445281c7531051241a686a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8404da533eff3064d63fb0988030089a58753156 |     
  mips64el   |          expat-2.4.1           | NOK | http://autobuild.buildroot.net/results/c80847eb0a51f58b463b1b2506036c3f4efe094d |     
   x86_64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/bd779ee960ba2181bc60313569c77c1e60b4e726 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/08971fa706c4b6b847599a2f3f6890661e168de4 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/dea1ad23ec9cd48a99bff64cb220ed0829f1abc7 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/58d0fa6af54eb273ea4b2af2d7a6ada6bb29605b |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ee40feca90c4ee74488518c4783b529c126a392e |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7c07ab40607a9a34195d29cad30195013d850377 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9c8d269181e428061a4ee8f655213b81434a1850 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e0b575ab885dea460115befc1ad63fffb7b452b6 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8e4e347494ee09c81b371300a7a6dab785104be8 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/a9d7c11e76de0c5b04a76674b38a5fe0843ccc8a |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/00ed7548490112927e84472418ea4e6f96dc60e0 |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/d1f7fc5421d498e1d92645da847efb674088dcf0 |     
  powerpc    |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/f17a294504e24b67234b25b9ad04fb07249e1fa7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6b17f8042d02d8d36e602b7e36cf52db27cb9d3d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/809f5caea18e51cbb988a7ce18820eb13aa70e7c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

              netopeer2-1.1.53 | 2 
                  zeromq-4.3.4 | 2 
                 mesa3d-20.3.5 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/9e2aa3ff6601a1b7d4d560c05403968d523d9dde |     
  riscv32    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c8fe5728aa6e0e1fe7d659b243aa7167593f3658 |     
  riscv32    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/1d11e7879c10c37376d31db4bd3b54d52ab9fa94 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ff6b76fdb68e87693fa99f3cab1c039bc324caca |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/56a653f57a09a199a207911573096116a7f2d5c1 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5bbca68bc5d1358c6b6f62c052a976037b8a4999 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

               linux-pam-1.5.1 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/6bac4460aead07045d20b1217d6ffd99df0451cc | ORPH


Gitlab CI results for 2021-12-06
================================

Detail of runtime-test failures for 2021.11
-------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/1851489294  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
