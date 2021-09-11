Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEB9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 07:09:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C5606101A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 07:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C5606101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FCE440444;
	Sat, 11 Sep 2021 07:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4175su8OqtOh; Sat, 11 Sep 2021 07:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F2A240463;
	Sat, 11 Sep 2021 07:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57CBF1BF388
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 07:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4638140463
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 07:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XtIVtgKcz1V6 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 07:08:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 547A540444
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:08:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0483310000C
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:08:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Sep 2021 07:08:52 -0000
Message-Id: <20210911070859.4638140463@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-10
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

Autobuild statistics for 2021-09-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 40  | 33  |  1  | 74  |
  2021.05.x  | 41  | 38  |  0  | 79  |
  2021.08.x  | 48  |  2  |  0  | 50  |
    master   | 229 | 94  |  2  | 325 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.52 | 21
              gnuradio-3.8.2.0 | 12
               libglib2-2.68.2 | 11
          refpolicy-2.20210203 | 7 
                  boost-1.77.0 | 4 
                 apitrace-10.0 | 3 
                     fmt-8.0.1 | 3 
                  zeromq-4.3.4 | 3 
                  autofs-5.1.7 | 2 
  gobject-introspection-1.68.0 | 2 
                harfbuzz-2.9.0 | 2 
                 openal-1.21.1 | 2 
tvheadend-dbaa0f850394af8ab... | 2 
                  uhd-3.15.0.0 | 2 
               apcupsd-3.14.14 | 1 
              asterisk-16.14.1 | 1 
               capnproto-0.8.0 | 1 
                 diffutils-3.7 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                 gerbera-1.8.2 | 1 
                     host-llvm | 1 
                host-odb-2.4.0 | 1 
                 libfuse-2.9.9 | 1 
                 libnss-3.69.1 | 1 
               linux-pam-1.5.1 | 1 
                       mongodb | 1 
                    mpv-0.33.1 | 1 
                  mupdf-1.18.0 | 1 
           python-pybind-2.6.1 | 1 
                    qemu-6.0.0 | 1 
               qt5webkit-5.9.1 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d0b1335c71dd0b9156dc9268eacfc7d5b2835d1d |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/9de4e6c8f3d9a3a9f769f54a1ff47587d2737387 |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/56245b03238e3182d7c2686370445423a96646a3 |     
    arm      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/eef39dfb06bdff247129a2cbfe38515042107938 |     
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/36fc1bd87a4fe61ba0c6f90cb7b98e4a7e392ac7 |     
    arc      |          autofs-5.1.7          | NOK | http://autobuild.buildroot.net/results/0c8ab8968b2adf6a5f8eeab00ce388968fa1c1d5 |     
    arm      |          autofs-5.1.7          | NOK | http://autobuild.buildroot.net/results/4d87e85c3f2bc8f4116a0503f2facfa3d762fa2e |     
    arm      |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/de6ac45e2556e516dc10df94941c9f993f8b9192 |     
    arm      |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/e3e013f697a58ab2321467778ddf4eb8a86ec4c8 |     
    arm      |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/707372e66fd4ebd9b1799365de0106961e169a28 |     
    arm      |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/cd32fe145531092aae9e25eca617d88c2b9ea163 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/75426faab38e356d09855ad7e931974901d3173f |     
    arm      |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/f34e48e485095d1247da51973a27ccb8176eb484 | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f73b5c9186bfde4d4821089ab59d2a0e7a130edc |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2d504946559865d3ef21d4ac6f08c17790d0b7f3 |     
  powerpc    |           fmt-8.0.1            | NOK | http://autobuild.buildroot.net/results/1883930d2bf413dee97dff8235f7368143e130a1 |     
  powerpc    |           fmt-8.0.1            | NOK | http://autobuild.buildroot.net/results/f88b9028ab2ec5ca06ecd017db7b33353a6d7ec2 |     
  powerpc    |           fmt-8.0.1            | NOK | http://autobuild.buildroot.net/results/9538490048a3c66d773dc4363353d352bf631b48 |     
  aarch64    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/bca3f52d0691b94d83c11821a371816dc6ace59d |     
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/eea2901f55be21a51040d104e936e29d360addb9 |     
  aarch64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/555e7a7692161dae3cd4cef3246994107427051d |     
