Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999EFC4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 05:49:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B38DA60F91
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 05:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B38DA60F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 638A183A57;
	Wed, 28 Jul 2021 05:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ga2Ewd4m3cRj; Wed, 28 Jul 2021 05:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CF1483A91;
	Wed, 28 Jul 2021 05:49:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0682E1BF951
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 05:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E891C404EA
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 05:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bV6aVwulQizC for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 05:49:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DA8B404D4
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 05:49:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4C60360002
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 05:49:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Jul 2021 05:49:17 -0000
Message-Id: <20210728054922.E891C404EA@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-27
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

Autobuild statistics for 2021-07-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 24  | 13  |  0  | 37  |
  2021.05.x  | 27  |  7  |  0  | 34  |
    master   | 57  | 107 |  0  | 164 |

Classification of failures by reason for master
-----------------------------------------------

                  libogg-1.3.5 | 55
             bluez5_utils-5.60 | 19
         host-gcc-final-11.1.0 | 4 
                  exiv2-0.27.4 | 3 
         host-gcc-final-10.3.0 | 3 
cegui-00b4e1fe174da53b7ed72... | 2 
                host-odb-2.4.0 | 2 
                 openal-1.21.1 | 2 
                       unknown | 2 
                    zstd-1.5.0 | 2 
               collectd-5.12.0 | 1 
                    daq3-3.0.4 | 1 
                 dc3dd-7.2.641 | 1 
                    ffmpeg-4.4 | 1 
                   gconf-3.2.6 | 1 
        host-sentry-cli-1.57.0 | 1 
             libmediaart-1.9.4 | 1 
