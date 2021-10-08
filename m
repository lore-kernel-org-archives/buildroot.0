Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22C3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 07:00:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6CF1610CE
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 07:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6CF1610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5505F40495;
	Fri,  8 Oct 2021 07:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYsQex4ka9UY; Fri,  8 Oct 2021 07:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E3F406C8;
	Fri,  8 Oct 2021 07:00:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A79881BF5E6
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 07:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A48EF406D3
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 07:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQ-SxcQyAq2k for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 07:00:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3C44406C8
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 07:00:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5C849C0017
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 07:00:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 08 Oct 2021 07:00:16 -0000
Message-Id: <20211008070021.A48EF406D3@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-07
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

Autobuild statistics for 2021-10-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 29  |  3  |  0  | 32  |
  2021.05.x  | 31  |  5  |  0  | 36  |
  2021.08.x  | 37  |  0  |  0  | 37  |
    master   | 27  | 109 |  0  | 136 |

Classification of failures by reason for master
-----------------------------------------------

                     apr-1.7.0 | 43
               libtasn1-4.17.0 | 16
                tpm2-tss-3.0.3 | 6 
                       unknown | 6 
              asterisk-16.14.1 | 5 
                libgpiod-1.6.3 | 5 
              host-erlang-22.2 | 4 
           host-openocd-0.11.0 | 4 
                 boinc-7.16.18 | 3 
                openocd-0.11.0 | 3 
                 raptor-2.0.15 | 3 
                 diffutils-3.8 | 1 
             gst1-shark-v0.7.3 | 1 
          host-libgtk2-2.24.33 | 1 
          host-libgtk3-3.24.30 | 1 
           host-mono-6.12.0.90 | 1 
   host-python-decorator-5.1.0 | 1 
libpam-nfc-bb762e0e64919511... | 1 
                  nginx-1.20.1 | 1 
           oracle-mysql-5.1.73 | 1 
            python-ujson-4.1.0 | 1 
             transmission-3.00 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/ff87c2bace96e881456ae386b9aba9a419f43e5d |     
  aarch64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4621fb62b1dcd4ec1250e8567add46c0fbf98096 |     
powerpc64le  |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/260757aa828cdc30dc3cd4d8cd6c735e80f97f74 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/12720851463e84975fa3500532535cba66b56c5e |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d938923c41eedefccabbd20c95449a69f98a7caf |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/513575819eb57c0a66e3b8d7760cc904062a9f83 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3e129fb60a982d295b986c67a62a43d449c8a866 |     
    or1k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f020bb4c99ebb7a05a995d36cbf716257b9320cb |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7c024f5fc16a2a0442200b5ef73377c335f3a21a |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4b4642ecbf02f9d9dee9b0219b8b7b937f77bb2f |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/42b09622a624facbce9ada94803820b5a4a5d417 |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f4eb3ef99eb5c11fe12b405ed66bc0a7b4a599a0 |     
   mipsel    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4bae016d523667e7c7b5b2645b0156833ffc0da7 |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/18ea273e7fdf873f50b574e5f9143976068e06c1 |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/592128ec368b5b8e995fd19e667d5de3d77e9603 |     
    mips     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/fcbfc8d0932f7643515de114d48ba42106a99352 |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/51c8ad2cd0819b4179efbdc536382643a2207c39 |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/a08d4dc9aba7ea2919ccc47d513bea8046f47d00 |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/31f720d0eeb9b878ef7cc266bdc6b8c5fa1bff7f |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/da8e1b285cead8492318bff1b81178e2faa3fd44 |     
    m68k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/9ada7782a57c0300b95eb9f41cd8c33ba4c83ef4 |     
    or1k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d0eec7de70e782bcde1b930da617c950c23250b8 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f634b5f44a79906be5e41c070170554a9418e78c |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/786675b7e6dd128d4e71dee496369085152d2722 |     
   mipsel    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3b4aabf5d04f634a8d1a62c69641fc993b57d34c |     
   x86_64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/31ca297cfe29b58deb921b6c81455890ac77b215 |     
microblazeel |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c9dbc7141dcdc74bdaf8cb90f085a68ee4394f0d |     
  sparc64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/8d48880c1d3a4b0dbde6d383402ca6eaa03a0b7a |     
  riscv32    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4f1652d1b49f9777cafe4448889e4cd667fbf8b4 |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/16d010fb9c1c9470198a1e613a3042240c3ea86f |     
   mipsel    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/2a780c385e1170389a7bd75461d978cd62906972 |     