powerpc64le  |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/ef83acceba508724d5a816b666e0fcbee371875d |     
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/95d59d50c76de8d6a6ef0a891c58535aa7ae92b5 |     
   mipsel    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/6640331b4c9a1d2b28ca618898a996871cee0f18 |     
   x86_64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/a9dc9521560d88c0a7394f7bc364407a199d4327 |     
  aarch64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/eebcd28af94b27145a59cdf189f994c768370ff4 |     
    arm      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/79ca96007e8d308d92f327e77da0d8fe905f0ebb |     
   x86_64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/79c7ff2f76deddb0ffd5fa9c42f87e46b638bdb0 |     
  riscv64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/284cbf1a22d7d6e848331f726bf322fa32534d19 |     
    i686     |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/d08bf1103dc7cee16cd4a489d045e3edfd082a72 |     
   x86_64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/da73c5a2c92e3326e2a9c90393336afb5cb00c3c |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/348fc0555e7df07fa0dffbceb0218304bd359096 | ORPH
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6ec9ad086dc79f396360fb00db45b1a73413c058 | ORPH
    arc      |         harfbuzz-2.9.0         | NOK | http://autobuild.buildroot.net/results/4de71340564d74bf686fa9e4370ead57269c2e29 | ORPH
    arc      |         harfbuzz-2.9.0         | NOK | http://autobuild.buildroot.net/results/dfa1574fdce32452b61bbac094ac80f8c71637bd | ORPH
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bd7eeef00a465e0b7283b1979519f5912a44dae8 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/98d9b42134f06a973c3852089b45ed3b9889ecac |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/40301101dddab5d42c9f4a148e2ec7ba21752fc8 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/845b36da7a0c7938ff8edd07380e8918dc824147 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7b9e6cdb3e158cb10dc14d342b6d7742824ac829 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/efcce35ad341db2a366d3ea273351fdae5c1ae7d |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2739e978b8a0d7328ace42b451382886205cbb1b |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5126de236ed01466f8cf3b22212a30be035ec965 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b3d99e248834d08d67977367098900bf9052fd1f |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c067b1efed4cb2c2d5b437c22a449138e5b41639 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2a57ef4b2d0041c8862ba713c8b895ccb99b1d14 |     
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/cbf53bb0351d04b1a35599815eb2baf7edee413f |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8de8b34a500959069e172964ec04d29959ffdeeb |     
    mips     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/60817bbc8129304a0557d4f3b12235bf8006a6e8 |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9bf0d1f363645fc32426f789f2444d3c6ed6727a |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e9fa10841f410e86017c7b99d94620bb77f005ae |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b28dd8deeb443f8ed7f05170bdcd8809276dd003 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7a9c838511daa8d12949908f24aa32f1a0dce896 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b335409a7d9162480188267e26b2dacc415fb601 |     
    or1k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/db4562381fe64dd5101e53dce6b52935ba51645a |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ac91283b25ebfc9d20a4462c2a537dea56e7bce5 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/930347d5634a62cbc70a68952a08756eb06367be |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cec4a237be878d1301c2bf40968364545af8a567 | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/2229cd2df9e9f3e2888e6aeb323e6ca11bcd812a | ORPH
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/5598df20a6b0fef4f6634cfe811d57837a9c3d3a |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/575ca2fe539b3858d0f654de7248789b75a7a9fe |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/ac756565f4e736755fbeb741dcd04aa37afa98cf |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/7197af2126912ca29a426291b689a3da69249c96 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/f3bb9903ff106dfa82188e1e803c80791aa67352 |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/b4f7351341ac2f0c5803e5b56b0dbdf26567d4e2 |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/00adee2839d695b8efdde8c16f29118089dc7331 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/6112d11918436fd19f5c3f23a88c30caf52bc4aa |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/df4469fb08993bb9d7f83d5ea1bb9e2f021f6443 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/92f2c728cfd61de9842bc169003c57d1a05c9c46 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/be9f756632b040c9fad3d30d6541aa5e9be5d131 |     
   mipsel    |         libnss-3.69.1          | NOK | http://autobuild.buildroot.net/results/192695f245b1ead7301584b14e257afdd4d76cb4 |     
   xtensa    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/5718df6b704075f9218d695751abe354339d1bcc | ORPH
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/2a57d340084879a92d19791283c612d7c2c74591 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/be030d614993e3d3b6a0cb5e69477465d3ba27ed |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/51c589b50116bc56104359f9345d8db23169da7a |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/6e7be776e960fa7cb077008de14c7e1800313242 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2cea8f5b93492e9498a5428758dd2656445b84f6 |     
  sparc64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/a5eedbf2c2fa3b2959af8ef91bf3dda20ecae623 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0c2a58975ecb095f4c95f9a7c734e2478043d4e4 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/30a9299f6cd852b2425f15a6d5786982776757a2 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5e3dcfa54f72324b28425fc693ab18521ef16625 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ab870502da85750b4d21a67452d30a1f87b490a2 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/aa3bbaccf1574ec5da99a72900dc1d998126f5fa |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7c6b52c78c1c55306a49c3aa41c6ab605a146745 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4b836d6972cde316740d85ba16c495abbc7cb1d2 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/edea257acefc37229a24a424dd18de3f13a93b8f |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9c78cd855c5b21fa8a90c505f15036971605e7cd |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/c596f6308b7f4d44d9ba009ed0c395396fc72f47 |     
  aarch64    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/f30a793740f93cc199a96f0b359ae781d6e59be4 |     
  powerpc    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/30c9475bd3f8a64df677bca3d44c2a5cf3ea2fc2 |     
  sparc64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/8dbceeb911dc8023cedbf118094a270a42fcc2c7 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/4d098df85e8a3cc1ab3f8cacff25d97c1c8eb63c |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/6ea2d479dbb859fb3ab08e08b0f13d70dc28e439 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d49d9afdb80ca5db1a066b3b64e59b3145e241f6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/020a46cf3331e14af1ca8b798b869373fd2eca87 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e9cbc88df143e4117198953f4037a2eaa531b05c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 c-ares-1.17.2 | 26
