Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDA3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 07:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4881F813F9;
	Sun, 26 Dec 2021 07:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfTKlQi575zR; Sun, 26 Dec 2021 07:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CD3B813FB;
	Sun, 26 Dec 2021 07:01:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA9191BF3EB
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 07:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D4D60D65
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 07:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTnAgpvMOQHs for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 07:01:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3971B60C2E
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 07:01:01 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6FC06100003
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 07:00:59 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Dec 2021 07:00:59 -0000
Message-Id: <20211226070103.C8D4D60D65@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-25
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

Autobuild statistics for 2021-12-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 72  | 12  |  0  | 84  |
  2021.11.x  | 27  |  2  |  0  | 29  |
    master   | 105 | 39  |  1  | 145 |

Classification of failures by reason for master
-----------------------------------------------

       lttng-libust-legal-info | 8 
                  rygel-0.40.2 | 7 
                  assimp-5.1.3 | 4 
              host-erlang-22.2 | 3 
                       frr-8.1 | 2 
      intel-mediadriver-21.4.3 | 2 
package/lttng-libust/lttng-... | 2 
                 wavemon-0.9.4 | 2 
                  boost-1.78.0 | 1 
                   guile-3.0.7 | 1 
             gupnp-dlna-0.12.0 | 1 
             kismet-2021-08-R1 | 1 
libdbi-88b8477d57153b9f736d... | 1 
            lttng-tools-2.13.2 | 1 
   openvmtools-10.3.5-10430147 | 1 
                          qpdf | 1 
xdriver_xf86-video-nouveau-... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/4551e2a4601bd14425188a0af26541c23752da55 |     
    arm      |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/e90b158a7433a881bef56da0b0da4b98be2af332 |     
    or1k     |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/c09478efd8469914429f7fccedf02bbc9231ce22 |     
    arm      |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/5d72b5d9c5f5f9ae2794ff9d19d8e4c9c4c28598 |     
    arm      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/cb5039ef3154ce970d735161843eba89fca40759 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/80ee65a4eb4e1b344c92fa454a137c6c86b89451 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/a50f9b270a578ace16caca2cbdbb55c76560d92b |     
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/625fa7a7f54ea93c8d2f288a71d99a563fcea215 | ORPH
    arm      |       gupnp-dlna-0.12.0        | NOK | http://autobuild.buildroot.net/results/3b580c8d9cb136455c710549909bb78c8b38b9c1 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f1785087f2a2eb0456d71aef32ffba45992d98c6 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1fedf51cbf1d6946f3c4ccc7d9521beeec1d2594 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/fb6001841d607af83d88fcf3cdb1ffca0aecb22a |     
   x86_64    |    intel-mediadriver-21.4.3    | NOK | http://autobuild.buildroot.net/results/8d62590fbe3ec2e5b7b9518054647628e03aa17c |     
   x86_64    |    intel-mediadriver-21.4.3    | NOK | http://autobuild.buildroot.net/results/1178d072a86f3fa85866edd98f92494688cac9ef |     
    m68k     |       kismet-2021-08-R1        | NOK | http://autobuild.buildroot.net/results/ead34dc2ff6018fd72096d30b5fbb826ef86e00f | ORPH
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/4e74829daa8ca7fd5073478631fa8e6ac262f90c |     
  riscv64    |    lttng-libust-legal-info     | NOK | http://autobuild.buildroot.net/results/456e25e9940b458323db030bc697b68b2c4889f9 |     
  riscv64    |    lttng-libust-legal-info     | NOK | http://autobuild.buildroot.net/results/b30390641fc649767d9fbc8d07cd505d2e61c0a8 |     
  sparc64    |    lttng-libust-legal-info     | NOK | http://autobuild.buildroot.net/results/470d6401f2a97f4ac91b2d8cfb1af90b638320a9 |     
  riscv64    |    lttng-libust-legal-info     | NOK | http://autobuild.buildroot.net/results/43a43f8d204ea253bdbbcffdfed0ea5c675cf413 |     
    arm      |    lttng-libust-legal-info     | NOK | http://autobuild.buildroot.net/results/9d62548a1b148f8cc61939671a8f94b72474b428 |     
  aarch64    |    lttng-libust-legal-info     | NOK | http://autobuild.buildroot.net/results/7ae1b7fdb7b985c7e5644beeb3199f59dc62a327 |     
    arm      |    lttng-libust-legal-info     | NOK | http://autobuild.buildroot.net/results/0625b5dc7a2e9261263b2c6817a11a0a049ebe93 |     
   s390x     |    lttng-libust-legal-info     | NOK | http://autobuild.buildroot.net/results/421eae66f3af53970ce7f17331fc85f4a9b2bac8 |     
  mips64el   |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/066c72f04b4c82df3c5c6a75d2eef232d4468612 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4af7b6b48ddd01f91a14623ec4cee161b2e27272 |     
  powerpc    | package/lttng-libust/lttng-... | NOK | http://autobuild.buildroot.net/results/fd0eeb825ec096de806383e4a21f4ef32a59fb37 |     
   mipsel    | package/lttng-libust/lttng-... | NOK | http://autobuild.buildroot.net/results/3f0cf869d0d1b28d73f815acff51f55500e01f2b |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/ab1add3dd236bfae521d3cd268af4b7a53579e13 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/65f9072888dc759f3b9ef6ad210a7c7171d8fee7 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/cede2c521464a57d7776c8a2e1d02bfecae6a6b5 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/1752e8e4eb397a6d7a33f4d11574ae847ca2fc4b |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c6ff755ed64d908bc172371a0994cdccdf8c6b7a |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/3b71f733d11c2bc5ff67776dcbf05ee6d2379dd8 |     
    m68k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f29bc568774f692bf77d7d947031f3de2cbbb286 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d7ad2354de756f60c6576676e3a2531eadb9ffc9 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8f7b38697a49244bc1814bb49a05e6dd5b098a35 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/82b9a83a3c0db250de25dffe4b46577bdd9ab068 |     
  sparc64    | xdriver_xf86-video-nouveau-... | NOK | http://autobuild.buildroot.net/results/31e0b27441b3a68199f790a56d6c2bbccf5a7620 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/195410c6e43debf2599a861dfc68720ee963a553 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
  gobject-introspection-1.64.1 | 2 
monkey-f54856ce250c4e257354... | 2 
               apcupsd-3.14.14 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 openal-1.20.1 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/1c16fd9e2537389e4695dfa98b9f38dff5dc2cc6 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/15a59e7c1fb6163f476402c8a64652d35daa4efb |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/bf07001e6898d10a7c1f53a99f100423fb4ed868 | ORPH
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2e95b1e9cf3c01006641313d5a7f65be984be1fe | ORPH
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/99173f5ef6cc1a6be95faa41dc8e96e391bd29f8 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cabec70fdcfd61804957c763e4437305b1c98c80 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/696e4445404859326b2d3465641dcb633dcba0e7 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/3102242cf857a7d2316fa083e11299f9f6ef5d56 |     
   mipsel    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/32dc6ff99b6d2fec2552a9af1298fe8eeb75829d |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/6160b313f6e83535c3fd7e87d67da41537c5faff |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b9196c3102d052d904f23a037826a0913b823cef |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2b992fe7c9d708fb3a65ae59fae86bd75ddcbb6b |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 libvirt-7.7.0 | 1 
               pipewire-0.3.39 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         libvirt-7.7.0          | NOK | http://autobuild.buildroot.net/results/332f369b09d7cd582034c46f862d77c38ff788ae |     
    mips     |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/6019b4818d56ec3274d31ffa9d057d9307b93b47 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
