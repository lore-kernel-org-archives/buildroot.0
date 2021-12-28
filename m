Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C421C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 06:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1301040342;
	Tue, 28 Dec 2021 06:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Efg6Lr2p2BO4; Tue, 28 Dec 2021 06:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DDE340308;
	Tue, 28 Dec 2021 06:57:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59C481BF35C
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 06:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5268B60A8D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 06:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msFB8qs_8Ki6 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 06:57:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6B5560761
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 06:57:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B3B19240009
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 06:57:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Dec 2021 06:57:39 -0000
Message-Id: <20211228065744.5268B60A8D@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-27
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

Autobuild statistics for 2021-12-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 60  |  5  |  0  | 65  |
  2021.11.x  | 30  |  5  |  0  | 35  |
    master   | 106 | 29  |  0  | 135 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 9 
                       unknown | 4 
                 wavemon-0.9.4 | 4 
                       frr-8.1 | 3 
           host-harfbuzz-3.2.0 | 2 
              host-erlang-22.2 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                    ncmpc-0.46 | 1 
                nodejs-14.18.1 | 1 
                  uhd-3.15.0.0 | 1 
                    vnstat-2.8 | 1 
                xapp_xfd-1.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7e30942219ebd445798964563919fa0c15005cee |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/ccf7336e06a655d7486909f4452bc4fd61693453 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/37ca282b8ea2fc62c0e63ab43165edca9874b9f7 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/db44155087ecb3dfd0998d968c22080437f3ae42 |     
    arm      |      host-harfbuzz-3.2.0       | NOK | http://autobuild.buildroot.net/results/a3926dc9aa297850e18b9f9746fe850492874e03 |     
    arm      |      host-harfbuzz-3.2.0       | NOK | http://autobuild.buildroot.net/results/83cb549c9fc9ba4d701f413d0ea9e9911ab94a6b |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/46103ed54df3a60500c5c736c5e635cfa17b3b35 |     
    arm      |           ncmpc-0.46           | NOK | http://autobuild.buildroot.net/results/151765cb4000643048e8d86c7a49bc8bcbf9f390 |     
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/b9c223f854171b0b6cf9203f9dbed8a90340b2cb |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/b70a6c882037bb7d0cd22aa28ca9329af1681a4e |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f2add91d7499e694d3a417522899ade75e0d8e77 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2e0135882d059d5cfff3ee9abccb10f32ac676ea |     
  sparc64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/b194606c1c484e6962bfbfdb675e94c2d52ca474 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9b1dbd9285a57b1c2568c2a7cb40c6914dee0fc8 |     
    i686     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7cb80d55d1d9c41bbb1694001cec4b3f937264f7 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/526e641affd617f6d832ec8ad54c55125f171a15 |     
  sparc64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/677ed97dd04feffe256baa7ad97ef9070f9bd670 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/37115ca1a923bc344f761932c2fc00656375efd9 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/e73d0f85f020fa16c5514fdec76d85b08b9a24ef |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/974d07be1cced5f5e1e0316711425af4530f506f |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/f2a0c716bbd0bffdc7123720486246ffc75650e0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/00af5dca8c30b243af1e8cde3b02e264f7603442 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f0283843fe6bc80368d6f2ee6170abae98e13be |     
  aarch64    |           vnstat-2.8           | NOK | http://autobuild.buildroot.net/results/dcd675b92630c86d96cc4de3c6cc40bc95f5635b |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a87c331bee42211cee141197dee9146600cc2561 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a966eaef3d68e4f87f899da9f40a72c78ddf2e43 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2f714ed5412216e0bfc9df24adb61b9e85d4aa5d |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a6cb33bf7dc4f981ab060a4dac6620a0e87bd3b6 |     
    arm      |         xapp_xfd-1.1.3         | NOK | http://autobuild.buildroot.net/results/ec15712f5e852828d059da48412babe30d01c883 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               apcupsd-3.14.14 | 1 
                 openal-1.20.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/433f3a4604eb4ee6ca126b7a10686c9344388b6b |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f63b869321b4429c900dd41580dde323d3da23c1 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b5d6f83db6c544819cba5f361545ba96c95f01b5 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c95e6aec22243bda1b3ef27e4e85020847a3565f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/23a5c24e22d617e510c625757c83a951b316b16d |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 2 
                 libqmi-1.30.2 | 1 
                  ndisc6-1.0.5 | 1 
                nodejs-14.18.1 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c837edeb90ccd98c320ea212616a6f53226f1adb |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/da972a1892394e3d6070678da04af09520454139 |     
    arm      |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/aef1f2999ef45d49001dcc6ee768dbc8ed021921 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/54383b3674a9d911a42659f635652c09ab1bd228 | ORPH
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/8bc6c3afe8cbb745fe69afaed55b7496bd344fb0 |     


Gitlab CI results for 2021-12-27
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1921792262  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