monkey-f54856ce250c4e257354... | 2 
               capnproto-0.8.0 | 1 
        host-sentry-cli-1.57.0 | 1 
make: *** Waiting for unfin... | 1 
                       mongodb | 1 
                 openal-1.20.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/35a08ebd1cdfab068a879e3b2b4dbd6313da7a70 | ORPH
  mips64el   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/2f5e72987b717cddbf5c6c68892012e0e6aabd93 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/fd767756bc22977d6e64e92818b4da451a2daf9e | ORPH
 powerpc64   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b120f1a92e63dcf3b451b3f5f6b303a68594a80a | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/3e85fcf957e51a330a6aec3398dd22bc04f70811 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/3f80fce1895e9c2c6fc962a4ee1d53f1af787d95 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/fc90e95d38ab736f246e00a5277fec89d9d68358 | ORPH
   s390x     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/fc63bf665bd648fe75117301c1248af71c816f4e | ORPH
 powerpc64   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/f2c22bc718c3d0fd764a09bb88e35aa787274874 | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/9973ddb3cd3e6e277a8f9d9e19a0b63f5db6d9e8 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/fee8ff8e42cc4dc3107a49eb23cf1e23bdf5a0d1 | ORPH
microblazeel |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/da42c10e1add48440581910281db823bb6ec282c | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/85dcbb93a0247aa33ece928ce96a4db10e6e7d83 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/a52d9bd3134301f5f029780c4233963e66817de3 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/098e58ed652598d20f8e69a8a51a8f3c027baa9f | ORPH
microblazeel |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b516b7c0ec829a3517ab57dd3ffd4b76d57be5b3 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/450d652050fde5375f24a2c5faeadb47fb42db06 | ORPH
   mipsel    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/68113a261c267828f54f741647c40617afb9984a | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/4834b38f2f8334743aab9292761b449ba3920734 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/baf1292cafd03852908d900fb5586a1a8f69e08d | ORPH
   mipsel    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/e39e0731da0a0c432a966ee912469ba4e89fdebb | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/2447726157a3ad849ee63aca7f392ca837a26576 | ORPH
   mipsel    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/81de403882ce71f3a7496cc7d4b52aacaaecd61d | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/112a26467275fc2054f96777c2bbec524e3e0b1b | ORPH
  aarch64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c73b202c4914bbd64829fab6a633149f9ded1b4c | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/d16d29efc8e270604cc3cfa93eec37819060328b | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/cf6c7003948120e368127bea717beacf86721286 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f4d70f8579e3c44338be702b056264223927f7f9 |     