microblazeel |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/a52edeb26a32290f40b8bb1d8c10ae2506666f34 |     
    or1k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3c6ed7c46c1b205af5cbb5a144dab40514ef4fc4 |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/466a9ae1cb743b95eaf839d796ba2f298828b7fa |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/976512e6c1f51bb1cb5f075b7c66f05126a69ddc |     
   xtensa    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/eb109225e839c5eeac0be6277c533019de8458a8 |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/ef8186332cf774ee174db7bfc65b3ab2cd2a2f14 |     
  sparc64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/9b05c8e3c5a428779013f53c9b5e1e3bfb831348 |     
   sparc     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c5f61a7d2188e2f11599fbcf40b540c44c95ddd1 |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/b8d1258098c90f8771ac55ad24dc546483f25849 |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7cfef8a43c23435e98d084e2a655c41696c1d2e8 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7e72ec75498692226228a497a77316cea9467d42 |     
  riscv32    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/a45826f2eb0a0018898fa3c55cf233e48f7ddb23 |     
    arc      |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/c9e3542371d3af3c1ab0b67f31f2221d3ff50a23 |     
  aarch64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/b2bf2abd05633ee2b57604f43311677343187e94 |     
  powerpc    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/ce6ab81ff9ba76d376de5c3130af527f5f3e36e3 |     
  sparc64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/894cd81db65fc9220c1083619650a97b0989a1f9 |     
  powerpc    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/478a791f8291e493d67855cfc71e1ed5567a904b |     
  riscv32    |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/f21afd00d77a89c8d5d90ccbb7b18e8aa97238a3 |     
    arm      |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/a5833e80ea95c2a17136405a72f5c4241158a291 |     
powerpc64le  |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/f3f87d4817f8a42b1ebd4a359ff4c36ab1a80e17 |     
    or1k     |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/b1fafd8af075fa546ed9fb46445d3da5b6271dbb | ORPH
    arm      |       gst1-shark-v0.7.3        | NOK | http://autobuild.buildroot.net/results/3850284a339be7b38067e1a5bbc714a43f000231 |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/925c53ec2e619842b21711f45c98d4bc5fd517de |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0b8fdef55cde77b17747182efe5f674197d0b345 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1bb544dad6997d0cdb775073dea2a136569df18b |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7c1b20710a0ca531b9363e27f57aadb398838a47 |     
  riscv64    |      host-libgtk2-2.24.33      | NOK | http://autobuild.buildroot.net/results/7500b957355496176ecca7d8eccec66569789e4c |     
   nios2     |      host-libgtk3-3.24.30      | NOK | http://autobuild.buildroot.net/results/dc3346d07bbec2e4689d24c1ecaae5f8f457c978 |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/1d1d82b505abd16d014d754b6a4a48fb1271e3b6 |     
    arm      |      host-openocd-0.11.0       | NOK | http://autobuild.buildroot.net/results/f7e805cf822b245403e121f7806d666a1574a497 | ORPH
    m68k     |      host-openocd-0.11.0       | NOK | http://autobuild.buildroot.net/results/6d15001e78a31a6b91faf133c20d2155f9eeb86c | ORPH
    arc      |      host-openocd-0.11.0       | NOK | http://autobuild.buildroot.net/results/b29c65cca215e0c53d6ab6122cd3a527d863578f | ORPH
  riscv64    |      host-openocd-0.11.0       | NOK | http://autobuild.buildroot.net/results/9a9de451641fec6cd8d6434dd19bab7168c6c838 | ORPH
    arm      |  host-python-decorator-5.1.0   | NOK | http://autobuild.buildroot.net/results/d11433a8076798d6088f92716608ebbe1c6aee9c |     
   xtensa    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/132002ec3e0fa3327d7a7716759f2789695bee52 |     
  mips64el   |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/1a0f516bfb5d54c496721d04aea9ca4c92f5f0c8 |     
    i586     |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/b49087eff94aab734cfa8022c446dfa093a296d7 |     
  powerpc    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/d98e6c15d0a14c54bf7ad99678ed43d02192980d |     
  aarch64    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/578e2ada193ce9bc9e71a8972085d908ec6830a0 |     
   xtensa    | libpam-nfc-bb762e0e64919511... | NOK | http://autobuild.buildroot.net/results/94c2ed506c04be35b9e6b4101e5ac565a48ea7da |     
    arc      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/81d0c25293d215559829e07aa4094a3dc34059b5 | ORPH
  nds32le    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/38d7d6b931d57e3452cb73964b4ba0f483c010a8 | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/ddbf8784909ebf23b7f01984bc25d76a366c3b5d | ORPH
   nios2     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/544bc651c5238ef536b427e59a5ef3960a013527 | ORPH
    arc      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/e4d892d5d3f5d9ea22644525edf52d185f6a0beb | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/302666d33a04a65fb817f243c8ff4f8407f1974d | ORPH
   x86_64    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/1a0421e9affb36e18c4bc3ec6432cb514d0640fb | ORPH
  riscv64    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/5d5e06e07c8a5ad9b063f0baab793063a2be842d | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/3bbc09fc10a516caae722ad776f72f51c5629d38 | ORPH
   s390x     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/b1d718ba9742ef5937e58c0189ea255f9c840f67 | ORPH
  powerpc    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/1b6e3a6791257fda539067343afabaf73cce38e3 | ORPH
   nios2     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/6ed8600b2ed4d64c8a335005266ef68e0c4dcdcc | ORPH
  powerpc    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/3db197460c03681f257678ebb373507289230810 | ORPH
  aarch64    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/7d011c1d93b9c8a92a4d55b37ffe3cf2e2962151 | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/abd07c5ee587db8d2a59df8141a39ee95600d139 | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/a2df50334f622f7202a151f74172214ac66da753 | ORPH
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/703a332be0a12dc50081b7c8e03bc6adf95683e0 |     
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/17ca255e83a12c34321d96254034fb1578d5d19d | ORPH
microblazeel |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/95e78c03a2d4e24c864237ecd9e51b732a3c5313 | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/366821c4e25673557d75562a09d3cca88f9d3add | ORPH
    arm      |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/d8c144d156bd7312fe331eac67ddf20d7e116ef0 | ORPH
