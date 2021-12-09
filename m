Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2283C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 08:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB1B605D7;
	Thu,  9 Dec 2021 08:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54zM8h9zw1SU; Thu,  9 Dec 2021 08:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D8E460585;
	Thu,  9 Dec 2021 08:05:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 416A11BF578
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 08:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 281DC402DC
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 08:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6x1Yb_hVacb5 for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 08:05:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 401CF4025F
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 08:05:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 30250100006
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 08:05:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 09 Dec 2021 08:05:09 -0000
Message-Id: <20211209080516.281DC402DC@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-08
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

Autobuild statistics for 2021-12-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  |  3  |  0  | 44  |
  2021.08.x  | 42  |  3  |  0  | 45  |
  2021.11.x  | 18  |  4  |  0  | 22  |
    master   | 87  | 29  |  0  | 116 |

Classification of failures by reason for master
-----------------------------------------------

                     frr-7.5.1 | 11
              host-erlang-22.2 | 5 
rpi-rgb-led-matrix-63e3e7ff... | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
              containerd-1.5.7 | 1 
                 dmalloc-5.6.5 | 1 
                  inadyn-2.9.0 | 1 
libdbi-88b8477d57153b9f736d... | 1 
               libyang-2.0.112 | 1 
               linux-pam-1.5.2 | 1 
                log4cxx-0.12.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b70058f3a080a6d18aa4530dd63b52ae09af079a |     
   x86_64    |        containerd-1.5.7        | NOK | http://autobuild.buildroot.net/results/0dadb6e93062bc24eebcd650bbc3b2f54d341a08 |     
    arm      |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/00565c4b0618ea5f553d8c22284637b6574e4a93 | ORPH
    arc      |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/c70c1d047bb54fecef968b1e8264791b3f05ec67 |     
   x86_64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/a3c2371243a81cbab35358b2a88123af22ed2cbb |     
 powerpc64   |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/abcf8b9291451ce0a0abae769d6b22983792fa6e |     
  sparc64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/760581fc4b56c73cc5e27fe3beadc6419d9fde73 |     
  aarch64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/314b58f2918505f7746ad8c7733d62f523e03d31 |     
    arc      |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/28eb0feebf4f6de52748a422984f19d11c52a036 |     
    i686     |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/1df78aa143431ca99a87eedf055410d8861d40d3 |     
    arm      |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/f055f8541cabcbb6ec2ff586005fbd4467995840 |     
  aarch64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/aa494bf969c4777bc17f97daeb733f28528f54d1 |     
  powerpc    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/40d05b6cb5be6dec5025d27a7b9ac4f4cd6b5c25 |     
  powerpc    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/06cec92552a2b442831e1e8a5d73c3663f002485 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c6c5363c5d7ae737202906d598e5f8ef99d5b690 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/64b85de7ed7f9fbb0a68d7cf02310aba00b8697c |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b7625da0c11b9d9fb43a5abd7fd6e386ca91b396 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/cea2a2f2f6b00972930d221ddbedade86a85b50b |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/04c8567b47035e5241203cebda1b57f06743f99c |     
    arm      |          inadyn-2.9.0          | NOK | http://autobuild.buildroot.net/results/234fc3ebc9738ef682fa6bfa0595132fa7c16aa5 |     
    arc      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/dd532df41cc94b692ee358d048f643dbeac4250b |     
   sparc     |        libyang-2.0.112         | NOK | http://autobuild.buildroot.net/results/623913bb281ffd46b233580bba2c4f4a280358ff |     
  powerpc    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/9c3dd027c27cbe44cc9ec3fcf592d5370ee515e6 | ORPH
  riscv64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/f75e44192cad593abfc3ca3074b3bf801568cb5b |     
  aarch64    | rpi-rgb-led-matrix-63e3e7ff... | NOK | http://autobuild.buildroot.net/results/d18fc326c6e2443af9dd8d7c22ee6671f58cd536 |     
  aarch64    | rpi-rgb-led-matrix-63e3e7ff... | NOK | http://autobuild.buildroot.net/results/be291d6b0efdc1914babfb4a9be5eb863058eaf5 |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d25b915797a16b674052fc3a2a73b1106491b192 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5c1a79562ba00b4cd5e11ded9a4f857aa3788bec |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/735e513fce76604402138ec0fa578ec780b7e2fb |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/51697ed0d259884ead0370a6a6f97f2b179a43d7 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6b1ffa5ded10b1b8bf26759633eb74c6f8c40726 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a58412a0deeb763127a3d17c3665968a3a38f2ea |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

  gobject-introspection-1.68.0 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/5665ca857022b8cf8dcb5d3e157fb94ecadc116d | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a857afc8876480c36264b685ca9e5fa26ddcac1f |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/6853d88b650395c92f73c0b4af55165c33c6ba60 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 2 
               libtheora-1.1.1 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5f85efe439e6eb5c1c502308beacadb736b2b950 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f875437d8f652965928a563605df80101227258a |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a8fde5969bfc783be31a11adbbc0e411294969fe | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/82d63fd915b9c1074c480c99e52ce8df58827d00 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
