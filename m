Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2F6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 06:55:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18ED66115A
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 06:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18ED66115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A900480F84;
	Sun,  7 Nov 2021 06:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTPjKx33tsNo; Sun,  7 Nov 2021 06:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC24C80FF2;
	Sun,  7 Nov 2021 06:54:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEFA81BF487
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 06:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CED66402C5
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 06:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vikWgpiCYNFm for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 06:54:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E530402C4
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 06:54:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 26A1940004
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 06:54:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 07 Nov 2021 06:54:51 -0000
Message-Id: <20211107065455.CED66402C5@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-06
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

Autobuild statistics for 2021-11-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 39  |  6  |  0  | 45  |
  2021.08.x  | 31  |  5  |  1  | 37  |
    master   | 55  | 46  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 11
              tinydtls-0.9-rc1 | 5 
                   mpd-0.22.11 | 4 
               pipewire-0.3.39 | 4 
              host-erlang-22.2 | 3 
libdbi-88b8477d57153b9f736d... | 2 
                   luvi-2.12.0 | 2 
                    olsr-0.9.8 | 2 
               apcupsd-3.14.14 | 1 
                    bird-2.0.8 | 1 
                  boinc-7.18.1 | 1 
                 coreutils-9.0 | 1 
                      gdb-10.2 | 1 
                   iperf-2.1.4 | 1 
                log4cxx-0.12.0 | 1 
            python-ujson-4.2.0 | 1 
                 samba4-4.14.8 | 1 
                sg3_utils-1.46 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
              webkitgtk-2.32.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d0d2c8dc7ab7f02a04d36672861cb736e54e3b93 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/ec7cf36833a2f0ef653993a06167ec0962bc4b9c |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/ed3656f443364f01895600f332816d20e340f315 |     
   x86_64    |         coreutils-9.0          | NOK | http://autobuild.buildroot.net/results/c69f5c8b8e53ed3de753f0c6d2cdd99497504b49 | ORPH
    i586     |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/85c7e73400ddc598f6ea11e358e44f6d09a2ddcd | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c0ccacca2ed4415480bf8de894f0c8a0709faac1 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/326b650fbc4bea4cf0591ef508fdc09a222303b7 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e01e00b62c0d9e246f5bf18b0fde534c36631499 |     
    arm      |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/2d68d5fd0d159de94be9f51be45139d594118166 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/1c1dc338eddb6e237c49e0b8438e64237a55d471 |     
   xtensa    | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/0d44159c1b6f80474027ed785e53d583fdea62b4 |     
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/589d09f1866c2751b8584fb8c42ddc6815bf338c |     
  powerpc    |          luvi-2.12.0           | NOK | http://autobuild.buildroot.net/results/69e9a2e5ae2a0b0482570beddd2abae7963b4cbf |     
    i586     |          luvi-2.12.0           | NOK | http://autobuild.buildroot.net/results/132dfc9a2a0b3e971462c9c5f56941256fb72d09 |     
    arc      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/3bf27b3e95cdea6c9d756f0a96f45cd2aef05dc6 |     
    arc      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/7bd2325b0af590e3d72c7ae0e3bb5ad8e9e24e37 |     
    i586     |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/9047f3d551363e7b38126cdb421aaa934a519f0a |     
  sparc64    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/e4d2284af274a4e3e2d57c54ed39fa3a1d533f4e |     
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2d8e0bea9ecdcc0914c08ca3647f64b78cfe4e5b | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/11df612048f9bbb92dfc9ae40dd90f58a778b82e | ORPH
  powerpc    |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/eaf255c46b10cbb6b8a629bc15acf7772d5e274b |     
  sparc64    |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/67818dccbb8f1e06802f489b4d0dcf981476acbe |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/d449095c67b9477fc95ebbab5eb628e5eb4ea5c6 |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/02d5dd25dca17a6745b840e62260d3cf432725ab |     
    arm      |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/f78abd13bbb54b82b38e9feb848c5f4560c3df4e |     
    arc      |         samba4-4.14.8          | NOK | http://autobuild.buildroot.net/results/f2a2123c2ed3de316ff585a4ac8f9d14e3ec7c95 |     
    arm      |         sg3_utils-1.46         | NOK | http://autobuild.buildroot.net/results/adc20fd52052daadfe1f16ee3f62c30e518cbd16 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/0b623240c7106f487c0384ef724e561b344fb381 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3e9bb037ad4051f0669938cd959d846a404e717d |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8c87ceb0d7ba88a138a30c60a387fc7eb22b68bf |     
  sparc64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5e849f9d5a245f52ad1fdacf0d5dd29230a97e12 |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b746a863cc43038eaa8ba9cbe9c25f4270ee3e6d |     
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/fc5cf79b6798a7a5150be161b031cb44c89fac3a | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/353649c904f1007591738fdcc83b895194d4ec78 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/0900bbfd58bb5aad86f8168cf0733e55b2ee914d | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/bce3dd8b799e2880bb1a718f58d4598d98004771 | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/68a1da75797ee23cd354c1111074c4b0e3640b74 | ORPH
    i586     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/660bf8f8e8faffc408d42e66ba148cf1601ca36a | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/84fb5bc83b269b5f5e892ba3b78ebd7326782fe0 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c0b93928b7e6bdb50685a6202c7ffb472f3c80bd | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/fdf4befdbde6df114f472ba06247591693f06a89 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/9b85611c720f8baa473e0165f73028dd83b366e6 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/9ca2f28226cd6d157496137cd311901d708fde76 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0fef9ab1af590bd532d4b8029502a673d79e06a1 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2d94f889033b28a7bc7bea79c572358391954f8b |     
  aarch64    |        webkitgtk-2.32.4        | NOK | http://autobuild.buildroot.net/results/2fbbf65a3dd8b6916fadb459af1b308f88b58554 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  vim-8.2.3565 | 4 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/84fa063f91653f5a8e953605c45bd807264464a7 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f35d54a45d9e75c3103d728397e3ae919172d598 |     
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/415f632a634e65e7f417b427fdcc708b6ea80a90 | ORPH
    or1k     |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/31c728ab0436cf55ddf8b3945e6698464560c8eb | ORPH
    or1k     |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/587d5dcb46d61e309e309eda1fde75d380ca872d | ORPH
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/3709be69afdd4286a702f6cdfb92b5fa60218d1c | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  vim-8.2.3565 | 2 
                 mesa3d-21.1.6 | 1 
                  mupdf-1.18.0 | 1 
                 openal-1.21.1 | 1 
                          qpdf | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/d16fd0c5e7e7732dbdc41f4850f34c01498d7baa |     
  sparc64    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/e58d30663083ecd15d0cfb3c80a20169f01a44fb |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/cab45260036f8d7894ef519e92c2eacdc37de122 |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/ef2fd78ee7e3788c80da443e95a4d0dc4a3bde44 |     
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/12dc7e4e5ba21ef0923a04501ee6167627609a4d | ORPH
  powerpc    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/de365e959ff454042c149d40eb7bbd0d273e86f9 | ORPH


Gitlab CI results for 2021-11-06
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
