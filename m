Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9291AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 06:53:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8508A6124F
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 06:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8508A6124F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB8440246;
	Fri,  5 Nov 2021 06:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_Hg5efpbO8e; Fri,  5 Nov 2021 06:53:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0347E4029A;
	Fri,  5 Nov 2021 06:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6502C1BF20F
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 06:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 542CD403EE
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 06:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJVejsA9Sy0J for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 06:53:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91AD040408
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 06:53:06 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B93A7E000B
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 06:53:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 05 Nov 2021 06:53:03 -0000
Message-Id: <20211105065308.542CD403EE@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-04
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

Autobuild statistics for 2021-11-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 39  | 11  |  0  | 50  |
  2021.08.x  | 37  |  3  |  0  | 40  |
    master   | 49  | 79  |  0  | 128 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 33
                  boinc-7.18.1 | 9 
                tpm2-tss-3.1.0 | 8 
             transmission-3.00 | 6 
              tinydtls-0.9-rc1 | 5 
                   audit-3.0.1 | 3 
                   mpd-0.22.11 | 2 
            python-ujson-4.2.0 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                    bird-2.0.8 | 1 
              host-erlang-22.2 | 1 
           host-sg3_utils-1.46 | 1 
libdbi-drivers-b0c7ac0ef2e7... | 1 
                log4cxx-0.12.0 | 1 
                 openal-1.21.1 | 1 
                 samba4-4.14.8 | 1 
                  vim-8.2.3565 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/64c43e6bc0f701eeb5d8d692b71a475552e6641a |     
    arm      |          audit-3.0.1           | NOK | http://autobuild.buildroot.net/results/1c8a959d8847d8942fbdf148c1b781df0d8bb4dc |     
    arm      |          audit-3.0.1           | NOK | http://autobuild.buildroot.net/results/7fb08ee659a0e2cd0aa3fe471404a47ae3953280 |     
    arm      |          audit-3.0.1           | NOK | http://autobuild.buildroot.net/results/6581099b540723797d42da485a5ebc476d4b1488 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/36d90e7e2cb66a4e2f22c451f0e90e32917c0a93 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/0b5a3582a231f6212285198e7e0a8ac411a1fc81 |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8c5d6eb003e7440c3b0704b829bce9dd2a5e878c |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/6ee1667a096c578f0d7adb33cb8180e44da296e1 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/ec6bafe09397fd7bf41e3723d4b029de7ffebe50 |     
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c800048a25845131cd160e2cc32a8f513fca5488 |     
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2e0319321bef0505c458d2048baf271de8792559 |     
   nios2     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/15a0cee7a31ef2e82d2248e6fec2fe02cf956d29 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/62fb6bc9ab58ab73df5cfb5b3096e9377f944f5b |     
  riscv32    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/a56cf2639d278745efd89a03b4297913a841fb6c |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/166cec5ace7afad86d0e6ccb12c977b1835a915f |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1cbca157ff0f29f8b0ccded3b0bf06514dca417c |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e2d3e0113f1386ead43290688d9cbed9ec1c2792 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/dc2690a7e4cddbb46f954565a448829b73f7314d |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d89176d9a5f44483784ac10937b8b06e4e914af2 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f826cc5ef25444dc33e3add1c23c2422ab32b43e |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/87ae20c0a8083997a6fd2d46cc02cd6b5be651fe |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/308a92b23ebd75b140398a5eb5eeb6279e1deb8b |     
  sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0eeb0c960ec329cbd2da4b6ce2e76c010685e588 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1d4539a71f0d63cc590aa12462471cbc1bdea01c |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3c32167b4b466016c5bd8c072a4d33d7987df481 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/417c84aa84367931cbfa027cda422ac70532affe |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a6d1a48f604f5e46d1bd632cef4b3633bab30f74 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f83ea0fc6da07714bf5c445e5748803a70e6cccc |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bed734544653fc2c6f063dd013fb4bb16f7bbdc4 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/220f479d9b193197743a9bed3f777ef26d3343f1 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3dbfcc6b81310d3b549b3645aa34b5577b84f730 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/94ab747d0873ee59a562ae6a283c6e84b9be9cc9 |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/686043ee33de047ecf94f21ce037ce48da731916 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e6f49b2479bcbef455d94d3c6d3b490430bac885 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8edb8a064a25bc2cd598cd089f8ee5af08b76027 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/97dada979f03bc9a6ba67ea8705f8d162f1bb402 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4c151c7a832c0b367ce4873465b61e1162dfcd5b |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/827c7164480ad6ff62976675028154b61b5f9a35 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2991ff2fcfbf40bb1b7971dc683499b7805a4841 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/254731c99ebbdc74b423d6c32e6a96d896a654d9 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b06e84a60baa69f72e60c2c6729ec60c1206638a |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8d8a2ced30f8cefa2555173e4ccbe48e3b053cb4 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/837e75a3d1aa5fa6b087199271ade6ada8c16228 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/18c60e4a468f535f55d6751efd2dd5193963b2c3 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0a382bcb06cdfc14c071cdacf98d14efe3fbec26 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/130cf5a7ceeab0e96cb32a72c884ad8dcea2dd13 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0a509272a3e495be447f60a32ee2538570d5dcb8 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/10b9a180bb4743871e4e946fbad8aef1d86aef74 |     
    arm      |      host-sg3_utils-1.46       | NOK | http://autobuild.buildroot.net/results/2f531a187dd8e4c709bc0d81f8d4cb36ef5f5437 |     
    sh4      | libdbi-drivers-b0c7ac0ef2e7... | NOK | http://autobuild.buildroot.net/results/89f58005b3a4d50384803fe6f07ea3049935959c |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/fc5a19f6d1fe9c5e58a430450d16b764b4e68fc9 |     
    arm      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/a98294b809aecb6eb7ec26207ad28909159628c1 |     
  riscv32    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/3a9d07107e6c1fd015d1698e0163cff527e72747 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/cd765553ebbbc587451cad4fd53c659e03d1d06f |     
   x86_64    |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/4d8151a84d4f028cb94fb02945abd4f60b2b2956 |     
   xtensa    |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/7cba3aa7938477e13b79d85bf7b5068595d8b2f3 |     
    arc      |         samba4-4.14.8          | NOK | http://autobuild.buildroot.net/results/fb805caaa0c8579297a82be14ec0637d7d9fa2f9 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8966215ab5546d0cf5c0d3c65e6a934fd7038155 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/830c42f7a2cc330afb0661583a1ed7bea9c19097 |     
    i586     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7f75385e3a44227c59e5d56586fe37612c7a202f |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e203a07e7cdfc54011ab0ef3f49b562f4b899f18 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3590f83fafe089cfc816b19a8786731caddee762 |     
    or1k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b4e00a416a03fb2e0503d01fdb08cc7a478686d8 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8d7dbef0c92a39a40d721141b5f1fd6e938b5b3b | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/cd74e9d16329a977070da379408d0310adb848e5 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2d622f24a6bbfb0ba6a5fd66e1bb685a8da20561 | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c097100125b537ef9b02fef9c284d3367b73bc6f | ORPH
