Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CE9C432BE
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 07:10:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C76561107
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 07:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C76561107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E362460BA3;
	Thu, 19 Aug 2021 07:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdD8ZPPStnN4; Thu, 19 Aug 2021 07:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9BF260BB9;
	Thu, 19 Aug 2021 07:10:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA6B31BF2B8
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 07:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8B1260BC0
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 07:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNLSVjq22EUe for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 07:10:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45FAE60BB9
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 07:10:03 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3DB7C1BF203
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 07:10:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Aug 2021 07:10:00 -0000
Message-Id: <20210819071007.B8B1260BC0@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-18
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

Autobuild statistics for 2021-08-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 40  | 10  |  1  | 51  |
  2021.05.x  | 33  |  4  |  0  | 37  |
    master   | 188 | 30  |  1  | 219 |
     next    | 32  | 23  |  0  | 55  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                  zeromq-4.3.4 | 4 
                 dc3dd-7.2.641 | 2 
             bluez5_utils-5.60 | 1 
               capnproto-0.8.0 | 1 
              containerd-1.4.4 | 1 
                   eigen-3.3.7 | 1 
            erlang-jiffy-1.0.6 | 1 
                flannel-0.14.0 | 1 
                      gdb-10.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
  gobject-introspection-1.68.0 | 1 
                harfbuzz-2.8.2 | 1 
          lua-lunix-20170920-1 | 1 
                 mesa3d-21.1.6 | 1 
                       mongodb | 1 
                  mupdf-1.18.0 | 1 
                  ndisc6-1.0.4 | 1 
open2300-f21982e0b1f8321561... | 1 
               qt5webkit-5.9.1 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                    xen-4.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/ae3c9d0c77ff766c33e9964178e0a03ed07f7dd4 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ed0501ec2d045b75e681352c353d3895a6983b79 |     
   x86_64    |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/5daf49c339610752b0f3baa1e2ee706df47fe21d |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/33cc9bf5013979c02edf05c1ff20862f6cfd5394 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e71ced8b439516adfd321ed7a18f2e44bfd5a7cd | ORPH
  riscv64    |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/1af9c982f8adc6605fe129cd0b06ddd588803914 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/40c5f06a07d9cff182559fd833e3de267f26b344 |     
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/003e291beaf77f905f0832de6abe0d48f18ca234 |     
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/b1df71e6e00b1c0637cc7af00ddf8c2bd7a3073d | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/eba4e53bff7b3979c3f3c4f542b3ee3dff038741 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/9ed5b0bf9b95e5604455df9903de80e1f998b10d | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/72272baedb8e2963504eff39e7e73f6716836c56 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d732b373061ecfdefab78aeee3955d11149fb89a |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ab314b9481558514b35012ffcfa9c264a367dd5d |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/97aa03f497536462abc85011ba1c94874d18f237 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/96b5f284c0cf167aadd874f3c4700fe2419c036e |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fb1a389bb56b6c769e7ed3010594a76599cfcbb2 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bf7361dc482d8f3f97d523b7d56eabe5bc515ae8 |     
  riscv32    |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/91c2cc8d0af909ebb6034c979f4e76797528290d |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/692700a5f967760a0b8cd358b1712f1d5a7b681e |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/6c3ce484aaee50a10c0141acb6a5985c23063529 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/c57aef52dfefa115b110ffdfdbe19f35b98920f3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9464991f07b8cf1358e5bc961ce2e49d5bf6b420 | ORPH
   mipsel    | open2300-f21982e0b1f8321561... | NOK | http://autobuild.buildroot.net/results/59b073dfaa9b312ac30f8aaef9e73f7e240ca491 | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/3cdf991413d4869e8fa82a0717030c44a94f00ac |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/6e71f3a8a64a990a1ff2b6529619126457876ecc |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/fc0bb32e2e8b395a7c2ce48c17b32105d5bcf8c8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bab0a2445b53cb35fc5572c948250adee15ac9b5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f679353ae6ff1e2f2dfb293461c8dbf4ee1478d2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3eb00b3ee66d08cd17af0db8c7e4f10fb3d18d3f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4d08e875495583942041536daa9c9a694e193459 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

