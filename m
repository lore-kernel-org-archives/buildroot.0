Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64962C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 06:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F013B6058D;
	Wed, 22 Dec 2021 06:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVTwUSDY2u-T; Wed, 22 Dec 2021 06:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 128B160EE0;
	Wed, 22 Dec 2021 06:55:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A64781BF5B4
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 06:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0ED7404C5
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 06:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDDSOfoaRAVK for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 06:55:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCE8A4013E
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 06:55:26 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D0337240007
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 06:55:23 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Dec 2021 06:55:23 -0000
Message-Id: <20211222065528.A0ED7404C5@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-21
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

Autobuild statistics for 2021-12-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 53  |  8  |  1  | 62  |
  2021.11.x  | 35  |  5  |  0  | 40  |
    master   | 119 | 46  |  0  | 165 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 14
              host-erlang-22.2 | 7 
                  assimp-5.1.3 | 4 
                       unknown | 3 
                 wavemon-0.9.4 | 3 
               apcupsd-3.14.14 | 2 
      intel-mediadriver-21.4.2 | 2 
libdbi-88b8477d57153b9f736d... | 2 
                    bird-2.0.8 | 1 
                  boost-1.78.0 | 1 
                       frr-8.1 | 1 
               libtheora-1.1.1 | 1 
                log4cxx-0.12.0 | 1 
                nodejs-14.18.1 | 1 
           php-apcu-legal-info | 1 
                tinycbor-0.6.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9ee7924efbcfb2cd6c79810147701c2da5911ff0 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d1fe1dd39e10b86a70880004af30a0cedfc365eb |     
    i686     |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/44cb05600ce3092fdebc0c79a694a02467b82e62 |     
    i586     |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/bb1d2aa973e7e8d774debaa24f9af76e58718866 |     
microblazeel |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/dab522882dc22898fff04ac1d4f490b05cab4d9c |     
  mips64el   |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/90de7d42f96726900440405234c984178d0f226e |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/53ab9a21376d35b7f6a44981e295f265682a9e9e |     
  riscv64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/8af247ad084d510cd1100f76cb57a7fd32fcdb69 |     
    mips     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/c6a2568095cdd67e3cd84b36240cbb6e851bd2c0 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4fbace7fcd07559efe32946f23b1555d78d126bc |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/76a99ce7f9fdcfe16e4f76f9ae2703b6de2bf564 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/43fc268316204f4b6406b9636cf2bba99feb11a9 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4924d6741cac86be4bc5b3ec86baa1e94666bc2e |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a998ceb5b5fba4232bad6c65935c1e66c11e4e67 |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/01e483e24dd9a9c7ca4006a44bfd019858f1ebe9 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e38ec3abe5c7ee675113b8590b0a778983058bca |     
   x86_64    |    intel-mediadriver-21.4.2    | NOK | http://autobuild.buildroot.net/results/e7e10d2324ba077c914038f15a7ae0fd24f68181 |     
   x86_64    |    intel-mediadriver-21.4.2    | NOK | http://autobuild.buildroot.net/results/4122e40efb8c4678dcc238e1c994fcc8e5809dda |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/b45667b90ba4a48d1f52fd43712f984270fe3e58 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/8924cc7e92f7fc81b27b55620ebcc7dca092eb50 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/313ce5b41a7e86d6f2ad1abc5b32a12f55b8f35f | ORPH
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/561d5e1c97b36d0a4531ed6275b6bb6b11f24e3b |     
    arm      |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/2a94ec95c7f2a36ed3a57aefba23bba6da674ffc |     
    arm      |      php-apcu-legal-info       | NOK | http://autobuild.buildroot.net/results/0829e7f1f7a18976363b3e3f79ac9865cd099df4 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/8f2afc8e598846e4f3432fe394843d6410da64cc |     
    mips     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/4bd65531222b30e629fd8e42170ac3964ead58f1 |     
   nios2     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/371f11e057acb539484b8ca124b5fd2cf844a42f |     
  aarch64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ffa54b8cde1529146574ced57c9913254d6c82fc |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/684fac705a76a651786dcd01f80f8b1c4c1ce370 |     
 powerpc64   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a5e4c5f24e731ee630ac5fb0da5ed0ead998c615 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/dbf5be6510e6ca788a78164b4fc34de457535e7c |     
 powerpc64   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/027ce84895fab6fb251dd37cd5cfb7169287a2de |     
  sparc64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/673eb737b2d6bb76d5df3e5df9cf9b8c5c94b89f |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ae491b53bc8f7c934f5369ada3ffccc46d92ae51 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a1d6d90e127d330b3c489bd0e3200fc3b2d19fa4 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/023488d21f51b2623e499ff7376e704c414c89cd |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f5d1fc322c6ebd99e7923f6fd098d0ad7e97dbe4 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ec7af876e53e696f5fddcbb2ff5756e6b1b8409c |     
    arm      |         tinycbor-0.6.0         | NOK | http://autobuild.buildroot.net/results/a9fe64c42bb96f9e7b4af3050464f6570c1c00fa |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e2dd96b4e6450778b27611bc995bbdbf3173d40b |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/a8c7baa5b686808d065aaa0de3428da406b44c7b |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/019b9a43a7bfa7e98714caf37c7860f9d7eabf23 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8fbd8640d689e89eae0906be21c2001adfbbefa2 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b8fb85e5c68300981077f8e00a3748971ded07cb |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/54f0352d0cf32063325384a5b7f77773e65ca4e5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/44a0d62050e4c932cec2058b63c2345017a535ee |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 2 
        host-sentry-cli-1.57.0 | 2 
              asterisk-16.21.1 | 1 
                   delve-1.5.0 | 1 
            erlang-jiffy-1.0.6 | 1 
                       mongodb | 1 
                   uacme-1.4.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/09d4cf3ae84d86abb965069311f5640d29e5fbd0 |     
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/87f600ad7525692cc26cabb537e1fee944268176 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/14f091a96d2a83eaa1c27038f9ffa5de492cffd3 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/591067ff7b89e7cfe1665b00cd298bb2f358aa58 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/fd2b4028bcf1671b9c6e73cc5cdc3339a83640c7 | ORPH
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/edf33e965b854289fa23a73ea31674d45c2ad90c |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/da57ac09c49f2abe4e74e197f5f35662d342389a |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/dd4a8f173f7f1e5a573c65efe7bebc89e5f7ef19 |     
  riscv32    |          uacme-1.4.1           | NOK | http://autobuild.buildroot.net/results/2ba942465f6ea5ef4f68f4308ba9a82653fb4ca9 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 2 
                 wavemon-0.9.4 | 2 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4855209aec53eef7248991e90c473f433963a6f8 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8c27efce8dfd54b5ef42fe9afb39734f980b379a |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/63fd6929ce5e7b6d530ccaa153d6b9b3fecf3ab2 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/03dc476421c030ea8774878346237a22a7fa716a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5d67e82759397a053d05b9364e50442526cbb557 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
