Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699E6C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 06:58:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F12961056
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 06:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F12961056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D63860B51;
	Fri, 20 Aug 2021 06:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28Yyt0-zXDam; Fri, 20 Aug 2021 06:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E6A3613AB;
	Fri, 20 Aug 2021 06:58:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12B701BF47D
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 06:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0860240715
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 06:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NxF5xqG5q_m for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 06:58:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79F634020E
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 06:58:21 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6F5DA24000C
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 06:58:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Aug 2021 06:58:18 -0000
Message-Id: <20210820065826.0860240715@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-19
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

Autobuild statistics for 2021-08-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 46  | 14  |  0  | 60  |
  2021.05.x  | 40  |  4  |  0  | 44  |
    master   | 168 | 36  |  1  | 205 |
     next    | 33  | 32  |  0  | 65  |

Classification of failures by reason for master
-----------------------------------------------

                    mpv-0.33.1 | 4 
        host-sentry-cli-1.57.0 | 3 
                      gdb-10.1 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                  mupdf-1.18.0 | 2 
                   sdl2-2.0.14 | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
            docker-cli-20.10.7 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                       gdb-9.2 | 1 
  gobject-introspection-1.68.0 | 1 
                   gvfs-1.44.1 | 1 
          libmodsecurity-3.0.5 | 1 
              libostree-2021.3 | 1 
                       mongodb | 1 
                  ndisc6-1.0.4 | 1 
         nvidia-driver-390.132 | 1 
                 openal-1.21.1 | 1 
                 openmpi-4.0.0 | 1 
       python-matplotlib-3.0.3 | 1 
           python-pybind-2.6.1 | 1 
                 python3-3.9.6 | 1 
            qt5location-5.15.2 | 1 
                 ripgrep-0.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8ddc0a439309d64685b30b9f02a16fd0bfcd7e87 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/73c8ff8181340c3837771f7192ffbfe951d3e00c | ORPH
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/b09cc16c41435ca0c7b46c25b3f7a167d221883a |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ad307e7bd75a89d7082c88ed5470202484b140d1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d2a11813ea6c427b129c0f232108e241ef6594df |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/728879e814a97c2ff2c16887e0ad439006591850 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d19e3edeb71ce9b2d2a869c1d44256202a1692ba | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/dc64a72f3feed9954304b793dc0c623ec5ea72e2 | ORPH
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/07e55bb98cb63d2d1b41cb95733fb2c950d56c60 | ORPH
  mips64el   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/002ed0bdb310416062dc512d82f82b7b0fd85ace | ORPH
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cfd6419315a09a406b5f752fafe1b07869c8cb12 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cf58554180742fa731097fb6c3c0499f45de9e9d |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2b0ccd498b0ef9900a529ced358803d70afbcb34 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/bb84ee74ecf89b68c81bbb5079056ee7312bce71 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/0c842f8887bb8b17bec8dd8b93fa4610bc7f88bd |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/de36c6e7fb65edfc84794b9c68fb28ec9c3c519f |     
    mips     |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/67d41aabc407f0b93aeb3d03b8730012234cde9c |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/eb3ccb66dd8200851a92c9fe4c6e6a4d91191e31 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/82d58f5a785bba68c900a72a82d95b28c3657883 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/83d6dcbb77ab8754aefcdcf90baeaff9db2a1c81 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/fcf8cf3c4961bf0be9d7ebeec86065730b0f9210 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/937f37cbf17e6751fc68cb78fcfc386c587793cb |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/ca7bc4ecdd77bec2945eaf0b6ee90eebbb9fc333 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/27318dee9927bf21fffd317b8ce5db1b73e06ab2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/66d6842acf253f18d950c05915adc48fc79e7214 | ORPH
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/c2e7a826c105363309f70a3fcfe28bd53efcb94a |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/22e73367140120349da6c2c0991255923a8e6e14 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/6da99eed9b86a85508ade677e31e092261c438a9 | ORPH
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/9c038346feef97b3efc24494269d8ded2ed59996 |     
   s390x     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/5340ba1adb477503c602478d973f1ccffe93e3aa |     
   x86_64    |         python3-3.9.6          | NOK | http://autobuild.buildroot.net/results/23c504f2b76555301bf3ab871457fc17d23eeb45 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/fd1399863f8ab31471f5c62a0cb919e1f2a1acb0 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/3292c7b4c44e0db5b63b6acb4a43e0ad5c7568c8 |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/cd0a7fbdc4eb8393258e0410fdd440dc4ada6d90 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/355c7e5092e7641d8b04ecb550e2671d70720bd2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/30bd2c9aaff201b19066c4f63f7fa816c9f01ed7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5a0ed60b56f046665c75389ed4da6d9f2f9b2c1d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 2 
                  gensio-2.2.3 | 2 
  gobject-introspection-1.64.1 | 2 
                rocksdb-6.13.3 | 2 
                   dante-1.4.2 | 1 
           libunistring-0.9.10 | 1 
                 mesa3d-20.3.5 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/3f791f35cc09ed7d2e2f28e8d2e1e88c750787e2 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f0fc11c7f6b777c88596d395cc0aaf7ead7c7b92 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/038109d0a75a1665f41c12e3ea5da545aa40747b |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/5e28082f378a645d27be52209970fc4907e23818 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/73b840d7aa2f03203208f50db62b714a94faae35 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/25f9ef7849d7bd56c33571208a4e84e7c5293fae | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/21f4f61b308c49c5d7e2e8dafa8d7969a27cd8ea | ORPH
  mips64el   |      libunistring-0.9.10       | NOK | http://autobuild.buildroot.net/results/7c937d6e1eb38e585ef55c0e35e5e26b892f79d3 |     
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/6e6a4d65488bd9f15ef0b8cc6a211e5805157db9 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/d3836bb2e711859e04c288fb6ce4e16bb0fbfd4e |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/998bef06d55a2c436c159dad391f952807fafcbc |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/b4fd3e8b285339a514d2759d520551c7b84e5aeb |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f8ce52c0fe8cef4c4a8fd0e520a6275493f21cce |     
  riscv32    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e990cadfb36a846d9862af2a1d398f5a9dc2e17b |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
        host-sentry-cli-1.57.0 | 1 
