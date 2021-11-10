Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ADFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 06:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F3D6117A
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 06:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1F3D6117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B99060876;
	Wed, 10 Nov 2021 06:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvKsBbvea2NC; Wed, 10 Nov 2021 06:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F74608F6;
	Wed, 10 Nov 2021 06:56:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB2021BF2A7
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 06:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A90DB401FC
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 06:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMwOylr0TJ4D for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 06:56:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1049A400DE
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 06:56:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D707920000A
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 06:56:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Nov 2021 06:56:16 -0000
Message-Id: <20211110065623.A90DB401FC@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-09
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

Autobuild statistics for 2021-11-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  |  8  |  0  | 36  |
  2021.08.x  | 32  |  5  |  0  | 37  |
    master   | 58  | 36  |  0  | 94  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 7 
              host-erlang-22.2 | 4 
libdbi-88b8477d57153b9f736d... | 3 
                   mpd-0.22.11 | 3 
                       unknown | 3 
                   iperf-2.1.4 | 2 
               pipewire-0.3.39 | 2 
                tpm2-tss-3.1.0 | 2 
                 apitrace-10.0 | 1 
                    atk-2.36.0 | 1 
                  botan-2.18.2 | 1 
              containerd-1.5.7 | 1 
                 diffutils-3.8 | 1 
               linux-pam-1.5.1 | 1 
            lttng-tools-2.12.3 | 1 
                  uhd-3.15.0.0 | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/2d65dc36b3be50d78d229a60b7c66d09c78c8df3 |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/2716929db638977e6bf665352a08bd580e1dd0ae | ORPH
    mips     |          botan-2.18.2          | NOK | http://autobuild.buildroot.net/results/1aafc2bfdb82c6424327062e17f5745c15417526 | ORPH
   x86_64    |        containerd-1.5.7        | NOK | http://autobuild.buildroot.net/results/746fa8418e631ff04df2bdfc891bb4e0a36dcf8a |     
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574 | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/91ec866d7be9d5041c70b77047a84a3c090e409e |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6fa9f2d912e47ef1afcbe4bd1a4314a7af4bc809 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/2bcd8fe19a4fd277443323ed7123ffee5d518e5f |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c43fda0e6e48f71ba0bda35d5f7c9ec074b4b5fe |     
   x86_64    |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/3d9c9850de8da5b10bec4f25be07d9ecbc8e0931 |     
    i586     |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/23ada69f9b7dc4460315d9175d3064d8db182f8e |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/c4aa519de7c574d1d5007848f6f358f169012937 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/93331f1ffc0537cfada47a75a031406c51d857a2 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/024f94d4456607f5a5e26cefb46b98892876f27c |     
    arm      |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/0a53a065da788c2303f9588c740cae940d4b03a5 | ORPH
    arm      |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/533e8366e2ff504be788e9739f43778557bb4050 |     
  powerpc    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/9de21fce978715dc50370981f5cac3ff3a693f60 |     
    arm      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/d120f9cf1c0f8893aa5d0fbf3d21e39e9dc6104b |     
    arm      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/dd8bed974d49a58137878ed1d17a9949906bb214 |     
    sh4      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/435d59d40209cc1028cee8e2a71a69cd3769ab56 |     
    m68k     |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/05e68c0edd7bc43a8415c6df4b2385b373ae2eac |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5eede591642de398bb0c4e6e9a8d7f0790799417 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4042409f6615cedbfb3b81e52415c28e6ed0b06b |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f3d80375d67f0ea7acd8b96588f6e563437b6bb2 |     
   nios2     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/260777438025f9a278a1b9ab7b8ffeb45e1b77ed |     
  riscv32    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/625771008526bde7727daa2fd6464df8d5605e61 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/166d8283b5590a2832b02f58b2ba405df2b4bf03 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2a1485f4d4e47dbc2aa4316fbdd47d6c26bb6fae |     
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d923a63f6c2c40cb17a6c662e415dad387592069 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/97bfa8f7dcb12e36bd63c9d06fb39418070d840b | ORPH
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/8e366070508817e32f706ac13ec7a03bd8c9423f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0fc249753827e8691fd030b2219f3d37b87b646f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/85c84c4a95c59e0728d7f20496a649ed22019214 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0a59b153cd027625c6eac1e53e349d2d41d766f1 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/93ce11310c79f9b09d7277b831eb8d5075706361 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ce48e850a4057177296b04e24d5893ef24a655cb |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  gensio-2.2.3 | 2 
               capnproto-0.8.0 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3ac06514239cdfc96f50c8ddd495898d2737fce7 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/98b7714ca66bab41e129720d66dbda5a0bc4de6a |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/3be4132241fdd780c819380044a57dbcbc3948e8 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2796c4f9570f3973b53636d5855a1fc0b3b85c1a | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1a338bdc7f894c4ad7a73e899f1ae03064b7c2fb | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8957efbd112c575ca30ced55467d6825b738a2be |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/210a0e5757f60dec060e0cf54ef61a9324960392 |     
    i686     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/523b0a1ac1cb7b6425a415019432fa4d406ff26f | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
  gobject-introspection-1.68.0 | 1 
               linux-pam-1.5.1 | 1 
           python-pybind-2.6.1 | 1 
