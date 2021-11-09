Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE08FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 06:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04E6060D42
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 06:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04E6060D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90239606A8;
	Tue,  9 Nov 2021 06:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLblINo-p8kN; Tue,  9 Nov 2021 06:57:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BAC60608;
	Tue,  9 Nov 2021 06:57:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3796B1BF831
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 06:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D37260608
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 06:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KENThkf5hREx for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 06:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B497E605E7
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 06:57:23 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7CAD34000D
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 06:57:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 09 Nov 2021 06:57:19 -0000
Message-Id: <20211109065728.2D37260608@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-08
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

Autobuild statistics for 2021-11-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 33  |  9  |  0  | 42  |
  2021.08.x  | 32  |  3  |  0  | 35  |
    master   | 68  | 31  |  0  | 99  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 6 
                       unknown | 4 
              host-erlang-22.2 | 3 
                    bird-2.0.8 | 2 
libdbi-88b8477d57153b9f736d... | 2 
                   mpd-0.22.11 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                 diffutils-3.8 | 1 
glmark2-06e78b67702b5413335... | 1 
                 libvirt-7.7.0 | 1 
               lighttpd-1.4.61 | 1 
               pipewire-0.3.39 | 1 
            python-ujson-4.2.0 | 1 
                    qemu-6.1.0 | 1 
                 samba4-4.14.9 | 1 
                tpm2-tss-3.1.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6156604c9682b4a52992910b2b93338f591301b9 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/027379d981425315ae3e16ba7432a35194a69757 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/2bcc69da7f97c740c063ccaad8003db5274a63fc |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0fa8e30d81ed8abee08b451938ccd2a5f2215fe4 |     
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/cb5d68cb3cabc289f3791e0ddde3f532536d7930 | ORPH
    arm      | glmark2-06e78b67702b5413335... | NOK | http://autobuild.buildroot.net/results/e393dbfba7c2989fe983df47ea0638c3ba62ae7a |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8958c79e5dd90b784ef0ea903e8d9e811763af72 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/fc3fb9d2a3abb97040a22836663d5f1a1b7e742b |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/19f7b23941ae49a787f4c94d7056ad7e592bedee |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/72bdfb94dfcd09ec7b923dc6546b41f00d13f218 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/dd83fd1c5a7c49ed5dc3cbc3fd88d68c2d46c4be |     
   x86_64    |         libvirt-7.7.0          | NOK | http://autobuild.buildroot.net/results/3a20db6cb39c0d91213adbe82934274659df43e7 |     
    arm      |        lighttpd-1.4.61         | NOK | http://autobuild.buildroot.net/results/0349d8fed35b0766796dd9ba3b8de6ff8bd68fe7 |     
    sh4      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/c6682cde69f1b837280e2f37dbb25151a4cd253d |     
  riscv64    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/78766a71dbe120b5e19bf0474f84a33d92ce44c3 |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/b93db9ef243f133f54980c8cfa20117e9c6e44fe |     
    arc      |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/5b4093aed08510ecbf01ab271ee7cdf68e71011b |     
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/15566782b3ba1c75c13f2062dfac65b9bf6c7d5f |     
   s390x     |         samba4-4.14.9          | NOK | http://autobuild.buildroot.net/results/d0b823595e7e64f389373f6ef804a967f9fa6fb7 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/444dae1913e495edc9098c64a40c931fcdd19b31 |     
   s390x     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c1d67f2cb5e346fd99dee773fcd61b92af2cb13a |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/142a0fffa01159353c122109de465bdc6bc05c10 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/bdeac18163949e8e41578e32abb4905a97b6aa06 |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f7a9bd5aafa76805e969be9841d97dd682067fbd |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/24f55c6d411691a7af66acc048db3aa5b365bd45 |     
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ae98865085076fce17a29509e06f484a17d13173 | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9fc9f5ee7ad85015858bdc309623bf1d69ae4dc5 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/2cecc2c2fda28029a60b750354ba3e1797b90c93 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/66984e5e865118c3362f372f220f7e5d0447e753 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/61dacc7ca4de83afde91d9f60e6c9df3ad7ffe5f |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/31d8484f083ee76348e689fba8fdaa663110a81b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 2 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-20.3.5 | 1 
                    olsr-0.9.8 | 1 
                rocksdb-6.13.3 | 1 
                suricata-6.0.3 | 1 
                  vim-8.2.3565 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/80cf6cc9588b612596c8957440551c8eed08a9eb | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8384ac21ea562106b3fd4d74be0efd67c50ade14 |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/d8836945b756727863177fd385515408ce945274 |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f23e30c6c50c22d44a57d5a8ea230445211a4874 |     
   s390x     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/cb0840cb9b844b7b30ad8eddf3f122aea086502f |     
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/4b78a68e8bd120a3e9c46fea83fc0252d601f1b0 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/5108d223f6f7fcd7dd8563bcbc191252bf4e1dce |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/00a21925911e9018076823015cc9c5638de70315 |     
    m68k     |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/082c32d57c1789e672804c865de602a4df3f5a4b | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

  gobject-introspection-1.68.0 | 1 
                    olsr-0.9.8 | 1 
                  vim-8.2.3565 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2a124229f4003b56e708fb622cf92559b1442b08 | ORPH
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/872bbc38203fb4a7be9f29946b04ff26cb9f5a35 | ORPH
    or1k     |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/20d488a37f73430963636abf59f789dd40481ddc | ORPH


Gitlab CI results for 2021-11-08
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
