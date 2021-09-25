Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABAFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 07:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43C861019
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 07:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D43C861019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6B74068F;
	Sat, 25 Sep 2021 07:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odDUUfrXXd_6; Sat, 25 Sep 2021 07:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F70040696;
	Sat, 25 Sep 2021 07:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2440F1BF956
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 07:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0125E40696
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 07:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vx0teRnwoxWc for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 07:02:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC7064068F
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 07:02:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A913D10000D
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 07:02:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Sep 2021 07:02:34 -0000
Message-Id: <20210925070240.0125E40696@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-24
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

Autobuild statistics for 2021-09-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 51  |  9  |  0  | 60  |
  2021.05.x  | 52  |  9  |  0  | 61  |
  2021.08.x  | 59  |  1  |  0  | 60  |
    master   | 144 | 113 |  3  | 260 |

Classification of failures by reason for master
-----------------------------------------------

                liblinear-2.43 | 50
                  uhd-3.15.0.0 | 9 
               usbredir-0.11.0 | 8 
                 wavemon-0.9.4 | 8 
                 diffutils-3.8 | 4 
               capnproto-0.8.0 | 3 
                    ffmpeg-4.4 | 3 
                 opencv4-4.5.3 | 3 
              gnuradio-3.8.2.0 | 2 
                   gstd-0.13.0 | 2 
                log4cxx-0.12.0 | 2 
 Makefile:740: target-finalize | 2 
                       mongodb | 2 
                  zeromq-4.3.4 | 2 
            docker-cli-20.10.7 | 1 
google-breakpad-7515ab13768... | 1 
                host-odb-2.4.0 | 1 
             kismet-2021-08-R1 | 1 
