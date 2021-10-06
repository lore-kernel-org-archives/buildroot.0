Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA83C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 07:03:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420E96112D
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 07:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 420E96112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D071D83B0D;
	Wed,  6 Oct 2021 07:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSMB6yQfZcIC; Wed,  6 Oct 2021 07:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E631083C34;
	Wed,  6 Oct 2021 07:03:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74AA71BF33D
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 07:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64057404C3
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 07:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGarDuVR8Cpw for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 07:03:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D52B340495
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 07:03:45 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id F16CD4000A
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 07:03:42 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 06 Oct 2021 07:03:42 -0000
Message-Id: <20211006070347.64057404C3@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-05
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

Autobuild statistics for 2021-10-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  |  2  |  0  | 30  |
  2021.05.x  | 31  |  3  |  0  | 34  |
  2021.08.x  | 26  |  5  |  0  | 31  |
    master   | 45  | 26  |  0  | 71  |

Classification of failures by reason for master
-----------------------------------------------

                 wavemon-0.9.4 | 5 
               usbredir-0.11.0 | 3 
             python-pip-21.2.4 | 2 
            python-ujson-4.1.0 | 2 
                     apr-1.7.0 | 1 
                 dc3dd-7.2.641 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.17.1 | 1 
               libtasn1-4.17.0 | 1 
                mongodb-4.2.11 | 1 
                    mutt-2.1.1 | 1 
                  ndisc6-1.0.4 | 1 
               php-gnupg-1.5.0 | 1 
                 samba4-4.14.7 | 1 
               target-finalize | 1 
              tinydtls-0.9-rc1 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/1942cdd0684220d4990fb8d2d579a836c446b9eb |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4b696be57aa6febbc98fb54c8ce1ecff1c26160f | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2973cb7421c9c4fe01d838301bb3d8e5f6b1f490 | ORPH
  mips64el   |         host-go-1.17.1         | NOK | http://autobuild.buildroot.net/results/3382bee3eefdefd183a475345c6a7494a79f6a13 |     
microblazeel |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/0b7dac180007c3cc2cbaa29401c7543b6ffb9b89 | ORPH
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/8b0b045c42a2d187795ecb00277255de20a9cf98 |     
    arm      |           mutt-2.1.1           | NOK | http://autobuild.buildroot.net/results/4df3f387871d99544caddb3e8303d3369d7ff34a |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/30545cf810bf58869f7f0f8fb32d6b296a697294 | ORPH
    arm      |        php-gnupg-1.5.0         | NOK | http://autobuild.buildroot.net/results/b1118ffa9cefc986811266da83c42afcbd46d385 | ORPH
    arm      |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/35b2257f7df4724e91fbcd2ce2fe94b3148c1f1c |     
  riscv32    |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/17dfdf46178d18bc5982cda35361deee2aea6833 |     
    arc      |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/4f18e70a18d4bce2c1256310ee4708086ea10bf5 |     
    arc      |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/1145f3a546bd1b4147fb3c2ebe59ea2d4ca21814 |     
    arm      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/515676ec5c21c3cc7e577e14394d5d9e6d2eba02 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/356c6b09566c6020dc320eb89da791581571cb7f |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/dfc53cfa1ba725bdd48c9093c67e77ce45bda720 |     
  mips64el   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/adac4fc35c4f18696df5b29dde42f28c136541f3 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/becce5fe39b97f161a9a6db91a3132c8777e7c42 |     
    arc      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/484ee35ba7d5a5e3069ca62371118a0cf991e09d |     
    arc      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/48f50987247222bbb117cf1d492f7fb5182c3be8 |     
   x86_64    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/aa3ecd2941022730944f659c815f9b5e976d9ce6 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b21382d6fbc6d917c1c06c447eae9a0e910f9320 |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/688e07ca83b3e956626c6998d0f85f1a82f3e674 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/837cef131035ce8f0db84761343aa1c523426021 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9cc31015d0045065d21f430b22370fc14ef1fbcc |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ecd360743324feb3393de1c30a934f75b52029b4 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

         libhdhomerun-20200907 | 1 
               libtheora-1.1.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |     libhdhomerun-20200907      | NOK | http://autobuild.buildroot.net/results/8d0ca4abb76ae40599b00dea30443b736ec29b40 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/897dd2ad09566f62981467c3d231a94270eb445d | ORPH


Classification of failures by reason for 2021.05.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
        host-sentry-cli-1.57.0 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2ce224b5e4ce3d95134741c42bc4fb94d7e13d5d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f6013f32afbba32c3dad4a46f8d8709fe7dcb863 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a2f2a692b9b7f6ebf3d9c18ae1a11b91e3639cc8 | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

  gobject-introspection-1.68.0 | 1 
                host-go-1.16.8 | 1 
                    qemu-6.0.0 | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3be3ee76f17508df8696e724e30ca0c138cee5c9 | ORPH
  mips64el   |         host-go-1.16.8         | NOK | http://autobuild.buildroot.net/results/c25acdabd25fa1205a20c0ccbf12eff8be042047 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b121b04e12677d99300b2cfe197dacdd33ba4f69 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/87f6197b09e8a1515c37a9bceb6e2b34b0c4e9de |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a525058f6488bf8ee203d2561fbbd6c962a58184 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
