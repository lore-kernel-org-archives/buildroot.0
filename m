Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CF7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 08:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22A6A606F6;
	Sun, 21 Nov 2021 08:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IaDniSzBbLx; Sun, 21 Nov 2021 08:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57ECF605E2;
	Sun, 21 Nov 2021 08:04:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 353931BF2F4
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 08:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EF6A605E2
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 08:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsQiIRF8tdjp for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 08:04:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3A1F605D3
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 08:04:38 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 841701BF209
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 08:04:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Nov 2021 08:04:35 -0000
Message-Id: <20211121080440.2EF6A605E2@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-20
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

Autobuild statistics for 2021-11-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 55  | 10  |  1  | 66  |
  2021.08.x  | 77  |  2  |  0  | 79  |
    master   | 76  | 13  |  0  | 89  |
     next    | 10  | 13  |  0  | 23  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 6 
              host-erlang-22.2 | 2 
                 wavemon-0.9.4 | 2 
                 libgee-0.20.4 | 1 
                log4cxx-0.12.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/16663e34ac4cb49b7f65ff49460a30bcb2a568e5 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8573fec21c286e0bcb43ade7a43b673b3bfd15e9 |     
  riscv32    |         libgee-0.20.4          | NOK | http://autobuild.buildroot.net/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35 |     
microblazeel |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/fe118347cfda1ad02fc6e8569eca410cba6bd161 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/6e44f44121cb0234dbd037863cf877a9ab57ba07 |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/cac3227dafe02e9b3a42eba44a55a9cd8361589e |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3231fe775e66f2d36a54e71d4aeb9473c2875997 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/88d7918833082788c44b6c14bb5acbf2a0188d48 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/adfa3c32ac2f31fbf7b6a29923a54b29d9b9488b |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c29a6b12e3cc656f5e7e1d9069bf18a381ed1c29 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/91702029e482d3e3dc1dde2cb8f7812c9e724c7f |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f20e5ba4f7e5c9c92f410be693fbee0cbcf019f6 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a19f40af2f13fc29894b69a3d4b5f24de3d05914 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
            erlang-jiffy-1.0.6 | 1 
                       gdb-9.2 | 1 
                  gensio-2.2.3 | 1 
               openldap-2.4.59 | 1 
                   python-lxml | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/bff6cbb07a5bb28e0a15a06a8e7a93bedbb9ba92 |     
   nios2     |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/0bdc0dfa6446c7129ad58679c2f720be9ff8856f | ORPH
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/ab3db23725e26805972fc18f4b02414d973c840e |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5a5c05ed798c527cf3e0bf7deea2818c7d21bdea |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/74b32ff3141c0a44cd53b866f15159a92bf76ae3 |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/94d00eedb0a25508d9c4651e12465e09dc9f688a |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fa1b75bc984cf990acc9efaac8027759a5ae539d |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/a5c9b37faab2389c3a2df76eaf119491a048c98e |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/b21c2078f454ab85fdda7ddf8a82d7baaa756c71 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/81b5d47c84f5ae32191c5b9ecf02bb5d811004d4 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/31f202e566ad39b5e0641191d4e3a14b969be0e4 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  ndisc6-1.0.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ca21b8d6aa6b96ed6f2e536a9eacc5eebfb5733f | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7827971a84f9512c0741c137d1368cc2a45596a2 |     


Classification of failures by reason for next
---------------------------------------------

              tinydtls-0.9-rc1 | 3 
              host-erlang-22.2 | 2 
                    bird-2.0.8 | 1 
               capnproto-0.8.0 | 1 
              gnuradio-3.8.2.0 | 1 
             gstreamer1-1.18.5 | 1 
                   mpd-0.22.11 | 1 
                  mupdf-1.18.0 | 1 
            python-ujson-4.2.0 | 1 
                suricata-6.0.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/c3b5bf859bfa259e52e3af1d93bfb4a72cc5a16a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/df68a4f4c4d88eb0d17359b8dcbe9b9821b734aa |     
    arm      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/39e840227f1f3f52565eada44995d3eec192c44c |     
  riscv32    |       gstreamer1-1.18.5        | NOK | http://autobuild.buildroot.net/results/1fa98d759af1116b2b3e00da058f109a735843cc | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f2b0cc2b7c64556c2873c0d89a87b143663692fc |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c7120eda38216f28808829a4f855d4c85322361d |     
    arc      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/75c8d62cbc93234136f20a86e18c85ccea915f3a |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/0845b542be969ab5c38152b9fd8eb0103d71d481 |     
   nios2     |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/10d034e4b827bc128635090bc67d780187b1ab5f |     
    arm      |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/56b868f80e9e330d4ca8d9e3f8873905b6f085df |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8aada3c31e771334d02e76abd5a4e99f1d456fb7 |     
    i586     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1b51b53d083878a2a00b2ea556d3636ce203bc48 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8af6728ca10d16e4a8c40e111abe1e485d301060 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
