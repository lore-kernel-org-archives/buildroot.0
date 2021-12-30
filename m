Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AF6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 07:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9079A40987;
	Thu, 30 Dec 2021 07:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2hfQ0MSSn2v; Thu, 30 Dec 2021 07:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D15584091E;
	Thu, 30 Dec 2021 07:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 118B61BF39C
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 07:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00813812BF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 07:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynV15OJ0IBxu for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 07:07:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 784C281268
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 07:07:46 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 15E841C0008
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 07:07:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Dec 2021 07:07:43 -0000
Message-Id: <20211230070749.00813812BF@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-29
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

Autobuild statistics for 2021-12-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 65  |  4  |  0  | 69  |
  2021.11.x  | 30  |  6  |  0  | 36  |
    master   | 110 | 30  |  0  | 140 |

Classification of failures by reason for master
-----------------------------------------------

               poppler-21.12.0 | 7 
                       frr-8.1 | 4 
                  rygel-0.40.2 | 4 
          gstreamer1-mm-1.10.0 | 3 
                 glibmm-2.68.2 | 2 
                       unknown | 2 
                  assimp-5.1.3 | 1 
                   guile-3.0.7 | 1 
                log4cxx-0.12.0 | 1 
                 openal-1.21.1 | 1 
                      poke-1.4 | 1 
                   qpdf-10.5.0 | 1 
            qt5location-5.15.2 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/0861c66ec02a55e984577094e28b65c78b95a330 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/ee8d12ebfc656b7176dbba9555155306073a80f4 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/380572280cffe73bfffa75c74bf9d84f7dbc0d6f |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e681c721eed661bb3eb64fa5c3dd8e4c6ac9f3b1 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9abc914cb6c02b1e7ee17c6cfa2f9c8b91a80f19 |     
   sparc     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/af3208e3f16b2f76a7ad120b28079b0c30078074 |     
   sparc     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/6a2709956fbb16ac3cbf676acb242c88f83fcdae |     
    m68k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/49993eec66fc01f96ca08b916e3d7f1f94b0566d | ORPH
   nios2     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b6ace9a6f6756356279e2c4c73ebf5817d99a68e | ORPH
    arm      |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2d71301a407eb4e5af9322bcd0421abeae37666b | ORPH
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/5bdb12ee121b63e0f58f8903046e3ed5aef03e3b | ORPH
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/a60039117db7b7021c867f52c596ed76891f2c3c |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/e3d3f26f66be76024281d57ba248687b89dae815 |     
powerpc64le  |            poke-1.4            | NOK | http://autobuild.buildroot.net/results/31e928631416cf427ffc7f187ae28aa6e7a2ed74 | ORPH
    arc      |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/31aaec1c36e60c578adcd0e832eb6a975ad968ad |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/7695ef7de4be9a74829781ff53dc26d3a1381e84 |     
    i686     |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/360972af797bb1be80b0324796794817fe0ccf53 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/5e23bddd862839976f82704c11e5f571faa0eeb5 |     
  aarch64    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/52121821cee8eccfe653613b389a644bfe9ebecf |     
    arm      |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/e4cde4281c60124ff5fb975f85044a33489cc4a9 |     
    arm      |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/ce4eea816e24039aa1e6b437762a6d70c242cb44 |     
    m68k     |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/3b7f19ecb3303c9c9eb89c493c7e0d8a47b4be95 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6378e43d50dfad13a45522492f14c9df7acd64e4 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/dc9a7cae2530917898f58277087d0eade0edb6eb |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9dbd940cfb2d878bb03a6f7d0eaf5812ae03aa58 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/33c56ecabbe5518545baedd9243a5992d08d5f15 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7d26970a408381ed570d5a1787d15a18c0635710 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4bda02f3513dc71255fbb72d4cf1a07d8442025f |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e4cfad4c3e203d04fbfd9a85cf4a085e4d3dd3d |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9bf4a338c964a4628c9ccf6c7242e97cbb656868 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d28d3b4f824fd4fbda3e7dd1edad0a8a72f0ae6f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8e8ada7890a7775e034767b921da49ee335cd759 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/df6760f098d718257d63446e459543a6a1eb7f4f |     
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/cbd41e9478ac12f24a974ccf7c3f0a58020197cc |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

libdbi-88b8477d57153b9f736d... | 2 
                libmbim-1.26.0 | 2 
                    ruby-3.0.2 | 1 
                suricata-6.0.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/4a0633f6b5e01a77e1d34d847eb3dd19ef2c5318 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/4533166450c91c73541da53360e380dce1e7de49 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/d7dd4eef923dfbcccadb32df045a0641dc68a55c |     
   mipsel    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/7d2289b8651a636187ea5c4bdbdd4b54d5ab84db |     
  mips64el   |           ruby-3.0.2           | NOK | http://autobuild.buildroot.net/results/4fd99ee9d3b58f612357d10149481d2076228b2e |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/6254157eb67337695c1a0b8b53bebeeca982722e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
