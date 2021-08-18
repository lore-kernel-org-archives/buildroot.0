Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0130AC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 06:57:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D9B461051
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 06:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D9B461051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D7E040019;
	Wed, 18 Aug 2021 06:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TB3Hh6wwDiS9; Wed, 18 Aug 2021 06:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A297400D2;
	Wed, 18 Aug 2021 06:57:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43F6A1BF8B4
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 06:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 330904074D
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 06:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rm05sHFQvx_m for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 06:57:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFB4440219
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 06:57:25 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 71B806000A
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 06:57:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Aug 2021 06:57:22 -0000
Message-Id: <20210818065730.330904074D@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-17
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

Autobuild statistics for 2021-08-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  |  7  |  0  | 41  |
  2021.05.x  | 35  |  7  |  0  | 42  |
    master   | 186 | 30  |  5  | 221 |
     next    | 34  | 27  |  1  | 62  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                       mongodb | 4 
                    mpv-0.33.1 | 3 
                      gdb-10.1 | 2 
  gobject-introspection-1.68.0 | 2 
             host-cairo-1.16.0 | 2 
                 ripgrep-0.8.1 | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
                   eigen-3.3.7 | 1 
                harfbuzz-2.8.2 | 1 
                     host-llvm | 1 
          libmodsecurity-3.0.5 | 1 
                 libvirt-7.4.0 | 1 
                 openal-1.21.1 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.15.2 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c28dd04c453827c58c078b0808739d780c87690d |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/8354da225d1e5e337aa7ea62a7e6524fb5f1135f |     
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/21647e2a661dc198f6f6f37f3c767faa449cde65 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/21bb9fd1a2e4a9e43ec21ac0477406086bb5ef91 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b749049b0484f1e3d097b2d25d15082f52398f39 | ORPH
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/e5a96a3c7bbdf999ca47e3da0e2067a6763714b3 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/e2dbf859ae5ea9408ac7bf1554c110b0477bb497 | ORPH
   xtensa    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/00096bad2d9eee90c07761fc8c7f9eafe8782dac |     
  mips64el   |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/c1d61387edf1f79522f7d9df82c90c9cd67bba2d |     
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/c97386a8a1092a3ee4735720cafad62eb6cd2721 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/38ccbf255a868e823d441f9e3dc6f1949edf3978 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1d1708d0d6464271b4b0c4e992b58040f9cf8cca |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d5c8b9bcceb3317a07713190a0b2a918e44976c7 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd7d3f81de5d98bb4a5b519ee8edb8e1e05aa303 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f00eef7a67b3de664d4c5ef1e5328abfa96b274c |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e3d48d2f67314e8e533a2c6194829e27bb4c1fa8 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b92980a563fe7ee331e70f288ce041be0bf29d40 |     
    i686     |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/2349c55a4a42f08ca52700c60cda3065b0c4bd88 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/d5040c9ee89e401f897daecf58d823489d6ff52b |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/5f5edc8a61827480f1a8b0c2c448976d446964c2 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/8e3fc4996d86be79b09ebf7e74bbc244a08b4670 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/8f41dba464a725ca3dfae20cbbe7a387639dfc9e |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/fb10eb81ddc77576c6e23519c26c6db774d6f8e5 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e5c15228f42a73f8c34b26630b2074c30e5f5966 |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5008324c586b70e71ea5fe3030f0355c87daa96f |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/6a2809f8eefdeeaca8a4c61130a8d85511685cfc |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/2f96654c2238c115060aafc3cf10f71457c585f7 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/eb3dfe679536b578a0f16762312a96ada7162095 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/568f7fceebb06deb0755e8d3757c761608faeec7 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/e069c1a3433431b8055520a87f989b4eeefd7a4a |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/8bab232eb98b164df300581ae019254bde7c8ca3 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/92c086b0c5c2a298a82a6eb9c289dc53c58a5e5e |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/306e1a107abfad392f97e8d8d987d6e17ec80012 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f6d9c3b1e7be0e3c722f79bad7b89c7f1bd0f2f0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c6b4f37e30b7c6f803d32e6d9d0dec8e15e7ec30 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                    iostat-2.2 | 1 
   openvmtools-10.3.5-10430147 | 1 
           python-pybind-2.6.1 | 1 
            qt5location-5.15.2 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/89b0c7a11593e6a6c554806b703df8ac4f0336e9 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6b14f8aec98a7fdd45d23746cf86e1b50e51c29e |     
