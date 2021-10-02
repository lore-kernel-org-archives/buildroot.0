Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AF7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 06:59:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD24619F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 06:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECD24619F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9628D845EB;
	Sat,  2 Oct 2021 06:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkkyfdMWTbwh; Sat,  2 Oct 2021 06:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40332845F0;
	Sat,  2 Oct 2021 06:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF77E1BF267
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 06:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2028845F0
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 06:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBm3T7OwE9Ra for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 06:59:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89684845EB
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 06:59:49 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5DDEC1C0005
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 06:59:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 02 Oct 2021 06:59:46 -0000
Message-Id: <20211002065952.E2028845F0@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-01
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

Autobuild statistics for 2021-10-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 29  | 49  |  0  | 78  |
  2021.05.x  | 23  | 40  |  0  | 63  |
  2021.08.x  | 32  | 51  |  0  | 83  |
    master   | 65  | 296 |  0  | 361 |

Classification of failures by reason for master
-----------------------------------------------

toolchain-external-bootlin-... | 133
     toolchain-external-custom | 55
          linux-headers-5.14.3 | 44
toolchain-external-codesour... | 10
toolchain-external-andes-nds32 | 7 
toolchain-external-codesour... | 7 
toolchain-external-codesour... | 7 
                       unknown | 6 
               usbredir-0.11.0 | 5 
  host-python-inflection-0.5.1 | 4 
                 wavemon-0.9.4 | 4 
                     gdbm-1.21 | 2 
                 openal-1.21.1 | 2 
toolchain-external-arm-aarc... | 2 
               capnproto-0.8.0 | 1 
                 diffutils-3.8 | 1 
                      iwd-1.18 | 1 
               libtheora-1.1.1 | 1 
                    mpv-0.33.1 | 1 
         python-psycopg2-2.9.1 | 1 
            python-ujson-4.1.0 | 1 
              strongswan-5.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1f2bcf93e9ab76502427c13e2e8191b6bb0ff42a |     
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/3f5215696ac6ea30d2cba27b614d79fd1ed44bf7 | ORPH
microblazeel |           gdbm-1.21            | NOK | http://autobuild.buildroot.net/results/3e4a50cd319d3ba84a9020697f8877475fccf618 | ORPH
microblazeel |           gdbm-1.21            | NOK | http://autobuild.buildroot.net/results/4e234a40027ea33bcdce920c31d91cc6f02e924a | ORPH
    i686     |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/c6a607fa6d75729a96f84511c23d2a17d7b23af0 |     
    arm      |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/a237e2b7c16bf46062ea5ee0aa97204a3127e9bf |     