make: *** wait: No child pr... | 1 
                    mpv-0.33.1 | 1 
              open62541-v1.2.2 | 1 
                 pixman-0.40.0 | 1 
                    qemu-6.0.0 | 1 
                   sdl2-2.0.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/b2ad1b092d0264819f0696a1409533086284bb57 |     
  riscv64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/62f55682f09638b789bbf46ad52ddcc933808c33 |     
    i686     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/80f5e79818454f73d1a47926b6d0beb10277ad77 |     
    mips     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/3ab2f4ecf40a1cc6932a11b132c0fdfcadb3c1d5 |     
  riscv64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/6b3a6f8a8d69ac60e1a2ce5cc8b0d82ab14f0449 |     
 aarch64_be  |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/0d338194965d1bcd356e24d3c07afe0895fbf5a4 |     
    i586     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/9222879c9fe958e01e33f69531270355ea016d17 |     
  riscv32    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/64d75af986a4d6e9c5a176efb6e22046f4d82350 |     
   x86_64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/d54cdfc03212fff772a863d1bc8afd3cfb605831 |     
   x86_64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/bf46a371b701774a3b091a8fca42088060ebf479 |     
    arm      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/fd11ec32a5503ab1c91a367e539c779a2995447d |     
   nios2     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/e07b7573e09e34116deb781b56727f0fa63c2307 |     
  powerpc    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/69b641395ce2e5915576fcbc950cc836f738ea18 |     
   xtensa    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/4e20fe6e8bcb3d5656cbdd686946628310fea70e |     
   nios2     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/8ce91d6ce31d8f3d32b64bfb089be7d05713cd56 |     
    arm      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/3d235c4085b9e5ae1e9250c654eee8cc695e0d92 |     
  powerpc    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/6f6e1179fb9ce0b06855ff6d9a8b8d416cce4239 |     
  aarch64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/868ffbfd65fa86b75bd5e4ae8ce22422048a52f7 |     
  riscv64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/1d1bd9a618487cab028508ffbd45e88396b7705b |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7f5cf03766a136b60091d0773907997b48469fac |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/62a72848b6031d0fac80f9d258eb7d254fbbeafe |     
    arm      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/d7fab1106e0a81dda5f3014a9cfff1b67242557b |     
    arm      |           daq3-3.0.4           | NOK | http://autobuild.buildroot.net/results/b56defe97c0bd56d9a887beeb183ed9bb660b72a |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6247d9d23f7ea357f6abc1b98d41c9c69f24e2a7 | ORPH
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b4be06fb859ea005303af74ea59ec49ced4a05ef |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c421add72090d35e23e7db69dbe94fa9420e53f0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/58d418195df5cc4d34e1c6c48fa233d3a20d9af1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8fe839014428e5d86baf6b8606e389dcc439ba53 |     
    mips     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/0c7c91071f3edba92833f8c7208c28903689e909 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f64f69184b97230ef2bc1e9cb2da8f71a011b7c4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cfa19f4976ae196dac7449986661b3c21199e80e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5f574f7ccd0561a9bc8aee149f161bebd0476a42 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/55367e8f105ca8a2743e3ff7a627e398d7c9fb2d |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/a0abd90cd1937deeb55a34c989fe8ee05c153824 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/5ffa24f53f0ca945fd74d9acf822db017565de39 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/2e4dd52f04f1ebc9c1bb2117d2e021a8f562766a |     
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/54d78f1a1e80f0cea8851e65b5f0bcbcc119b154 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b4c5a9299ee1ef39dac588bcd701cfb049e5eb0a | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/379a461a20570ef11aee28a39fbc66d88001e026 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/f02378852dae39b7279c438800b390d6ab277955 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8c8ceef910252adcddcc24cd885655006ffc1f05 |     
  nds32le    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0aa07abdfc62f6835ae789ffde806c9356e1d782 |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b4b6786e6bc35167ca1ba22d065e607d0be40b13 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/01f2fb5ca366ed62263e34f335e88004f9b9a20e |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/5644517367b5294442dd221592786e64881d2b76 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f2d75015fbc722df7521f7d875ce4630832ba9f9 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/12b68c0369f0e9202c4e58f009860135c2f43088 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8edfbbdf938bd22bcc381cb7da35c29ca3bdd8f8 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/24dfede05ae5f45316d99b0d8f9a3d8dd39ddcc8 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/478ef11809211e6d8f12b874546c10a2a21d9a07 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/81baa9dc702ec1f8b9177092e1086e807a51e985 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/131a406df85d72765bba9141256ec69e61deaf4e |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/bf1a7cca1b91ad076bc1f756e52bbdd635657bc0 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0b5fc26648d68ca90777317cb83b1569ca852c0f |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b1f5691653a3434b6db85f69110f0513c6f21fdf |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b144dc601c8928ad3c6f59bb8491531109c59279 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ee9d829e1ff10085b578c77e4b5a3b321480e5e1 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/697ec47ebf3fee622e01c76a36963d33e30f425f |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c570ea77863a6ec1ef2631ed33e116de3ca0cf78 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/be6455528facb376545f8fdd5b675445e75bb276 |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d9bd606bcb7e4ac59bdb95d6979619ec84d389fb |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/595465f356ffa4bfdce6cb61b1aa5cfe03439510 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d5d4743edda2c179cdca8fa86d20ccd1fdf2edcd |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/69a2f0112c7d45aa3efb28decda42b0fe5bd0f49 |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/aa7a55060d07e46b313579f5a8eab5d692133600 |     
    or1k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d33ea44875ed51f29980f45616f13c5b6559a212 |     
  nds32le    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3bda9d8ffc63e8920f184cdad2af41062ed76cb2 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8bae14af53114ba93136ff33af8bc25efeba93db |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/acdc144b4eb5617e940970d759b6586e436d059b |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6f6ad7601566b7334da352602d557fef3b677d63 |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/fd0ff14666b6d49a6ef9a2a9d167137b958b6cdd |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ef542b3b217e8d0dfefa04b3002c66a6092a9994 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/bd2a665d5b7f369bc6c8164f39d5aa7a86f076b9 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e88ed507301b402207776ee84e429a1d55d1b5d8 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/5f6596ea7cfcec6b74b9848a4f7a56b1163666f8 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7d3373397bb65d1e8bcc01c94961ca293044eeaf |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a0cb01e3a00ea91c24d162a25fb6ba432bb190df |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d6da837a79c417acbffa44a481fced2f511c52d7 |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d78b120fa9ba982e3a0c03694b9800d3b8083ec9 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/66c6e992bc54ac3ef52336de411be99e9c0dca5a |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0ab5f2b4a6c0bcae9f3a4c71942b2ba35eb10f45 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b533dc82bbde1da179189ddeccba887f71a515b7 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1ddb6477f565beaffb2643f97c07a3446456d634 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7d725d6b482803a08d9e764e84b9059ecf4ea23e |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/742e3207f1e7d12e07bb9233e3ebb03c34dbbb0b |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/116728557287468e3da202c5a6c38f439e4d2ffa |     
    sh4      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ae7145aae8ee861332827d65e6a79918177c17e4 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/bd907d7fc617c44698951f74eea0d7b2265014cf |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4b936d0dd511ade996c4f22e7df553261fc0bba5 |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/79001d773684bae5311c83ddc0406539fc4a036c |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/41c4c96ecd00a6c1054f95419dd8da37787604fb |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a65e600cd25b4566c6cc457fad8ba16116307a03 |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/16cc3402d623267a09370751b39cd1ccca9624fa |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7cd9fb67450a10b128803f782d5c7c5717b21edd |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/82a7e0a1b0c66f96ca2941e78b9ef5c16e152994 |     
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/86f83ddc10afb95c9a632705c1529b97d8779e8e |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7aba632bc073428b7e14ecd526acd5c6fd4e23e5 |     
   nios2     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/c0a33dbada549c480bc741c1c8177b788ff053db | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/73776e54ce19a3082d95c87116ff583cb2163d5d |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/1fc220a9bb594b8d59cb0937004d7f2a90559928 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c6afddbb3bad385cc9d0f2880d0cf66e2cce4d0e |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/711388d1fcf3c6e3f9f7995d5a73053baf135bf9 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/2ae31660a895af18f0dc4b0f9c94ae5c9396ce16 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5b09db7e185691fed1e1574efe1c028ce6990174 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4dfa81d84f9cce3ab0fd2573c0f134bcc937cea8 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/30cc6cfbce9e8b3310f5b7e5282dc47aa01673ca |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/3b1aa460d43d5906effc225c70e6395d6616c9e3 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 2 
        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
            docker-cli-20.10.7 | 1 
  gobject-introspection-1.64.1 | 1 
              libostree-2020.8 | 1 
                mono-6.12.0.90 | 1 
                 pixman-0.40.0 | 1 
                 systemd-247.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/c3cbafc4e68911b09cd6f2739c4293ae288b7b42 |     
    i586     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/e8762c0560f570e0c71a302ac1f2581c1ad78674 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/77b8e6e7e3622674ec8ef5573d7123f8ae013fa9 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3fe3398e705072dd62fb8543ea98c8e750f3c7c3 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/87109518b97ebaf273c261337b5a422bcebcf965 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b4de7d20959c943eb8f0c1597583add61c1f06f5 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d378da17d9d3182b5c0a6cbc96cb82db914f0bd3 |     
    mips     |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/c151f271b7a0c6bb1bceb2d4311333e774b9fe44 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/2a41c6c0852bb19622aeec8cf4fbacd199c8075b |     
  sparc64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c16612c87fad7b48318b4a8ffa722572d97e8881 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f00efb3c156ddafef542c9c0fcd50a8f312e0687 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/41c0720f124aafb1c61869c63f3a45220e03bfe5 |     
    mips     |         systemd-247.3          | NOK | http://autobuild.buildroot.net/results/c36ff5f738cb215e06add79aaa340bf9919d13ee |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                    htop-3.0.5 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  motion-4.3.2 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bf22d1e98e057835a952be1679bc9b512abaa808 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/77e4caf68940742f3c9c812833382efc08a0f95d |     
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b58e482bc15ad67852fe20e1eae82e0eec5bfcf3 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/0fa94f1f930aa16cec3bc96e64bc57b460238a0a |     
    or1k     |          motion-4.3.2          | NOK | http://autobuild.buildroot.net/results/892436689e96373719e9223f8df88d68ed7f3942 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ef2d4ed14de1cbf0ed5dfdbcf506a5af09528032 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5bedf94326a88ccfdf768bd64c5ded6f49154597 |     


Gitlab CI results for 2021-07-27
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
