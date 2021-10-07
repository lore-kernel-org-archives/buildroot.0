Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353D5C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:03:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE5D610CE
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AE5D610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2899D841ED;
	Thu,  7 Oct 2021 07:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHGrDzC7BVHM; Thu,  7 Oct 2021 07:03:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA42B841E6;
	Thu,  7 Oct 2021 07:03:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 457341BF379
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3004760F64
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3WskilJP0sC for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 07:03:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10F4B6076C
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 07:03:41 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2BE9040013
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 07:03:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 07 Oct 2021 07:03:39 -0000
Message-Id: <20211007070344.3004760F64@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-06
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

Autobuild statistics for 2021-10-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 23  | 11  |  0  | 34  |
  2021.05.x  | 37  |  9  |  0  | 46  |
  2021.08.x  | 44  |  5  |  0  | 49  |
    master   | 29  | 125 |  0  | 154 |

Classification of failures by reason for master
-----------------------------------------------

                     apr-1.7.0 | 57
               libtasn1-4.17.0 | 19
                libgpiod-1.6.3 | 7 
                       unknown | 7 
                openocd-0.11.0 | 5 
                 boinc-7.16.18 | 4 
              asterisk-16.14.1 | 3 
           oracle-mysql-5.1.73 | 3 
                tpm2-tss-3.0.3 | 3 
                 wavemon-0.9.4 | 3 
                 raptor-2.0.15 | 2 
               capnproto-0.8.0 | 1 
              host-erlang-22.2 | 1 
          host-libgtk3-3.24.30 | 1 
      host-oracle-mysql-5.1.73 | 1 
                   libnl-3.5.0 | 1 
libpam-nfc-bb762e0e64919511... | 1 
                  libsoc-0.8.2 | 1 
                  ndisc6-1.0.4 | 1 
                    ruby-3.0.2 | 1 
              tinydtls-0.9-rc1 | 1 
             transmission-3.00 | 1 
               usbredir-0.11.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/113b9a4e771df574e18ed259ea22eeb69e2aeffd |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/9bfb25f101f9718a8d549bbaa353b37c6aa5c1ff |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3401b91e47d12c0f4d13c86d0e061965e024ed0f |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/35727cb71c78c0c76a0228d4ca59f216be036562 |     
    m68k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/60394af253741060cca6caa6a72d07a88a4d579b |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/9c87217ae32a8bd2b38e1ddec6fa1043db0848aa |     
  aarch64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/e6161461a2ae310bf86bebeb97de1b366832301a |     
  riscv32    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/a1aca475e8c6ae2f3ed1a45c7dafa61709ca4015 |     
  sparc64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/33a0b1623ec6036769ef6e0fba56bf307deb936f |     
   xtensa    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f0ade0f5b2e7bba144d574d9596d4b9e60dcb099 |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/12405bae28f11bd46ec933609705245a55efcf3f |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f5623af3093ca6c6b53986989e96aa97e7d21935 |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/6233809a4dd0b7c71dd7f3788684e36f9623e2f4 |     
    or1k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/640bbe5b19d6e046cebd5208b37293e03714cd21 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/2523a54803ae2b24a28fe6b81c19d1fabd3bb02b |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/e04ff24ad95e86d199c23df8ce8827bf6e217f20 |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/99928d7b94de3e943a40a1006320f519e9bf7faf |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7e6b939173634860994279be9c6e7fa4ccbb5fd6 |     
    or1k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/639b34aba06d859f0c226fd51a26b80ea0eba4e6 |     
    i686     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/166c24ecabbbd9f0a1c863bdb6db318e27642ced |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/9e9194819ff42020795a0d6700e9bb42a529cbcb |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/971db340d18a0fb0b47ab8927cee77fd239fff4d |     
    sh4      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3c88905aeb3366b54ef0b7c0981f14f33c72374d |     