microblazeel |           iostat-2.2           | NOK | http://autobuild.buildroot.net/results/f94137858a7a602b3d55d48c9d0cd84dd9f3b424 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/05ae1b96367c992fa7a97b5da03f8c0e1acb832a |     
microblazeel |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/1c024ef8e53300ed3f80495e96f24f10576b62a3 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/fae21dd69641ecc729c64ef073e6662fe99cfea1 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/6a868f4e2306196be81fd214f6ddda2416c5e34b |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 2 
        host-sentry-cli-1.57.0 | 2 
android-tools-4.2.2+git2013... | 1 
                mono-6.12.0.90 | 1 
            qpid-proton-0.33.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4b8b4c245ca279feeb7572abe2b2963e2aaaca24 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ac296714731151b63a063438c2ee3bf73a14eba2 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/040c1cbff25c1c2bfb05b701d9d763ad4c49a583 | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2554f8f9d2849bfc4948df368e4f6f73fd43044f |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/415df41b2d9a0520f2df3ecb0ba15e379ccec390 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0 |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/145f0583ea412fba20d565fac0bac9c3f21ea261 |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 12
              host-libcap-2.52 | 3 
                   sdl2-2.0.14 | 2 
               capnproto-0.8.0 | 1 
                    ffmpeg-4.4 | 1 
  gobject-introspection-1.68.0 | 1 
                   guile-3.0.4 | 1 
                harfbuzz-2.8.2 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                  libbpf-0.4.0 | 1 
             libmediaart-1.9.4 | 1 
                          qpdf | 1 
          refpolicy-2.20210203 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a09dc881c8cae437e7377632c86e5159f58d8005 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3b729cf7c45c59caca269b398d7e26301a725143 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/fd72dcd5f9ccef266e6300b15040425fa3313ddb | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/6945079da142733ab0ee77e6cf503dfa8fd36c17 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/3d884e49b0d8f9485d3ed68f1198eb6179122f57 | ORPH
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/002b6a88a23fb1311c31ef14d792cba0900a44dd |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c5013a4d9a7dd2305bab8d9aa43104fd5f353bcf |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2511a7ec0b4fc29133a4fc99160beb47c5681f02 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e0d8cb350072ea90c331824a6790c792d60d885d |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0ff73f9bc7264fa53d0297eb54ceca4d1261b874 |     
    i686     |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/29075722cbe34782fc0a79ac61562d7828d2b9cd |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8b615eb0eea66cae7c31d9ce5d48eca8c5f0e82d |     
powerpc64le  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5fcf8e3923e8ce33338271846904139e15b81849 |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4f8897ed82629876042457862717ffaaa2ad45d6 |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/9eba4b4935f36d23e5a760ce5567501d556fd578 |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2840467638490f2a4024de83192bfed32436973b |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f24595dab2e0774606afee65814097acc66663dc |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d3ede7a124550be7682bd38ed993c37b3bdf0fe0 |     
powerpc64le  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/07211fc9881303410db79ea5781bd668c59feff2 |     
    sh4      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/fb3d811d1077373f28ea6fe6ecfe41d34cd7a01d |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4f5e05fb4dd060e61a72d74c2cae3a8c2f480099 |     
   s390x     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b810862764ad9c762a652fa0d74e66fbb53d683e |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/a228f8012e7eeb9a1eb70e4db8270318f861b0fe |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/4408c40d4c12a683e4be5c550b59237b420b0a6f |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/1f78a886e719d26586324c972178cac5cc3a1336 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2a95e8b43636c8b1a64e41077649895d4f839801 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/fd3769e48d28ff32d6d607e5bfa5dcd47d60b93b |     
    sh4      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/79505f4740ac4ea75d24249c107a9fb8b7e1f70f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
