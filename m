Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2450C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 06:59:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F31760FDA
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 06:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F31760FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C7EC605E6;
	Fri, 27 Aug 2021 06:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ergb4VhkBndc; Fri, 27 Aug 2021 06:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 556EF614CB;
	Fri, 27 Aug 2021 06:59:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 727441BF306
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 06:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60017401F9
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 06:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HCPqKqDeyGq for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 06:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D01394020A
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 06:59:48 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AC5DE40009
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 06:59:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Aug 2021 06:59:45 -0000
Message-Id: <20210827065953.60017401F9@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-26
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

Autobuild statistics for 2021-08-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 36  | 11  |  1  | 48  |
  2021.05.x  | 35  |  7  |  0  | 42  |
    master   | 185 | 25  |  0  | 210 |
     next    | 27  | 27  |  0  | 54  |

Classification of failures by reason for master
-----------------------------------------------

                    4th-3.62.5 | 2 
android-tools-4.2.2+git2013... | 2 
               capnproto-0.8.0 | 2 
                harfbuzz-2.8.2 | 2 
                host-odb-2.4.0 | 2 
               libcap-ng-0.8.2 | 2 
                mono-6.12.0.90 | 2 
                 openal-1.21.1 | 2 
                  zeromq-4.3.4 | 2 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                   gssdp-1.3.0 | 1 
               linux-pam-1.5.1 | 1 
                 openmpi-4.0.0 | 1 
           python-pybind-2.6.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           4th-3.62.5           | NOK | http://autobuild.buildroot.net/results/347c61135157f0d6c74417e1b1844305cfcf91d4 |     
  aarch64    |           4th-3.62.5           | NOK | http://autobuild.buildroot.net/results/ee8619d25f286ce5ffaf3b46cc5c0ae96a8f3a3b |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ff4590c4f6b71143abe482c4f90e015b6849b9ff |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/612b4ef12d83bf9d48a7953f8b99821ba7e7a341 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/59eefdd9dbc93e449e1a653ed4f804f6f21616b6 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/236d4201536bdd3fb984d870cf171bbf4582f66f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/436b69e6228d536d0829a53b2040650605fc256b | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ff5707ce6d3018ccc81649e337c59d2cb2122a99 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/1d839f2a819ae632e99a58929832fe5e9481229a |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/fce6683d315af87a2e434b2a83acb131a1f06e52 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/cf2726afc937c5c763e97e906dd5fb7daa7ba169 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5fa73059d744a234b54c71aaa3fbe6237c5163ce | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6b1fc8a79610c4b95527592ecde972717b310a5a | ORPH
  aarch64    |        libcap-ng-0.8.2         | NOK | http://autobuild.buildroot.net/results/1ece34b4109163e063f0dfb73bce4649a0bd5e14 |     
  aarch64    |        libcap-ng-0.8.2         | NOK | http://autobuild.buildroot.net/results/5cad4efb3d89b4ba9acb7ccd53bac850d9e14fb1 |     
   x86_64    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/fe7a7e77c8a73d861316d0c37f54431999fb8069 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1ceb09c0406ca2a42fa691742dea11ad9accf996 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/03255f212e088397d44aacdd72d9b43e31f199d8 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/45471579ca972c9ba4dcbc1047637b3f1cee4938 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2d7637086ba8fcc6a107c5196ca6d79708cd56cb |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/abbda0be02df9b14b51989832a820c4ba32f735c | ORPH
   nios2     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/99bb486bf06f00cd8d3e2a252cd6d4f4a8bbaa62 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4f196f97b898fc8047a757dade2ac49e20a7640d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7c79ed6bfac74da17c7973b6a90d5b22ab18392c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/701c86cda8a6fc0614b170ded5cd8d43d75d05cd |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 5 
android-tools-4.2.2+git2013... | 1 
             kismet-2020-12-R3 | 1 
                       mongodb | 1 
