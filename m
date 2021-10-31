Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AF6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 07:03:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8AA60E8C
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 07:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A8AA60E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA71C40106;
	Sun, 31 Oct 2021 07:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rSd38rrf2Gc; Sun, 31 Oct 2021 07:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 524C840167;
	Sun, 31 Oct 2021 07:03:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF5B1BF322
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 07:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 766FD40167
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 07:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGzL3roxxi_4 for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 07:03:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDE2140106
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 07:03:09 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 53956FF80D
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 07:03:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Oct 2021 07:03:06 -0000
Message-Id: <20211031070312.766FD40167@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-30
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

Autobuild statistics for 2021-10-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  | 11  |  0  | 45  |
  2021.08.x  | 27  |  4  |  0  | 31  |
    master   | 43  | 99  |  0  | 142 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 36
                  boinc-7.18.1 | 14
                tpm2-tss-3.1.0 | 14
              host-erlang-22.2 | 6 
              tinydtls-0.9-rc1 | 6 
         python-watchdog-2.1.6 | 3 
                softhsm2-2.6.1 | 2 
             transmission-3.00 | 2 
                       unknown | 2 
                  vim-8.2.3565 | 2 
                    bird-2.0.8 | 1 
firmware-utils-86739f2b3ae9... | 1 
           host-mono-6.12.0.90 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                 mesa3d-21.1.8 | 1 
                      nano-5.9 | 1 
                  ndisc6-1.0.5 | 1 
                    qemu-6.1.0 | 1 
          refpolicy-2.20210908 | 1 
                 samba4-4.14.8 | 1 
               target-finalize | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/65859436871c42e5a2d2c98cb43683f22fa9047e |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/97436de51a5cf05104c7fe6cb16812b1fde11ef7 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2a06d79bc96603c98376d332e656fbd3e9ad305e |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/f4b94405224101e22d7045dc3db41ed673e98358 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/79b6de43222a571457b8f60e9bce8b5af95dc9c0 |     
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/94d18636ec1175f4d98f36af4be6456cd152bc3f |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/e959472688098b0f5ba52d787a2be6ed5e107669 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/11dac37f095c9f21796368627365bf9b06a7ab7a |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/3be57261895e02b6e5144e32cf96e07656dc2573 |     
   sparc     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/0d028854844ffb77d97056e1269fa99ff8e041e8 |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b34a3257fe63dc2c8b7d43db023139d1130d113e |     
microblazeel |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/7ae2c3471093fafa61779816a71891d3716b9d46 |     
   mipsel    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/02ba87e05db277f546ce86d978032303b6134170 |     
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c810bed9377599278904844af3e374f6774491a5 |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/e6300e20ad5d57ffa2b4b2b041bf6a6d1b17b651 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0d06754b0e74f3a0ac40e7581bcad92c83a4fa18 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/177d42fda557cc0aaa9b95715ec44c84a4f9b70b |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d4b86002e823d4efa92d78cf0a16fc27c9769df9 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/82aeef99e84ae0304535d19bbf539eb1a3edb7c5 |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8ed5bdeebf5045f4a436c8b3a24aa1b11b0a5635 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9019dfe04e3090404fab06d963120a006a8b1611 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5aeff6c086dc28fd24b900ef52fe22a176a787c6 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c012e1c85a5de8a94083293abc5f40fe1ef7d791 |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/019d81401e6beed2be6228d4a8c787d4d6bf4139 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b48e528278043952c2eab8a15420a779a84c88d9 |     
  sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c2f5cb9658baf9005e008ffc066898b9be38d65a |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b203c2f7377f5109743ee94c4f89043c98f54043 |     
   nios2     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/fce1b7a7c65518cf6974e81a6b7f2a21b78bbd67 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0f26abe026f01e1f1efe2aeb121aa0b12f950ddf |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3c8c18a377560f0a5dd9030a96569c96cf3ca4db |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e7fd848806e119baa59b96caf1c783711361282b |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/934a953450f1d2774516cb4070edbbf15a6dcf8a |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bc014de105e97ca7364c79e61eb31a2f096e6703 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/67a36cc4ffcd10732c304726ddaf75c563e84748 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/92b8e07e87d80d590fcfddc3d26221ee6cdea94a |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7cd813f3dd225fbb8f7d9f77f2a476a19ebf85dc |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d94ecc96b14a747f325f112aa68d60df43422851 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/22b0b24c2925fa7cb1f179270522283b527058a0 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/859c8ef58d563185501c16eb7714669d50b8eb0d |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b0d7038d6e5f49ea99c6ef72afc58e3a1bd07613 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ab828e9547b0f10b6daf80afb33b04d5c3f44603 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/65d7084f325ece120c3dd8ff426ea3828fc45764 |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6f9c8593cf616684470ad02dd201b7ae8aa085df |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/49fd56dabaf12e16939f767306bd90c3ff6a8fed |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e15f62fc697cf9d3a26559207290bbb649b50230 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ee5943c04652a5ee9ac77eb7d561221fa77aa274 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/16fc236bb12e324bf5e763a299fb18805be91191 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6600e62ea23a0aca5ee01b659d8dbb5cf90899c2 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/43ef5382fb436232c5d63b1314807a2277440e71 |     
  sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7764384b8c499244843a5cc5c0ff371257b0724d |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/040fe72d2d1fcdbe2fbee43f85a059bc9d359076 |     
   xtensa    | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/e301d1ee356a2d62772ceab32b7fa83274d7a7b4 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b8958e3a0e6fdce2e7e543ede7599b1974b4c4f4 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5aa5cc96513fd9ec4ac2614fbdef5499a6a6d952 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/fe9b968ea344e800248127855f4607e3219513ea |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ccb09c42e69bbfbe41d68aa713d36a1f4fdc3269 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d3e129ec910352e23f3d1cf2ba9573dafdeec3d4 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4733828617a73616179946942743e2d8b5478479 |     
   x86_64    |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/3dea58e23191bec9029ebb731ffcd5b86f031116 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/a2b3301453ba1965de8d3e4c690e98b29f555d22 |     
    arm      |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/110dfb4f9b592894a2f4c2e4abed2c82941ceae2 |     
   x86_64    |            nano-5.9            | NOK | http://autobuild.buildroot.net/results/1932c524aa6b6a3337a0fc21b44adaac60972d30 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/5f1f6dce75ccf6fd462fa1ae0118cd4de3b0af6a | ORPH
   sparc     |     python-watchdog-2.1.6      | NOK | http://autobuild.buildroot.net/results/213534584aff11b7731600f98fe9f625a503aa63 |     
   xtensa    |     python-watchdog-2.1.6      | NOK | http://autobuild.buildroot.net/results/337e68d3b671e45221965f31154a66f9719201c9 |     
  aarch64    |     python-watchdog-2.1.6      | NOK | http://autobuild.buildroot.net/results/0f268ef81c5ea3f648e6927f50a73065c21a2447 |     
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/3439a0ec0f74d1873110e1b248b63ab9740f9561 |     
    arm      |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/778736b3d0ed7c0413106a2e0a2b8107ec07beaf |     
    arm      |         samba4-4.14.8          | NOK | http://autobuild.buildroot.net/results/ad759ee0329aea04e17cf56eabec7e8d66f951a0 |     
  powerpc    |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/d8273f22b366e6b8729d5f1b87f9007996c4dca4 |     
