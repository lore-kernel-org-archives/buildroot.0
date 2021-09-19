Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D893EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:01:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF6B61212
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AF6B61212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF0AC606C2;
	Sun, 19 Sep 2021 07:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aszi69msDQC0; Sun, 19 Sep 2021 07:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA816067F;
	Sun, 19 Sep 2021 07:01:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F2251BF341
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6776B405C9
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjplSDyHQQsh for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:01:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A171D4057C
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:01:09 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 73B45FF80A
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:01:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Sep 2021 07:01:06 -0000
Message-Id: <20210919070111.6776B405C9@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-18
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

Autobuild statistics for 2021-09-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 37  | 10  |  2  | 49  |
  2021.05.x  | 44  |  8  |  1  | 53  |
  2021.08.x  | 48  |  7  |  0  | 55  |
    master   | 206 | 55  |  3  | 264 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.52 | 11
                      fio-3.27 | 5 
                 apitrace-10.0 | 4 
                 libfuse-2.9.9 | 4 
                       unknown | 3 
                  zeromq-4.3.4 | 3 
                 diffutils-3.7 | 2 
            erlang-jiffy-1.0.6 | 2 
                       mongodb | 2 
                    mpv-0.33.1 | 2 
                  uhd-3.15.0.0 | 2 
                apparmor-3.0.3 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                    ffmpeg-4.4 | 1 
              gnuradio-3.8.2.0 | 1 
                host-go-1.17.1 | 1 
                     host-llvm | 1 
libcamera-e355ca0087cd93ef8... | 1 
              libxcrypt-4.4.25 | 1 
               linux-pam-1.5.1 | 1 
                 mesa3d-21.1.8 | 1 
                mono-6.12.0.90 | 1 
                  mupdf-1.18.0 | 1 
                  ntp-4.2.8p15 | 1 
               pipewire-0.3.35 | 1 
                 postgis-3.1.3 | 1 
           python-pybind-2.6.1 | 1 
          refpolicy-2.20210203 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/a28cde72fee186787a8e6307eac624d65d61da3c |     
    arm      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/70a18ec7446a6575a5b6dadbc5a28826d8e66f73 |     
    arc      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/e63238cdd32005f87ef886378ca25fb626339278 |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/ea40e69c9efd1049eb012b4fb64e2fe76fa1260e |     
  mips64el   |         apparmor-3.0.3         | NOK | http://autobuild.buildroot.net/results/e52c53badc45b249e98e531d6449ecc715794a3d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/47bfa93eba9879f2a1433cd12e421e5d53b751d3 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1ffa14d87974ef7a40f3ea333f8f9230ffa2a77f | ORPH
    arc      |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/039b93ded4ae1fdf6e7d687aa74064f58f084d19 | ORPH
    arc      |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/8b40737e76147fe0def86b7a253f34fd21e344fa | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7f709406191056745025a3f6c9ee63711d402e22 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1237393e818814cc1814b66cf1cb3e6d074179ed |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2a4b9512808ee8a063280b361f60173b04abb32a |     
microblazeel |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/f3effffcaefcf25d4a5edafef18872490aa590ec |     
    arm      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/79a931fd87668a1139057eb9813ef687489c245b |     
microblazeel |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/cfe616deff7bc2fec0dbb898ab6ce2c5f9e3810f |     
   xtensa    |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/cda23e7730e77db1512807b369790f94e7f6d201 |     
    arm      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/2b077e2457d10e55dc3a616e0a28174b125ca7a7 |     
   x86_64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/09633c8eb7b43d235a143453f86a44ae57066137 |     
  mips64el   |         host-go-1.17.1         | NOK | http://autobuild.buildroot.net/results/7c0cf413f0e8e32e675b0ab562e8f27852c82ce8 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/321202dda7fa83ef019251e064cb5befe3160d63 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/91b0983f913b04172d796858ebb019a01da5993b |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6a28397485bde30ff264a5c71127de40575e2dfd |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/dd5e547b939965bad3f5b0ed4302387e0298c7a3 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ae5e871b6a68e386bfaca1150bfc489d5259d010 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c9e10ca21aee7b1cc23a0a5db262ee5fefb88329 |     
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e03057266bce4233144edbfe7861851226516aaf |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8cfaf62afe1a0eefe3d6cfd2b066aa1956e6a52b |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bd4a2eae12fbef342d01190bb66c061ca0865454 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6d430291e5c31fc291573c90f0619f86776e5078 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b3da1c17b14f3ae35336a8938f524ab0e144ddfd |     
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/224de7b821ba209e59672c9238efffbb4db20ac3 |     
    or1k     | libcamera-e355ca0087cd93ef8... | NOK | http://autobuild.buildroot.net/results/4d30f632a8792381858bf0556feef3194e4c657e |     
    arm      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/8a290c6c07feaed0ada313beb55d6f73a496300c | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/d45745972da2e11e7694a82b15970a3c26729f06 | ORPH
    arm      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/687096f4ae6002db79a64e8e7d85a4338646b8d8 | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/5e2863965e0271f5db6499d93cb645f3d80ab585 | ORPH
