Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855D4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 07:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED81340494;
	Thu, 20 Jan 2022 07:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkW_8ibIHzo5; Thu, 20 Jan 2022 07:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 924AF40385;
	Thu, 20 Jan 2022 07:06:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0751BF36F
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 07:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38EB640385
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 07:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NuCbFso40RIW for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 07:06:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66C5C400B8
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 07:06:31 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 60A5D1BF206
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 07:06:28 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jan 2022 07:06:28 -0000
Message-Id: <20220120070633.38EB640385@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-19
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

Autobuild statistics for 2022-01-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 65  |  6  |  0  | 71  |
  2021.11.x  | 18  |  1  |  0  | 19  |
    master   | 91  | 50  |  0  | 141 |

Classification of failures by reason for master
-----------------------------------------------

      host-riscv-isa-sim-1.1.0 | 10
                       frr-8.1 | 6 
                  rygel-0.40.2 | 6 
                   guile-3.0.7 | 3 
                       unknown | 3 
                rtorrent-0.9.8 | 2 
           tesseract-ocr-5.0.1 | 2 
                    bat-0.18.3 | 1 
             bluez5_utils-5.63 | 1 
              cryptsetup-2.4.2 | 1 
                  gensio-2.2.9 | 1 
google-breakpad-7515ab13768... | 1 
                   gvfs-1.48.1 | 1 
                host-go-1.17.6 | 1 
             ksmbd-tools-3.4.3 | 1 
                libglvnd-1.3.2 | 1 
               libupnp-1.14.12 | 1 
                 mesa3d-21.3.3 | 1 
                mongodb-4.2.11 | 1 
                mono-6.12.0.90 | 1 
                nodejs-14.18.3 | 1 
            resiprocate-1.12.0 | 1 
                    ruby-3.1.0 | 1 
             tpm2-pkcs11-1.7.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/e87521dd795b72b78a704aa1172282a8e8744fc5 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/aa64d1b5f7db46dd4e59597aaec328ef239a01d2 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/06bf3ae6db48ddd7e8bea901b8c2a88d96ac5665 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f08c29637d88cc836472e1825b1fa4971d81e030 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/c35688288c6ab7404165a29db27e63b7448dac1f |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/44d74e375998c00e0ea70eb3699021599782d742 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/3ac5e7f085a5103095ccc3a90cd5d2caf672cdc5 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/4ff2b8887247f87b3ab176ffa887c0d0387ae02d |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/5c40f0a3268d5863f3000336a80eef1aa6f5f465 |     
    or1k     |          gensio-2.2.9          | NOK | http://autobuild.buildroot.net/results/18dc5dea6a714a9d9b7b62e824658936d51ad70b |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/1b98b2c0f5b0c6dad8eb57a67a3f7fee839545aa |     
   x86_64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/841a352d41727647babce23186b8abdd09fde1d7 | ORPH
   x86_64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/adb63c3f4565e80d3d01526c40a163df8fb45705 | ORPH
  riscv32    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/9b1a169aa5ea3529607ae4b40849e91b43568b13 | ORPH
  riscv64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/2601972c7add2871214a13f98139e8515bc55967 | ORPH
  mips64el   |         host-go-1.17.6         | NOK | http://autobuild.buildroot.net/results/201d833e90dce59000458af5a2b1bfd1663af991 |     
  nds32le    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/60ae48de0ee87e7c98ebfe5e4bb931ee16f2ba25 |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e8a10eae22f1310f39bef0e328ea4970cf90a3e7 |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1c89a6d170035cb9a990b1e81a074cd642a25eae |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/60b89cdfae4feefd54eeb7bfcd7eddf2f7c76674 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/2e76a505246fcc1ad3ff598a7e57e850c9e26d5b |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/57d625e939cebcd3c1f80f18d71094d9d6d0f100 |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/343504ec0f99dd16888727fa20811bd29cdeaffc |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/88c8f8f7c6c4930a59c496ac26bf3087c776c98e |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f024ce003c121567c4ae53f2e047c606841305fa |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/76a37d6c207c2c13f1ffc07259f41a6ae4c740f1 |     
   s390x     |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/e10bf89c88f7ee784d3af1f0fae4c33343a75fef |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/0d9be02637772039247d0e823cae457c15405852 | ORPH
    or1k     |        libupnp-1.14.12         | NOK | http://autobuild.buildroot.net/results/a121b42d3e768e2370ffca75e252eaf31128e2c1 |     
   x86_64    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/de325f313a118480972f0227ec2112a9672db5f9 |     
   x86_64    |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/0b573c0987087f807460b42aef87caebb7bcbbe6 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/64c007ec4183ef1726ebab390dc0e8dd15050cb3 |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/68db60ef0a4909ef7b43365f9a1776166aa47804 |     
  riscv64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/d76ac39be85ef58f5236f08436f442a4fda30357 | ORPH
   x86_64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/4714d68a24160fb3a818f3470cc01a66329a1a3c | ORPH
  powerpc    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/89a069fd7b1ce6ebb9b890fd21facd14cf7f3c59 | ORPH
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/5a38bbbe3680fa49b1ac658434fe682d1fdc83cf |     
    sh4      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/20eff05871c3bd3703785537011c3553825d6a5b |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/e5dc8dc1273a11f8f500e63c7aaf764a3e01a0f6 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/27f28e7d91715f5a8df4b569358af139c7ad548e |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/dc0c2063a92c6c98afa32765f5168f488c818371 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6c3bf3dee7a3d42e23e1195c9fe25bc8d2e7dfd3 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/edda4cf8232eafc64fd26d9fd89128012c217496 |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/b71a4e13a038ec50a220e940b54db143faee6994 |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/7b6051055dbe2bb093b2fa48814ccf27df0541b9 |     
    or1k     |       tpm2-pkcs11-1.7.0        | NOK | http://autobuild.buildroot.net/results/e0a70c7ecae7b4bf71880842517f3aeaaf100ca0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a4f5fc22aa1774c3fd369666d538f8e0131f5466 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/50450e8aa9635b947dc80506c5df045a54127042 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b7b5c97f21e76a8531b16a058f520db729ddf180 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1931a9e90fe31b7325555806f6965b16653a7a1d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                  apitrace-9.0 | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/6e87b86b6b01cdb91e8d09afe6e5220d29b445c2 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5a162018da395ce19207a9994effa41db3f52da6 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c52f0996efbaeb6dd78a73138dcf4ec480c540c2 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/65fca52bba12bc7011693b063a8e72a539380808 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/ca61cec1922741a2447fed05c95e8b58e99d4af1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a27c46399adb20c6535ffbd23958996a43e97c7a |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                   libnss-3.73 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/76bf9be59ca90afa957c55e8a17322bf10ed0c27 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
