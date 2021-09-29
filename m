Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC23BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 07:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C189A613CD
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 07:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C189A613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC5A415B0;
	Wed, 29 Sep 2021 07:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRRZ2NqNZAF8; Wed, 29 Sep 2021 07:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77948415B2;
	Wed, 29 Sep 2021 07:06:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 178AA1BF4D5
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 07:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1186F40323
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 07:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYSEG-cDYbvi for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 07:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDF22402EF
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 07:06:07 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id BA39610000D
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 07:06:04 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Sep 2021 07:06:04 -0000
Message-Id: <20210929070610.1186F40323@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-28
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

Autobuild statistics for 2021-09-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 24  |  2  |  0  | 26  |
  2021.05.x  | 40  |  3  |  0  | 43  |
  2021.08.x  | 26  |  3  |  0  | 29  |
    master   | 73  | 48  |  0  | 121 |

Classification of failures by reason for master
-----------------------------------------------

                 wavemon-0.9.4 | 6 
                  zbar-0.23.90 | 6 
  host-python-inflection-0.5.1 | 4 
               usbredir-0.11.0 | 4 
                 samba4-4.14.7 | 3 
               capnproto-0.8.0 | 2 
                    ffmpeg-4.4 | 2 
                      iwd-1.18 | 2 
                log4cxx-0.12.0 | 2 
             python-pip-21.2.4 | 2 
          refpolicy-2.20210908 | 2 
                     gdbm-1.21 | 1 
                   gupnp-1.3.1 | 1 
                host-odb-2.4.0 | 1 
                liburcu-0.13.0 | 1 
               luasyslog-2.2.0 | 1 
 Makefile:740: target-finalize | 1 
               pipewire-0.3.35 | 1 
         python-psycopg2-2.9.1 | 1 
            python-ujson-4.1.0 | 1 
               target-finalize | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/df8ea53084524c79bd3c152b435b28cf4ae888c2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2bd0f76020c68b44d1f23e72df39ac8ef8c8c0f8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/26a5b17ef1cc5fd35bc82fac4a096b315d486117 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/856db165be36cd7c2afdde41034d208f31442c4a |     
microblazeel |           gdbm-1.21            | NOK | http://autobuild.buildroot.net/results/b887e45efef7d1ef4f4789acc367c197cabf44e2 | ORPH
  riscv32    |          gupnp-1.3.1           | NOK | http://autobuild.buildroot.net/results/1ae181a7e89e62d618e4044866069df27e8d70ef |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e9c994e1ec4f5a2d41f0608b6afb1a923a8a82f3 | ORPH
  riscv32    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/8f1c0b6a3f6d392b1720736f661678f405f65686 |     
    m68k     |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/2302f1076a55232444ea82f30dc10728382106fd |     
    sh4      |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/b457086053c772cf71c0c2b7294990186364eee0 |     
  aarch64    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/d287d7549fa661a93a5d32c6fb0ffaefd7e1d9d3 |     
    arm      |            iwd-1.18            | NOK | http://autobuild.buildroot.net/results/08c25bcf220919e0a80da2cda56bc97295f5f213 |     
    arm      |            iwd-1.18            | NOK | http://autobuild.buildroot.net/results/2888d6e733835eba6973ccf6d0b2faa083f530e9 |     
  powerpc    |         liburcu-0.13.0         | NOK | http://autobuild.buildroot.net/results/cee2bfd2f7ccb8ab5119b420f216431b37d771ab |     
  powerpc    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/5cf566007fc60bf7e9f3264edb3223966db5be5b |     
  powerpc    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/36b181c31f06e15d480b3cc7908981df5a9a6834 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/3221ad768cc79ad9cfa93d094ffa799f95a6ddc1 |     
    arm      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/7740ecca1b51c5d7325073dcba323a3b60d17a44 |     
  riscv64    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/32a679fc7e3d8de930dc30eb76ed1367bc4435d0 |     
   xtensa    |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/0554b50cd1da06aa68db5cfbd7c4df44e64370ef |     
    arc      |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/0f598a4eff6b3416cac1c99e10a600a3ef9c35f9 |     
   x86_64    |     python-psycopg2-2.9.1      | NOK | http://autobuild.buildroot.net/results/a49ca12b1ed46189a135dadea1c9fa873c9cbe9e |     
    arc      |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/bc4516c7a6e768b040f8592fc72c5a844560a226 |     
    arm      |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/0213b48b66a7c0fda53ce308d4450c84fc2d4718 |     
    mips     |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/1420c31f60888364331f83a5f90fd35a609ca1aa |     
    arc      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/bd01e9ad72a53a11dba0309a7295d4103b47ceda |     
    arc      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/af4a330c306313130242ab6745141083eb36093d |     
   s390x     |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/65879a747a039fcd9f921d1e4d8bf915417f7589 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/f4e422bf6038121fab5684e655437aa6029c3bad |     
   mipsel    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/aa2bd1fbe1b4880aa8de389238380a3d35f80b53 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e2a47fd6611c8c66ea63fe15fa7a1c1504e9f0e |     
microblazeel |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/f56663fc435bcb6220b98f6170a0484d18f628a1 |     
   xtensa    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/dee2f1a1c4c506eca65a3bd27cd850e3f2b15614 |     
    m68k     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/8b8ffdcd4418f2ba6d57c0001b3d9eb6e9dc7b07 |     
   x86_64    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/85247418c2586fc5f5df9fb100f22f38e840e023 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5b1b6f997f2f247db50b993a9007affde3530bd9 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ffa7143b742bd630e373f223d0c047f1952abfcf |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9d241accf1eb82a6d10d08ff64a58a8912660577 |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f80e4b261719ae6a4b948bcd53bea120609066de |     
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3ef946ab1a9870cfbe638c75495c5cdb3ea418c1 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/29a0df26cee8be4817e85118bf5ab9eb36617092 |     
    arm      |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/1eacb08e4552332fad0473185a9a749b407891cb |     
    arc      |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/264519be71339454c01b13467c11859d4f5307da |     
    arm      |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/99ca66e07393450003afb98171b0711d0cc51bb4 |     
    m68k     |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/05a0b7aa453147b665431c908934f02873596812 |     
   mipsel    |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/43a8c8d5403c329f2d754ed09807a53772174397 |     
    arm      |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/5c50ee4f3c6e72e9170ce64307fc67251eee35ff |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/23c6d431085a05d58b60d1aaf18d0664d0f330b1 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                    git-2.30.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           git-2.30.2           | NOK | http://autobuild.buildroot.net/results/b69154a2c9cb671da64aafaab85a5c72d7c16dfe |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/63631015cdd81b4b15175a7fe5bb1359bf4252cc |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                host-odb-2.4.0 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2e854f9e0201d0678a001406da6732b0c1e8ac92 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/dafac818ccbed0fe56e49d9bcf86099ee514ed82 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/db658f763e1dc860a4afb12d01b5335f77cd9592 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
               libtheora-1.1.1 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ce2ef6e91ffe48dc23b5df2d07c603dc5b56b0c0 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a3b12f95a1877476f4b6be3b49e40ab90796a805 | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/bea43741251d67e320332e49bf5078098644ca11 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
