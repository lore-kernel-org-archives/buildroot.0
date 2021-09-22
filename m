Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E800DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:12:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4254061156
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4254061156
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E101B401C3;
	Wed, 22 Sep 2021 07:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5YLzB0IlTt0; Wed, 22 Sep 2021 07:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0352740418;
	Wed, 22 Sep 2021 07:12:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6CD11BF3FD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B680A613A5
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORm4jcraoKif for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 07:12:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2683C60B61
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 07:12:38 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 04280240009
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 07:12:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Sep 2021 07:12:35 -0000
Message-Id: <20210922071241.B680A613A5@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-21
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

Autobuild statistics for 2021-09-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  |  9  |  2  | 52  |
  2021.05.x  | 37  |  4  |  0  | 41  |
  2021.08.x  | 39  |  1  |  1  | 41  |
    master   | 174 | 58  |  3  | 235 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.52 | 7 
                  uhd-3.15.0.0 | 7 
                   gstd-0.13.0 | 4 
                      iwd-1.17 | 4 
 Makefile:740: target-finalize | 4 
               pipewire-0.3.35 | 4 
                 openal-1.21.1 | 3 
                  zeromq-4.3.4 | 3 
               capnproto-0.8.0 | 2 
                       mongodb | 2 
          refpolicy-2.20210908 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                    atk-2.36.0 | 1 
                 boinc-7.16.18 | 1 
                 diffutils-3.7 | 1 
            docker-cli-20.10.7 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                      gdb-10.2 | 1 
              gnuradio-3.8.2.0 | 1 
google-breakpad-7515ab13768... | 1 
                host-go-1.17.1 | 1 
                     host-llvm | 1 
                host-odb-2.4.0 | 1 
                  ntp-4.2.8p15 | 1 
          refpolicy-2.20210203 | 1 
                 samba4-4.14.7 | 1 
                   seatd-0.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2cb6462b4434c0e63151ebbc042f75b0a668e98b |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/29ac97ba6a209b430ae48030a03b1cb220373f0b | ORPH
    arm      |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/2752c546057ab19f5dcfe2811393ba04381c4296 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/249947cfc287baa3be605ecae4bfc9fadb27671c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/850fa742c6cf8ae80962dde02fbe36cd3c1e1978 |     
    arc      |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/2f51ea0ec0da6b30d47063d77e2d321239ae9b34 | ORPH
    i586     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/673906753d6929cc624a11325f608a5523d6624b |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e1ff0144b67e429dd6e236af395933215c7119bd |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/96ec326fea924c4bca3fd307c3de095179c962a2 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/78dc5873eb7bc105ccc51e259b528bc000d24d4c | ORPH
  aarch64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/8c356ac403b590fbe51c230103cb52b08fc623a7 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/90778998edb30ce950a8323d20fcc101c1bc197e |     
    i586     |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/b3e405cd0942dd2d259839528abf44acec1b0196 |     
   sparc     |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/39ac368d20cdccfb3f727e74d73be2003267cf2b |     
  riscv64    |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/b07c973ac5c763bb4b91ea16ab8ca9fe8e681899 |     
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/28a7b432e5b27eebbaa191954137f6b93d2d0a96 |     
  mips64el   |         host-go-1.17.1         | NOK | http://autobuild.buildroot.net/results/1bc99a433d3d351c953730f9e33f418c3e3facd1 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/105b2c4a6156df7b950f97c523226c9fca4c4021 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/52a6a345a2f73385c91fd2e81a12e2bbada504ff |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e6836077159de6634ca190e224552dd6fdc24480 |     
    i586     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/870fd6e8f527e1e0efa818311e66c44ca7ede596 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/31f06439e39afd0f73c6492eabc2f5b9cbfeb1f7 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2ef2ec823d13c94223dc491bad870a116d7eb1a7 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/895999047133a9318e75b2c1cc4f4161844688b1 |     
    i586     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/590fa6cda7e6605fde4b642ff9531126e49ff17a |     
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/944b9af0d40543ea0ffda0607a55ff6b9a8880a6 | ORPH
    arm      |            iwd-1.17            | NOK | http://autobuild.buildroot.net/results/c71139bea4d64f57c3c954dc685baf81fdb82fe7 |     
  riscv64    |            iwd-1.17            | NOK | http://autobuild.buildroot.net/results/875706b465b505c57c17e5872111c4bc90baa14d |     
    arc      |            iwd-1.17            | NOK | http://autobuild.buildroot.net/results/50a209a8ce954eb0c9743ddd129b9c5f45a7c2aa |     
  riscv64    |            iwd-1.17            | NOK | http://autobuild.buildroot.net/results/97d1a95281ec45b404f9f3d51f6db9cd626d4fe1 |     
  mips64el   | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/3bd619c93430e0a34b9b8b2fc6e5369b59409c51 |     
  aarch64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/edf13abec2951a27722dfdd061fc7ceb866aecbd |     
   x86_64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/53f9b1463874be17e29189ba8f824654a877193f |     
  aarch64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/57f43263d4acf55287b0a51a30b8e0bbce73b858 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/7b567b4ef031fdf5d49709cb8d4fbce8d2428d3d |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/0138e8865dadf8cf95a207263cc8cbad00608634 |     
   s390x     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/21b0f65d202f8667cf636fadc0bb397162ad2217 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/9cd57155a1752243f2c91d173493f52019b2c4bf |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/85cf687df90cadeacf77cc0512709aa2313440ef |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2e53ba9ee5c0cfc01fe4b68c6541509ad642779a |     
 aarch64_be  |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/06fee56be86d3c2ae5ea673ccb1b28556c61a5b8 |     
   x86_64    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/afe5ba1bbf45286ed39e057bd0fef6979837780d |     
  powerpc    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/089e34cd3156ba0c6caa8d0f6ef6165d438971ce |     
  mips64el   |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/44723b334ce13d2027c7d6d3a09789cad3160153 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a1222d4ba0abf104dfc4a3dfc3c787e843fb6124 |     
  powerpc    |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/6a908d29e8aad1dc8d20568adab2d2f48e5882e3 |     
   xtensa    |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/a044563696c82d8b40ae213336f53776ac9e6939 |     
    arm      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/96a83e826e39a14fb18a8e002a6824d73e647054 |     
    arm      |          seatd-0.6.2           | NOK | http://autobuild.buildroot.net/results/83b858cf43c5ca72707db39f670cbb7d8b65a149 | ORPH
   mipsel    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/e281f885dc9472e61849ae53af4ec2e3099123eb |     
    m68k     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/39be2c3c1bce9f3ba6b1641636b45130d641b919 |     
   xtensa    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/9dbc971ccf507d8d0a05f4e255f47ce0254deee2 |     
 aarch64_be  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/00343a09846556028e9d50f8d9cf3cf34c9697b5 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/ee0ab8de7d77d63c1f2356cd2030ebb8473fdb2f |     
 powerpc64   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/4c40d5ee93a15f43527ad0cc7e2795347d9523ed |     
    i686     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/34c3c66ac833edc65aeb1d71851cd11867e48a2f |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/6025c670a8c57704287638f47f9b4d94e6e95ad9 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/109bc060b26f079ce35abce7775e9a71b5eb70d5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8c51858bb723e9beaf0770935864df30940b08d1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9d8ef22647f9f54bc39d3669d6eaaae6a4904206 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ad17d31f8d407a6e144f29079a40d731fd07bf85 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 2 
                rocksdb-6.13.3 | 2 
               cutelyst-2.11.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-20.3.5 | 1 
                       mongodb | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
 toolchain-external-linaro-arm | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/e91f5dacc91ecfe7cf4e8af9b5069d65c0427750 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0cf45dc2186e2bda0c401e7213de0fda7529235a |     
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/608f356329d71c631c47ab9f8c8a73abf61a3d07 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/93ce4f4c770a4f18603c416d031862967d16c83e |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c9e29a3e4d8ed32c0e96736d36950c467f41222c |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c7b75e09c564ae9083acb8de570f6f44b469e888 |     
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/c783c9a9afaa3915973fb93f216f94258e607093 | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f4a66a03264d99ca0807c973f3a02142b3c32f86 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/87503bc298b7871cf82c3f5bd87a639b90fc9485 |     
    arm      | toolchain-external-linaro-arm  | TIM | http://autobuild.buildroot.net/results/c901eaad29579868dedfbe000c810b746ac4273b |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/948bd567c67ef2218ab4f58f339239e02d8a689c |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

               libtheora-1.1.1 | 1 
                 openal-1.20.1 | 1 
            qt5location-5.15.2 | 1 
              rsyslog-8.2010.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/1e8f4f3d9aa1c13fcbf99fc8fc58bca10b17aa09 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/82c413c1c9c6c8173ea8afbeebd2ae51b3c97900 |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/acc43f272a46101179d980aaf0f58ba7cb4cd1c0 |     
    arc      |        rsyslog-8.2010.0        | NOK | http://autobuild.buildroot.net/results/08156c934e9b4d946c354dbaf78ea5d9ae9a4701 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
                     wpewebkit | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0a12ce9c1d5b7083a81d2c07a3c2d3feb3b1ba47 |     
  aarch64    |           wpewebkit            | TIM | http://autobuild.buildroot.net/results/7e710d62e6e5f355c31f9eb9f4a52361b26ac78d |     


