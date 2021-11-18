Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F439C433F5
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 07:59:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89EC461B3A
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 07:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89EC461B3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B69C400CD;
	Thu, 18 Nov 2021 07:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNbbfY42OyDh; Thu, 18 Nov 2021 07:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1963400ED;
	Thu, 18 Nov 2021 07:59:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEE0D1BF275
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D08400CD
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 07:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xa_ox5qHZ7of for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 07:59:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15756400ED
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 07:59:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1F06DC000B
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 07:59:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Nov 2021 07:59:16 -0000
Message-Id: <20211118075921.D9D08400CD@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-17
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

Autobuild statistics for 2021-11-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 39  | 10  |  0  | 49  |
  2021.08.x  | 66  |  2  |  0  | 68  |
    master   | 70  | 23  |  0  | 93  |
     next    | 13  |  5  |  0  | 18  |

Classification of failures by reason for master
-----------------------------------------------

              host-erlang-22.2 | 8 
              tinydtls-0.9-rc1 | 5 
                      gdb-10.2 | 1 
libdbi-88b8477d57153b9f736d... | 1 
               libtheora-1.1.1 | 1 
                log4cxx-0.12.0 | 1 
               pipewire-0.3.39 | 1 
               qt5webkit-5.9.1 | 1 
                    ruby-3.0.2 | 1 
                  uhd-3.15.0.0 | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0 | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/136e9c2f53e3ed82250e93fccd7c2976582df103 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/427204a7d15e2ae033aff9b5c3978557a09bd231 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8f4233f56bfc5169e2d827ead56e30136ade3095 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9ca5734f88a8b844386888077092143482ad932a |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/2ba37c8e2fbe4a5db8b29c6b1fbc2cbc9a07ecd2 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c7bf7980032b71551e666aa949face8c80710224 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b9984c6b01718a1727d2ac06b4adb2600065f5d8 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/56edc355eae970ab0b5deb6c5169f14241a1bf89 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/1c2a18ad1b7baea57d7591fad74eb61f6c66bc69 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d3e40a3de6634d8c9e809ebf25d6a2f84bff2ca2 | ORPH
  sparc64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/4cc73d06c4ecbb20e958ee3bef2f563906745b09 |     
    mips     |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/b11e1b3516042df754f6cf0b63a98e82035a7c51 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/b62a0a9f00f6364790ea278c613c96f8580f2fc0 |     
    mips     |           ruby-3.0.2           | NOK | http://autobuild.buildroot.net/results/fc72a36fe6f7bba1fea00712219fb847b4e333e1 |     
   mipsel    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2b7f621f8ece74a3da542d4f8341af6a9d0fc930 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e394dfd2f24c1a989c9d5ba8714eddcca4a549ef |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f7e427637ac15ad1a4e5da351f2d881db93de838 |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/eb4af92b7ebdb3c1c0ccff884ce74f2904836fc1 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e656e955348a29b3aede5d2257e966bf1cc609b2 |     
   x86_64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/915930df8a7109e8d471d6326865c7052c250ed6 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/67aacec82331816cb8da239e6f79e793ef2d6915 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/de3b98a1b55a32f5d99798f6dbf70a7bf8f71a0a |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
monkey-f54856ce250c4e257354... | 2 
               openldap-2.4.59 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c27ceb4bfd17edbe8dec060420cb724f700618a6 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e7b0a2435aa27af029d43dcad3641b2fb897337c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0a73151b5fdafdd7b7ea72645139f1373849fb23 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d27e695434cdbb973ff87468afe6cac22ff4fbf3 |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/e2f6de24a018d7d9c68fb9c7fdb91f467336a4a4 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ceb97d1179cb6787a0d06c4362b94f0b327eb9d2 |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/82018ba5712732a655aedf046c35ce256b619be5 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/93545482e9093af73f71c94515c574de39097e2b |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/6c94e89e9507a5c74f0bf7467062f941fce8bdb8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fa265b664d78f56b4fc4f19db8c705f7161bc100 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

              gnuradio-3.8.2.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/64dbe3cda4aae6e59e8a56898e5c662b9e656074 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4382cba8d2cee013b7e28bfc4f42c15c475f02ef |     


Classification of failures by reason for next
---------------------------------------------

              tinydtls-0.9-rc1 | 2 
                      gdb-10.2 | 1 
              host-erlang-22.2 | 1 
            lttng-tools-2.12.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/09a2ae68ff40834f59bd8adac614a86cd2b90746 | ORPH
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4f4d28cd4e070f867da625c99d8248f3f6bf9c95 |     
    arm      |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/5a0dd14f726daef731853b668e6e607776289463 |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/203475ed10e03ea845a0c1f6a3083dbbe441bdb4 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/cb8acfc1dcc409a5eef019313a6484ab45b927f2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