powerpc64le  |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/bff6c0d53fa16e6e65e978bbba883ced12e2cace |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/c97959914c782286d837d3bb7513cf8d80e7fb74 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/38535d739151c1eee4a557578582102dd671b60d |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/168eab259d0bd9dd8f5175f65fdfe3a245493eea |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9e1ae6413022ebad38b1735896cd274165ddc3be |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7449a1cf5ac7d1ea46f62f10365cfd36321d466e |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/af9f8b3bdf798c88f29b919b926edbc3472a3d8d |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2fc005efc78b6354d2b770176bc8bf8081d22375 |     
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d16de6ca5ee89271f5cdcde38dcb9b7f3b0b6e42 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4f255c31c15c0448a4cbf670550aa2ca4a751cec | ORPH
   sparc     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/0c25113d78c135f814ad2a71e7b1350cb4b18ed4 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b784870c23bf71ea9f2c416c1b4724305c185830 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1d092968ff33a25eaba21447a4b30effac5956d4 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d6b8d89492ccf1822687ecc544eaca96c34b8faf | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c8dfdefe83f8e8b8b5c281170a4ef5eded514750 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/dddf152169329c75f63aa50a7151afe91a2de943 | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/6f1c6b27e81b25d0ac496d53e2e8579e7875ecb8 | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/bfb482520bec73a0c8c9df6145cd4afaec0eaa05 | ORPH
  aarch64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/320610a473646a236cb93e7efaec7c182bd52bed | ORPH
  aarch64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8d8391b32016157c9355d9f8abe989918ba4d105 | ORPH
 powerpc64   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d479fffc70ccfe5ba65490d071f98bbba77cc4f1 | ORPH
    i586     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/fed637a1a3265c2565d3b49d57b99e272e35572b | ORPH
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/aecc0214a11036fe320d53e5fe01742856ce35a0 |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/1337532c969560303a35ad0ddcc973b14dec7dcb |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/493b3fe019551c4f0ca0b37c233d724b5c4ed04d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7f1c6b5dcf6fb56dacdfe85d3caec8b501ec2f59 |     
   x86_64    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/0be1f4e5bea77b984baeacef4cf4377381b4cfd5 | ORPH
    arc      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/ff9c9bf8b46a25bdf15dce47567666340d915ddf | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/50af923ec0c2332db4521023d173178aa0e4d465 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                  vim-8.2.3565 | 2 
                       gdb-9.2 | 1 
  gobject-introspection-1.64.1 | 1 
                   mutt-1.14.7 | 1 
                    olsr-0.9.8 | 1 
                 openal-1.20.1 | 1 
                oprofile-1.4.0 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/e66916ffba58749b1ca3869538ae9ce2ac47718d | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/77024a290ec6fe82690b121a46a85f6579f0eebd | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/36b6c603f9c3fc322984ea76b6dfc1170e93bc0d |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/efb10e2a6c97d6316c179ae29fe045ff76fca680 |     
   sparc     |          mutt-1.14.7           | NOK | http://autobuild.buildroot.net/results/9d90534b8329f8f0142979963649bfba7c6ec288 |     
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/4ae918e1fd11b258e79c956135df1667f38c79e2 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/daed05a4edf69604b4093209b6826945d863983a |     
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/b801a157a9e080a5ec2d05aa2592298a7faa253f |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/395a17cfcb5ca8a042c33a6983645b2ee6e8aa30 |     
    arc      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/8a2e54ad11d875c6ec3115329ee75936f90fd586 | ORPH
    arm      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/792e67a3da26b74b4c2ff09e0eddc1695a5b6be0 | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               libtheora-1.1.1 | 1 
                    olsr-0.9.8 | 1 
                       unknown | 1 
                  vim-8.2.3565 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/401822d56a81e24116d42391eb1fb5f6ae556e38 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0256120b198f5f0e770b6d0b71fee4b2029991f9 | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bedd91444011d82a7d8aecbdefdd5acd76219ba2 |     
    m68k     |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/8928785e14cf34cf75a2c89a3d29d1a5942e9cc2 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