microblazeel |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/eab568178f47ea534f6882b9503eaf1514475674 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/acc32d23ca1f8311723b587fb9c5e24553769283 |     
   sparc     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c8e342bbe814d53b98641affe4f8c3833ccb3cbf |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d1e173c3dd0a048f8e8000dd2ee173d0c63bbd1a |     
  sparc64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/71d3358ee849dcb9f78d1e8efd1f91457a4dc4a7 |     
   xtensa    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7126204fc73f4857dae17b16ab4035512c019459 |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/1a45a615dd8db510c5c20bef4a8d5c39c03b0f00 |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c0da61f4c49d6ea207e70d6915203761967d48ad |     
    i586     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/144da63bc7fe24e827de2ece0effd2012d8d9930 |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/81b8d25ee0f74f44776b0dc4831edb30893f1397 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7f6be2991074ef13f09c1ea5e7609baa7008cd9b |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4469194297975806af0b633001dd2b463405a339 |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/06c35a3afd19cee0e7184413929d5d2b718d0e63 |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/a0990232538b0796faef47b96694b111c263090e |     
microblazeel |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/512e766600bbead5f9078322f776f80564c6e17e |     
    mips     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d152f66544a9c5d8093624430ae24f86b1bae72e |     
   x86_64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4ccabca39c1360afdc5335869d32d52f760c20e9 |     
  riscv32    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/828783cbefbe575b57cd56003fef9cc79d8933aa |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/de11bc4d71665948a0256caf92ac3a422dc85240 |     
    i586     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c74d02d465ca6a3076576135a05aae8d32bda331 |     
  aarch64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4a7f52c7fb20bf5ee73b3793202d676f3d2d6450 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/15a48a58889bc4168ed131d1926eaa26a5c613dc |     
  aarch64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/6fc7a18edd5d4d3869121817cad9cd1ae253d667 |     
   x86_64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d7573a22997311216b308cde47fdb49ebcdb6966 |     
   x86_64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/09d7b3cc13c0c44c9a9b9fd47cabc9609d0a1270 |     
  aarch64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/50a2794d4c36beb88cc0b52962340d386b1eaaf8 |     
   xtensa    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/9ddedf2534019704c7beafc764d3da01c637e776 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/32f841e79af901d4dac9ecc19a4787b437fb6887 |     
   mipsel    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d9d8c8c46cad8613a5ececdfb4c91447fa949b1e |     
    i686     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/54a919ed320db46c8f0a5cf3856c34cb3461f3c9 |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/524cd6c90ec9bbdee4b13c89f1108b27c482d962 |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/7479709c3460e964c618be654f32176cdf26678c |     
microblazeel |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/a8d887713b7a6a8dff88e472ec4c2f1f0e755c6d |     
    or1k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/b5e5f32febaa3982933704ab70841e7067389b34 |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/e90de4f3df5458535f3531f7200413413e2a13b3 |     
    or1k     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/10f3101863ef394d6a775e4675338b4ca2a10d0e |     
    arm      |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/e7dc47da7863a5dc492154f620c4fcebafccf6ea |     
microblazeel |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/b6e9ed6f68087162af40ea4ef815f5aa6e904bf3 |     
    arm      |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/5af6523b0a6fee0a9ffa7ca1049b962997bd1dbe |     
  mips64el   |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/4b468a5d3bfbff9638316ca930ef791867774aef |     
  aarch64    |         boinc-7.16.18          | NOK | http://autobuild.buildroot.net/results/8a03fda30ec789be76e741ef82dfee17ce560444 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/07ef8336069e7a4370f2ef2ab1f8db7f4d99eed9 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/60af6a78bd9086f3e1f564f45870a52c80b84ee7 |     
  riscv32    |      host-libgtk3-3.24.30      | NOK | http://autobuild.buildroot.net/results/ce974281acdd6729327f2083b24f62485f9b1e1a |     
  aarch64    |    host-oracle-mysql-5.1.73    | NOK | http://autobuild.buildroot.net/results/84ebac4d708f191069b8ecf3efbdd7fe722f8851 | ORPH
   sparc     |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/c2966fda1b26911b3a552268352de0d57ef4684f |     
