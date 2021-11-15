Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC37C433F5
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 22:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E09B619E5
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 22:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E09B619E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B69E81ABB;
	Thu, 18 Nov 2021 22:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PenreRzk4WHt; Thu, 18 Nov 2021 22:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B8CA81AC4;
	Thu, 18 Nov 2021 22:17:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32A861BF8B4
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 08:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1703040443
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 08:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POX0CtS714xv for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 08:00:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9C6F40442
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 08:00:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E79E41BF211
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 08:00:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Nov 2021 08:00:34 -0000
Message-Id: <20211115080042.1703040443@smtp4.osuosl.org>
X-Mailman-Approved-At: Thu, 18 Nov 2021 22:17:09 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-14
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

Autobuild statistics for 2021-11-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 43  | 13  |  0  | 56  |
  2021.08.x  | 62  |  4  |  0  | 66  |
    master   | 65  | 32  |  0  | 97  |
     next    | 16  |  2  |  0  | 18  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 13
              host-erlang-22.2 | 3 
                 coreutils-9.0 | 2 
                  uhd-3.15.0.0 | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
                  janet-1.18.1 | 1 
                log4cxx-0.12.0 | 1 
luajit-05f1984e1a862e4b3d3c... | 1 
                  mupdf-1.18.0 | 1 
                qt5base-5.15.2 | 1 
                samba4-4.14.10 | 1 
                sg3_utils-1.47 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1a54cf9e7223c2bd67a5c85a6f2f42aa98da3a53 |     
   x86_64    |         coreutils-9.0          | NOK | http://autobuild.buildroot.net/results/cae246dd8d9f009acc5b99ea4616d4fae31e8cf0 | ORPH
   x86_64    |         coreutils-9.0          | NOK | http://autobuild.buildroot.net/results/d5fabc3a5ef006d77d5edc81faf54e409a852eed | ORPH
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3d191073d686bfbd60400c044b002e44b1410cfb |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/385c4edeecfe1013348f35b67a4b2ede251cbb0b |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/331596b5aacc260bae0db018c482a6d3ae422c23 |     
   xtensa    |          janet-1.18.1          | NOK | http://autobuild.buildroot.net/results/d6cd842bd156abe3d77b72a7a108a5233fa19e20 |     
    sh4      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/e7443e3bc955e7eddd7bed63e2728880dabb31a7 |     
    arm      | luajit-05f1984e1a862e4b3d3c... | NOK | http://autobuild.buildroot.net/results/92a5188ef7f9dda3e417d3853b0c4067415f5970 |     
  sparc64    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/e64d456174a0f701c0e0de68317debcdc429a660 |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a0ce11c1984a2b5344a1d659400d0b08cd884513 |     
    arc      |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/89f6342410a557528aa3e75f7dacfb2f4b1f0775 |     
   x86_64    |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/9ead59ffefefe2a4e3b94a153b3d23231736d882 |     
  riscv32    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/dfc9a06d07e6ed27db12fdbb6ebb1048e4124b80 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1c1914f28afb5f6acbbac690c82c9cb6b827fb22 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7838c99309e0dca9381e1186ec0f39e28b2778bd |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/358adb427cd889b636a05c565a5a6b599479562a |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4fee46ef4755fc10b7ba9b2705c40a9b67cca6d1 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4ba39e66549aa8e03f39ff28d320a98efbcd75f4 |     
  sparc64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a84cf6b71226638c6a0e3fa76cfa2db89debdac3 |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f82324e6c93cbe2f3c2b222fc8b6e301f73968e8 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/bdae1a6db2f783a0c15ca0e4de0d971107d9aa3d |     
  nds32le    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/0618fb5e8bfb1d3970e8664db5854253655123a7 |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9cc4f436db8250ad85b997f75129a1455f83d863 |     
   x86_64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1283be796da63ecf87ac01a5b384b2314bb7f1ae |     
    i586     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a29efc24837dfa077ddba40aa486dff682516c2f |     
    sh4      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d901da7d259d6818e66e42c2a2921ff8ae7df935 |     
  powerpc    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d3a2208c6e9fe83ced39aa8dcec51db0abb439b0 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/589320d96eb09152251a6e48034df9e349499ed5 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/974c93a09ea249d32a5f988c9118e0fb4ca50c4e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/48d9a412613ad82769bfd475e4791ded22cd393e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d7d0dc91d7763a5d1245ef47c111cbbec61f7fb1 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 6 
            erlang-jiffy-1.0.6 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
               qt5webkit-5.9.1 | 1 
      qt5webkit-examples-5.9.1 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f374561bf2c0f45d592c881185c3afe54be656ef |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/58981f7ca487bc851322b0e9d34db3be8b05813c | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/4ba7675d513b5a0e33b976a0eb1dca5ed6a265c3 | ORPH
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/962bb99e0babc0b764bde9661f241addb55df082 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aa1301f8ab100e8ee710decb5b3e10542dbf4aa5 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5c03fd026a8937a9dcbb2d5bcc3fc5823b533fab |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/956b809c53b1767d2d9fb5a771e817a7ab6c2735 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e88129009ccebf731d2c5a97f927e5745688873d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2c7365e2df92e65e755fc17c5ad5a60a17467b4d |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/4b1763fbff0495302aafdfae75f2b114f2545b20 |     
   x86_64    |    qt5webkit-examples-5.9.1    | NOK | http://autobuild.buildroot.net/results/76de9135d85590895d682bf0ca98528fbaa25f06 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f18bada902acb4af94debfb2279516343bd185e6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2ba2c48f20b10ed12ec20c02de7b7b4989511888 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

             containerd-1.4.11 | 1 
  gobject-introspection-1.68.0 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       containerd-1.4.11        | NOK | http://autobuild.buildroot.net/results/a015feecd7188d90b1c2454a2a118db793f2a8ef |     
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/e16b778612cc7917c12b9a27b47b5d8a4ea3f2b7 | ORPH
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/78480ccf579c5702478ad291889bae701fec8415 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cbf7df058d5fe173c3168549bbb0c3e2c2fb25df |     


