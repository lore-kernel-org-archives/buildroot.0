Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69601C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 05:51:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84057610A0
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 05:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84057610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E134400F7;
	Thu, 28 Oct 2021 05:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TS5vgXUgbtBZ; Thu, 28 Oct 2021 05:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7407F40132;
	Thu, 28 Oct 2021 05:51:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FFB81BF391
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 05:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A3C160651
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 05:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7Mgqo83eA_t for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 05:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55A9960612
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 05:51:49 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 360B41C0006
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 05:51:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Oct 2021 05:51:46 -0000
Message-Id: <20211028055151.6A3C160651@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-27
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

Autobuild statistics for 2021-10-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 40  | 10  |  0  | 50  |
  2021.08.x  | 54  |  3  |  0  | 57  |
    master   | 66  | 112 |  0  | 178 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 45
                  boinc-7.18.1 | 20
                tpm2-tss-3.1.0 | 13
              tinydtls-0.9-rc1 | 5 
                       unknown | 4 
              host-erlang-22.2 | 3 
rpi-firmware-2ef3800b1b71c0... | 3 
                  vim-8.2.3565 | 3 
             transmission-3.00 | 2 
               apcupsd-3.14.14 | 1 
                    atk-2.36.0 | 1 
                    bird-2.0.8 | 1 
           host-mono-6.12.0.90 | 1 
                   iperf-2.1.4 | 1 
libdbi-88b8477d57153b9f736d... | 1 
            lttng-tools-2.12.3 | 1 
                  mupdf-1.18.0 | 1 
       python-matplotlib-3.4.3 | 1 
           python-pybind-2.6.1 | 1 
            python-ujson-4.2.0 | 1 
               qt5webkit-5.9.1 | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8f310699056871b700d06e644e9ff5ddd0e20120 |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/95f07ca588bbc5eec3fbc511cff4cc3dee360126 | ORPH
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/84931c18de17966f0293cd945a316fe2d4c7edc0 |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b077a71f3ad30badf1d44153312f9c4fad259680 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/50a6aa9351aa0a0aab2ee85c75553ed608e3e72d |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/97df53ae872cdbf06fe9abd0749523ab43d64119 |     
microblazeel |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/159645d0fa2b57a92c86c4a0a10bbcc4b459b7c1 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8fd22ab8302ea3ca0bc01a21574e69c20eef8353 |     
   mipsel    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8681139578a352a5fa2210b4c4d43ef070e81e12 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/6a67dbaa117cf180528a3909d2ad96c6928d9abb |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8453d0536ea33efae0aa31ad400e0cfc0a94fdb9 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8cc98118d11d2d6816c53ebfab64a8a70816d3ab |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/df20ad7448d890ca75ad0dc10bce260bf0eb9118 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8d153631e70f0eb5503cf86440b189b9ccc95a13 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/e739a8d862847f4bc9ee96a8a8a2264fd6c811cc |     
