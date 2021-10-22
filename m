Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3A8C4332F
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 05:58:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CB17610A8
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 05:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CB17610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 276A083A42;
	Fri, 22 Oct 2021 05:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kw7cNmB1rmk6; Fri, 22 Oct 2021 05:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3029483A44;
	Fri, 22 Oct 2021 05:58:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67FFD1BF3D6
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 05:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4541960665
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 05:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZgYSLIRstC5 for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 05:58:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0174660676
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 05:58:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 053BCFF804
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 05:58:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Oct 2021 05:58:27 -0000
Message-Id: <20211022055833.4541960665@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-21
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

Autobuild statistics for 2021-10-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  |  9  |  0  | 43  |
  2021.08.x  | 27  |  1  |  0  | 28  |
    master   | 65  | 70  |  0  | 135 |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 13
                  boinc-7.18.1 | 8 
              tinydtls-0.9-rc1 | 7 
               host-qemu-6.1.0 | 6 
libdbi-88b8477d57153b9f736d... | 6 
             transmission-3.00 | 5 
             python-pip-21.2.4 | 4 
              host-erlang-22.2 | 3 
                  zeromq-4.3.4 | 3 
                    qemu-6.1.0 | 2 
                    bird-2.0.8 | 1 
             bluez5_utils-5.61 | 1 
               capnproto-0.8.0 | 1 
                   gstd-0.13.0 | 1 
                harfbuzz-3.0.0 | 1 
           host-sg3_utils-1.45 | 1 
            lttng-tools-2.12.3 | 1 
                 mesa3d-21.1.8 | 1 
          python-libusb1-2.0.1 | 1 