xdriver_xf86-video-nouveau-... | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/01d59fb1523db27fd8cd6da480a7f41e46ed18e9 |     
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/41e3d6310f359a69f1ac138546a10cc3f71dbb82 | ORPH
    arc      |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/11bc25a65fe77ea6ace7619f2364c46f030152d7 | ORPH
    i686     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/0e70fe80591defa60ecbe555182f26dcd928f6f8 |     
 aarch64_be  | xdriver_xf86-video-nouveau-... | NOK | http://autobuild.buildroot.net/results/ddcb2f20b71ff4ff3a385358f8880ef9c1257852 |     


Gitlab CI results for 2021-11-09
================================

Detail of defconfig failures for 2021.11-rc1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965968  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965970  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965971  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965973  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965975  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965978  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965979  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965980  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965984  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965987  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965992  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965994  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965996  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965997  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758965999  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966001  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966002  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966004  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966006  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966007  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966009  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966010  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966011  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966012  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966013  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966015  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966016  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966018  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966019  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966021  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966022  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966023  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966026  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966028  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966029  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966031  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966034  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966035  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966036  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966039  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966041  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966043  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966044  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966046  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966049  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966050  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966051  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966052  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966053  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966054  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966055  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966077  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966078  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966079  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966082  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966084  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966085  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966090  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966088  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966089  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966091  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966092  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966093  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966098  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966101  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966106  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966107  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966114  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966116  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966119  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966122  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966124  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966128  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966129  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966136  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966138  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966141  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966143  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966144  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966148  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966150  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966154  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966160  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966163  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966167  | ORPH 
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966177  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966180  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966188  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966189  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966196  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966194  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966200  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966202  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966208  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966210  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966214  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966221  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966223  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966224  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966226  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966291  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966297  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966298  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966299  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966306  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966307  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966308  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966309  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966310  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966312  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966314  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966316  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966320  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966323  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966324  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966336  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966364  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966366  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966379  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966380  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966390  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966392  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966393  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966395  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966396  |      


Detail of runtime-test failures for 2021.11-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966701  | ORPH 


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863905  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863906  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863918  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863932  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863934  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863943  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863944  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863948  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863951  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863952  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863959  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863962  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863974  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863989  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863992  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864003  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864011  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864025  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864029  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864031  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864033  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864038  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864039  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864042  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864050  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864060  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864066  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864068  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864069  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864076  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864079  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864080  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864082  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864083  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864084  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864092  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864093  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864100  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864103  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864123  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864124  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864126  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864131  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864132  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864135  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864142  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864151  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864161  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864164  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864176  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864183  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864186  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864188  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864189  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864193  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863881  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863604  | ORPH 
  TestGdbHostGdbserver11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863606  | ORPH 
       TestGdbHostOnly11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863608  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863577  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863538  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863679  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863663  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863631  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863657  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863846  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863688  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863701  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863702  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863709  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863719  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863723  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863777  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863787  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863807  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863819  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863821  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863826  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863827  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863849  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863502  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863479  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863483  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863866  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
