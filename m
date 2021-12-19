Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E913C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 06:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB3FF84DC6;
	Sun, 19 Dec 2021 06:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWNjQQhdEjKc; Sun, 19 Dec 2021 06:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2EA484DCF;
	Sun, 19 Dec 2021 06:59:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF6201BF267
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 06:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA5C24027F
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 06:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id De2PPQncUPc4 for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 06:59:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A034014C
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 06:59:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 268DB40005
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 06:59:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Dec 2021 06:59:03 -0000
Message-Id: <20211219065907.DA5C24027F@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-18
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

Autobuild statistics for 2021-12-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 59  |  8  |  0  | 67  |
  2021.11.x  | 37  |  2  |  0  | 39  |
    master   | 125 | 37  |  0  | 162 |

Classification of failures by reason for master
-----------------------------------------------

                  boost-1.78.0 | 8 
              host-erlang-22.2 | 5 
                       unknown | 5 
                       frr-8.1 | 3 
           host-harfbuzz-3.2.0 | 2 
libdbi-88b8477d57153b9f736d... | 2 
                 wavemon-0.9.4 | 2 
               apcupsd-3.14.14 | 1 
                  assimp-5.1.3 | 1 
  binutils-arc-2020.09-release | 1 
      gst1-plugins-base-1.18.5 | 1 
               libtheora-1.1.1 | 1 
                 openal-1.21.1 | 1 
                  uhd-3.15.0.0 | 1 
                  waffle-1.6.1 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/dbedbe906104d65cabbbbb438256826aa3458454 |     
   sparc     |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/58b146b8239bcc2c90f9f4d3c48471c510e0d5f0 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/4ff9efed2bf70ee0aace9e3b017e919fbde1c581 |     
  mips64el   |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/95895a91f5c2478de28f5d48cc4abbcc8d918c10 |     
    arc      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/2d09bc3b7175848312ec361560220f893abcfec9 |     
  aarch64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/656e7f601cf87c1bf7b48e2efa1180a34879846a |     
   x86_64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/32cab47f3e8594ceb82eafc259634c1de88b2af3 |     
    arm      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/1cd493da7821563d09c40a644317d0327935ef32 |     
   x86_64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/b98a6c623eed26093e577025ddff921331f49692 |     
    arc      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/ed1e267c66c60e31173fdb4662cb5f4e3f6350be |     
    arm      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/3b7c3b200a8c38f1bd5cfe9db6f8d47c4d22bd29 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/8c79f2aaa474af0afc16e4b230dc026e8272dba3 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/eb623ab647d61d29f697d06b243c028d63c78c03 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e24a893ecb51eff6941f2f63437f552661a5d9a9 |     
    sh4      |    gst1-plugins-base-1.18.5    | NOK | http://autobuild.buildroot.net/results/c9a0417c473b08948e4721c74be5c7b1217dc8de | ORPH
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b3391677117e4d7b9558148dd932ba4ccae5e45d |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5586854c8c81b74d999d73c447cb3e3fae36980b |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9afb85a1c5bd60abf35371d1503c1c8b6931ccf6 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/78f7acee8f798e174931431426ae39dfc660885f |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/008482a97969ea52c755e2afa5ee085e96f9b0f4 |     
   xtensa    |      host-harfbuzz-3.2.0       | NOK | http://autobuild.buildroot.net/results/89e1194c1659d7e1af9db8ffe5feee770c448f76 |     
  mips64el   |      host-harfbuzz-3.2.0       | NOK | http://autobuild.buildroot.net/results/ef12550581a32c8096f42d05575f0f6ea9411a6c |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/70dc4252d167f51b14a4123c44db14a9a39f5db1 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/cc016af81e3ebd8ee323871ede92e40d86c278bb |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/efe8c792c54bf6f6a1050fe3cdace7e79dd7af8b | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2d5e3065d35ce8a161c049bcf4e5f4ebbf5dd40c |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/73a6c879a487eeeadce0201529abeea78d77e6f3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4ff4e19c8ebd4009a2006f1367dcda9f594cdc61 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/050d3467b0fd599e2b66c4d50d6b060ec812dd10 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a14fca57a96d0534eef4e0e29c4087b2b65b886f |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/de14e4c7b33eb842b2cf67377f4663d6f7beda72 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/2303a8e5b4b64c611a17ac2aeb2a73198d9f97ff |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/49ad3e67b045e7d665a5d566e55ffb101e9bc578 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2b222a4e1addeb47ee6ba357d2d20fc506d87f5c |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/84fb115394cc3cc42440c60ed2cfb19de1d28b10 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ed93f916eda304b30f320816c85d1b0d4488c699 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/90a11139dbe58d20beb508f3bcb3a9e970d44a23 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 
               openldap-2.4.59 | 1 
                qt5base-5.15.2 | 1 
           uboot-tools-2020.04 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82f176d73486aeca0b8534b6540f79998c0a06ae |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/966ba216b5933ff3ee8f024a144c05b0cb36ff77 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/11fb68142bb681db4f473a0f940bd803067a4cb1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/6e3d304eb2204baa6f5abf6b414fabb0ab14af3b | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/908c407d9fa490e74fa20c1cb4b6c1606b6fafbc |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/8d261ca2bec8d5c8e70aba2f928e9a786a74c47e |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f78df2efb16a33d35083478b2f2b8d1758d2b3c2 |     
    arm      |      uboot-tools-2020.04       | NOK | http://autobuild.buildroot.net/results/bcf1b531eff806b5c88c182b2a68a1a154adcacb |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                log4cxx-0.12.0 | 1 
                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/914888f0b9ceb9f2ce18c69abec0253c9d3b383f |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/44599164284cab5d30ba22e7e27cfeaabc1f1e54 |     


Gitlab CI results for 2021-12-18
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