microblazeel |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/d017e700094dada33f80cad2b581c489aef171c2 |     
   sparc     |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/2eb98559791e904814e2d85534e84313f05d87fb |     
    arc      |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/045dc3f737f58d44014a4b717b5a565388e86f63 |     
    arm      |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/649569dc7849dd8baebdb2e4f8d3dc445e171faa |     
  mips64el   |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/7ba36922536f0bba2d072d6b2963cddb998a008c |     
  sparc64    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/13348a8b224f9b9b44da2fb6d22d393cf61c4aed |     
  mips64el   |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/6bd856c73271059a3973973bc1da93a1e9771f47 | ORPH
    arc      | libpam-nfc-bb762e0e64919511... | NOK | http://autobuild.buildroot.net/results/af907052e8adb58c1647e1e960e121aa6fb5ab60 |     
    arm      |          libsoc-0.8.2          | NOK | http://autobuild.buildroot.net/results/6e7a129b05e7852a4dc8dd35148664ad09610f28 |     
   mipsel    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/2a13fa766334b90899da44c9dd804ef4f700d8a3 | ORPH
    arc      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/b65e9d7814169f619132645306de0286feaebe1f | ORPH
  powerpc    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/5dc95b56e22d98c8325cd1c94338d97b8ce98236 | ORPH
    arc      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/df6ea5862dc9d665356aa47a14b43801cbb538d4 | ORPH
    sh4      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/3c3927b89bb1123b01ef0a6fa856ebc03316dd8c | ORPH
microblazeel |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/1eadee7500ee144c401ca8c7c74d386ab1ef3815 | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/5fe276b67ef8d5beb6fc9a5544c477e63161e815 | ORPH
  mips64el   |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/2b67ef5c6aff3a119e31f8febb61bea679ef7d3c | ORPH
  riscv64    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/23dd993be4dcd7937d48eef4521690bf30123979 | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/8306d25b0d36f9f179c134edd709d526b849ac19 | ORPH
 powerpc64   |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/82714d395ca6c3ab7d82d442ae0432748d12519c | ORPH
  riscv64    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/ebe3fcdf2431bc26e39a567a089df089213409cd | ORPH
    i686     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/9db6c1b155727e4095a307284a3c37bc0f8c0892 | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/085f912240262d60f14c3b8491762050b25e510a | ORPH
  riscv64    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/c139828c03b4c4c0008fd6091438276244071428 | ORPH
    m68k     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/c10fcb6956ae8f6722bdf852b2617a0857a667b2 | ORPH
   x86_64    |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/fe9a2394a4eb227fd47b808a5e895b3af991048a | ORPH
    or1k     |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/2c42ac589eb48d9fd74d36079084ab483ba37d12 | ORPH
    arm      |        libtasn1-4.17.0         | NOK | http://autobuild.buildroot.net/results/3611f3e95225f6b5284a6964ed9d6eb5b748e0d9 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e262ba2c1a235abd1e087d1bfb039fb8b9134930 | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/1049bdbc21f92d9d7ced1e4982f81f1de65a729b | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/5b8bef0ea47ceb9fb251edbc43be351e6cbab9e8 | ORPH
   x86_64    |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/5fb7aa28703aff61ba850eac11bd35c8804528ae | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/316f9a452ece9a2e2f758369640658e644804595 | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/e0121ef5200541ea8f61c4d8cf2d1a7e1d7ea232 | ORPH
    m68k     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/2d9d3b303979af25444a95ece62b9442ab058c76 | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/013ce456f05656aad82900fdfd6676298aaf86ce | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/5686271e99357636012c602aa628448b48a4d679 | ORPH
    arm      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/bcf489ccd41197b57b39312b369921467f295431 |     
    arm      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/5a0ca32bfa98842328518e03a61a7a23e02ed943 |     
  nds32le    |           ruby-3.0.2           | NOK | http://autobuild.buildroot.net/results/63f32033aff5c800a933d8b1c805be0d9d6abea6 |     
  nds32le    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a16cb34bbe027c5dd87889cbc314894c12dc2ec4 |     
   x86_64    |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/8b7a0aa64373a68ac1fdcf6131a8366c6d39072d | ORPH
    arm      |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/5d4ca70ebf30463aa7e8a96a90effa6282f57e21 | ORPH