microblazeel |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/701a0b9a3035456daaf2f1ef57b50e177e4c1f42 |     
   mipsel    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/92c308909637197897cb5a90784842d68a8ef9ae |     
  riscv64    |            iwd-1.18            | NOK | http://autobuild.buildroot.net/results/6e7cf65842bd96c8ba1d56a8cf9558ae776edefe |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e521e172c84291c4cb03f5a0df836757547ac9b9 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/6496b3782ee273576724b9fe4cd46b6cebabcd8e | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/8d2a6995eed5415e0196d84017049a0a296916f6 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/1b600d4f9a94322e46f4b0681711da6bbff0545d | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/b3e4d9dac7b23984f7fa03211f9ff676e0811137 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/571f7573cb0b2aa1e70854acf8b41fbfb8c7126e | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/c52983be0e1bb1e5cc882113266ea6b857e36a3e | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/8eeb5507300858133b6476f23fefc7df3149e1e3 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/7e3db3d492972aa193b44e7922c5a6e31862ed24 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/8814db1a668a4fb232a91bff301cf7c7769dfd73 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/1e5d264843eade71badd4c698357a2e4455f5f91 | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/768c50400763be65b3b3d5748905be582ab77575 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/cabbae594caebdb08173c9383cf92d05e2558635 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/da99b6c2c32bcb70830c0e6c8ad4b4d95dfdc243 | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/19327510e34e1d324f03df6de68b89ccc7130e1c | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/5d1522aeec71278991bd22714b4baaf75bfccca5 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/a22ad1415e5e0b0134793e4e3598332edb7ca851 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/e2d8c5c5f7405f088f6f2aedc94982a1ff8375a3 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/84f6226f53925bc9d9e63139ea295b1ff0a1edbd | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/933fb1080899d0d93f2c9b794dd9152cd8182dd5 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/167fcd214ce82b120324edea6528ba75abbe64cc | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/fef646587e62b28488e799ea5ae843e693bbdd13 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/9be1be5b190c044c9cbf2022d11174bfa6ee450a | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/a32c71620fc030e8cdd8548e35a907bb9966cd1f | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/d1a5900d454ce9183bf044dc276d5ae6c269fb8b | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/0bfea313a11386e518844ed56575f36210ced9b4 | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/5baed8fb0f396ebc0257eecf3fe00b46a10e11ea | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/52d7fd7a2faf46f7093c5207e0728c3ddb1ad952 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/1bfeddeac9559bda6e3628226980327d6c1220de | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/31fc46ae49cb13b1ec0daa43c7109a9987b4fee1 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/149cafe574d4cc8c14a0358666f3a7bd971718d1 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/954fae9542d2ae32f302852729594f91df3ea2fc | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/b0dceebc3867c2f40fede9be3f93c3c976583915 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/69f6f1f3503113698b2dfa016eb0f287e9d78778 | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/aff958aec0a418d82e2803dd427e9a119ebf9be2 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/72791705518af7ba5b5423e3de0a2f40db74bf3f | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/d9bfc315ea8e6d6ac703824a8bd75da9203a1f6c | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/dc70dda76e008cdd3a33a184cc6110e9fce005c7 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/b7b5590f75b03ba47f16a4a553d0be75a44da6d2 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/11825cc8b87c10001853acaae0032fc4a20aae80 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/3a0630b5a4aa6679350552dddd144feb6ceaf771 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/9be4537df5d91a23066733761e207b5ca2375c17 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/389df5df310be6ea15f94d979b9cc7c4a716d8cf | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/a824ccbcd8a9f5b57de41b01496493c3b2e0ecc0 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/b4bfce76970d1d7b5491437e938bfba80bf6e1ee | ORPH
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/89a381019fc8eef99fa21e446018d844f3434b23 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/678a3957405fab846eb220e19a30cc05096f0a31 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/5fb50e8fbc1a5ac696a26e4c140932fc1b735632 |     
   x86_64    |     python-psycopg2-2.9.1      | NOK | http://autobuild.buildroot.net/results/34446c54e68b58530aa2354eafd9801910cff10e |     
   xtensa    |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/c75157538d7784809d935aefcb166e89c137c9b7 |     
   xtensa    |        strongswan-5.9.1        | NOK | http://autobuild.buildroot.net/results/d470c2040cce6ab098d44feb3c6f5b459c88d2d7 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/a5a4e08fe0e2175ee24f5ae00407b51c577ac4fd |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/c964fc5e07a46be58b4f785995aaa475c865c6d9 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/fc7fb4d90269ee2ac039f6eec30e9bf722ee7e19 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/13c0dac191edf205539371f77a7bf48ebca4fee3 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/6cb4c24c66a6ed03113ced127e3c0b37cfa2bf03 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/55467268ef4b616d4de097821c6a96c61fca74d0 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/58a2d8422def6a0a16643fd5f89bb00c3e203ac2 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/644b5099c05b1cae5a84740edeee1e9994fd0d5c | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/d7eadee98f8fd77fe0a4f41088998e0d5e47dba5 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8ed90ddf15aa6759938ba51ae8d95319511218e8 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7035d592d68fe696729d6094757e7e6de6bd8bb4 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e2f6f428854c5a24e633b6c70985a1aca03f6b47 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/83ca0c0dd86f499208d61d3d9d3b7f601b7b7bfd | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dd20c6f1d0fca36074b8e00eea11e38aeeb5e336 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f27f7803b37641c1f36ada341bf431e995b1584c | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/93a8f917a29c038c5ed75b18f1bab003b1bd43aa | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/932f94477d5949cd61a07708aaacc9d4df6e0c21 | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7a7c774e47ed573145977a0220d9fd717c8062fa | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ac2c1c3e6fa539e5a4d84e1d725ecd2379da17d4 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3c861a6f1e422dd39fa82c8b46bdc8ae9d91cfb7 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b2d5986fd310f7327d84f5f110234dff80438740 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4a4acc2b01b0556d87159c869f6a98658dca4370 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/51e2fb7bc238b76d12138c9d44ac10bf64d700d2 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5e8693348e58b445de294b01bb3538610adc3953 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7d1c0d4b5ec02fef000e53f26cc48f6480d87e32 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/31420a28140d78a6cd8aef049604e847feab4f9a | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8bf59faea1b97528059b967b4e2a4f9b7b193507 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ad7fb38f2aac3d3151031c10ec229b7ef41d1764 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1a1422f34c842b6851601fe25ba50bfd8076fd45 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/de993bc81b7018b59320336448c61d51caed033d | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/da7a1946defdeb06633f0da52b37202edbc38fee | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/51927b86efe12d240db2d2368932a673a234df43 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a0d714251040d97248272768cbed97e4bff9ad95 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b4766264f7a10b96d69b55fee724e012f746c1db | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b8aa0883a71a5336b77d63336743d1996d9a5ddd | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8646387ed6902d99ea115d6034535aebc132fef7 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/29bea674af9305163009358774dc20d8f0abb25f | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cf081e41200e87b956779adcbcf4fa77169fa885 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dd019e60d4c9d6112ca11db6ea848e1bc65f1878 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cc826dd2bc2bfd15555681da0d9734c94cad3677 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d3e615143039004aa1ad14816c1fdeba04ad30a1 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/11efdfdd7f3397e00585eefb1a9b04c49668647d | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2e6d6f2c2395fbca7eb76a793d436a9b6e5df5fc | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9f2ca74f39fd9bec9b1d1800b340778789ad0feb | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/48724f6bfd1a6758eb16c0c8b1a312b5b7abaefc | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d14e0948552ace2c1d1529bde9702b295b7156eb | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1c50fa03c2b2bc0e5f1bb4e57d7baff9b656c67c | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/326bfc652e8d69f95aedda0c021d4ac3d6ac0197 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dd88c968a68ef5d89e8de45178e0d55de7cb6903 | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/318f2d6fbbcbce4f63b1a49123880198283c38ef | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7cf3b5e28e769afd437850fd12048aaaae9c9eaf | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/49c079a20e7349b6c9e77129845e722dc3586daf | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/28b9244c2a8d4c16b344699d3325a2838370ffba | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d52d7e8c38d2728a865a5e9467029a47f6527d4f | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ddbc66ebbb40a8237667cb9f9d714b65ac764cda | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/07fb44c280cb81b558c615ac211ab590321e5078 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b1a48ef9642fad0cae224c73b6ce78158a01cb88 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f46119ec8a0627cf5eb58b034ba49d4575cb9292 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c231c2da5db308ef21751d44edde41efd131f3da | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e332b2db90ff6a4785f40f50338c78659be15415 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4c18e31755e76029ec5899ae4fd7be58c8bb66d0 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ea23c7e0d9c42721cba07faf4a1922a2a84159c6 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9b1c85832ddf6eafd766d983a4e40d4418ed8615 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eab39a5b18081b483e45628921362ff71ccb0217 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3148d08df8b8696d09192469d941f0bb78e88a2c | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2a70efa0ca7496f0006401bc87beaa30e03175cc | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/45fcfb30cb49d11d61098b0fd6d6415c2b69baf9 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/442a9041bb2eeee395ed78813d10496f91ea7ccb | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dc6268fc66652a42bac70a6857cf1743f707431d | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2da74d45d3c5a898b66389c2cb14166989ab534a | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/19e219b58e2e5e74ba2d1cda23c6b12992217ec6 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eaef7136f0d019e35d29ba1e788eaeacfea92171 | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cfc149d4dffa4e50f97009827f25ff39f74cd996 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f19c8769c2bb9b5589f0c67063e8b30be99cf57d | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/46ae07938447985f0b253142d3b5f30295a802e0 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5d125606c93889a30d6335c7ebcdb45d3b2e7741 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fb47500e1b1aca415a0f4899f83083059b01b833 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/41ac15abbb8f6d8287ef939e11fa927f77bbf2d0 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/edc2eff1344278418935e0044199f2717337bddb | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b791adbe75a86eb273dfb9e3c166056f844eca60 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3078f49ccf31f8daed20975f2a6efa81310d157d | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d9b50cbe6ad208c6f289e2f397b066831d802c7f | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d1a804dbddac706fe9b74be043d311644a6c034f | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6e084f82010b665983c48bd90c114861aea2e91c | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/184953ead64cd393495ad290e081e2ab3ba95913 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5ff8c69c382d159c1425985db157722444c1ab23 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/331ecae7227e9e45564ef925b207da1497742f63 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/21443103e91d7f2721eee47f73d9321b6001eec4 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/15805b41a3965bc3fa9a73620b2eff761e4da204 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5c6810579561a44d4a3e6ad95a7d6af75117c540 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2c8e01e268652a646cd918fdc19ab50cfc84a630 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/52a1781d9399b3e55071146e50f7261293bd6525 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c27e9fb8d85e3c4da746abe99299eafa5e910b6c | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/803618012338e442481d94ae2cc6ac786253be35 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/98c4e705ec4dd8d5ccb40d471cc497332e1ff0a1 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e82f5f6eb5998d3af8fa123d2fe55d16215a0697 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3055a8cb68cb1c487eadf65d47fe1ba57caf62a3 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/81b77b582b0f1d115e41ca39d25a3880e347531a | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5106424b4d8cd67220aebd813cda4d6618f80684 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/26a55dd9293bd2102f560d8a249d9034cb6028fe | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0c4938e2b5bfdf556dd3f93b67d3e14a95084b28 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cc1e96fd38903e5163c3584fb05ae2e0976de32c | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fe8f0a019bd59af6e15a28fb98118c1bee261689 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/00d4e6151faa45eb0a5f44ca5a3c1f1796f29b9c | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/792ffa0e03fa276ac23378d36e08703b22ae915b | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ee6b7f0b57a52dc4fcf261a2523b4530254df64a | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d1ebce894e7e10201a42f23af81c5d68a28ff541 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1c74a5b076c3ac4f0c38d77ce699b591a146f9ff | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2e308a33ab9e34cfda0f6c44d4d7ab11e925c1b8 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6df3710d1a84741abfc8b7089eb6b7506f5325b5 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4eef1063ca978118f8ccc30dd0b8024b7af57fa9 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/01750733919559617823bb60111b30bb608ca9f5 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a36dd48d2be8ce105e4d2a9bc2a169681d250d44 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/685faba25d769af81e987c0a19047fe846aa4324 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3b000c8c43bcb5abb30c0878bf8f1b96bd08289f | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/81ea2c8f746c52c5dc4c4a8d61bcbe9928ed5f96 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3437afc3569ebdce972a8332a5417491776f0c69 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e4097429bdd8d3326c939e6eb1840f6dc405ab45 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/34d7c126e54b76c7c91480d67709813634770cb3 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/258262111ee89210e4a3b326b6900be6f1205e17 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ad118470e0a7aa9ad3705ad74a8e85e30a915178 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fb9addd9f2db19ac6c05c102a63ccdf9b231c7d5 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/956c4bc33a8dc74afa7899afe56ae1e1c7d8ac10 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/543fe4c053d0de544822bcf48269b20ff042b57d | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eceb903d32429d0437aa5bffce30832d7bcdf01b | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1a71c0a8ecdd1c5b1920d6a2cf9e03bfc551d536 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9af1308aa082573495f75fbf005278eee381a985 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cd45be85ec7430469787ace1195c480ae7d3b489 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e3aa4abc16b69d56fbedfdb9df3f672419e875b5 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/db51ee8085cc17936e4035ca0ad77dceeb2a8b0f | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5fdc225bbab220a7b3554751ce4bf9c9fc1d0567 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1d8ad6607cf41143630a8515bb229c30dbfb0726 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9329f608ea8e3a36aef648303d53cc7614d48b08 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/81e3cab3a5888d70f240cfb3609694550ffcdff6 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c74e9b56e74be02485a49489c45f5edda4c997cf | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/665fec0ac422b3fc01f11d3ecc002747e5eccfce | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c5d24dbe2d34edc25e984267724113cf40338745 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dca717d680fbf7a3cd3474df330c965934f9b904 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d8a7bc908b78cca48fb5776af0348dbe23bfdbb3 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/80dab649b996af114d8d5a0af8e76761c7373428 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f1b57aeec850260d5011eed73b60ccc4700de93c | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/983f502f4a192df02296c9e429e6bccfc25e8939 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c0d45926b7290fbe5ed84af11023b6f962d2d8f1 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d430e667759c173f0e8133b2106196094c733073 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/15c23aa04d5a7b9bfdff8b6850085c2af5b283c4 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7fb45c93e97848297a54920f566a310c91f17f99 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a73789651ffa164f565db54e56a5fc83589df2d8 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8cf5d38268e4b9095999921ef87b1741c7b2c0fa | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/348b25f51ef9cf0024075804b7ed9d8ee078ad1e | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c32bbe51b469f5377b7b4a37aa204aa1b32f0109 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/04946bfc0ee4ad5765671192a80fc97845150af0 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/e84113f212c338c38c6f7a0a908a72016ff3546d | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3e58d913675d1147f71a42f401ff218625f0f577 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/301e8c3fe31dcbcbb2da94832bf9a8abb067ddf2 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/2dabe11f0b9ba13e19aec4fa9e5108d7370c2131 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/11ee4bb8342dd5ff58e85edbb262a3e00f4b0975 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/b1af3832feb558f364c75620c9d1804e3ee9ab5b | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/eb8cbfbd33eb22111733edb52099928b772c44d6 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c4582245bd53f7d544d1474041d0ba1f00a5f1eb | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/62dfcaf2f2cc548568ca07611826f0a7ffd8c625 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/2f70b3f715d2572869fa4072ce7c6d02416c3855 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/591245bfbf87201ee7415d5ad86f0cd32b7aa699 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/23b2492e563a8e16d70662d75cc2c8aff55f23c0 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/937c5721e9780181b0b427431be68599208ca6c9 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9d35a4b896e659631d5a602a23f0ff03d2ce3a55 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0611a9c78ddd076982b1b643f0d30db6bb25c67d | ORPH
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e11217ec7f6675f62b8b805c4bdefbf679fbba79 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/cb32fcada59d3ec71515b094ebf371fbbaef5d90 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/863eae561f1be5640e39e014a3565ba2f892a585 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/cfc6ae31541c208592c05318cd435e449f1b8827 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/11d52d301667244a90cf980216410a18f614bb44 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/db43f9ea5dd0081c83c22c9a9b8daaa4d2d4d49e |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1e490b9f09e3a2e7cc9e09a21e92cf1dc343fd80 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/3ac8dfb0b86a87e93306430d858cae369c7b75e5 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/65916a3be1e1156c1c8670538dc0a5988bd878dd |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/d27bfacc8d9816ddd847b22baa004f6d91e85706 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e83357ee7b1569a564138449b71b27b979efab2e |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/10479323f4983552b9f4fc87328b577d3c6fa264 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/453068cbf79c77e8b9cebcfac2149b5b0bf5ec23 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ae58ae4691114ce2daa81c49c5d562eed23081e1 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/88a972df5f376fb762b30e63d3da2cc650ca74eb |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/7053009c63553382139ab5ad1e8ce39c73ce2bef |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/cafc3cb8fa06580f78cdb88d6e0df084eb142a8c |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/fd15986c5e002a45cb56937eae9ab7947260a353 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f9e22ad4b44865f2bfdf6f7fe93428521eeaa25b |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/991748a0ab8121e4caa3eecffe55257e4d9cb021 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/bcc7cd2c9051133d938cb0c669cebad2362ff1b4 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e7ed27eca8599e11e67e8e38a0db3c65cc88a1cc |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/438a24bbddae361d58bcea3e4c90037ed98762d2 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/344ba2c5269f910af9fa321b054a46bfd23e0e12 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c21b62c4698dd71cf2516495525d30f1a2acac38 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/dec481a54754a6760e5e5dd2a2110a0480a4531f |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/477a0ae430eac86507363a852f5dd3e7e8501646 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f11168a2e74f1c2250514fb9f37e4aedd207ebb2 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1ad8b3771332d77c99f8f1e41c7e63d16dd0d3d2 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/fb3420638c915fca310d00da40aa88e3bffb7525 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/601169d29d613bef5f7a21879b3d97464feaf71f |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/8f929bac466ec8eab94c3ddcae9c198fabcdba9b |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/5b66f4bf5076805ebfd9a6bcbd63737b122982dc |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/975d55d3469ee0f59781ce0dfb836fa75947a2f7 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/45bb4d6df84d29a16e5c374e4f94f2e238df1d5b |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/d7bac7c1249b459fdf7171b2e15c75e8d02bd38c |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c492069335f7dde0608434c15bb8d34009b7e3e0 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/b06fdcdf57db379f81d672e5bdf58b77c9a15a15 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e2b8b1ba9a5f3c0d5171314c3401b036527cb70d |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ad4d3f1d09813f50f5c595bcabb99c2b40df27ac |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/32b5d56a38f518d01a413beee4691096dce7ce7b |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/507ed9f3a6d45f06cdd98c666404aecd802aef58 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/30649c5d1e267d519ad319a4d8e05a5c82f04509 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/a7bce291a0385b0066e7dec8cb4f5bfffc8c8584 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/bcfe6270ea76c7876c708591301595b713999961 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/eed70e06c23cfed4bece6d3d4f39a92c0cc5baaa |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/3d3b0e603f89d574e42f67dd6f54e4045ba916fb |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/5f18cb8af5d3c35c38e1c8a6bc6820c48dc7976f |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/a4118db21ee331b4df81b5297e8f947b2be3237d |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/4517e19c75e4d41d3cd5e40f8dfb03e80a621fb3 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9f03e741ee7d5febf805e5f32a8b372884566976 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/47f8566b5e76bbd93865f0714702e1d8fbaf0d36 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/d5865a66557de3b157b4bc14264559566a179724 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/61e3304ed66fab0e4fa7f356c809118089ca9b99 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/0462c23b049bb4d5af25b861ae94ca6072b12829 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1f229e686c192bc20cbf3f6bbb6ca868142a1673 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/be471ea914549df2c49f43bd6971094116e7ee21 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/d31f628684368df557ba3be321541d444b2efbdc |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/920e31488e6ada1227d9d9a4654f1bffd25d23fe |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/8b19b5093ce5fbaa1b16f451c02aae35e874edbe |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6987fdbf9e7a83861c2975ec32ce0c083d6a33f5 |     
    arc      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/ac077d2bcd2add66599eccbe3cc9cfc4108538c4 |     
    m68k     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/9705dc6a39f7c7fae11b2fd0e1f041cf2ae2737d |     
    m68k     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/a2ab5f920f174826bc85e1d78335a501951e507a |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/36af6b67adab34c4daaef9d78a9b244e466c5d5a |     
    sh4      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/693cfddbf09d05cfa273a40af18a6d18149fc523 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e1fdd740250fc9824fc14cf9a45fe6a170ca5597 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1735e4d65c3a1a9bd833ab6e1ad1c6cc2a71967a |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/25ace49ccd87fd91a5b91faf3b3fa387ed027e75 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d696bbd913ddaa46af70ac99356a5cfd8d496441 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

