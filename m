Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B02EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA3960F04;
	Wed,  8 Dec 2021 08:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28P-DbMhkHq7; Wed,  8 Dec 2021 08:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C0B606B3;
	Wed,  8 Dec 2021 08:03:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 413341BF368
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D9AF606B3
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2dGQAT8ZX8r for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:03:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC4DA6064E
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:03:51 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1D5B6C0011
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:03:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 08 Dec 2021 08:03:48 -0000
Message-Id: <20211208080354.3D9AF606B3@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-07
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

Autobuild statistics for 2021-12-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 42  |  2  |  0  | 44  |
  2021.08.x  | 42  |  2  |  0  | 44  |
  2021.11.x  | 23  |  6  |  0  | 29  |
    master   | 86  | 15  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

                     frr-7.5.1 | 4 
              host-erlang-22.2 | 2 
libdbi-88b8477d57153b9f736d... | 2 
                  assimp-5.1.0 | 1 
                  inadyn-2.9.0 | 1 
               libyang-2.0.112 | 1 
                 mesa3d-21.3.0 | 1 
                nodejs-14.18.1 | 1 
                       unknown | 1 
xdriver_xf86-video-trident-... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          assimp-5.1.0          | NOK | http://autobuild.buildroot.net/results/1531a004235a75de8a6bbf5c2f9aa2facc8dbfbd |     
   mipsel    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/8d1dc6d5bef35758f43a8aac5b06ab9fbbe74143 |     
   x86_64    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/f70d858fe0b33a8d28409e6dd17b68a4dbcaa0d7 |     
    arm      |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/3d4d56366d051e32511fcca7b8fe6a547a7c8c3b |     
    arm      |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/330c706096a781ab8af5852b72d73ea763f8b75e |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/71762afea0981f0a3fb91ff53684c1b470ffe5c5 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/21dab5f898febd3eae82504474e1ac0f765cdce1 |     
    arm      |          inadyn-2.9.0          | NOK | http://autobuild.buildroot.net/results/9323cc7afceff75f7d41ff161b8d0ec9aefa164a |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/db6ac03a73e43c86d91fea99c501d3fca90bd4e4 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/b228b880a1fb9118eeb860805515e45a3116dc65 |     
   sparc     |        libyang-2.0.112         | NOK | http://autobuild.buildroot.net/results/c1f090bde4891ac1cc84e59c51ff9561869d42b9 |     
    arm      |         mesa3d-21.3.0          | NOK | http://autobuild.buildroot.net/results/b5a23dc849cd4f97ace6e14ddcff3045cba7f08e |     
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/77ab717cc26ac6c0195438968e93d9bf925069bc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2a54f395aadf41a96467b4b490ee5e1414c53a2b |     
   mipsel    | xdriver_xf86-video-trident-... | NOK | http://autobuild.buildroot.net/results/c81ac8075af257e8626d9d097270be7a7b4a1496 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/49c431452269d1e6ad5da3590a3650b56ee2882d |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/98731b7a1147f86b90e0534ca05991b50a2b5ee3 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0128c3a99ce6b8a1de562185e9cb9a2b0161b436 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5208554788aa51001e6667670012544a39d9583a |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 3 
               capnproto-0.8.0 | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bdcf27968a0f108c1ad30551922f1142df570109 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/779ed4667a7270d625db81cc67faf7b89e8e717c |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/09474fab18f9df71c0b6cd1d7dc952bb36f91c38 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b98e8e73729da92a607fbac53b628d365389f54b |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fded7473a80c775cb6cdc99c1a54b77c7b8f9585 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fdd4a16747403eb0552253107ff044602e4b360a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
