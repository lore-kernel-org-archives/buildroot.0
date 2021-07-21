Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4CCC07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 05:56:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AB460232
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 05:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66AB460232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F402D402F3;
	Wed, 21 Jul 2021 05:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XxKPH-N_djN; Wed, 21 Jul 2021 05:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6330402F6;
	Wed, 21 Jul 2021 05:56:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 832DD1BF852
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 05:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A41482D75
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 05:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqN3dy_AUKzd for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 05:56:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B024D82D14
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 05:56:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B2A49C0006
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 05:56:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Jul 2021 05:56:02 -0000
Message-Id: <20210721055607.7A41482D75@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-20
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

Autobuild statistics for 2021-07-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 19  | 10  |  0  | 29  |
  2021.05.x  | 28  |  6  |  0  | 34  |
    master   | 75  | 76  |  0  | 151 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.51 | 17
           host-libtirpc-1.3.2 | 8 
cegui-00b4e1fe174da53b7ed72... | 5 
              tpm2-tools-4.3.2 | 5 
                  exiv2-0.27.4 | 4 
                   gvfs-1.44.1 | 3 
        host-sentry-cli-1.57.0 | 3 
                darkhttpd-1.13 | 2 
         host-gcc-final-11.1.0 | 2 
                     php-8.0.7 | 2 
              swupdate-2021.04 | 2 
                       unknown | 2 
               belle-sip-4.4.8 | 1 
             bluez5_utils-5.60 | 1 
   brickd-ev3dev-stretch_1.2.1 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
 glslsandbox-player-2019.08.23 | 1 
  gobject-introspection-1.68.0 | 1 
              gupnp-av-0.12.11 | 1 
             host-cairo-1.16.0 | 1 
         host-gcc-final-10.3.0 | 1 
             kismet-2021-06-R1 | 1 
          libmodsecurity-3.0.5 | 1 
              libostree-2021.1 | 1 
                 mesa3d-21.1.5 | 1 
                mono-6.12.0.90 | 1 
                 pixman-0.40.0 | 1 
                      poke-1.2 | 1 
                    qemu-6.0.0 | 1 
                qt5base-5.15.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/c55f50a8d657695f0d5492c32efa666254cd7f99 |     
   nios2     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/dd911f9c20a5a20aeca244867627a4cdabea7e38 |     
  mips64el   |  brickd-ev3dev-stretch_1.2.1   | NOK | http://autobuild.buildroot.net/results/9ef8f778b86fa2de6a927c43e2a2b1edaf883c10 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/22f17d0115572957bef790f1417ae5531952a696 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f4f25c834178580a3bcd41469b96869acd5753b6 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f80ebdcbde08c13eddec9fadc39b9c2bd4b83e94 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/3b996c977cfb52c6b02ed589724d247c1b552b41 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e94195dd3d7d4b14d3d950b4100e578c534c2f7f |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6761ea464c790520985d910efdfba78b26ab90cb |     
    arm      |         darkhttpd-1.13         | NOK | http://autobuild.buildroot.net/results/ffcb627c44d2b7202d641129b67af2dc7865c618 |     
    arm      |         darkhttpd-1.13         | NOK | http://autobuild.buildroot.net/results/880dd69b1f3586834989f4bd0469af298f3f7e8f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f168abec3faa33b08e8110eeb86daaaa713b079b | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/11ba8019f8f565de632bae9bf7eb5168b75ddfe9 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a0b3692d00f175116633da0a00feaadc833a5987 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/09db2763fc28c634c44eab45a28aca6a56bfb406 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/331c4a1e0e87f757753ae1c96f05c7bb5bf15ddc |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1319cdd0629f3c6f69058f2311cebcebdd14a2a2 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/0aae949ce384dfe5c62f59736e1288ed965e63ae |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/620eb9c97a178be1a142325e4405496e77c9f0ef | ORPH
   nios2     |        gupnp-av-0.12.11        | NOK | http://autobuild.buildroot.net/results/f21a8d4ac11f17fc44001907cfb227aace172ce9 |     
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/2789ec13a2789f54574f8b01c846cf27907e2b1a | ORPH
  mips64el   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/b0727fd2e10475f506237e19b3fc28672e047adb | ORPH
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/f3b068ade59c39759544d8416657820fe8886773 | ORPH
  powerpc    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/d6b2eb87bac991665d4b3bce8e620e6fc5dbcf9c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ea6c4924d04244b92995e528ee6cb7bc9d1d49a4 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/bdac259af9a3bd30dad773c681cc9be594490c65 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/12fccd91aa150f8b5a8110bb7152a9e1f89e95ab |     
  mips64el   |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/0a26f1c6b022130bd8a75ae09c00ad90931c8bea |     
  riscv64    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/23948170de63f95cdbf9647d0911084c94049a15 |     
  riscv64    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/1c93e05592ba3bab35c35a336b6e2084531355f8 |     
    arm      |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/9e67bdd540bb7779a13e27c55114a561c12b289a |     
   nios2     |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/c7448dae9d36cdee50e399e4aafec06f2188ff37 |     
   sparc     |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/41ba6386bf43da93c800fb40c894d68326203410 |     
   xtensa    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/52b011409ab1975d14c5fd5f9cad0327bb4dfe20 |     
  aarch64    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/77eb7d3df9a12420099054fd8c609009025ce70f |     
    arm      |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/acecd90338b7b8ab91dd8cfab77dc75b808906db |     
  aarch64    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/4387b1135685525367cc4d81f47aa0dfde4e9abb |     
  sparc64    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/b0474429ecd3c979c2f252615c5e1e95625ac427 |     
  powerpc    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/6569581a39af7de25c9d047bb14fa0a33fcd32ad |     
    arm      |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/ae68d2b5cfd708c0da536069891115fa3aed903b |     
  riscv64    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/842f3170967b465079a4d15da581f83b00041d1a |     
    mips     |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/2b94f85ad8838d56561b91906375d902680559a8 |     
    arm      |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/9af92735d4a76b7c3df26d758915a1f8be68ce3d |     
    arc      |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/8b372ab1ac7a7101bcdb1cbce6e9925489de1f45 |     
    arc      |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/35daa3507acf8df9366ad2f1e91410c6a538aac1 |     
    arm      |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/bb6dc373a96b69c6c117bb061656a43c27864e01 |     
    arm      |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/897b6a688729bec80ae21e050ec07823e4514c64 |     