toolchain-external-bootlin-... | 18
         linux-headers-5.10.64 | 9 
        host-sentry-cli-1.57.0 | 3 
toolchain-external-andes-nds32 | 3 
toolchain-external-codesour... | 3 
                  ndisc6-1.0.4 | 2 
toolchain-external-codesour... | 2 
     toolchain-external-custom | 2 
                       unknown | 2 
  gobject-introspection-1.64.1 | 1 
           python-pybind-2.6.1 | 1 
toolchain-external-arm-aarc... | 1 
toolchain-external-codesour... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/c7eb574c73fc552da54cff1c3770b818b74094c4 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b6852db743c846a50d4a9e290dd8e5b0a71e19aa |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1e9b253200cae57f99508ff8007be3c323cda992 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/16bc1286869f6060dc94797527ace910bf2fe80d |     
    arc      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/3c8ad96f2fe00972328abea32ef28c4e6e4e6271 | ORPH
  powerpc    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/c55337b7f8099b549d23390b73148abf6fc26b6c | ORPH
    arm      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/2d4f22334d421b56d1608864af0c66dc499ef6ab | ORPH
  riscv64    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/7e610410506c7c02f49e9e8d0937f95b56d8b4f7 | ORPH
    arc      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/57a70c3d3864b4093711b61219c19dd82396fdf3 | ORPH
   xtensa    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/a834bbec4eb88bbd98f047d2a62379a15a9a0c83 | ORPH
    arm      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/d51d5cbd27640e2b032ab3a8f484fac8cb290963 | ORPH
  riscv64    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/2315eb17d27350109adc7acc6a19cd96b28a0082 | ORPH
  powerpc    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/e20869e927e9175e9d335c8e44831654a11e3756 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b75365080f6ea7802b1dec10adb353f1a022fb64 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/823686b0f4622ff50bbc53713e331ec05aa3e7c7 | ORPH
 aarch64_be  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/93e2ece78a27d8f66a65122ba168ac5200f0dabd |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/814b30577e98bd3318a688a36e0851e8384e1b97 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/9f698651ddfe891cc693f60ab8b2e1e36dcf0816 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/cc3576fbf68b2dc84153e10110b868b9da40687b |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/ea9c55982f463e068c663eba3ed6c9d71bb389ce | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e217e88333fdf0dc5ddf9a2e0ff7d25a158b92dd | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d3ea369906f1799b3074f68e29f1e1d97620955f | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/189128d5c91004bd3c88ebd3a35267df15c9f7f0 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/076ddb6f0c4c3477e6cb7ef976b4006ddcbe8539 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8a7a1486be87936b608eca5453aa13d4738a08e5 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4e9772daa1038aea1ab837f99db9fabcbbe91f6e | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d5a26d0e3677ce237308b2718ce0539a20293d18 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/96461afb2ef2def678ba33894af56b433bb68249 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/476f6592d91cdb3eb865b7971604db3dafcd8c76 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b56b92957aa17b82630f68e6ecc4fc4e892afc75 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3a82ec83a0d5add1c63eeebb5eb91561c4564a97 | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c3de1ad6c76e93b8333e3ae304a4368c12599686 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f4adc69f949c447a058270e164155820d58228a0 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c6265fbdf7590a01f7bef1967775e28a6876673a | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8569ed81532077aac3d42942319da8d25ad2a818 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/63c1daaec583eeffdb4531bd518d5e02a49a93eb | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/56ffc1246af97a84582b463a4b47c43a728d3984 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/455fc2bc8f67716472bb9a01411dadad904ee072 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7b2322588cfdf824c09cf14b32e74e413c3e8417 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/5a8318a24b5aef928733083ce858360d32cd08eb | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/14598701883cde655c4a0ccdba8ce35caaf817ff | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ca7c4dd0aaf6b98a62850c2fad1e610256338053 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/14eaac3e4469711d8aba2c710028e2813a859792 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/57175cc4d064bb830bdf3731ebe90a0f7fdc0d04 | ORPH
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/05bace7bb66053e3797db5eadb3775b0ab14d971 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/52b8d09f5e7d451becb76504d5516c134a48d481 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e8e762e97d6aca8e8f71d6faecaaa70ff2631262 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c064fb45c11b00880bca6716f57910d443a96a46 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/84f74a7d75fc309e749b4bbc577abda77a9cc661 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