rpi-firmware-2ef3800b1b71c0... | 1 
              strongswan-5.9.1 | 1 
                       unknown | 1 
             util-linux-2.37.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/bc4d43b4be73a77bb50ac2d2582486423ced2a4c |     
   nios2     |       bluez5_utils-5.61        | NOK | http://autobuild.buildroot.net/results/b0ddea71d181274af752396fcaed091b3d59f550 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8cbe0caab09a1a9b2bb94fabec41e59d703d1350 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/319fcb562f7f582a9256bdaebc71629d5cf6cfc1 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/547807a8d0aad9683be88ee966e414d9ef8accb2 |     
    or1k     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8cff5d6afea06944a121bd08ca5577ba6b0b48b8 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/949a1ea6ad3cb86a865dfc928c689d75cd35f81c |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/474f09b2feb055cd04a61d19596be4d5e0bb29bf |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/925bdc95c910b8a7301a783596d637ffc07a1ae2 |     
    or1k     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/a238228b3b7d16bc58d96f1ceac415ef83c2018e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f8ae2b36fe97cbbf0a22097c6f848cd7aa357746 |     
    i586     |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/77c10947ddc749c54c7c233e3143f5cdf1edc73d |     
  riscv32    |         harfbuzz-3.0.0         | NOK | http://autobuild.buildroot.net/results/2c6a4470542af574f9407fa5867f0408ec2b4880 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5171b93aed2598e39346d4dfe9016124e4a7267f |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4070285680607a09e6890c920e30c6b4b60e6a8f |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4656a0a7f4f2e5c7d3630b86107ce6e965b54546 |     
   s390x     |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/42318db7fd9403473b64c40b71d5c9201639411a |     
    mips     |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/2e622c4cbbda2c314c05feda7da14fc8ca7095e8 |     
    arm      |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/e87e9d385dd40aa419265ea38a9ddfbff2da8bdc |     
    mips     |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/a992239e17c5ab70ec080e8a0acbc2e61dc96d4e |     
   x86_64    |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/650c214661a32f5f4b9fcaabcc0c4e48abdcccc2 |     
    arm      |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/1c378ec720d1a3f2378274ed501f8a770bc8abee |     
  aarch64    |      host-sg3_utils-1.45       | NOK | http://autobuild.buildroot.net/results/9c3af5feaa4079fb4c818d9d87d1e5a5750f3878 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/4403ba823d3e1df29123af58540bcd5493f3225d |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/770cf3fafe2dbe67c9061774428f067e95064c46 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/6d573a814d21c0b0cc79435ab72aba42726e830f |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/0707b93479152e28a2d64ca9a6e03a8dc4dd8e40 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/d5d0ebbbba6bb4b7dc8d2cd2b11c2e607ecbf758 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/73d5510eb1eed7fd2ea3a47627a53e63344957e8 |     
    arm      |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/9e38a719eab58ea533ffee3407f24cd2d8ae0097 |     
  mips64el   |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/21ab716fc98a6b8d0dbf6c5580e63e4d9f37c5d3 |     
    arm      |      python-libusb1-2.0.1      | NOK | http://autobuild.buildroot.net/results/12f56251c1a21bea899fa7d1429137b0b2a7d13a |     
    sh4      |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/c5b18d1c222a2f03e559fb50ab52854a9f23507a |     
   x86_64    |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/c591a1e7e8320ba494d2ab15999a2ca9a5d2d79c |     
   nios2     |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/8469a8ce9b587cd6341d68deef3ca985d966f2ac |     
  aarch64    |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/310e24d8a0f2e5a0a13fb2d64605c2b3ca8141d7 |     
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/df447bd963e62e06b28d7230da744616ae55b194 |     
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/be24433a429fda681fb66698160132c1c99bc53b |     
    arm      | rpi-firmware-2ef3800b1b71c0... | NOK | http://autobuild.buildroot.net/results/88b2137ea81c4944cbded11fa68adcbca02e83d0 |     
  aarch64    |        strongswan-5.9.1        | NOK | http://autobuild.buildroot.net/results/4e0bbce08f23c3caa621203bb863d3610ced0d51 |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c3cbff0c32d56ad35bcebb9dff14183b6d463e66 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/59ad2905e753310c743da2aa58ab5837177c4429 |     
  aarch64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f34656afe34f38a5a2faa7923ff5148f8529fff9 |     
  sparc64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d453cdb4a6e3afa3df2a5bd9fd2a980058a0a339 |     
   s390x     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/96e18b9f4de747feb9b093fecddc684258313dae |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5cfec6afa7529f85daaa6a771da668dfebb5f1f7 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c518bb8d21b3158887bfdb5c49b6e3796730a65f |     
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f50886b4d1e38457fdd9dcf0fea92f1117a59d90 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b5269ff62cbc97ffefae2c640a424eb84d0a3391 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ea16add4d11ffb025db12d06087af61682b9f61b | ORPH
  sparc64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/de5c37e388690bee8a775fec8f8b39dca112250d | ORPH
  aarch64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2cc5b4ef155b198735f0cfde66bf1e06afc54603 | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/0d949b9d8768c86a93aa9dfe3fe91f60a68ce238 | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/7f767d9df57c58ef38dd67b420615b4a3401de77 | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/bd21d13ac43cc88b99c0c99033bb665cc4a307cc | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f5453510e39130e503c8f85384d8642777118c0c | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/5d4afa389524c665a2dcfdf58b1af40e98898b41 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/19f27323dc34005df96ff8bdabd5ecf2177f4869 | ORPH
  sparc64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/dbc269918110cac170c1b49db52fa5c1edc42059 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ba154c31a9a3172e7c06e11a56bab74f60126831 | ORPH
   xtensa    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/f9b31fe94e2380283b4687406a2e142b61579657 |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/650f5102a9ddfee27ff84b4256ef3e6647f0fb65 |     
   x86_64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/12cb7bc8850832cce2ba71ef8ccfa334aff90eaf |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/66f73aa14948d5ff620fe29599a34c4ee77db026 |     
   s390x     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/e3a9aed206ae8199ae23f5d3545ac58760115cf3 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/6cfd78d958c0f1ed4f0d5a0f4e1a9d6c046fa0b6 |     
    arm      |       util-linux-2.37.2        | NOK | http://autobuild.buildroot.net/results/9fe26ab98c93b67f937293f28625843da7ccb77f | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/604b8a21d6552f36534e798ac627524851587983 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/14156090bcd7afb8a462c8e4356d122995546e24 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cbeb50d4b043e7fbdd1a33f26ff9620211f1f34f |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
monkey-f54856ce250c4e257354... | 1 
               openldap-2.4.59 | 1 
                    rauc-1.5.1 | 1 
              syslog-ng-3.30.1 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8a827cf204dcaa623200bd85edcc767aef3b1a00 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a4eb0c8200e6dbb1852bd678e8b2898f4bf99727 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f36c0d4d57a05f371ebd2d2dfcd22d5040a8fb2d |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/026803d1fdbabd85083adb2dca9364fc4926f7e9 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/453015ec87bd187e3de3427205f93110198b7b05 |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/0cb838eb389e1456c367fcea02fc7ab09ee06a6b |     
  riscv32    |           rauc-1.5.1           | NOK | http://autobuild.buildroot.net/results/625338b0b497c8a2f675452dbea75c5e71eb61a1 |     
  riscv64    |        syslog-ng-3.30.1        | NOK | http://autobuild.buildroot.net/results/7f455810f24ce8c579525c6c6ecaad19683001a8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/92425bd7f0f1a15f5cfe352b8923a2de623274dd |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               pipewire-0.3.32 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        pipewire-0.3.32         | NOK | http://autobuild.buildroot.net/results/84dd9f765f5e723ba34974d6ed2ed0ce67fb8595 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