open2300-f21982e0b1f8321561... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/cc974c81d460040964b555948c7f62803c165fee |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b5f6e7effabbfa8b961873267386f4997fcddab5 |     
  riscv64    | open2300-f21982e0b1f8321561... | NOK | http://autobuild.buildroot.net/results/5d437e7099e423d86f9d094f810a3aa2a93aad78 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/56cc13965c2411bf6594fd7998baae7275dcd13b |     


Classification of failures by reason for next
---------------------------------------------

              host-libcap-2.52 | 7 
                 libebml-1.4.2 | 7 
          refpolicy-2.20210203 | 3 
                    ffmpeg-4.4 | 2 
                   gconf-3.2.6 | 2 
                harfbuzz-2.8.2 | 2 
               libgtk2-2.24.33 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libqmi-1.28.6 | 1 
               php-gnupg-1.5.0 | 1 
              strongswan-5.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4152c76517e6a8c829149434d62c0e430b7933c3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6fae3a393cf7ed5ca969265a3a66f801e7438d08 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3fcf73428807a57e16cb86315ecfce2c44b495cc |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9cb17564906dd541f5cb21cec7404ac3b8085f3d |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/4e89732b08dd9af48806a25f6aaa888255e9d424 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/a1a3fdfca1823bd41d9729d0ed66513837eaba8e |     
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2299d6ad19efc5f36a82cad3328ce9ec9397d5ba | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/244dc2483464b9b49b3914258bca3e830949f2db | ORPH
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ff9b6bfc1e2f93c9350e7f2ddfc3bba4c942a3bc |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8e126d6f6203053bcfa3a7428e0def54ad222374 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a89553ea56eb97352c7c2afbddd810b1873a69d1 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ef814825e6bde49d6892899045dbeb0e751c9c11 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/109debc1c06ea139fafc331f14798d1a01edce98 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b2abd788479117c814ed86426ad1015f3a0ef122 |     
    i586     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/aa6d5f7da210475a393cc4b8a62f85759d82064a |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ae091dbcb155e63c208ce5adb289807cee83e28d |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/63cb24fcaa0cc18c8b6e381701b00f220320b436 |     
    or1k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/02652d57420537bdb1b062e98cceb5ced73ab2ae |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8897c5487ca2f67d24ff927a78ebeba4bfba0168 |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/07c3eeb3bb1f00699ecc53385777725d59d63d28 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1917f27a62199b6a548ff03715a3e6547eeb207a |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2b1d3bbbf6c7078ece03cd5a6b526c68d6be5051 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d1370510592ac4c77afe5db638ff8b098dccb0e2 |     
    arm      |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/22823644f4402d624112c165c2666e9c87d4a41f |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/c0a35009581f4aa673bab3c946fa67786d952a2d |     
  sparc64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/69fc9f5ab0ca37f9c1a1fb33e1e975a81754fcb3 |     
    arm      |        php-gnupg-1.5.0         | NOK | http://autobuild.buildroot.net/results/78ea48b309c013987649b61002f6721ba1812449 | ORPH
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bcfdc680743b1442508227bc769f39c24d481a5d |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9a42e0f0d37a4cd1d62801a0b54e366fbcd13303 |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f8813dccdd4cc1ffc56f777e31a417ea86283453 |     
    or1k     |        strongswan-5.9.1        | NOK | http://autobuild.buildroot.net/results/f8f0c857c4f0aa39a4cbc8121dc95aa9ca5debbe |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1614330477a9a95f5b1b947f0a5bade04362d654 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