Gitlab CI results for 2021-09-21
================================

Detail of defconfig failures for 2021.02.5
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124200  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124272  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124281  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124299  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124326  |      


Detail of runtime-test failures for 2021.02.5
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124559  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124560  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124561  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124562  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124563  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124564  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124565  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124566  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124567  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124568  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124569  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124570  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124571  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124572  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124573  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124574  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124575  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124576  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124577  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124578  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124579  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124580  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124581  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124582  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124583  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124584  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124585  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124586  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124587  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124588  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124589  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124590  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124591  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124592  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124593  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124594  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124595  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124596  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124597  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124598  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124599  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124600  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124601  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124602  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124603  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124604  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124605  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124606  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124607  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124608  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124609  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124610  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124611  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124612  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124613  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124614  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124615  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124616  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124617  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124619  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124620  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124621  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124622  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124623  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124624  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124625  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124626  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124627  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124629  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124630  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124631  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124632  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124633  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124634  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124635  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124636  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124637  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124638  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124639  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124640  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124641  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124642  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124643  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124644  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124645  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124646  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124647  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124648  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124649  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124650  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124651  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124653  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124654  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124655  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124656  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124657  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124658  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124659  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124660  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124661  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124662  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124663  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124664  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124665  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124666  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124667  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124668  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124669  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124670  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124671  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124672  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124674  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124675  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124676  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124677  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124678  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124679  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124681  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124683  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124685  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124687  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124689  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124691  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124692  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124693  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124694  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124695  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124696  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124697  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124698  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124699  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124700  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124701  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124702  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124703  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124704  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124705  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124706  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124707  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124708  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124709  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124710  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124711  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124712  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124713  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124714  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124715  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124716  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124717  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124718  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124719  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124720  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124721  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124722  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124723  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124724  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124725  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124726  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124727  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124728  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124729  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124730  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124731  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124732  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124733  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124734  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124735  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124736  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124737  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124551  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124552  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124553  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124554  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124555  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124556  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124557  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1603124558  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1607558748  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
