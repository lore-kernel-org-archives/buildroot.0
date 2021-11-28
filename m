Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C78C433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 07:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A360283051;
	Sun, 28 Nov 2021 07:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0rkk0eab_sz; Sun, 28 Nov 2021 07:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C199B8303C;
	Sun, 28 Nov 2021 07:57:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D75571BF2F5
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 07:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE7F440103
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 07:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVivDZqwsyHJ for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 07:57:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF829400F5
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 07:57:32 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8D40F4000E
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 07:57:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Nov 2021 07:57:29 -0000
Message-Id: <20211128075734.BE7F440103@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-27
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

Autobuild statistics for 2021-11-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 69  |  6  |  0  | 75  |
  2021.08.x  | 54  |  1  |  0  | 55  |
    master   | 95  | 20  |  1  | 116 |
     next    | 15  | 12  |  0  | 27  |

Classification of failures by reason for master
-----------------------------------------------

              host-erlang-22.2 | 3 
               pipewire-0.3.39 | 3 
              tinydtls-0.9-rc1 | 3 
               capnproto-0.8.0 | 2 
libdbi-88b8477d57153b9f736d... | 2 
                 wavemon-0.9.4 | 2 
             openjdk-17.0.1+12 | 1 
           python-pybind-2.6.1 | 1 
                          qpdf | 1 
          refpolicy-2.20210908 | 1 
                samba4-4.14.10 | 1 
                 watchdogd-3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6bef67c83be8c31131e10bd0b0567c107a159c30 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/db7b9f990fbc05df305847a7c38cedbd59f65112 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/997926ebe05bac3821bf71aa12af449edd3d1744 |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/de43001af1bd33614a14010398e652c43761dab6 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c6bdc6452d094453ababe5599ab10caf497f5396 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/b61d7bec3063a6c35398cb5a307bd29173de0234 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/653058da4fa002e269a35ef39c4690783fd60fdb |     
  aarch64    |       openjdk-17.0.1+12        | NOK | http://autobuild.buildroot.net/results/7f76298cd61525f51c7a7f420b9e0d42596e9c62 |     
  mips64el   |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/66724a089dd31652f339b8fc6a7243d1bc85a713 |     
  mips64el   |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/0519a2fcf9ad23e8e192521699a2d669ac7c74fa |     
    sh4      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/b763fd86feb3ac691761e02d4c1708161b1c137b |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/79677cd758a79f4ffc4663a2f6ade7107da3aa53 |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/6ed66b04cbcceb2bc111a1a30d4b48386188adcb |     
  aarch64    |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/610484c288fa1923d9ee28a3cb780dcb67579eee |     
    arm      |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/b7a08e5d6c131912c0c8f16d2f280cf1b46de015 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/edb621c4ca67a5d786b7a6c98b0aba8eac78c395 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8f67980585cf0138f937c10655c51b7fc0c3e3fe |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2a6014a5188885e62266f62bc12bbabf034162ce |     
    arm      |         watchdogd-3.4          | NOK | http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e714ac7f9cb2dfa9a1f46df72a67363514f0d470 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d5ee77ef4b431709253e3eda46830c0c9c189170 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
monkey-f54856ce250c4e257354... | 1 
                suricata-6.0.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/602e149eefdc2fec84e0064081e204a4db9420e5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7e9fa4c662282bca631710d8071daea7ccf16e42 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f9f5b3621a73675a3b632e59200444c39fd00bc0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/36d4b28280e1322a642f5699013934b87292d906 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/4625b182448c9216ab95ceb843bc171dc1afb940 |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/4b88749e36e2c096e53ccdcbe6c3d968e9034d0b |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/59c57e42a187f85e5d0726e9013cd75d3f84e154 |     


Classification of failures by reason for next
---------------------------------------------

              tinydtls-0.9-rc1 | 2 
                  uhd-3.15.0.0 | 2 
                  assimp-5.1.0 | 1 
                  botan-2.18.2 | 1 
              host-erlang-22.2 | 1 
libdbi-88b8477d57153b9f736d... | 1 
               qt5webkit-5.9.1 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
xdriver_xf86-video-fbturbo-... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          assimp-5.1.0          | NOK | http://autobuild.buildroot.net/results/4dc029f0cf4e89f842420bc5b812596a655e7d4e |     
  mips64el   |          botan-2.18.2          | NOK | http://autobuild.buildroot.net/results/4078d265bdc71ad91f2afae42d7c35d20fa33a17 | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/26455fd0aaf9c767c299a847b521c693a40683bd |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/15500abbe02b3bf504a52f1742ac260dea67cfe9 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/6897ec9bb22e8e67e6313c88eb385031224060f8 |     
  sparc64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d5295376a673c082d57b1699332b4afc489796ea |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/db43aea1f4612fdb8444036e615aba9d218d8ec7 |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/8f6d4182b472d776ae8d82d5da62c14c4268d71d |     
 powerpc64   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/2ff6415828a1dff046706208f0e95512bb8c0ca2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e2837f66bde36f989c122c503cbec536f44cfb77 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c4a4ac9080560a4078f78a71b19a6ad53d9fc11f |     
    arm      | xdriver_xf86-video-fbturbo-... | NOK | http://autobuild.buildroot.net/results/7351c4b124e52c92b3f2a7cddb10827c72677048 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
