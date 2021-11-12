Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1803CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 06:52:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3978560F6E
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 06:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3978560F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B948940547;
	Fri, 12 Nov 2021 06:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiNNjLxyRMfl; Fri, 12 Nov 2021 06:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08F1140543;
	Fri, 12 Nov 2021 06:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DA361BF41B
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 06:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A91040543
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 06:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMyt23qe9yZ0 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 06:52:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FCD340540
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 06:52:39 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A54321C0003
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 06:52:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Nov 2021 06:52:36 -0000
Message-Id: <20211112065241.3A91040543@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-11
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

Autobuild statistics for 2021-11-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 38  |  8  |  0  | 46  |
  2021.08.x  | 37  |  4  |  0  | 41  |
    master   | 52  | 21  |  0  | 73  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 4 
libdbi-88b8477d57153b9f736d... | 3 
              host-erlang-22.2 | 2 
                 wavemon-0.9.4 | 2 
               capnproto-0.8.0 | 1 
                 diffutils-3.8 | 1 
                      gdb-10.2 | 1 
                   iperf-2.1.4 | 1 
               pipewire-0.3.39 | 1 
           python-pybind-2.6.1 | 1 
                 samba4-4.14.9 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/dbe54d4c3aea87a15d76c9bca56d9fbf3af935e9 |     
    or1k     |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9 | ORPH
   x86_64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/adc63581ba092dc912d88ae04a74f76420808262 | ORPH
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/2952751241561f8fbe94e0218dfb328b560e503b |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/623e5c2c8befb889f7cd33ecca7e96073133309f |     
  riscv64    |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/7e19d7a3e026450d9b5b04611ad445a61208c308 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/045bf93a59de4e4b9b9d95521b8e12f28c010e59 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/358af1999ba90f75c4b69ab05445aedb8bb2becd |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/c7a87e3b672240815b6934554551519a8104a547 |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/9c396248b297bdfb45b2c1ad7925f19965dd8ccf |     
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a |     
    arc      |         samba4-4.14.9          | NOK | http://autobuild.buildroot.net/results/b7b589caf99faa31ff790f6f8b56132477066650 |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/0f3932c198c2893b9f08bf44e33f8a73b04f4af4 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2f332b1903543ed5a3c945518cec5e01375b04da |     
   x86_64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2ec4d2e0fc0a1832774a4f3ce918492427302ba2 |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/af13648db3db51d3b639b1cb0c98fb0a0d1a803d |     
microblazeel |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/dc4d4a772000cabcba154561ba4bd44255a5ed3e |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d54b43913f9f0f78e84996c70033ff278ff37a1b |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/62d8ef03de0dbb4b05c3a0aa629561461df28de1 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cda1457e3d278f5da12edd664687058243e46a5d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0098d9dbe51d96f2c76e7279cc65eec3f55935e0 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                 mesa3d-20.3.5 | 2 
               apcupsd-3.14.14 | 1 
  gobject-introspection-1.64.1 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a3e356cc360077e15933c2de4c393ae06229595d |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/61939f52596df85dd4bfd1069fda5de62e6400f1 | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cf894b881088343ccac650db37b347eb6c8a934a |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0608171fcea5ae8f487b03000d2a934a42d07042 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/933a3f0784417e85a7e23a1860e6bad85bbb01a5 |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/9858e8ba1ba8b71c3c72a68c9f11f2bdb1f2de3e |     
    mips     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/56d5cc7e82706256277eeb27bb43c91533bc71cd |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/4120c98de3ca88bb4f8867d6841b09b727a6e9d6 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

  gobject-introspection-1.68.0 | 2 
               luasyslog-2.2.0 | 1 
                 openal-1.21.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d28b13016274e05833e5574ca7efbfd03a3c644d | ORPH
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/49234ecffeb9d047c6ca57e6006c76c1738a319b | ORPH
   xtensa    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/9f52309903f3e7b5475cfe3ce3583d85bd2683a0 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/b278d7cd0c54039e9b3da536895d77f71cbd9636 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