microblazeel |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/44a3eddc499ab91d5d2f02a2e002834f3b842f92 |     
  riscv32    |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/765ff6d4afbcabfd87c42765e7d1bae183ef4734 |     
  riscv64    |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/831daf0963276fa3f4671406f6e839effd045856 |     
    arm      |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/677658ac2615f8d28cec9bf17c2871af14ea7b8d |     
   sparc     |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/1d50d363df1fb348cb0f54f74c8b9a26dfec7239 |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/74a40f9865391ace6889e413ab6239e9c04a4f29 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9b08f85f4e765334e999e43cccdcd44bb1a0d9a9 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6d56e032c96fcfa782700888596142c1efebe5ca |     
  sparc64    |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/38f20816a654894c0625f00b1360c92fdc251e8b | ORPH
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3fd2060972235316d33028926e66b69b66b433f6 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/752b7875b3ed572482bd76162684b4a6f7a2e7d7 |     
  mips64el   |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/100cbbb2e9d86d7ae5ed00cd0977dd11250515f2 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/dd13adb40a3fc205f8479faf27882fe900f5051a |     
  powerpc    |           php-8.0.7            | NOK | http://autobuild.buildroot.net/results/092c0d91e7a6f430ea5a2e6ef859d1661c8126d9 |     
microblazeel |           php-8.0.7            | NOK | http://autobuild.buildroot.net/results/afca41e7607c9f3e3bc0b0c0cd6731e190461c56 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/344a5d776cec6e8dabc7befdef0ef72e8c2b216b |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/fe0cc2d9c888bcdd6410092c21471f8a5811f247 |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4d1c14fc7cadecce7231578248a7efe80cc409ab |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/8a4637671624828083ea6f7e9408dd4b4b3352c1 |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/760b17f064012d93d7d4ccdf7b8920a906c22baa |     
    mips     |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/c41786cbda7caf75abf4fd87d323d07e0225e95f |     
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/5866de1565cd8a839b251ddcfdf4d2ad7c21885b | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/7b704dc7694e171505692716d959226a4db30e32 | ORPH
  mips64el   |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/4efc26aa01fbc0193902672146f76a82f30e20b7 | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/aee1739f4b727c5e8d342f47985741be6d1c7c82 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/7e8e5922c95c5177de1f86daa508e164207946e5 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ab5c4e7679345d630bdf8ca5e28f5e4ee23af917 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d7112485c3737076e9a967c8571fef3fd384043c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f35616c0f8a01b6a4611bf5926bb3e8c61fe9fa8 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 3 
        host-sentry-cli-1.57.0 | 3 
        glib-networking-2.66.0 | 1 
  gobject-introspection-1.64.1 | 1 
                 pixman-0.40.0 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/082381139a4aae1935949fe280a7ceb991cda07c |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/296283f6202b1b263492053846c6d5e8a122bc52 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/177b885cb404c86e30e3ad52e026c4f139d2eb2d |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/013ef3f6d5fa4241e4e63504a440f3aa1ee2724b | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/af0f38d03100ffb520110f2daac198c6891de697 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/78bf3426e21adc0e6f61b071091fbe09c0cc1171 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/25bddee3bcb362103498d22c266799b812edae03 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1ece807d6cc433b657d7af2c7093048d865f80e8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7957462784883865d6ddd14fe4fb231811a46662 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5827661f9dde33ce17eaf7b591093bce6ebfd068 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                   bullet-3.09 | 1 
  gobject-introspection-1.64.1 | 1 
               qt5webkit-5.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/06cfde79e414b4a35df279262158b98e7d5739f1 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/066a9f3ce9bb32fd1d1fead3ad3d244b6e759929 | ORPH
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fee09d3642b7da80454776a45e2af838fba55b08 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abea5681a967b0d58cc6ac9b524f4be9c476aa66 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/ee3e0d0592fcbe59de02301a57d8b1e2ec3811d8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ff06ce4de26ab534a0f61c35baf4ebc6ac9f0495 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