Classification of failures by reason for next
---------------------------------------------

              tinydtls-0.9-rc1 | 1 
                  uhd-3.15.0.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3362c81e5d11b5213b0422476487607bb2b41cd2 |     
  riscv32    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/77479b09355ff613999c51e3440ceca1bb00fc0a |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20210930     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 41.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.3.1        | 4.5.2        |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/00037 | 1.2.4        | 1.2.5.1      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 12.0.0_r13   |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 10.7.3       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 5.1.0        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.21.1      | 19.0.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.42.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.36.1       |     
                        autofs |  DISTRO  | https://release-monitoring.org/project/00140 | 5.1.7        | 5.1.8        |     
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | r1450        | 6.3          |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.11.0       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.10         | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/07137 | 2.0.3        | 2.0.4        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 19.03.14     | 19.03.30     | ORPH
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 5.1          | 5.1.8        | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2021.3       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.1       | 2021.3       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.5.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.0.51       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.4        | 8.2.0        | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.0.51       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.0.51       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.4       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.36      | 9.17.19      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.36.1       | 2.37         |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 22.0         |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.61         | 5.62         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.61         | 5.62         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.1.3        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.11         | 5.15         | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.09         | 3.17         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.16.1       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.301        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.8.0        | 0.9.1        |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.5          | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.34       | 1.4.36       | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.6.0        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.2          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.2.2        | 2.5.0        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.0          | 4.1          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.13         | 6.14         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.3      | 0.104.1      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 13.0.0       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.16.9       | 3.21.4       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.10.1       | 0.11.90      |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.3.6        | 2.4.1        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.9       | 1.28.10      |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.1.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.4        | 3.0.5        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.11.3       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.0.1        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.0.1        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.2.9        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/07487 | 1.6.0        | 1.6.1        |     
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.5          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.6.1        | 1.7.2        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20200327 | 1.3-20211107 | ORPH
                       dmalloc |  DISTRO  | https://release-monitoring.org/project/21417 | 5.5.2        | 5.6.5        | ORPH
                       dnsmasq |  DISTRO  | https://release-monitoring.org/project/00444 | 2.85         | 2.86         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 20.10.9      | 20.10.10     |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 2.1.1        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 20.10.9      | 20.10.10     |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.16       | 2.3.17       |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.16       | 0.5.17       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.16         | 1.17         | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202108       |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.4.0        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 20.07        | 21.07        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.184        | 0.186        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.12.3       |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.2.15       | 2.3.1        |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 24.1.5       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.21       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 1.0.6        | 1.0.9        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.13       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.29       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.14       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.8        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.43       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.27       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.0.45       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.13       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.23       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.47       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.4        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.28       | 1.0.32       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.12       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.9        | 1.0.10       |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.12         | 5.15         |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.8.1.0      |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.1.0        | 1.1.2        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.25.3       | 1.26         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.7.2        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.41         | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.15.1       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.11         | 1.12         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.11         | 1.12         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.15.4       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.94      | ORPH
                    freeswitch |  DISTRO  | https://release-monitoring.org/project/21436 | 1.10.6       | 1.10.7       |     
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 7.5.1        | 8.1          |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.7.1        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.05.00     | 21.09.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.8.0        | 1.9.0        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.10       |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/00868 | 5.1.0        | 5.1.1        | ORPH
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 3.41.0       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.6       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.9        | 2.3.3        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.53.3       | 9.55.0       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.1       | 2.33.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.66.0       | 2.70.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.66.0       | 2.70.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.4.0        | 0.5.0        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/21445 | 0.0.8        | 0.0.9        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.14       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.8        | 6.2.9        | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.32       | 2.3.3        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.9.4.0      |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.68.0       | 1.70.0       | ORPH
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.14.6       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 6.1.2        | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/01251 | 3.6          | 3.7          |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.41.0       | 1.41.1       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 41.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.3.1        | 1.4.0.1      |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.18.5       | 1.19.3       | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.18.5       | 1.19.3       |     
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.0.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/21847 | 1.1.6        | 1.1.7        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.18.5       | 1.19.3       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.18.5       | 1.19.3       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.4.0        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.2.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 3.0.4        | 3.0.7        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.3.1        | 1.4.0        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/01282 | 0.13.0       | 0.14.0       |     
                    gupnp-dlna |  DISTRO  | https://release-monitoring.org/project/01283 | 0.10.5       | 0.12.0       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.10.0       | 0.10.1       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.44.1       | 1.48.1       | ORPH
                          gzip |  DISTRO  | https://release-monitoring.org/project/01290 | 1.10         | 1.11         | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 3.0.0        | 3.1.1        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.14       | 1.9.15       |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 10.11        | 11.0         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.21.10      | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.4.1        | 2.6.0        |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 69-1         | 70.1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.36+nmu1  | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.11-13    | 7.1.0-13     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.7.4        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.21.9.6     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 21.3.1       | 21.3.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 21.3.5       | 21.4.1       |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.24         | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.9          | 5.16         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.17       | 1.9.19       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.10      | 0.11.5       |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.28       | 2.0.33       |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 2.2.0        | 3.3.1        |     
                          jose |  DISTRO  | https://release-monitoring.org/project/11761 | 10           | 11           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.6        | 2.1.1        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.3       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.13.0       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.0       |     
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.10.3       | 3.10.4       | ORPH
                     json-glib |  DISTRO  | https://release-monitoring.org/project/13144 | 1.4.4        | 1.6.6        |     
                       jsoncpp |  DISTRO  | https://release-monitoring.org/project/07483 | 1.9.4        | 1.9.5        |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.7.1        |     
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.1.4        | 2.2.4        |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.22       | 2.0.23       | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.88.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.88.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.88.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.88.0       |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.1.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.0-Ma... | 20.0.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.0-Ma... | 20.1.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.0-Ma... | 20.0.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.0-Ma... | 20.0.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.0-Ma... | 20.0.2-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.0-Ma... | 20.0.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.0-Ma... | 20.0.0-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.0-Ma... | 20.0.0-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.0-Ma... | 20.0.0-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.0.0-Ma... | 20.1.0-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.0-Ma... | 20.1.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.0.1-Ma... | 20.1.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.0-Ma... | 20.1.0-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.0.0-Ma... | 20.1.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.2-Ma... | 20.1.1-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.0.2-Ma... | 20.1.2-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.0-Ma... | 20.1.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.2-Ma... | 20.1.0-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.1-Ma... | 20.1.3-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.0-Ma... | 20.1.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.1.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.0-Ma... | 20.1.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.0-Ma... | 20.1.0-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.1.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.0-Ma... | 20.1.0-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.1.1-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.1-Ma... | 20.1.1-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.10-M... | 20.1.0-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.0-Ma... | 20.0.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.0-Ma... | 20.0.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.0-Ma... | 20.0.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.0-Ma... | 20.0.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.0-Ma... | 20.0.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.0-Ma... | 20.0.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.0-Ma... | 20.0.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.0-Ma... | 20.0.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.0-Ma... | 20.0.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.0.0-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.0.0-Ma... | 20.0.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.0-Ma... | 20.0.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.0-Ma... | 20.0.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.0-Ma... | 20.0.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.0-Ma... | 20.0.0-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.0-Ma... | 20.0.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.1-Ma... | 20.1.1-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.0-Ma... | 20.0.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.0-Ma... | 20.0.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.1-Ma... | 20.0.1-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.1.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.9.0        | 3.10.0       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                       leveldb |  DISTRO  | https://release-monitoring.org/project/09338 | 1.22         | 1.23         |     
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20210324.2   | 20211102.0   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.25         | 2.26-1       | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 0.4.0        | 0.5.0        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.10.0       | 0.11.3       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.5          | 2.6          | ORPH
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.52         | 2.60         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0          |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.4       | 1.10.7       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.1        | 4.3.0        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 0.9.2        | 1.0.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.14         | ORPH
                        libdrm |  DISTRO  | https://release-monitoring.org/project/01596 | 2.4.107      | 2.4.108      |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20191231-3.1 | 20210910-3.1 |     
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.10       | 1.0.11       |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.5       | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/13493 | 3.9.1        | 3.10.1       |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/21361 | 1.6.0        | 1.7.0        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.2        | 3.3.5        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.68.4       | 2.70.1       |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.42         | 1.43         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.15.1       | 1.16.0       | ORPH
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.5.0        |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 236          | 237          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.37         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.11       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.0        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.3.1        | ORPH
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.26.0       | 1.26.2       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/13148 | 1.9.4        | 1.9.5        |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.3        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.43       | 2.0.24       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.1.4        | 4.1.5        |     
                     libosmium |  DISTRO  | https://release-monitoring.org/project/07023 | 2.17.0       | 2.17.1       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.10         | 2.11.1       |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.6.0        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.52.4       |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.4        | 2.5.3        |     
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 3.3          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.2          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.2          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.6       | 3.0.7        | ORPH
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.2          | 2.3.1        |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.0       | 3.0.2        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.4.1        | 2.4.2        |     
                        libss7 |  DISTRO  | https://release-monitoring.org/project/21690 | 2.0.0        | 2.0.1        |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.17.0       | 4.18.0       | ORPH
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.12       | 2.0.4        |     
                     libuhttpd |  DISTRO  | https://release-monitoring.org/project/89386 | 3.12.1       | 3.14.1       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.11.4       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.7.0        | 7.9.0        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.21       | 4.3.0        |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.10.1       | 1.12.0       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 5.0.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.51.07      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.240      | 2.0.112      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.7.3        | 1.8.0        |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.0.51       | ORPH
                linux-firmware |  GUESS   | https://release-monitoring.org/project/141464 | 20210919     | 20211027     |     
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/12244 | 1.5.1        | 1.5.2        | ORPH
             linuxconsoletools |  DISTRO  | https://release-monitoring.org/project/01827 | 1.7.0        | 1.7.1        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2021.11.14   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 13.0.0       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.13       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 13.0.0       |     
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-6-0        | 3.6.0        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.12.0       | 0.12.1       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.18.0       | 3.18.1       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.93.2       | 4.94.0       | ORPH
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.31         | 0.32         |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.3        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.12.1       | 2.13.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.13.0       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.12.3       | 2.13.1       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.3        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.12.0       | 2.13.0       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.12      | 2.03.14      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.10       | 4.0.11       |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.6.9        | 1.7.0        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.30      | 10.7.1       | ORPH
              matchbox-fakekey |  DISTRO  | https://release-monitoring.org/project/229563 | 0.1          | 0.3          |     
             matchbox-keyboard |  DISTRO  | https://release-monitoring.org/project/230595 | 0.1          | 0.1.1        |     
                  matchbox-lib |  DISTRO  | https://release-monitoring.org/project/21187 | 1.9          | 1.12         |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20210328     | 20211018     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 172          | 179          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.5.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.0.51       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.1.8       | 21.2.5       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.1.8       | 21.2.5       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.42.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 9.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                     minissdpd |  DISTRO  | https://release-monitoring.org/project/57838 | 1.5.20200928 | 1.5.20211105 |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20210805     | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.16.10      | 1.18.2       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.11       | 5.1.0        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.4          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.29.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.90    | 6.12.0.158   |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/06078 | 2.0.12       | 2.0.13       |     
                         mp4v2 |  DISTRO  | https://release-monitoring.org/project/98413 | 4.1.3        | 5.0.1        | ORPH
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.22.11      | 0.23.4       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.5.0        | 2.5.1        |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.29.2       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 2.1.0        | 2.2.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.0.3        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.19       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.0.9        | 0.05         |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.26       | 4.0.35       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.19.0       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.1.1        | 2.1.3        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.21         | 3.22         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20211106 | ORPH
                         neard |  DISTRO  | https://release-monitoring.org/project/21866 | 0.16         | 0.17         |     
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.32.1       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.218        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.1       | 1.31.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 1.1.70       | 2.0.35       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.1        | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.32.2       | 1.32.12      | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.16       |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.46.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.21.4       |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16m          | 16n          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 14.18.1      | 17.1.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.14.1       | 0.15.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.132      | 390.144      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 495.44       | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 1.16         | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 1.31         | 1.33         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 13.1.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.18       | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.15       | 4.5.4        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.32       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.13+8    | 18+23        |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.59       | 2.6.0        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.1        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.44.8       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.3.5       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.27       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.0.51       | ORPH
                          owfs |  DISTRO  | https://release-monitoring.org/project/21559 | 3.2p3        | 3.2p4        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.22      | 0.24.0       | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.48.10      | 1.49.3       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.48.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.3          | 3.4          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.13         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.3        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202110       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.37        | 10.39        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.32.1       | 5.34.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
      perl-crypt-openssl-guess |  DISTRO  | https://release-monitoring.org/project/17375 | 0.12         | 0.14         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/02748 | 0.31         | 0.32         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.33         | 6.35         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.57         | 6.58         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20200907   |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.90         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/03485 | 5.09         | 5.10         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.5.0        | 3.5.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.1        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.2.1        | 2.2.2        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.0        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.39       | 0.3.40       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.8.0        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.10.1       | 1.11.1       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 1.2          | 1.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.119        | 0.120        |     
                      popperjs |  DISTRO  | https://release-monitoring.org/project/141557 | 1.16.0       | 2.10.2       |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 21.11.0      |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.3.9        | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                          pppd |  DISTRO  | https://release-monitoring.org/project/03703 | 2.4.8        | 2.4.9        | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.17       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7c       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 8.2.0        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.18.0       | 3.19.1       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.14         | 4.15         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.9.0        | 6.0.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 15.0         |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 3.1.0        | 3.1.5        |     
             python-aioblescan |  DISTRO  | https://release-monitoring.org/project/21242 | 0.2.8        | 0.2.9        |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.3.2        | 0.3.3        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.7.4.post0  | 3.8.1        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.0.0        | 1.1.0        |     
        python-aiohttp-session |  DISTRO  | https://release-monitoring.org/project/21250 | 2.9.0        | 2.10.0a0     |     
            python-aiohttp-sse |  DISTRO  | https://release-monitoring.org/project/21251 | 2.0.0        | 2.1.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.0.0        |     
              python-aiorwlock |  DISTRO  | https://release-monitoring.org/project/21254 | 1.1.0        | 1.2.0        |     
              python-aiosignal |  DISTRO  | https://release-monitoring.org/project/41889 | 1.1.2        | 1.2.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.1        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.4.1        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 4.0.0        | 4.0.1        |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.11.0       |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.4        |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.21.3       | 0.21.4       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.13.0       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.19.2       | 1.20.5       |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.22.2       | 1.23.5       |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.2.1        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.4.1        | 5.4.2        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2021.5.30    | 2021.10.8    |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.6       | 1.15.0       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.4        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.3.1        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.5.2        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.1       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.1.2        | 8.0.3        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.6.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 3.3.2        | 35.0.0       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 1.0.2        | 2.3.0        |     
                 python-cycler |  DISTRO  | https://release-monitoring.org/project/11552 | 0.10.0       | 0.11.0       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.24      | 3.0.0a9      |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.53.0       | 0.54.2       |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.2        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.2        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.2.7        | 4.0b1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.1.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.3        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.18         |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0b1     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.3.2        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.1.2        | 2.0.2        |     
     python-flask-expects-json |  DISTRO  | https://release-monitoring.org/project/127659 | 1.5.0        | 1.7.0        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 2.0.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.5.1        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 0.15.1       | 1.0.0        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.2.0        | 4.1.0        |     
                  python-hpack |  DISTRO  | https://release-monitoring.org/project/19034 | 3.0.0        | 4.0.0        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.2       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 3.12.0       |     
             python-hyperframe |  DISTRO  | https://release-monitoring.org/project/19035 | 5.2.0        | 6.0.1        |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 3.2          | 3.3          |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.28.0       | 7.29.0       |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.0        |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.1        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
                  python-janus |  DISTRO  | https://release-monitoring.org/project/56567 | 0.6.1        | 0.6.2        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.4.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.3       | 3.0.3        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.2.1        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.2.1       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.3.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.5.0b1      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.11.1       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.21.4       |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/11718 | 21.0         | 21.2         |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.6.1        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.7.2        | 2.8.0        |     
               python-pathlib2 |  DISTRO  | https://release-monitoring.org/project/12723 | 2.3.5        | 2.3.6        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.7.0        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 8.3.2        | 8.4.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 21.3.1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.0.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.22       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.18.0       | 3.19.1       |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.2        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2021.2.2     |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.6.1        | 2.8.1        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.20.1       |     
              python-pycparser |  DISTRO  | https://release-monitoring.org/project/08175 | 2.20         | 2.21         |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20200321.1   | 20210626.3   |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.0        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.10.0       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.8          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.3        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.19.1       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 19.1.0       | 21.0.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.7        | 3.0.6        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.11.7       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.6       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.81         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.5        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.1       |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.15.1       | 0.16.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2021.3       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.1.1        | 1.2.1        |     
                 python-pyyaml |  DISTRO  | https://release-monitoring.org/project/04123 | 5.4.1        | 6.0b1        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 22.3.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.0.0b3      |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2021.11.10   |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.3.0        | 4.3.1        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 2.2          |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.1        |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 18.1.0       | 21.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 59.1.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 5.0.1        | 6.3.2        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
         python-singledispatch |  DISTRO  | https://release-monitoring.org/project/12013 | 3.4.0.3      | 3.7.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 4.0.0        | 5.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/07203 | 0.5.4        | 0.6.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.5.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.27       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.0        | 1.2.1        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.2        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 4.1.2        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.15.0       |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.1.1        | 1.1.2        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.62.3       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.1.1        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 21.5.0       |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 20.3.0       | 21.7.0       |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 3.10.0.2     | 4.0.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.2       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.2.1        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.1         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 1.0.1        | 2.0.2        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.13.3       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.0        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.2        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.36.13      |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.9.7        | 3.10.0       |     
                  python3-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.6       | 1.15.0       |     
                python3-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.24      | 3.0.0a9      |     
                python3-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.3       | 3.0.3        |     
            python3-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.1        |     
             python3-pycparser |  DISTRO  | https://release-monitoring.org/project/08175 | 2.20         | 2.21         |     
                python3-pyyaml |  DISTRO  | https://release-monitoring.org/project/04123 | 5.4.1        | 6.0b1        |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2021.11.10   |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 59.1.0       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.3.2       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.36.0       |     
                         qt53d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                     qt5lottie |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
              qt5quicktimeline |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
              qt5remoteobjects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 6.2.1        |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 6.2.1        |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.1        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.1          | 1.2          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.9.9        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2021-08-01   | 2021-11-01   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.2          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.4       | 1.10.5       | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 6.26.0       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2110.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.3          | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.0.0        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.54.0       | 1.56.1       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.54.0       | 1.56.1       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.38.3       | 0.40.2       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.18.0       | 2.19.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.0.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.2      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.6.4      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.5.1.6      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.0.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.3.3      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.2.3      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.14.9       | 4.15.2       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.2.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 3.3          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 3.3          | ORPH
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.12       |     
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/04801 | 1.46         | 1.47r915     |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.1          | ORPH
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.11.0.0     |     
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.8        | 1.1.9        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.4.9        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.2        | 3.4.8        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.6.0      | 3.1.16.0     |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.3-80... | 1.13.6       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.4.3        | 4.5.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.17         | 5.2          | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 3.7.1        | 3.7.2        | ORPH
                       sshpass |  DISTRO  | https://release-monitoring.org/project/12961 | 1.06         | 1.09         |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 1.21c        | 1.22c        |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.20.9       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.4          | 6.5.3        |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.13.01      | 0.13.05      |     
                  supertuxkart |  DISTRO  | https://release-monitoring.org/project/04912 | 1.1          | 1.3          |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.27.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.42.1       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.4.122      | 2.0.53       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.4       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.00         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12         |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 2.1.54       |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.6.12       | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.3        | 4.3.4        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.9.0        | 1.11.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.4.6        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.15.0       | ORPH
                      tinyalsa |  DISTRO  | https://release-monitoring.org/project/21382 | 1.1.1        | 2.0.0        | ORPH
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/21379 | 0.5.4        | 0.6.0        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.6.12       |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.2a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.0        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.3.2        | 5.2          | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.9.4        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2021.10      |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.11         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.1.0.4      |     
              unclutter-xfixes |  DISTRO  | https://release-monitoring.org/project/09206 | 1.5          | 1.6          |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 2.2          |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.4        | 6.0.7        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.5.13       |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.11.0       | 0.12.0       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.54.3       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.3          | 0.6          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.3565     | 8.2.3592     | ORPH
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.66.1       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.2.6        | 3.2.22       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.0.11       | 4.0.12       |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.5         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 6.21         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.2        | 0.4.5        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.7        | 3.5.0        | ORPH
                       wolfssl |  DISTRO  | https://release-monitoring.org/project/21631 | 4.8.1-stable | 5.0.0        |     
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.10.0       | 1.12.0       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.32.4       | 2.34.1       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.5          |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20210218     |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/08648 | 3.20160805.1 | 3.20211022.1 |     
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/15900 | 19.1.0       | 21.0.0       |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.3       | 4.15.1       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.10.0       | 5.13.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.32         | 2.34         |     
                xml-security-c |  DISTRO  | https://release-monitoring.org/project/05197 | 2.0.2        | 2.0.4        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.45         | 6.02         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.18         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 367          | 370          | ORPH
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.03         | 2.04         |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.0.5        | 2.1.1        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2020f        | 2021e        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 1.9.9-b1     | 2.0.5        | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2021.2       | ORPH

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                    freeswitch | CVE-2021-37624   | https://security-tracker.debian.org/tracker/CVE-2021-37624  
                    freeswitch | CVE-2021-41105   | https://security-tracker.debian.org/tracker/CVE-2021-41105  
                    freeswitch | CVE-2021-41145   | https://security-tracker.debian.org/tracker/CVE-2021-41145  
                    freeswitch | CVE-2021-41158   | https://security-tracker.debian.org/tracker/CVE-2021-41158  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                         matio | CVE-2021-36977   | https://security-tracker.debian.org/tracker/CVE-2021-36977  
                       mbedtls | CVE-2020-36477   | https://security-tracker.debian.org/tracker/CVE-2020-36477  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                     pure-ftpd | CVE-2021-40524   | https://security-tracker.debian.org/tracker/CVE-2021-40524  
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3682    | https://security-tracker.debian.org/tracker/CVE-2021-3682   
                          qemu | CVE-2021-3713    | https://security-tracker.debian.org/tracker/CVE-2021-3713   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2021-36690   | https://security-tracker.debian.org/tracker/CVE-2021-36690  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                     webkitgtk | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                     wpewebkit | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2021.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-3487    | https://security-tracker.debian.org/tracker/CVE-2021-3487   
                          bird | CVE-2021-26928   | https://security-tracker.debian.org/tracker/CVE-2021-26928  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                  bluez5_utils | CVE-2021-0129    | https://security-tracker.debian.org/tracker/CVE-2021-0129   
                  bluez5_utils | CVE-2021-3588    | https://security-tracker.debian.org/tracker/CVE-2021-3588   
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2021-0129    | https://security-tracker.debian.org/tracker/CVE-2021-0129   
          bluez5_utils-headers | CVE-2021-3588    | https://security-tracker.debian.org/tracker/CVE-2021-3588   
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                      civetweb | CVE-2020-27304   | https://security-tracker.debian.org/tracker/CVE-2020-27304  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                          exim | CVE-2021-38371   | https://security-tracker.debian.org/tracker/CVE-2021-38371  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2020-35965   | https://security-tracker.debian.org/tracker/CVE-2020-35965  
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                   flatbuffers | CVE-2020-35864   | https://security-tracker.debian.org/tracker/CVE-2020-35864  
                    freeswitch | CVE-2021-36513   | https://security-tracker.debian.org/tracker/CVE-2021-36513  
                    freeswitch | CVE-2021-37624   | https://security-tracker.debian.org/tracker/CVE-2021-37624  
                    freeswitch | CVE-2021-41105   | https://security-tracker.debian.org/tracker/CVE-2021-41105  
                    freeswitch | CVE-2021-41145   | https://security-tracker.debian.org/tracker/CVE-2021-41145  
                    freeswitch | CVE-2021-41157   | https://security-tracker.debian.org/tracker/CVE-2021-41157  
                    freeswitch | CVE-2021-41158   | https://security-tracker.debian.org/tracker/CVE-2021-41158  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-27645   | https://security-tracker.debian.org/tracker/CVE-2021-27645  
                         glibc | CVE-2021-33574   | https://security-tracker.debian.org/tracker/CVE-2021-33574  
                         glibc | CVE-2021-38604   | https://security-tracker.debian.org/tracker/CVE-2021-38604  
                      gnuchess | CVE-2021-30184   | https://security-tracker.debian.org/tracker/CVE-2021-30184  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2021-29923   | https://security-tracker.debian.org/tracker/CVE-2021-29923  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                          kodi | CVE-2021-42917   | https://security-tracker.debian.org/tracker/CVE-2021-42917  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libressl | CVE-2021-41581   | https://security-tracker.debian.org/tracker/CVE-2021-41581  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                       mbedtls | CVE-2020-36477   | https://security-tracker.debian.org/tracker/CVE-2020-36477  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                        monkey | CVE-2013-1771    | https://security-tracker.debian.org/tracker/CVE-2013-1771   
                        monkey | CVE-2013-2183    | https://security-tracker.debian.org/tracker/CVE-2013-2183   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2021-32055   | https://security-tracker.debian.org/tracker/CVE-2021-32055  
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
               network-manager | CVE-2021-20297   | https://security-tracker.debian.org/tracker/CVE-2021-20297  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                       openvpn | CVE-2021-3606    | https://security-tracker.debian.org/tracker/CVE-2021-3606   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                   php-imagick | CVE-2019-11037   | https://security-tracker.debian.org/tracker/CVE-2019-11037  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                     pure-ftpd | CVE-2021-40524   | https://security-tracker.debian.org/tracker/CVE-2021-40524  
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
           python-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35504   | https://security-tracker.debian.org/tracker/CVE-2020-35504  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2020-35506   | https://security-tracker.debian.org/tracker/CVE-2020-35506  
                          qemu | CVE-2020-35517   | https://security-tracker.debian.org/tracker/CVE-2020-35517  
                          qemu | CVE-2021-20181   | https://security-tracker.debian.org/tracker/CVE-2021-20181  
                          qemu | CVE-2021-20196   | https://security-tracker.debian.org/tracker/CVE-2021-20196  
                          qemu | CVE-2021-20203   | https://security-tracker.debian.org/tracker/CVE-2021-20203  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-20263   | https://security-tracker.debian.org/tracker/CVE-2021-20263  
                          qemu | CVE-2021-3392    | https://security-tracker.debian.org/tracker/CVE-2021-3392   
                          qemu | CVE-2021-3409    | https://security-tracker.debian.org/tracker/CVE-2021-3409   
                          qemu | CVE-2021-3416    | https://security-tracker.debian.org/tracker/CVE-2021-3416   
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                          qemu | CVE-2021-3682    | https://security-tracker.debian.org/tracker/CVE-2021-3682   
                          qemu | CVE-2021-3713    | https://security-tracker.debian.org/tracker/CVE-2021-3713   
                   qpid-proton | CVE-2016-2166    | https://security-tracker.debian.org/tracker/CVE-2016-2166   
                   qpid-proton | CVE-2016-4467    | https://security-tracker.debian.org/tracker/CVE-2016-4467   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                          ruby | CVE-2021-28966   | https://security-tracker.debian.org/tracker/CVE-2021-28966  
                          rust | CVE-2021-29922   | https://security-tracker.debian.org/tracker/CVE-2021-29922  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                          sudo | CVE-2021-3156    | https://security-tracker.debian.org/tracker/CVE-2021-3156   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                    tpm2-tools | CVE-2021-3565    | https://security-tracker.debian.org/tracker/CVE-2021-3565   
                   uboot-tools | CVE-2021-27097   | https://security-tracker.debian.org/tracker/CVE-2021-27097  
                   uboot-tools | CVE-2021-27138   | https://security-tracker.debian.org/tracker/CVE-2021-27138  
                    util-linux | CVE-2021-37600   | https://security-tracker.debian.org/tracker/CVE-2021-37600  
                           vim | CVE-2021-3927    | https://security-tracker.debian.org/tracker/CVE-2021-3927   
                           vim | CVE-2021-3928    | https://security-tracker.debian.org/tracker/CVE-2021-3928   
                     webkitgtk | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                          wget | CVE-2021-31879   | https://security-tracker.debian.org/tracker/CVE-2021-31879  
                     wpewebkit | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2021.08.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                      civetweb | CVE-2020-27304   | https://security-tracker.debian.org/tracker/CVE-2020-27304  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                          exim | CVE-2021-38371   | https://security-tracker.debian.org/tracker/CVE-2021-38371  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                    freeswitch | CVE-2021-37624   | https://security-tracker.debian.org/tracker/CVE-2021-37624  
                    freeswitch | CVE-2021-41105   | https://security-tracker.debian.org/tracker/CVE-2021-41105  
                    freeswitch | CVE-2021-41145   | https://security-tracker.debian.org/tracker/CVE-2021-41145  
                    freeswitch | CVE-2021-41158   | https://security-tracker.debian.org/tracker/CVE-2021-41158  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-38604   | https://security-tracker.debian.org/tracker/CVE-2021-38604  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2021-29923   | https://security-tracker.debian.org/tracker/CVE-2021-29923  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libressl | CVE-2021-41581   | https://security-tracker.debian.org/tracker/CVE-2021-41581  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                         matio | CVE-2021-36977   | https://security-tracker.debian.org/tracker/CVE-2021-36977  
                       mbedtls | CVE-2020-36477   | https://security-tracker.debian.org/tracker/CVE-2020-36477  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                     pure-ftpd | CVE-2021-40524   | https://security-tracker.debian.org/tracker/CVE-2021-40524  
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                   python3-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                          qemu | CVE-2021-3682    | https://security-tracker.debian.org/tracker/CVE-2021-3682   
                          qemu | CVE-2021-3713    | https://security-tracker.debian.org/tracker/CVE-2021-3713   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                          sudo | CVE-2021-3156    | https://security-tracker.debian.org/tracker/CVE-2021-3156   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                    util-linux | CVE-2021-37600   | https://security-tracker.debian.org/tracker/CVE-2021-37600  
                           vim | CVE-2021-3927    | https://security-tracker.debian.org/tracker/CVE-2021-3927   
                           vim | CVE-2021-3928    | https://security-tracker.debian.org/tracker/CVE-2021-3928   
                     webkitgtk | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                     wpewebkit | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the 'next' branch