powerpc64le  | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/05cd9df282e242b0a1a2e07646a79076306c4f64 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/58c07939ab19cae64666740368985bd3f073cfc8 |     
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/0fbcc230f90b356bc7031598aaa3660db403118c |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a3ae87cd897c639a1ded50a56398b2399103dcdc |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/d5235a99df14df0e6185975db01e77752f6c581c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5874fbcd35a14b2f1448ea1a8e78471c714f47d6 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 c-ares-1.17.2 | 37
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b29615462b76f88f445189e874b9ce1b794bb9ab | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/26c87cbcb95a00c7afabecd5365ba29b32361146 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/eeb6895bf9abd348e1980a149e9a5e08d3ab6d76 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ec7435bedc4c807db856190c705550498268c358 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/f3421319405f091e4016f7164f13bd7f6e02b6b5 | ORPH
   sparc     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/939ce90d15f81585be1d41582a762cfe9ba65ab7 | ORPH
   sparc     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/cf58aaa6f1ba38ea9ddcb815812c6b293db7d79c | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/2d5382bbbcf59376b4d75a29652e999c904ebc66 | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/5f9cc086dcd9d27b56858d675634a537116b8471 | ORPH
   xtensa    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/aa7005c0ba7078a75af48683ec1bbc13a015e425 | ORPH
    or1k     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ccbe06c1c8af75f070391b4e608d67b3c992831d | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c800d51f28c4a20fe8801e3bdc717fe7cfd17b04 | ORPH
   xtensa    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/8a1762cc9cb158f91804cebeced7209882e024c3 | ORPH
   xtensa    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/6eab604afb4961d6df0a9112c6da1d1c2aa0be3a | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/6a086cccda716b6084689aa4471550a8384ad972 | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/fa59de6f188ccd63c4f8a2bbf4429ed9b4ebf2d0 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/301003eb044e340533bd7ded7b9fc69a572cf426 | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/87f9b323054fdf507bbc3ac25b5e53bc7547ab2d | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/4723db6026b795908a826a5cec97e50e57236a0a | ORPH
  mips64el   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c0051969ac57d5d7b04a53c60b53cd3bd3bfafdc | ORPH
  mips64el   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/371136f7501820f234c2285c45f1d4425d4dbc9b | ORPH
  mips64el   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/95a0fd110c25fe9ecba029accc9a2b797bac6b22 | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b230ed19164ff80034396fdd96f9e607c122c222 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/d81c65795ac33758a44eeafc6925ed776929f9c5 | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/71a81184e623794ccf7c30cab305edfaf7fa5a7c | ORPH
  aarch64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/9944f675129acd37011d5440c20ee03ff93a840b | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/e1ce11bc37c26e2b80c0e4d5643645b80a5b3a3d | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/afca7f27c31de80728b2fc29f45298fef9628ca7 | ORPH
 aarch64_be  |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/5a3989bc4474b35df375754e11030187974aff20 | ORPH
   sparc     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/193b143c8f5ece013e47a3c645dcbe1860173f36 | ORPH
    m68k     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/e617cd6d0e6d3cf56ba120ad5a82e4bc78cb4ba8 | ORPH
   nios2     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/d8bd3de1a039d6b9688fb09f97dab18cdf4d2327 | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ca55961b561d60723ad6f86c44b59190e40ddffa | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/7a362ca2f2eb878e925aecfad75183398f2dea51 | ORPH
  sparc64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/7f4a75c2cf923a6a3b2eaf45985e83b10e5bb407 | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/bdb80f6ef39c0a96d9e3d752362f5a5c8c34e71c | ORPH