powerpc64le  |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a5f5a8fe8a590d19e3fa6613943dda6313c64a36 | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b4be94ec8f1224699f3d0506a485574dd49dbace | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d9f2252da76ef3ce9acf4c535f71fc45cc8b072e | ORPH
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/bdb243fb5f2e206bd43657ebbcf8fc15f074ee2e |     
  mips64el   |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/22a0ebb5451406652598c6261371c269c41b6b5b |     
microblazeel |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/21ea4c5e00b2bdba99b3848c451170a468c143d5 |     
   mipsel    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/fe59e1fa9611a62b6a5633993345a0f6818b5b60 |     
    arc      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/8462a580a5d84db8eb95fbd19e31f31be05be553 |     
  sparc64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/5838dbff2b9f8d0c079d461c50f90ab6f84a23f4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6fd0cfb8f5e8c81ab6a6c0825937b6c64812321a |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/324acbb65792df3c0f4f61ebacddad40b228e792 |     
  powerpc    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/06c9ff190b3d904e652292d5aba74ae87fb916fe | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
               cutelyst-2.11.0 | 1 
  gobject-introspection-1.64.1 | 1 
monkey-f54856ce250c4e257354... | 1 
                 openal-1.20.1 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b32c604c9aabe183584b0782fe685b8d6b64e3a1 |     
  aarch64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/72a83245594b67b7d2ed2b26a2a0309f530a9377 |     
    mips     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0b474ff5ef6870a609cce130dee81c7e9cdc6e8f | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b11ffa5d9de0c21280819c020245aa26dc6ede0d |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9bdf283606d17b4b68f0d5ecd84434976b84e666 |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/bdc2c592fe58cbf02f4afb9e0d308d4e824ba99c |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/1cad5f676f27b8b50515f33d274226ca6cc146fe |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/ec7716a0ad37e2b4dcc59d55262f430623c002aa |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/0f4566b9ee8bc5fbd78455b21eca7e2205405be6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5bb62e5198fe67ad1acdacba4bfd7c54fdecf972 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/80b16af7989a508c01fe6f8ddd26659d02b03765 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

  gobject-introspection-1.68.0 | 1 
                       unknown | 1 
                  vim-8.2.3565 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2d2c2b0559c11c20b03bd91943b6bfbd1360e5d9 | ORPH
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0490a323fe74f16b6028aa168257584aad5aa972 |     
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/e09e521dc6073fe2fa1cb1fda7815c141c08b4d9 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