--------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                  bluez5_utils | CVE-2021-43400   | https://security-tracker.debian.org/tracker/CVE-2021-43400  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2021-43400   | https://security-tracker.debian.org/tracker/CVE-2021-43400  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                    freeswitch | CVE-2021-37624   | https://security-tracker.debian.org/tracker/CVE-2021-37624  
                    freeswitch | CVE-2021-41105   | https://security-tracker.debian.org/tracker/CVE-2021-41105  
                    freeswitch | CVE-2021-41145   | https://security-tracker.debian.org/tracker/CVE-2021-41145  
                    freeswitch | CVE-2021-41158   | https://security-tracker.debian.org/tracker/CVE-2021-41158  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                    libarchive | CVE-2021-36976   | https://security-tracker.debian.org/tracker/CVE-2021-36976  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                         matio | CVE-2020-36428   | https://security-tracker.debian.org/tracker/CVE-2020-36428  
                         matio | CVE-2021-36977   | https://security-tracker.debian.org/tracker/CVE-2021-36977  
                       mbedtls | CVE-2020-36477   | https://security-tracker.debian.org/tracker/CVE-2020-36477  
                       mbedtls | CVE-2021-24119   | https://security-tracker.debian.org/tracker/CVE-2021-24119  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                     pure-ftpd | CVE-2021-40524   | https://security-tracker.debian.org/tracker/CVE-2021-40524  
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3682    | https://security-tracker.debian.org/tracker/CVE-2021-3682   
                          qemu | CVE-2021-3713    | https://security-tracker.debian.org/tracker/CVE-2021-3713   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2021-36690   | https://security-tracker.debian.org/tracker/CVE-2021-36690  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           vim | CVE-2021-3927    | https://security-tracker.debian.org/tracker/CVE-2021-3927   
                           vim | CVE-2021-3928    | https://security-tracker.debian.org/tracker/CVE-2021-3928   
                     webkitgtk | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                     wpewebkit | CVE-2021-42762   | https://security-tracker.debian.org/tracker/CVE-2021-42762  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