libcamera-e355ca0087cd93ef8... | 1 
                librsvg-2.50.7 | 1 
                 mesa3d-21.1.8 | 1 
                mongodb-4.2.11 | 1 
                  mupdf-1.18.0 | 1 
                opencv3-3.4.15 | 1 
               php-gnupg-1.5.0 | 1 
            qt5location-5.15.2 | 1 
          refpolicy-2.20210908 | 1 
                 samba4-4.14.7 | 1 
               target-finalize | 1 
                     wpewebkit | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/46515ff2627811a41a9a6a24d9e7ce0d69ba6a91 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/758b9fe603f0bdb7e26e137d66dbf5d07635d55f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/73ad66e4cf48281ca9bf11f85d227deca5bdf522 |     
   x86_64    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/00560e548a720f6213b63544a7cecc75f20b4885 | ORPH
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/96201f44fdbb2c7ff536a9635a656019a4239020 | ORPH
    or1k     |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/4266dadd3623252dd4dcefed67ee89e90beba45f | ORPH
    or1k     |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/b2743df6b10a93a5c1b09a1eb03b9947fae92992 | ORPH
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/8007ddd6024565f3499d8f908310bf18c9c17683 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c22cec0657554162f1102888ae29979c6d8ce4c7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c321c248048196a69f85ee36eb7985e0467d06d7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/24f6f620561280a3d86b80d82f4ef4b72c764707 |     
  mips64el   |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/29e24de3db5029041096a2a673304d8f49e53415 |     
  aarch64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/4ad741e33a9f95cf61c74e58a2cda61be48ae6a9 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/0d10e8900f0c583175b7cc87bb9e645480db0509 |     
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/deb34ab151b0add7aee5769c7803e33615c3f5d8 |     
   x86_64    |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/2f97e8af9ee4f4b2035c218977467139f99a1a95 |     
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f3c8bb0db044b2f749d00d1f23f12b701f4e382c | ORPH
    m68k     |       kismet-2021-08-R1        | NOK | http://autobuild.buildroot.net/results/962331c67f6c62df1883ed772ad36aff2497f318 | ORPH
 powerpc64   | libcamera-e355ca0087cd93ef8... | NOK | http://autobuild.buildroot.net/results/f1b93f2c2d61e09f23033b6efe2e5d68ffb55924 |     
   x86_64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/9e22c968125c31eea2087871ea6e5be2ed328151 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/64283b9a29c3e57e8aefb3282a47946653376fb4 |     
   xtensa    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/722da0bbf02111d4d76a8783572af64ed513b4cb |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/df4eaefe0be2f7cf846a6a01c7fd6a8e704bc118 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/af77a999068978fc4d2a7ddb6d35cdc28a488b57 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/43811d041f7b522f4258fedd3c6bafa93d01528d |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/d19c2772d260928d91d5a18ef89dc0270cc33b85 |     
  riscv64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/b1c3ea06ff74fd6dd566061164a528b2ab09f8b8 |     
   sparc     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/57edd40a04c012a156d9d29016252a2d47acbf81 |     
  aarch64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/eba9d01c7fc20d3002a0cae3f55628fdb802712d |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/a9c6b7b46ed2c21ceaaed17a4fd2414d72781b32 |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/401e661775e1a096eb284f81c0118dcd61b3e232 |     
   x86_64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/b3e2e76a0dfcc17ff6ffcfa63bae5cfc7b7bf999 |     
 powerpc64   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/da2357fddd8610b70cc0ce9fd3c246ae9463407c |     
   x86_64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/a774f4cbed5f045a1d7d4414f53d09f347b79914 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/3461456dd7dba9f597f3795e17ad28456c0826e1 |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/681021b67f47cea0b7fc3d5ccac47e82f8de0580 |     
  aarch64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/dddba494b7c06599b6fa489a3c8c2892a5be29cb |     
    sh4      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/b8b8382b280413b6e67b5e76cc4ea071896423a9 |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/5c31c045078a73c05af8ddfba103ce00224a40bd |     
    mips     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/304a6ce1c09acd6195455b76d559c7307d3b4dad |     
   nios2     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/86b59a3c79def6ae01db796fd07db9dda0a5a604 |     
   xtensa    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/d96cfbf8e600ffb60faed27e025864c17d230936 |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/5bcaf618caf5303a31a5d42e5da52eab269e1119 |     
  aarch64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/ae1c8147f08db2f41ab32acc0bf76d72a4b43043 |     
  riscv32    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/d1690097780f64aef676c12f230ef820e3874e8c |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/51b8a9d0606cdfa8db22bdb0a30220bc4f225fa3 |     
    arm      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/7204f5c789909017681f0719466d017bb4e0e19d |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/8c17ce39c6fa21d6eaf4d11411de0676c5a5fc1c |     
 powerpc64   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/0749414a5a03588a3bf9b3639bd7d63cc413ecbc |     
    arc      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/2aa4536cf92b15454d5d7659e3a3a4402f51c7fe |     
    i686     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/2bb1fea9538eb740eb7c87642ebcbf2a957254f6 |     
    arm      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/c2bd123f396b0e275b4afc30e2eb25c9e3cd825e |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/6b63d3a5f1b846221a1e6ce3e0177b23bbe7c184 |     
   xtensa    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/de6e2c96a4b726e15a25ea032a3426c5a0da5e0d |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/50b424bbe40152cb4a392baabe10055bb33262b0 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/86644797e7a75ada18c3db7801f6b0b4cd698a66 |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/408aae8c134f61067766c1d77f517f3fb33037dc |     
   xtensa    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/0fb32cb745f8362f5de2ca1c8d3ba83e25520ad7 |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/aafd4846ac1b2da3ab0d314df9bf3a4897f06c0f |     
   s390x     |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/e5a634e8695e70afbefe20aeca89a507b121c344 |     
   mipsel    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/ff8976aff8cbe8e56a344fc665c40f76889b2e22 |     
    arm      |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/5c806baf569e07f3871d60f650dd76c886950015 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/c07bd0f46e4544d10771c662c6009f48e6e52aff |     
  sparc64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/87d3d75ef0f4ba59c768bffb1a3465ad1d88453c |     
  aarch64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/e2d7afb92629ef7d92f9a80cc134588c8f60376d |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/bd6462465757a99ce7f9d1f6f1f7aeab28c3397b |     
  mips64el   |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/4f9ffa9bd515a219bc55cdc2560c11b5d7ce790f |     
  sparc64    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/14f4b15ec2b9fd9409150e65b04fb26743440ee3 |     
  powerpc    |         liblinear-2.43         | NOK | http://autobuild.buildroot.net/results/1a6d18517663650858b30dc1605cc3b305328911 |     
   x86_64    |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/e35c781e00f715822536351a0db77eac4182ace8 |     
  powerpc    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/7d0297b071df06bc312b9927396021aa6fe401f4 |     
    mips     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/71eb8c4f69a2505242b3224bd79f4a96eb3b68a4 |     
    m68k     | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/600c5e7e4e16a8b164aeed0045af73159815dbbe |     
    m68k     | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/aa6889bc254eaa93adb4fc1a71bcee9f2f23cb33 |     
    arm      |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/edd173468e0ca07a7570ef36f37436674b9d4241 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/24ab770a538ca23bd659902cd687c88fff28e5fa |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/bfb2a89e7ce2a1c570edc6b7f707df13d1e98685 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/f0d3c30fe20db956e0be2091042dbc746b2435a6 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/3d1451b995d426bc57ad2fb846b1bcad508aa1ba |     
   sparc     |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/28d2d0e8a4a8d9188fea066500e17abdd4e9b85c |     
   x86_64    |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/ff05ba4221b40b9e4208f82435c80106c5fb64dd |     
    arm      |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/b5709216fce52d97d8afd9c55ce233259265b022 |     
   s390x     |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/2856060cb59250f4ef7ab75a848a3dc0be9b821b |     
    arm      |        php-gnupg-1.5.0         | NOK | http://autobuild.buildroot.net/results/d79bc1b0f98d68eb8a7fe7d86af5ddcc75e42507 | ORPH
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/bd434767664377116aef3ca85cb266fd54bc868d |     
    m68k     |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/a9f17a1aab3183f1eac4008a3f10a106866a9e07 |     
    arc      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/e7f12bdd79245bf9ff8887e12de9e8da97e3b17e |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/d3b919d94e07f106980eef89d7ac2e9b8c581973 |     
   xtensa    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/e0b9b2980b630e719093e5eaaf2dc02cfd6ac05a |     
 powerpc64   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d08f20f35db4e5339e823fb12f0b5f7db008213b |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f1108f37d1404bb78d76a317b0da9d0a6b2a8e59 |     