azure-iot-sdk-c-LTS_07_2020... | 2 
        host-sentry-cli-1.57.0 | 2 
               apcupsd-3.14.14 | 1 
                 gerbera-1.6.4 | 1 
  gobject-introspection-1.64.1 | 1 
                host-odb-2.4.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                       mongodb | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d1a087400eb98b2cb934ac045235d9f42dde8379 |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/5bd969b1ac9aac1f7d6180095f80f5400536dbe9 |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/c987ec61e2fc14b193cafa127856ff85c6616c07 |     
microblazeel |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/65e391933027de7566f5534c580ab177b2f2a32e |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f148d9b86933b93d80b29ad050accc6f2f8c5c23 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/20bc7315ba9517b1eb656d3fd6eda96c5cd664fe | ORPH
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2db988d7efb43d5c8217dbfa8983cea7d1ac1204 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/67e2b41006e108eb963a802b871b0c0266cc59fe |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/0a4cfad2cb9a7d5691231a6a60fb16610fdfd5b7 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/c378e446633ef15dbbdfa820441974438d8d0d04 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e5dd0219a5a5bc87d03225882014cadecefb9ccd |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    ffmpeg-4.4 | 2 
        host-sentry-cli-1.57.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3499de0bbca86d8dcbd0443062bbe50f3c35f42f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ef72ecaea41ebcc9eadcd7f879169d870d6140d5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd31656f9ad1a6d1e94ef5c726a5e71b71fcaf62 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/65a7ce3f8ca03d43c172d18ad91e99fcb1610308 |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 10
               capnproto-0.8.0 | 2 
                harfbuzz-2.8.2 | 2 
               belle-sip-4.4.8 | 1 
                      gdb-10.1 | 1 
  gobject-introspection-1.68.0 | 1 
              host-libcap-2.52 | 1 
                 libqmi-1.28.6 | 1 
                 mesa3d-21.1.7 | 1 
                 openmpi-4.0.0 | 1 
            qt5location-5.15.2 | 1 
          refpolicy-2.20210203 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/103fd345d9feac0d3e3f8bfaf541435b82076f51 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/44e93184a2cbe97fd93492ee497ee9bc6a386bc3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/189cba9530ff9df9ce4e64d66c45c850d3456427 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d08f6fdfb4027b2719c61af353d01d217f9d8e9f | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/c5b42126f78578ee14fcd4e4c5a400dc2b2c873e | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/06812a66fcec3583f99adf293f936aa5922e7e11 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/4e8757d5edf56346ec213cce233363a9f13342d5 | ORPH
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a13d8d193d096cc0a23439bff6db4edd4bed8c0c |     
    or1k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/cdf5f43b94ed5a8c8aed06a4c52db4f7bb13d7ac |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/921adc19043f10b9eba108f20682cafdebf8aa8f |     
    or1k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c11c970cc7e95cd67165841b8b0ef4bd0cb4bfc4 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2278f00c9883dbe116292e0d1cc6f2ccfbe1f9ba |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/051b92f25a8fa04d9111b45b93b15d3fe4f540b1 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/18f741a638b3800bf41c8410d7bf9152474f777e |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/9797641ebdeb515c580a8d2b8c7a866cf9f48a5d |     
powerpc64le  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c487b544b5954cd56c5d97b77201845401a3dad4 |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2f53c8f98f5b77c162f4a39af58e41211ae6982c |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3c1c5c42792187d319e382fc951bc024d013262a |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/19aaa69a004f942aa9eb0ee9a71d127fd3310ab5 |     
  powerpc    |         mesa3d-21.1.7          | NOK | http://autobuild.buildroot.net/results/8474f598a7ccc15dd7cd1a20bf9f88a2ae75b9a9 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/276e8c8362835ec68b1f7c8b4b5165f83f344d6e | ORPH
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/40a0f305bfde0e24259440b924ac827ce01281d2 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1950230748e82ffbedceeb01efe94ff997bae1b5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
