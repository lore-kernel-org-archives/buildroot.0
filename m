Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6876C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 07:02:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6BE761038
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 07:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6BE761038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C2381D16;
	Sun, 26 Sep 2021 07:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dt1vRTIQYVuk; Sun, 26 Sep 2021 07:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54F1281DE0;
	Sun, 26 Sep 2021 07:02:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5CD1BF4E2
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 07:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09858403D0
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 07:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0EZ5-x-Newg for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 07:02:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D961403C3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 07:02:06 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B65A54000C
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 07:02:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Sep 2021 07:02:03 -0000
Message-Id: <20210926070209.09858403D0@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-25
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

Autobuild statistics for 2021-09-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 38  |  8  |  1  | 47  |
  2021.05.x  | 33  |  5  |  0  | 38  |
  2021.08.x  | 27  |  4  |  0  | 31  |
    master   | 83  | 42  |  0  | 125 |

Classification of failures by reason for master
-----------------------------------------------

                liblinear-2.43 | 14
                 wavemon-0.9.4 | 11
                opencv3-3.4.15 | 3 
               usbredir-0.11.0 | 3 
             python-pip-21.2.4 | 2 
                ejabberd-20.07 | 1 
              gnuradio-3.8.2.0 | 1 
                log4cxx-0.12.0 | 1 
                  nginx-1.20.1 | 1 
            qt5location-5.15.2 | 1 
               target-finalize | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/0410c3db9dadf31c120a620d14c730005a0006de |     
  aarch64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/6be5a40247ed80afcddde42d2db14e0c06ad1fc4 |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/338fa465f1bf935863fc5521eb56a10fa5838d9a |     
    arm      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/a74d923cfc277d27b75de1f9d4033103acb4a9b5 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/5f4c4ec116a859a66bad9afc35c5e2cc2aa76e80 |     
    i686     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/cd537a5024ce65531c2778397bcaf6279203d723 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/dbfeab8af2746da5da5400b0896c122b5ce2e638 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/074d082a2d2b59c16c920338dcdb24d406e4fc89 |     
    m68k     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/c4d06fc8d6137a09a7b89f9aa56e64411dfe9dc3 |     
  riscv32    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/a3073ba9c0c0f9d6d1e050056bb97f866a3f5e33 |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/409c17c78c76c76a94c14562de9fe21966bd9095 |     
   x86_64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/efc5d1a8d1de2a8a00c5eb463694f19d66d4d620 |     
   xtensa    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/a667fedbf39eaa59ce12ee49fc0f9ca2a3697808 |     
    arm      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/b63657e9dc8e060efc2cf6b2461f46dcfe9b326f |     
  riscv32    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/3e2a51ef97735b7e31cba15308c6e001204c0cd1 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/7d5b3a2a22d79c20105de34c50886ab2eb74649a |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/777a90c33a599d6a241a4b8643d6aed9066a01f6 |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/f2175cc88f41001cac87790b56b9aa035824d770 |     
    mips     |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/931102c8381215fc7d353d71e6a624b287ad028a |     
   nios2     |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/cb7be3722c43a3b2cb656fe35a0802e1c50534e1 |     
   mipsel    |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/53945b399804928168c7fafe69be4f8f2dbcd3d6 |     
   s390x     |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/64bc5d477de6b850cc4d9401acfa5e7204866fb4 |     
  powerpc    |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/ed74f4ca96332454af329fac23505000c379d4a3 |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/da157285a2726283d7054d48947998ad62ca05d2 |     
   xtensa    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2210e641bb77e1722d078b47a9a4c2f86c28b189 |     
powerpc64le  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/7a2c5cb62b3427c03624530131be6516b1a6bb4c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/52550ec14a48c84d033e742724105220d4402097 |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/43ebeb5bc4b228f99a898e98157d7fafc09e98b9 |     
  powerpc    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/de6d6ee9c662fc69002d9b1838f6928d04e726c5 |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/6575c0b76185ea0ac79a5d5107d7394ba71bb62f |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c0d95323218230deffafb7480704552e41c07a2f |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/153e695cfcf1a1c926048e7d55cd806729fd8f3b |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/68f31b3b42fcb1d15a224e2ed5ee8b6fb002404e |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f1766b960e3a4b57b915a4b0edb1048b41cbdab2 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e7f22a4716b42adfa53f5ec073d9a385461be5a2 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1e081a159c3c294ded1c613236139e9f9ecdd433 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ba957ed2f81affbab9cb8aeb727b77633e35a2c9 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0d4f006894bbbf0ff79a6578e67f0a2bf52ed1cb |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/02e680a5c4c9960339f4fb1988729115b6b534ec |     
    i586     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/123cf815579f64fe2fcc6bb41147c9e9fbdb1ad2 |     
    i586     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4b252ab0828f8c909d8bbff71fe678d14c733551 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f6927e57b0987b6f2abd40a998fbcfee09c9b4ea |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
azure-iot-sdk-c-LTS_07_2020... | 1 
               cutelyst-2.11.0 | 1 
                  gensio-2.2.3 | 1 
           python-pybind-2.6.1 | 1 
                 python-uvloop | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/43d5ddba7fc1343225fdd7d4f8499d6a5b050a6d |     
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/602c1d62a5b9524a47f2f0f10162249ac7f55a86 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/b53c2d0d5922bd84d2776954fc592179547f9779 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/26eede5359bfb0141082d8f4ce1e1f9e562c2386 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6f5b4a4a5fd0b7c6e3534b00a9d34e34378854b3 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a6fb2c68725a4f2a3ff1e03b63f51529565bbd0e |     
   x86_64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/9a7a1101a18bbddf81c047ae2e65fc2c32cba47b |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/4c477504a9d1cef744aaa2935d70bca154f9a4f3 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f83cd13f46d2ce43b8918637029b34a8bd83ac6a |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
            erlang-jiffy-1.0.6 | 1 
        host-sentry-cli-1.57.0 | 1 
                mono-6.12.0.90 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/33c3557aa8915630b0c0107b2e31c17e91a2db9a |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/669a084e04b65216f8b94e07fec8f6d8f111e1d5 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/814ff8b49a82287c54e8cfd797d311635a7ca34b |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4dd47dc0b9c3eabac62ceae1258d831a342a8a0e |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/8105d83693bdbf20771bafa5d76971207589798f |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                      gdb-10.2 | 2 
               apcupsd-3.14.14 | 1 
            erlang-jiffy-1.0.6 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0f26699a7140bada347610bd65fba1468080bb3d |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4f575ccb48498ed30510fe271ae39f35a01a054b |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/2920d7e4d56bb5d28666bce14cc700090d3a239a | ORPH
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/7c0a01d1cf4723e13ae9ec0806cee29394a6b743 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
