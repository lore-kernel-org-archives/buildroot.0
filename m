Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA08C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 06:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DAC81750;
	Wed, 15 Dec 2021 06:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rF1Xv6B-_R62; Wed, 15 Dec 2021 06:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 417DA81490;
	Wed, 15 Dec 2021 06:55:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57C701BF2F1
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 06:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40C0A409EB
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 06:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NOxSKm2OFHs for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 06:55:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2B49409E7
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 06:55:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 56ABD40008
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 06:55:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Dec 2021 06:55:02 -0000
Message-Id: <20211215065507.40C0A409EB@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-14
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

Autobuild statistics for 2021-12-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  |  5  |  0  | 46  |
  2021.11.x  | 17  |  2  |  0  | 19  |
    master   | 77  | 26  |  0  | 103 |

Classification of failures by reason for master
-----------------------------------------------

                 wavemon-0.9.4 | 5 
              host-erlang-22.2 | 3 
                clamav-0.103.4 | 2 
                       frr-8.1 | 2 
                log4cxx-0.12.0 | 2 
               pcsc-lite-1.9.5 | 2 
rpi-rgb-led-matrix-63e3e7ff... | 2 
                       unknown | 2 
                    bird-2.0.8 | 1 
                      gdb-10.2 | 1 
               libtheora-1.1.1 | 1 
               pipewire-0.3.39 | 1 
                    pppd-2.4.9 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/a252d1ec89483b2f63ad3fd8649df480ccad2e66 |     
   s390x     |         clamav-0.103.4         | NOK | http://autobuild.buildroot.net/results/fbb50df7ac4f36c44a6434515201b3d3d2a14590 |     
  aarch64    |         clamav-0.103.4         | NOK | http://autobuild.buildroot.net/results/af4ef5887b4325cac6617d5240e29093dd088ca9 |     
   x86_64    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/b68d3e369e2925938bde39508988aa9b701f1045 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/766e3d00e16119414b9a54920be19840bdfb30b7 |     
   sparc     |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/5d7b5b6b469e4874fe7b2845ac48e03e80a5cb9b | ORPH
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f9b5eb72f7299ecc473e31df82b6d03bb7d4ef8d |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1397ea59ae8d33b04755edd1e530d83ccf264f5d |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e71f4cb417cab2c6698a3fc5b4294977fb5aa183 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c683fcfc37f45586bd8eb03e3f60b3d306972e37 | ORPH
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/a6fd8eac181c83aa97ea5a410da0ea9414705b76 |     
    arc      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/df903176502aa51bc3551749156dfed162324a32 |     
  nds32le    |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/1c2bf5bf95d1ccd08f7eefa86b8e0b337724ae3a | ORPH
    arm      |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/6cf323229f32967aa554418410dc94b7094d09af | ORPH
   sparc     |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/3eb3b5db0c4ceb24362dd339fb18dd5e1a40e07d |     
   x86_64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/3a7358de6199bb069bd38139747e2d50f9416fd0 | ORPH
    arm      | rpi-rgb-led-matrix-63e3e7ff... | NOK | http://autobuild.buildroot.net/results/8fbdcdecfd60f4bcc356448659da723cbbb01e8b |     
    arm      | rpi-rgb-led-matrix-63e3e7ff... | NOK | http://autobuild.buildroot.net/results/c035da0d183f21343f19f7dee982e8e73ee781e4 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a800eb24364231b2774f0dc3c9d5bbbe91a5e0e0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6848bf839b445978f45a6b3a9420deae7e924d51 |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3141a9babe60a13f92cf62e406f181328b8df977 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d38eaad5656fe39df1875750e20d823c566fdeb8 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2fa4bc96507dacc47429f97c1caf50277b931d33 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d3dd514253daec2c772ad89292e42abba4b7b2c9 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/446737ab11e1928314ce20f450eca95d3b035907 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/959f196c0c30769196b70b63823a60b34503c19b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
             bluez5_utils-5.62 | 1 
                 gerbera-1.6.4 | 1 
monkey-f54856ce250c4e257354... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       bluez5_utils-5.62        | NOK | http://autobuild.buildroot.net/results/1226367d54bd653b003448e8ae66f849445bc1e5 |     
    arc      |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/7f18113cd6fc024f70be5e7e7606dde7eae3f116 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3fbd15aec6cf17d29fbb5ea4c55160179d96bcd2 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7800e30e1a07cc952167d4f694b940eae3b03759 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d03b06ef1f31cac62cd7c450449c3d27b1b6421d |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                       unknown | 2 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a91f9f6d83590d47cae92e36eadff26967995e61 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf65a1bbd708ae1c8c0292feb000162f1d744100 |     


Gitlab CI results for 2021-12-14
================================

Detail of runtime-test failures for 2021.08.3
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1880516942  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/1880517068  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1880517171  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1880517183  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1880517184  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