microblazeel |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/23e93a832d51673ac37525fe704d9f5686da7969 |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/44c3302cb2b402dd5eb5d7b1bda60c8f32616cd0 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/816918c4360c0b4357d649cfee03220f8856bd5a |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b1a0a67f24c5db5e5ca8fdda03c6155625592e20 |     
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/02fd66e9049e80bedc893a9241d5be876066a24e |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b680dc4e3c06d55247d8b25921ad63bac101fadb |     
   s390x     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8b73dc78b10f1258af4980f54da88fb273190051 |     
   s390x     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/e20c8d5d6a6377841fb0fec4bebdb84369cc83bd |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d53b7e05f192f5422c29285337509f9dc3745ea7 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1afd5ba59124a5314c33a3527904e6e3519256a3 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/be08f47f37a7fe6441f386263d7003f43ed079d5 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f92814667d8ac059143c93577639e211bdaa38d5 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3ecb03e579821fb969892f973b7bae6c173eff2a |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c2c44ae7af9d7cc68743694a471dc4b0c7b7fc10 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cc96f7f9edac065dde674cf1d431fd9ee7eb6d47 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7edef4712794af27fbd07fa8ccd0a3e4b38edb63 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c3fd2e4b37333afab2fded903e92b404816d6910 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3decd798ca815405c4b17aee48ccebfea56dec54 |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bc9054ea294e27f5cc6a93097e415d7f5797182a |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/552a504dbdf7b2b8b569e6b525ebda46f00d058b |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/43b76cb7fbe56d71f876bf56bd27f924196b7376 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e9c7acf83ec3858eade21a7980fb4ff53ea789dc |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/af0760cfec4094f57b0fd3d7c556c4d49e97844d |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9a4266a204a922741b5457084b055bb7d877900e |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6d23d558cbfe7a9b630918bfc8b0111bfda68b25 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/dceffe73a85f096f1b6940e9dbe334a84f85f71d |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/da8bc3c2ff7c210023ba2feb1af7fa92a39a3103 |     
   nios2     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/edb689bdf7152dc67228687c037e6c61f7582e54 |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9fe3b6296d00c6f41a1d060edac7b78ce1d5b990 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/66d6bc29c3abbb0fdb00b3903f374703eb4491ec |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0404e806782373c2a3bc1862819faa9234e29832 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f3fe0b6408b7cbf0c7efac2dc34f0f2e3045c7d8 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3901a73e0db437c5ceda951378366b7845e26a6f |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5ea2ea2f68eadf88ba661087b9b060711c9e9bd6 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4df7e1d868efc6f024d757a5001b06de515910ae |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e45832b4b627c685676f3f919dada42d80f63760 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/df65824c1045f3f71b0806d7e9ce1b2c84ae2af5 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1afa615094532b9794b3d92eebad83f574f77b84 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/214a08f38744dfbff550b7a18aaa9eececebc505 |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a5a7efd3d8de3c672065c4c3c4a7880526ba9145 |     
 powerpc64   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7e98d8425fb946d3447e00fbb2df9de8fe96ecc9 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3f0e83b17f979353c50af1eab77d051ca5addc40 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6dae7922e72606a16e22f41add35bb5e4ec652d6 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cea9645e91ecb170bf61f80324be85bbce10948a |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/956285d1fafc5dc713fd30f2a93a2899c65fc52c |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/331a5ae63e4ac0e40d0cfd2597758133b4cc4bed |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e153b2da49c116370d956e6c81d198a1f7bc3c66 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ca8323f37c3ac1c6508a09ec79f28a0228d74cfc |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/04037d24d78379ca8a1b17c6ee0c0d3c814d8df2 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/98bb4a8b36f48b7e6a6d1370f75ac0b32b092c89 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8c135f73030027b27dffdf3cf4e5bd8ae7e088a1 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f4e30f12f789d10ecb4b18f1789ca5407fd1bf85 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/27d6e4e6396e15df6e6b3d623a1ed02122b9c68d |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b7ac83fbc5ede7c5e69088cf1e8c43262a375f4f |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8b597b3542c2ab61313d078180fee0726bbdee43 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b1165ba4ba5439eea4e6f668499ae939432355da |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/a07bde61e6e254419f3e89aba0da94719b052d77 |     
    arm      |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/91a8443d3f22d14910f57eae46ee480dfc363dd8 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/3ab105f53cf47f68a875627bb305740e17433201 |     
    arm      |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/61dfb9396c8ff5bc178929c0aab8732616656fdd |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/0945f305d31530677282f38fa7c99af5295d47bd |     
 powerpc64   |    python-matplotlib-3.4.3     | NOK | http://autobuild.buildroot.net/results/c2ba407275863bafe42faa4b335a20c6fa9e1d55 |     