toolchain-external-bootlin-... | 21
         linux-headers-5.12.19 | 9 
     toolchain-external-custom | 4 
                mono-6.12.0.90 | 1 
odroidc2-firmware-s905_6.0.... | 1 
toolchain-external-andes-nds32 | 1 
toolchain-external-arm-aarc... | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/1878528ce0e4ae5145aac9c628f631de07e695fd | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/f4198829bfdfeb04a12b94d679d4ef3e9e497d6f | ORPH
  powerpc    |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/5ffff89ef0fc5f3ca975765766abb8dc1d06a7d8 | ORPH
    arc      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/e85813181cf9d4cf0629f1ac671fddc562ed9d59 | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/34bb30796dd24e33e5e3a87a4d0de9a1c3025967 | ORPH
   s390x     |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/d851f0214dbbc125da25d7ad821001e54cf4adc6 | ORPH
  powerpc    |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/2693c9e7ab7274bb098fea612679078609fd1ee2 | ORPH
   s390x     |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/ff6ad3daaebdca2fca207f801378c910e3d284bf | ORPH
    arc      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/fb598cad47e807f6798dbc8187a513a3e2ec0cd0 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/94aeac8c856e47cd60ccaa23732a647b75688c3b |     
  nds32le    | odroidc2-firmware-s905_6.0.... | NOK | http://autobuild.buildroot.net/results/b7aab4e62397f13963fb85135722e416abd81ec7 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/e25963ca81435c75aa4bfee5de98baae5d054249 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/306f85131d1bbd44b58c4a2959b2ec68ee145664 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cd093eae5ac9f5c5b9271fbdfcf35a79d306738b | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/67396d9d8a196cd899afe549f19cfb71b4c6d273 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/33bb9e603b7851270fbbe7c4aa1e6c21ca32334d | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/93da404f5e17eaaf504725536ea14ae575595f83 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/51d057a771c4b550aebc22d30cb2bdc2696697b2 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/43fc40a1ca33c6dbfa2b3ed89dc02351ed7edfe3 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c8d917a948c6252657246e325ee3013e848f56fb | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ac2663eb0d82366bfa5e496d66431e1260d90459 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b44211d8d568e21a170f3dcfe0cef88c1c386188 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5d45a31d34e93fca525e6fff1c26573d944a3848 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ef56c6e7345672dcbd30a7b35e7432e81d546950 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a0c2b93564f44e760980447a07fdc7b8d874f2e7 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/20dd846484b1ae8bf79a2a1a6e61fe4410abc4d3 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/251d3982d36159388e02d3911b58a444d0869b3f | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/50153f18268326aae3347a850eec70c359a02b37 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0679cf05e8454bdabf6ec57700c8a15ce260729e | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/015fec9b11f720d0befbf29fdc2c29c8ca088751 | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4d6c3a8fa7d0f17bde68d54f8ed97bef6c25bbb4 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/470b68960c8ee23d790ae150ba98ecb01b3f57e1 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8597de538d473ffaea6be6f30208fcafa596b383 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fd6d47aa0637c02f602bf08afb8e9365d3075031 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7759c9ca96c6dbb393a74c5a92fb52524b0f6ae4 | ORPH
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/61ba4a97d0fe3a158e7057e8d74eecf3c9784260 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ce7c01f04376ad20b20c6f89b751a0dd7ebb3fa0 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/096a2cd6df74e41353d0844cb762b986efc557c6 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/8776cfa2b872e0afcc59f601d8c5e96f3da3aed2 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/9c5560c041eaf4a977adb36a51e9f92017f6d299 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