powerpc64le  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/fbfd661b8d9d17ce8adbdba03abfc4c89b3c79d6 |     
microblazeel |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f96050562caaddcab89457ab6f70ad6652661deb |     
  sparc64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b64531fb0a48322585636ce2183df0377385d3c8 |     
  powerpc    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/1a138dc4f5946e130059e13eaa97000d6d474e08 |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b820da82560fef33bdd8c0b1b0ee1994e4718328 |     
    mips     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/a38856930b20a0d6fda28fe52f8a4c90c9df4e3a |     
   x86_64    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/8faafa1048e4bf592e218a5ae823a01582d0ce6b |     
    m68k     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/2371f0852e2123c81adae2bc421df7f59955fbe4 |     
microblazeel |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/9ff3c21d9e16bff4cebee02b655622aaabee82b0 |     
    i686     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/9e6623c1306f19a4658b7852a9cd47e1d3c05900 |     
   sparc     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9 |     
  powerpc    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/2c26fa1aa5e566f8814dd3e081d158772cef4c40 |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/cf1e4e323219b8e0b7126f3914f58187abc43470 |     
    or1k     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/2d4dd040a631d4548b9a2febdd5ed2cc08578006 |     
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6d5d0b5715308f3673d0fc2e8d33e331587349e6 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b881dc9ad5514b55c1907bef111c99f7b2c69779 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4c7a64b23477980554c02680bf7f1a31be6f1253 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c47bddd6bc0626b417de46fe4de747132e81fbad |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8142ec0d5f6a425fcbf7ff257869236e33023b14 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3e5886e2c96c92e9626b2f6b2cd2b8f43c06da2e |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/158fef7dcef3eb099bed1a2f5a7904f6598cf69c |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/63f6c89d756e9a54b9db36221bc656217b7223c1 |     
   x86_64    |           wpewebkit            | TIM | http://autobuild.buildroot.net/results/78a5e6c5d5b83aa0d3f6260e9907fbdd6c5117c7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5d252a9226a6180e80f5830f5b4f7a3c2eb2e006 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/12a6e7c9522b8931f04f2ad265ec615ac5c2867a |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                rocksdb-6.13.3 | 2 
                  apitrace-9.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                 openal-1.20.1 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/8a79a720b4d6fc0ce64ec2d0391ef627a0457a7a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0da83d5b263e2a7f5c23a148dcc64564f2884714 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/62a13963de3c0a4a9e2d7924a655367d62dc930c |     
   mipsel    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/450da4df3d28fb86e89e22a9e9a27e88ce01d502 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/8e621bbea33be6261e2f131912130c9137d30ac4 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d39358bab9e230562eceffbd344bc0fdb43037b8 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/600c0a3e1bb6661983ebbf358fc110b942c8d725 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/0a5f355d012f5d0bd18708f89707bbd457611e3a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7bfd0806aa28abaf362f3705c872ad790176ea20 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
            docker-cli-20.10.7 | 1 
                    ffmpeg-4.4 | 1 
           heirloom-mailx-12.5 | 1 
            qt5location-5.15.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/245b7b888532b4d0e04ac78474bd6810ec8e43f0 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/53c5c1b223e49a4dc52f738d7215e9e1369fa01e | ORPH
    i586     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/29aae8f3c930ef9dcf28f3b97c06de3291917caf |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a67a66c727dc3fe2c7f4e17c121c6397aeb95b33 |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/c8769aeff8ce146a078b75b45fb35f868ed5e1d9 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b0c6286e1fc2478489344e1e84efbb7b2ad22003 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ac517f31f87488fdcd3d0796aea42f0afe220767 |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/aa814336efcb10f448fc4d521f616e9b1b46c8a8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5bd343e4f8d62047814f0a0ea8f1a5e52afbedbf |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                 openal-1.21.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/6de7c3ba22b243904658cdf649d45e403023abea |     


Gitlab CI results for 2021-09-24
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285289  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285727  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285807  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285812  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285817  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285821  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285822  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285825  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285890  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615285900  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615286242  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615286381  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615286699  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615286707  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615286709  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615286940  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615286954  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615287770  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615287824  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615287906  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1615288617  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