microblazeel |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/3cf5f266e0101a6c43f97801157fb6b2edce1ed0 |     
    arm      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/a016cacf66443b21714d3fa6153cc211e6b45e3f |     
   xtensa    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/8e23430c6e5f8dc873606efc1c66af0a629a4ff4 |     
    arm      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/fb01858e2719bd220a3086e5d5884240b98a7639 |     
    mips     |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/4f6f76fe32a316416ca0d4a4af7feeb33a50f50d | ORPH
    i586     |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/359e44b22b25236902cb5b513c07cf29414320f9 | ORPH
    m68k     |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/7592de0f2d85d77215ae56d8545df4fc97f6f183 | ORPH
   xtensa    |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/167a308735dee94b79a16f9f93a278aec67f6b49 | ORPH
    sh4      |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/ba1a777d1f5e3d2f622420451f653902c82423e6 | ORPH
   x86_64    |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/4ee228ca0ff3520cb696e8b87e8d8d138411986f | ORPH
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/c154513b8047a115a8429460637b70c3f4dabbde |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e44491b7bb5fa331bf92d9eaa6c4c65ed9546c0a |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/6d02896d422195ee282b99d2954139b0f4bb0804 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a096f2c0f84c62bcff8a9992c203b0177de9b617 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7c12622f0681bc91469fc5b5d5cf64e1becb54ea |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3793e4e7d59726173ad98c5717ba8169f66d21c5 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/db6fbc50cdcb13e4c24fd91758e5e6495c44d7af |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  gensio-2.2.3 | 1 
        host-sentry-cli-1.57.0 | 1 
                 openal-1.20.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/b8a815026e4b05e3f879a2313c1edf63d9306341 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a08c6b24f88da1b8e3e5fa2d6c5aa5e9cb65cd13 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/38d6266a3aee4b65b8a2b82614d3c3adcf854243 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

google-material-design-icon... | 1 
                haproxy-2.2.17 | 1 
        host-sentry-cli-1.57.0 | 1 
                  nginx-1.18.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | google-material-design-icon... | NOK | http://autobuild.buildroot.net/results/66f15072a1668459de571fb860dc08b17f8aab25 |     
    sh4      |         haproxy-2.2.17         | NOK | http://autobuild.buildroot.net/results/bf5b9b82504f9a19d480c6f919be9051df4681e0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/16ed78d048959ec4cd774db2ce6b13d355e2a008 |     
  riscv32    |          nginx-1.18.0          | NOK | http://autobuild.buildroot.net/results/8ffcc14d09c4b198b62a9f589836b9dcfccd2eb4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e6f254d87577e6a3bdfd702c8cdf6a2304e4a7bd |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