powerpc64le  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/7932e7d9b4b879b5a6e1d8dc6f14b55cc24288ed |     
   xtensa    |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/935f82ca071854e1870cfba31a79818f82f27295 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/7152a3398cb17aa6d6621a4d66b45abfdc65655a |     
    arm      | rpi-firmware-2ef3800b1b71c0... | NOK | http://autobuild.buildroot.net/results/e91e8da8ebd4c2ff1c2acdba1a367fbb5fb9a88d |     
    arm      | rpi-firmware-2ef3800b1b71c0... | NOK | http://autobuild.buildroot.net/results/c2c5e4985f7255cfb1a2ff8c641441ee55529aa8 |     
    arm      | rpi-firmware-2ef3800b1b71c0... | NOK | http://autobuild.buildroot.net/results/c91224af44327a301f87f239a73721173b81ce16 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ebdeb2e1bb9b0e136f39b14bc680bd8398960e7a |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3676d111f5678c5265a5a7462283d71ec438080c |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5aeb9a493373b560df3ed55b54a6e6b2f123df00 |     
  riscv32    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4bfe3aa75e4c269dcf59f1544f1828e09edef490 |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/341813ad721dc7787c2ca86c755064fe7d447383 |     
    sh4      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8a972c8a495a9864df5c49fcc0f958b258d2325a | ORPH
  aarch64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d86c847c489fc4335ccb7abcfe28af07eb42f091 | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f6da592e0cf8375f0e88817ad7daf3df2b6b78ef | ORPH
    m68k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/e10b4beaf44b55e6f908a2fc457f352f012a7f1e | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/42ee4f37260cf44b20729ce433fc6645e67310ad | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/5483e61fe5e50060f77de88dd0b75b596e838be8 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/0ec78b881c9320b3a57cd2413034f27965569e5f | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/13f247b679807c7831ae183d8bd526056bf8af32 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/6bf2219f5ff3020eb07e7f536abe5de6ecfa573a | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/682b4c601c09f475018854618abfc06051edc462 | ORPH
powerpc64le  |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1c39e42f8319201d561344bc23462a49fa7531c7 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/365be4ee7a636be7ba4ed99981ffe26900344f04 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/7bc6a9230f5b42aea3b3a620d6b91baa05c6ff67 | ORPH
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/5513b6201f42272825802407fe5438461e2d6790 |     
   x86_64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/534f0fdac0ba11fe9b94b0437187b076d1e0dcf1 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e3aafd2d68bfc3b72b4cb7331aa8bd4ef546be9c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1b69773690e70013105e7613815ccb31d0a2bee1 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2251dbc91be132e9b619df58c294dceb5be50d36 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f49b4b662f9bf10a5b8ae0f79fa24da81c27c4db |     
   x86_64    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/edfb5cd85bd1df9b8d344d720ba4e94cfbd236fa | ORPH
   mipsel    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/2132f9aa1b0bc618c91f7bf44fbd1b71b9d6ba05 | ORPH
    arm      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/10196ccc576b30b2b8520abf57cdf65ba7dca6ab | ORPH
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e45cbc802c504c114361da9f37c629ced42c53f5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/818cc483103b281c8c299e32dee7dc41056aecbf |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 
              netopeer2-1.1.53 | 1 
                    olsr-0.9.8 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/ed3c695dcca97ad4c09141fb7c38ab268921158c |     
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b3141f249357307774f90b6f199ac1ea64ae937b | ORPH
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/74e05afc5aaba0e2c178f0b23f61e495f3d91f71 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/b74d8aa8db3a2278a83b5169c91674b6de030f35 | ORPH
   mipsel    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/bec3725f98fd8579d65e4fe07faa6e71961854e0 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/bbf017d265a04416128a8d973e41edf374093a1c |     
  riscv32    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/42c51db91a726f2da3cab96cf9fce3633ba7df9c |     
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9ed3b346de1fdf38845715c4124b558832cdfe03 | ORPH
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/50101c8d3f1c181fafa8379a0b14927503aff362 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/97820789bfe21822ddea8bc4f4e0c50e2e335db8 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

  gobject-introspection-1.68.0 | 1 
                 mesa3d-21.1.6 | 1 
                suricata-6.0.3 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/20da6409502d694d1a3180fa78d82c4b26f2761a | ORPH
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/6af622270eb34e378780a1c2d046129d3007868c |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/a080a0c826d383a928a884dc1ef1a0581acc4265 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