microblazeel |        libxcrypt-4.4.25        | NOK | http://autobuild.buildroot.net/results/738d62450bf9b702989896c54b18472e616f2b6a |     
   xtensa    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/d3b8a154552792358314a48cd67744b054d405fb | ORPH
    arm      |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/f1417ec1a4e9723ceb0c6fd907c082550719a7db |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/98c58043d2af8b81231a307930a1167df5d5ca13 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/bb5a8296feaffb9786061530975aafe5c7afa241 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/37451f29607d73ae109b8b4b3208d2d11cd25b0f |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/66216df5ccd28682ff07afa07699332a882b8196 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/04d48391206f96f510bf84671ed12a9125b3d437 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/8e934b8adc683756bc1f0c1cd72d9ae26f854fd3 |     
    arc      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ede56f3a2fde121ed7b912df42bade900ad2ebd8 | ORPH
  powerpc    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/136c19358dc13aa8219476cb10495419ad3474cb |     
  mips64el   |         postgis-3.1.3          | NOK | http://autobuild.buildroot.net/results/6327efb87497fc953495e18b718ee4de162d41fd |     
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/7bb36763ed3d4665a3773f8c3e9d769797fddff3 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d5bee5525fb390a0600e27922c6382e4e8562152 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/39add254a4cad090c969a43672794c329a839b97 |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f83583de219328b47883514ae835eb769ff33ea1 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a4dad6e3bbc9da022d1bd2cfe1391577b549f2d2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6d8c1bc63e8543f40e785c07731c6efd3b2a1a2a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a6610b004ba88cbcf12ff70b7f9aaec17e3b71f1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2b683fb9ad6512d6c521654dfbae803197bf8a60 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d7d2c18b45f820300cb5f8fc164a9eaa8f761999 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a37ae1df150ddd90d363610a697675bae3cef178 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
android-tools-4.2.2+git2013... | 1 
docker-proxy-55685ba49593e6... | 1 
                   gvfs-1.44.1 | 1 
                     host-llvm | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                 python-uvloop | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/386e3c06e7318f7ea2cfd2ce95c98ebe8298c746 |     
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/8f0fd006c3f09700ed974f684f57d5c90a2c6dfb |     
powerpc64le  |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/a306e68559ad6a2c374764bffce55eaa246a3eab | ORPH
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/7e9ee331058f98f8779c811701f45a4f525fa51d |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2aeccea355e6a5c7aaf62d24050ad53cc8e477bf |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5c9becf17702a9b1e34b318d17d4e592f21f403b |     
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/4d89fdb0f9a2b0eb867c83b6c3e29a4a4c529504 |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1ab895ae32ad6f13096bde0ab2a9a34b0fbfcabf |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/06d7b76d4b1beed3717d30af7125c4465d90ff02 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/45aa6d19a68774013359cdf0804a49c43d958ace |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d09b428836ff6e734149c07186dacb04471e3baa |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/769e4fa9ed657b552264b276db8be0d3647f79fe |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
               apcupsd-3.14.14 | 1 
                ejabberd-20.07 | 1 
                host-go-1.16.8 | 1 
               libtheora-1.1.1 | 1 
                       mongodb | 1 
           python-pybind-2.6.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/95cfa3b3541b740664de5c1362dc8b8a208cb48b |     
   x86_64    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/b79561d3025f48baad4fa4da60836bfeb43e1c6f |     
  mips64el   |         host-go-1.16.8         | NOK | http://autobuild.buildroot.net/results/0ea5c3d7899d25dca7c48197b8f6102b860ed18b |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/83874b91d0ba74a21b1356f1bab4aaa92eab0e0f |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2a050074625232c7eee56c0b3e460c82a8aa4d91 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/79922f61b93cbd9a5f812c1426c979a1794c6e59 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/10130af65faa29d7f78c5981024626d6e1e73ecb | ORPH
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/b5fae39d590117878a49ba7a39ab8cc98d371a5e |     
    i586     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/0dbc1f9756efceda06f2304c6bc63f60fe0e5f97 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               capnproto-0.8.0 | 2 
                 dc3dd-7.2.641 | 1 
              libxcrypt-4.4.25 | 1 
                mono-6.12.0.90 | 1 
           python-pybind-2.6.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b9c17ba5da1dee2cacd7214b26fca513e550d3bb |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f0fe67450f68093749582be4797a04b7ab9371a9 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2be8306a24e312f6861103d6d967c203f3b00e1d | ORPH
microblazeel |        libxcrypt-4.4.25        | NOK | http://autobuild.buildroot.net/results/487536b5559e0b780f298361ef03aa6ca01a98b9 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f05d3eadce79eea8f641fe400d5fb4e66c6c8bb9 |     
   nios2     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/bc3137aceaf72329af9fd7334c35a8ca9b23a8f7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b33861ba0b284f5cb7c995b6ca66fad65e8b071c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