toolchain-external-bootlin-... | 16
toolchain-external-codesour... | 7 
     toolchain-external-custom | 7 
         linux-headers-5.13.16 | 6 
toolchain-external-codesour... | 3 
                       unknown | 3 
toolchain-external-andes-nds32 | 2 
              alsa-lib-1.2.5.1 | 1 
                    ffmpeg-4.4 | 1 
                 mesa3d-21.1.6 | 1 
toolchain-external-arm-aarc... | 1 
toolchain-external-codesour... | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/79823c1d27f53a711f80f7c071e77f0887541301 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/240b94e7ad9fc50b5ef0375b6165db6c82b71ba9 |     
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/14d82a8e08c7290c1cdb0bfe9fd8bd0ec1f687b1 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/a9bd24fabcb0f67235a19e5c856d586f878249c6 | ORPH
   s390x     |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/5f73cdc2d349bc6c6dfef0db23581f8995e90380 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/24f8de8635daa18703bb20d8ae4bef49a7653904 | ORPH
  powerpc    |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/71df77dc2922dc9f68fab38c2d78d892f687354e | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/70f11703e8c8b9a2f56c2be17b131c528169017a | ORPH
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/26a97e080c49c42c06ed59ec6a9d51d81b0ab882 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/9f847f9314a0cc89504920899df1916fdfde3e50 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/4f1c3965be169e8ba2daddf2773a390166673ed9 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/ddb38a9d26cea983a843038d29e81259962ded6d | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fbb8f76ed725811351a891bc4fadcc243c2f49aa | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4cd1c2fbd728d8d346b8d2f1d0cd3843189b8f56 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/496a1725dc8e702c7d65f66f0dfb7617f83f8ea7 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7e650cd782bc7898cc761eacc113f3553b6e9791 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/09dcee0fdc82295d6c16737e2bb4419ab3c95cdf | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d5c88e19f15f292556fc91ded4182f6a598ea737 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c6973be378b66cd25377ae362b88b87b1c11c5df | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0b056bd49c776c430c7c5db9359ae015435d7c66 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3691798cf23d81bc40ba60c4cff8318a26a42271 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e5cbff54a7779328346766a44a763456e95313a4 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/97baee2a9f84433733a2927fecf835b689ba3179 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e31e47d91f45c1756eeb5592b77fd2a3ff7cfbf1 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0082ba3257068ee6b3557938d8a65fb4d78cd2fb | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8a0e24230cf57dbb84341728cecdeafb099de2da | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/946647017603770bd74b34c682528bc1c4a669b1 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a5fd8e98df0532a99dc54f1028477ec41e9f00bb | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/43bb1d51e9916a9aa5ee45dcfd8d2bf2b8d712eb | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/299d6c8e48cc5b54342f2cbffeb2d01d26c5510e | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/4db656e099e318370ffa507665c325ea6e42d42d | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f68acd37b7be6d22c85045b5430ce6b62e120c87 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/064d8964495ea70f7d02f32a09721c17425078c4 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a2fad7295cdae02dac3c670a8c1a21594230eafd | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/36230e2e408d9a2ffa207016e2fcdeedfe006f98 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3a527865d19240b57d842c3bdc1376d8ecec7cab | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/aa42f8cae397b8619200376b418f276bfa4ebb68 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/18df23d44a01060e72190d78c02616c7318be65e | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3efaa462aeaf48ea565ddb374596e69f977bf3b6 | ORPH
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/08ca9f36d7ed5cbdca7bc698c58e5c8de4e8b8a8 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/8937d0ddf304f585deb4001c40782cb9bfdeb6c8 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/6976f02604b69b6c2be51c978ad87f12c6b989eb |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/6a6eaaa292de158c8310e7159a7a437d6f8ac66f |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/5a6ae927bce0d2bc5ffa97134da1c014cd67bdda |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/45fafdb912c395ced055612e692163107389c6b0 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/55b11d2170dbf1da9117053afdc9bef1a9ca2b2e |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/dafe438ca097b9d32c1e60ca26de5ac566fa0234 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/d7a39f85325101a062867b16ea60c0f89cd7b0cd |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b8bdb5ca997d1c7425e01a3cff4ac1b86e3423e1 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/2afdfe52272d833e664a81b831d6bf7220e84c84 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f075f44b323864206626fe201331af90e522f50e |     


Gitlab CI results for 2021-10-01
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209681  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209687  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209700  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209702  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209728  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209732  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209739  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209755  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209775  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209778  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209790  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209795  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209804  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209809  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209812  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209815  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209817  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209819  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209826  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209830  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209839  |      
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209846  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209849  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209851  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209852  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209884  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209886  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209889  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209901  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209908  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209912  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209915  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209922  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209925  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209933  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209990  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636209992  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210012  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210025  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210070  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210071  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210083  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210092  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210099  |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210128  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210129  |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210137  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210134  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210150  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210155  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210157  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210162  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210194  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210204  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210212  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210225  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1636210227  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
