Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319D7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 08:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9035C80BDD;
	Tue, 30 Nov 2021 08:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fnApD_hWPErG; Tue, 30 Nov 2021 08:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B466D80BFA;
	Tue, 30 Nov 2021 08:13:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF571BF284
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 08:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05DE140133
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 08:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_SH7TdArQXm for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 08:13:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3382840105
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 08:13:40 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EBF2420008
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 08:13:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Nov 2021 08:13:37 -0000
Message-Id: <20211130081343.05DE140133@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-29
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

Autobuild statistics for 2021-11-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 55  |  8  |  0  | 63  |
  2021.08.x  | 64  |  2  |  0  | 66  |
    master   | 106 | 21  |  0  | 127 |
     next    | 10  | 11  |  0  | 21  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 9 
              host-erlang-22.2 | 3 
                    bird-2.0.8 | 1 
               capnproto-0.8.0 | 1 
                 diffutils-3.8 | 1 
                log4cxx-0.12.0 | 1 
               luasyslog-2.2.0 | 1 
                    qemu-6.1.0 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/b277458fa25194c6524a46e425672ee07295935b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3c2c840e0da640cc4e25b3b06a4c569ad5003c21 |     
   x86_64    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/adecc3e5def140348dfff30961fe6514c9a8e7b5 | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a56449875bfaaf109c42247806edf482215336f2 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6e430e126df2fd7a7a69f5f787c9deb6558177fa |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5363b97199822dfc4a47e9ac6f6c4a98f31babb3 |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/8001d8716baf73a326ba9c11ca6f89f11cb8d3a8 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/08b0c5bcac8de5d96ecdb316a700fadaf9039155 |     
    i686     |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/44524199114cc2481520d9285302f2ea8f342312 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c1b9d8333963eaa8af23beab5828b02ade474f0d |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/af9930d12c5b200e700048d0b0cb3902fe7856f4 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/644789636e627c913a52ed430c76c25c0cbbd964 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d5918dbcbd0fd19efce39b3597a339c7c51ab492 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/22c4f43fe082e52a60d78de9b0a63e6a508576b3 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8b903424460edbb7ce893e0e5d8e7b48ed7ad624 |     
    i686     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4a4e9e6d8a08f864224295fb8858f500ffb7293e |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7c51f3efd46955aba6e54a814b2722109c057827 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e2fcd23a5e4adc37067b598ab3e159be22abbe9a |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9538a931a6e02aace7c08d687caf7ecddb445ccd |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1801edbc3f4d5762f745fedd38c5022878e707f2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/28af40e863505ab9f2d5c6b55531033ec47c1248 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  zeromq-4.3.4 | 2 
                 openal-1.20.1 | 1 
             openjdk-17.0.1+12 | 1 
                opus-tools-0.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4d60008721fd7f6e85e2b3be04740a246d12e8d3 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d2482b32ff2e411784c6026549c41a3914e76082 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a0ef6a3724fc75cd9dd80b3a8dac3930c634b311 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/ce976e11ffbf2875bd590973200adfe7ad8d6909 |     
    arm      |       openjdk-17.0.1+12        | NOK | http://autobuild.buildroot.net/results/e9588954a00a2a9895959497a081df6e6b387985 |     
   mipsel    |         opus-tools-0.2         | NOK | http://autobuild.buildroot.net/results/8a55ed6690a9a6b2430a49e4e83002bc60791d10 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9d7d314f9d6e58bc079d7009e827fb25c8accf17 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2827ea93bad1ebb2c2292cf2ef6e3c390e86e9c9 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 2 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4482d62f7f77f9b9acc6b48597dd1c1e82c81bdc |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c6c3ea7a213ecd06ca3ef847a4f8b95382f73b88 |     


Classification of failures by reason for next
---------------------------------------------

              tinydtls-0.9-rc1 | 3 
libdbi-88b8477d57153b9f736d... | 2 
                 diffutils-3.8 | 1 
               libtheora-1.1.1 | 1 
                   luvi-2.12.0 | 1 
               pipewire-0.3.39 | 1 
rpi-userland-bab9bf8790cd69... | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/9f5f754adb2f415604cdd64ce9541eb1b4623fc7 | ORPH
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/b2fad539b59dafe7493fb5a97f31ec5d6221d5dd |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/7121e6d5103318f8cc8822821f38f86f04fc0c13 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/fe7955e895a3d30d451d391c723aa01749fbf26e | ORPH
    i686     |          luvi-2.12.0           | NOK | http://autobuild.buildroot.net/results/8d2f0fe5979ad598505cdb5866a4d7ed4a44ed19 |     
  powerpc    |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/467fee5e1c4c1784a54ede16e1edb3606a72d1c7 |     
    arm      | rpi-userland-bab9bf8790cd69... | NOK | http://autobuild.buildroot.net/results/0a86c6e1e16ee6d7d735f4a232861785c2e0162d |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9c2ba1299392ee29ab7037899eb6b8555c405091 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/71a8907e29470b75aa628ce6741e98a3cf8c5735 |     
  riscv32    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/36ba81f2d96ae596d9f3adfbf6e0510cba035733 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/99b0af1e9532a4c34bd5bdd013b8bd4aecfa39d9 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