monkey-f54856ce250c4e257354... | 1 
              netopeer2-1.1.53 | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e06d1a8ab4dedb609fe9b3d9068a740941c50bd6 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cb5e770437b262234eda3b858bc5e51faf182a5b |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/76a41af75e62d67b20cbb3b886e8ea16651541bb |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/79971a4e6dfc14e17e9b06c5993c187e1f2da6e0 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/23eae54d75c672a6975b6030dd4960f3467bf999 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/275752396ad290c6119b41a6176cf9111b97dbe4 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/9c721638bf71dc99ba91f689ea67013faca82a0e | ORPH
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/1640008e27c37ece0568324b9c179ca9bfe935a3 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/17aadc240e70f65e19ef7fc74669dad2685cbedf |     
  riscv32    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/f2a33840b642b0993ea8226e0c92b2e8f1527b22 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/02db2ac7aab1a2a43b18cf81fc5813c4da62c441 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ae7333bf1bc3305135e50824f7084bbeca11e1bf |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
               capnproto-0.8.0 | 1 
                    ffmpeg-4.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/944185ef16ffb782545cd396de13d2be93b7c9b6 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2485c290ada2eec6a42f1701a1a34aebd9869a2f |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2e480c611f8b292a0c64b58b14a1c5040654a2b9 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c1ec1a23f30b61754faa5f40d707bd67688f98cf |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4cee35ca4fb18c0c75a69c1e6f71a19b283c8dea |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82256d5950b9e3ab287a0035c1cf6fb965ec0072 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5a6c17ea077ac246f84a835cad094902da8ffd8a |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 10
                  libbpf-0.4.0 | 4 
              host-libcap-2.52 | 2 
               capnproto-0.8.0 | 1 
                ejabberd-20.07 | 1 
                    ffmpeg-4.4 | 1 
                   gconf-3.2.6 | 1 
          libmodsecurity-3.0.5 | 1 
              libostree-2021.3 | 1 
                mono-6.12.0.90 | 1 
                    mpv-0.33.1 | 1 
                      poke-1.2 | 1 
          refpolicy-2.20210203 | 1 
tvheadend-dbaa0f850394af8ab... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fb5ee5edb8a0e951c12a269dc0123685798b17a0 |     
    i586     |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/970c995d5c6e9919ab300fe40487cf56a5c2bf1d |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/bef1123c87b02b3b73a0fee26cc77332476757b4 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e077182f01cdc5b6c70d2129301e68536383313b |     
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/271278d57f64fb7fd57302f8bb670daf1a9ca7d0 |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/abff1b69bb9a9f309afdb6ca8528223192918ba3 |     
  sparc64    |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/71b23ab62779009f737f6cb4a256940b972d96c4 |     
  aarch64    |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/bc96ce779d145ff0e2ec9107cf822a3c48c2f439 |     
   sparc     |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/4ffa59fff4d80a6aff1842db890ecc2e7c5acda9 |     
    arc      |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/be9a89a251537b7faed7648270b93c558f14aaf3 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/211c906423ae60395549adb815c1d3fa2e184a6c |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5077c40d2e3938e1881a00d5258ad6465a13add7 |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f82e8072a82ffcc3082f8aa5d204678816e69d5d |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e5424f4d60fc16e717181dde6ddf657c33cffca3 |     
    sh4      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ed6f5063cb230d3609b6d9de5fe073cd95b4baf2 |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/37b993b7b6e55f986cd7d1cb528fcaa006df08a6 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/06ecd579584e70b8a3b67a0cde48ce69fb64cb69 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d306b49d2e33b29991aa132e5ccb61a0e7a96c54 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/57e7737dd0c450cab8912ecac27416b51980133f |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f377fa09ad76481a192ffbcdb631232f5ed5c15f |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/13d474ea41ed523df67f89f7fee9eab9675175b4 |     
powerpc64le  |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/cfd589e2f1f9a23b62edb50b9bb9f31b7f5f651d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/2ab0c41bb7a44ca41bafc033a4ab7c012c9d7ecd |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/005fb5895a35bc8e11c4653ddde43554dec1e620 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/b2a8d3fda6f2dc963d324ade5f2fe21cd6f84564 | ORPH
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/cc13a9cab0dfde4e6e4c1e7243ad022f932eb5a6 |     
  powerpc    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/f8a95ca6ce0f9beecc102c16638545af5f36b2de |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
