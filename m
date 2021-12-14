Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0E9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 08:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E064067F;
	Tue, 14 Dec 2021 08:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuL1xo4MXvHL; Tue, 14 Dec 2021 08:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1360B402DC;
	Tue, 14 Dec 2021 08:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 674171BF2A6
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 08:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C7138126B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 08:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxmGTzzzwfmo for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 08:15:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3C6481268
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 08:14:59 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CFA731C0010
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 08:14:56 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Dec 2021 08:14:56 -0000
Message-Id: <20211214081501.5C7138126B@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-13
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

Autobuild statistics for 2021-12-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 31  |  4  |  0  | 35  |
  2021.08.x  | 38  |  1  |  0  | 39  |
  2021.11.x  | 12  |  3  |  0  | 15  |
    master   | 82  | 12  |  0  | 94  |

Classification of failures by reason for master
-----------------------------------------------

              host-erlang-22.2 | 2 
                clamav-0.103.4 | 1 
                 libv4l-1.22.1 | 1 
                 libvirt-7.7.0 | 1 
                 mesa3d-21.3.1 | 1 
                  ndisc6-1.0.5 | 1 
                nodejs-14.18.1 | 1 
               pcsc-lite-1.9.5 | 1 
           python-pybind-2.6.1 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         clamav-0.103.4         | NOK | http://autobuild.buildroot.net/results/c517efea7146259e001f847dac90dfe9704e537f |     
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e802b86fa3ea2c2ddd0899af7e473af2d496402c |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a143160f022d22de4931f6b456a597f861dda98a |     
  mips64el   |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/f8c1b31d3e3f873d2b6516c0dd2445de134e5a0c |     
   x86_64    |         libvirt-7.7.0          | NOK | http://autobuild.buildroot.net/results/d41d372b5566ad4981313ff24a6908e734ef5aea |     
   mipsel    |         mesa3d-21.3.1          | NOK | http://autobuild.buildroot.net/results/669c175efdfc11ebb4fca67a40dbfe943e645a79 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/f5d67db7aed460d16b9fa29c7a7f0fed5ed645f4 | ORPH
    arm      |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/1b0840be8b84ad848f4dc67bf7a39bfba1d5b36d |     
microblazeel |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/d6c3816eda7a68e94a05be06e7e301e410f48cab | ORPH
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/c74319d1b1c2bd8afd93b97f2798c872f2239b52 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e5f0b7cfad3b80b831772f5c739fb014edfbf02d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/76efc16255954ffdaa337b1099f96ed614149ef8 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

azure-iot-sdk-c-LTS_07_2020... | 1 
                haproxy-2.2.17 | 1 
        host-sentry-cli-1.57.0 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/242781a57e02b7274e59ce3f1a1f034b796a76da |     
    sh4      |         haproxy-2.2.17         | NOK | http://autobuild.buildroot.net/results/ced1436d5838d80c46c1a1d4fb85396127b9f484 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7c07bd835e7686045a046b14deccad23e523289e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9a8926e4888da6b1abbb14cfb97c8b9d9b5135c8 | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                 mesa3d-21.1.6 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/43f412dc6d0c38329b0f0ded848e6afccf15d303 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                log4cxx-0.12.0 | 1 
                  uhd-3.15.0.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/f54c21858a14b018bfb1c1589f5a5e97d123a710 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f6430b5f581f30e007c25d972644ecfba9eb1ce6 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/de3ea867378fab8f2bc9b2fcf4af60e404e653a7 |     


Gitlab CI results for 2021-12-13
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1876632183  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/1876632288  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