microblazeel |         tpm2-tss-3.0.3         | NOK | http://autobuild.buildroot.net/results/d5c49a2e8507d4e521870b98a7d4c6d841321bc8 | ORPH
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/1e24015b3ce10aeb0049320f2a045fd335dffdf3 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a0f04bd51e97ad6cae10d447d965baaece669ffc |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/bce3be58919803fe734e8f030b642500dc39214b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b5ed9456e31866b977ce5a90a2eac32dcdc63e0d |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ebfa9a1137a056a252919417c2f2cc855462569d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/addfb8eeaf9b2278a2a85dfc31dbd2e727f3a5ff |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c28cbaf5515e20a0231bfceff40c2ee9b008200a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d25df000dca9c451deaa664b657fc1ebf3d8ab09 |     
    m68k     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/90862a78a87230d423d771203a4133aa6dbe2960 |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a9933604631fe7f5854088217ec1efc404ea0908 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6ea3ce804e6bde5504afe45cedc4d95e0bb83ec6 |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/51805df0f8052aef7141c4368b34cc361d42adda |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
monkey-f54856ce250c4e257354... | 3 
                ejabberd-20.07 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/6f3e6d38aa993d1012fec750e6be4b6647b37c54 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4f6d0930b4ea4dc2bff068c56e011517bee09de1 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ae1e254914fb1b5c1fc470d1afa5b038fa40e154 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fa3f7d1bb5e4d92b85f097711a45ba9132e0c613 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fe44390a52004c752f082878c31afb0c3647de95 |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ff6f77053d461a4dee4aefe16dadddeab43bd68f |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a637f6f72c77d5ca4471bbc59ae9f088ca3e2833 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/110c77e5a8188935548fa2bb5d67cc7128aa873f |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/284d9ba0b1ff3034650e14316fb7f69fda325bc8 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dcb82704b300b95374650a785cfdf95206e247fa |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5883594e790183b5190324323236ec34ace5524f |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 6 
              containerd-1.4.9 | 1 
                host-go-1.16.8 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        containerd-1.4.9        | NOK | http://autobuild.buildroot.net/results/0b743cf2dbc589c8938c539c15e44519060dad74 |     
  mips64el   |         host-go-1.16.8         | NOK | http://autobuild.buildroot.net/results/789dbbcdb1d882bc90b0c8821939c2d78fad0357 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1cbe9768ac04f0c9ccaca95f7a0226f696089e74 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/da2106370089cf6ce072de50b7f52034e95e6a50 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f9a34a62749fa79c0b5188b97a82b365fcd29ff7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8adc29b94a80621bae059d083ef444bcca9654a5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b517d842400dae228075c663553c93c0da22a045 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7fb269e746783e3f6cea3a01edc64e45b6edfb0b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bd75786aa33a0c026a5b6673cb5dd8c4509f98ee |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                host-go-1.16.8 | 3 
               capnproto-0.8.0 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f0e145cff7e6b4c2aab4430aebead25c0e75086b |     
  mips64el   |         host-go-1.16.8         | NOK | http://autobuild.buildroot.net/results/763762dfb373670e646dbf3c02824769ad2aecd4 |     
  mips64el   |         host-go-1.16.8         | NOK | http://autobuild.buildroot.net/results/58c516db0bad2be9a4812066f46ff23b18d6cc11 |     
  mips64el   |         host-go-1.16.8         | NOK | http://autobuild.buildroot.net/results/6aac4f9c9b9660f190540faeef376556d312a6a1 |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/8850a24fe59ccba760a47bca59046fc52b0df96c | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