microblazeel |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/c444d561421f6c55b6619d4ef7b2ece6a6ab75f8 | ORPH
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5a1b9b05ef9105f9f7a6b0c6d9450b32a35ba9fa |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

libcamera-3a1f67a8031ac5ad9... | 1 
           python-pybind-2.6.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/5a1e3895e5963526ad7e6ce68f38bbcb628cf6cb |     
  aarch64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/5937911a51ce6582be9bea4b1d757831e6e18245 |     


Gitlab CI results for 2021-09-10
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071067  |      
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071069  |      
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071072  |      
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071074  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071078  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071079  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071081  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071083  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071086  |      
                 arm_foundationv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071092  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071101  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071116  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071117  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071118  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071120  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071121  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071125  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071127  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071133  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071135  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071136  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071137  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071139  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071140  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071142  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071143  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071144  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071145  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071146  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071148  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071150  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071152  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071153  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071154  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071155  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071157  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071158  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071159  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071162  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071163  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071164  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071166  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071167  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071169  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071171  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071173  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071174  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071175  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071177  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071178  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071179  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071180  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071181  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071183  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071184  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071185  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071186  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071187  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071193  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071194  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071204  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071221  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071224  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071232  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071228  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071231  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071236  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071264  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071269  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071271  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071273  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071274  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071275  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071277  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071278  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071279  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071280  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071281  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071282  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071284  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071285  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071288  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071295  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071296  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071298  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071299  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071302  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071304  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071305  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071306  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071307  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071310  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071311  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071312  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071315  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071316  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071318  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071321  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071323  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071329  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071325  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071331  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071332  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071334  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071345  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071354  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071357  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071358  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071362  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071364  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071366  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071368  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071369  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071372  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071373  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071376  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071378  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071381  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071383  | ORPH 
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071388  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071386  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071392  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071395  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071397  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071398  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071402  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071400  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071405  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071404  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071406  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071407  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071410  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071409  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071411  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071413  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071414  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071415  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071416  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071417  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071419  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071421  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071420  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071422  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071423  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071424  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071425  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071426  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071427  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071428  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071429  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071430  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071432  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071441  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071444  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071445  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071446  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071447  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071448  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071449  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071450  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071451  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071454  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071455  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071456  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071457  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071458  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071459  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071461  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071462  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071463  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071464  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071465  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071466  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071467  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071479  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071472  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071492  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071482  |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071483  |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071484  |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071486  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071485  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071488  |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071490  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071489  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071494  |      
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071493  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071496  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071497  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071498  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071500  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071501  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071504  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071506  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071510  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071514  |      
                 snps_archs38_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071515  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071517  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071519  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071520  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071521  | ORPH 
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071523  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071525  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071526  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071527  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071528  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071529  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071531  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071532  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071533  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071534  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071535  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071536  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071543  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
