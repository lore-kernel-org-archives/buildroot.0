Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A479C433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 06:52:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC2D60E52
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 06:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AC2D60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDCD40224;
	Tue,  2 Nov 2021 06:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7z8qU7g-2Sb5; Tue,  2 Nov 2021 06:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C895402BD;
	Tue,  2 Nov 2021 06:52:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5C11BF3E0
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 06:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA8C402BD
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 06:52:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zfq5L_K0v-qU for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 06:52:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7CE340224
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 06:52:16 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A986B20000E
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 06:52:13 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Nov 2021 06:52:13 -0000
Message-Id: <20211102065219.0AA8C402BD@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-01
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

Autobuild statistics for 2021-11-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 40  | 12  |  0  | 52  |
  2021.08.x  | 26  |  6  |  0  | 32  |
    master   | 59  | 99  |  0  | 158 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 42
                  boinc-7.18.1 | 14
                tpm2-tss-3.1.0 | 9 
              host-erlang-22.2 | 6 
              tinydtls-0.9-rc1 | 4 
           host-mono-6.12.0.90 | 2 
                    olsr-0.9.8 | 2 
         python-watchdog-2.1.6 | 2 
             transmission-3.00 | 2 
                       unknown | 2 
               capnproto-0.8.0 | 1 
                 diffutils-3.8 | 1 
               host-ruby-3.0.2 | 1 
                  ipcalc-1.0.1 | 1 
                   iperf-2.1.4 | 1 
libdbi-88b8477d57153b9f736d... | 1 
               lighttpd-1.4.61 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    qemu-6.1.0 | 1 
                 samba4-4.14.8 | 1 
                softhsm2-2.6.1 | 1 
               target-finalize | 1 
                  vim-8.2.3565 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/a1f4315bdd0b76e5d0567173e463bcf5afc5483d |     
   s390x     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2b551736cf288b05cd32b2f3294a74a67503373c |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/0688a3e0a73ed9b59a98d2d3b6edbccd2d61dfbb |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/552d7c3ccf7e98e4a66440b05c40e4673daafc6e |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/4853e822c1939e832f756950641b4bf625c61d3c |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/03cbb08a830e79c67b4bdc638e9023b25e13a980 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/fa45f3b700ce29aa2d192fc3f6392dedd9ae6217 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/857448319b1e37a196fcedc5c8ef9142496f0101 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/7a669afd9684ca9997a0301a19471ce4ecc9f48d |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c20df0c58e8f89a170736f4e7d5eb76f1dfe33e6 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/aa70e806120de9db603a405ac7157c117017c814 |     
   sparc     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/3bfc8984c59e5825a3c9094008ce248e9aaf6438 |     
   nios2     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/a3dba77fdc2d4176b1e73bb6aac8d478096f7b96 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/16762e61e395e549b05abc9ff9b96a1e7e9376a9 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4ae1f0625757b6bf4af56c369ac5ca10a11394cc |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5e7f11eb2203942061bd95946f738206a856e1b6 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2a0f52664aec84db489380819505bce3c6bf184b |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6d20c7feb1f8eb2d3d7674086d7ceb2fda53588d |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b94adb4e9f411e2a137daa76becf624db77df928 |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/481b53d855a13c4cb36d9018c5f01e865982eaa9 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0115cf113e0b7147f6a0ce8d737073945484296c |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/982f8de838b3bcf1537a1a7085d9eea5572b6489 |     
 powerpc64   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c97488d9a9dc7d85c50f51e6946ce32ce0259309 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b488f40abfa8b0c91c241a857b960ef24f18f236 |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bf54769b7d21fd7c9cc553a9e8d51e6ee8cecd94 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ab581943241ec78c53f2a94a2dfc43dd764cf514 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a53607fe232d09bb8fa45fedf85ef2e8da350df9 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c142e9c93f8018bc9a7cdb273d89fda603b05050 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bfc3909f94deee48580b99ee182bc140f9b832f3 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/786467546561195d342d1ea4c706ae0de9cf272b |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6b542ee48864522ee836e8d5c0081b713050542d |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8e9d9466558b0ea829cf9cde5c4aa7f50015afc4 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d1fd54047f7467f4fe7ad7908f421cb1c81c95c6 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3eaaf1a6fbdebbe841f0c5183f5e5294e8e34c90 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4b1064fb24179fbc2fd5b47cd274a15593e77908 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d145f997cc6db17a8eab14d9ced8fa35332c4969 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2a4d052ab043324551dff3bbc744a456e78abe43 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5008a8cf866f703f38a9693493e2b1f00ede5e6e |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ab5e5707584b7033b49ce1e132b98c5582268b78 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7992abdff5d35d780d51bdfac98700b66174b1f1 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4644cc6b85615f7a374b64957bfeacc442042858 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/230b282fa943debae1a572a38cda5e7ddf9e6185 |     
 powerpc64   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/328cf75d3b9de776a7fbc7d774d98d31a0043976 |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4d83899105a5de2257695f33a9e98d5ac0b80014 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ed65ae7c4b3230eb9ba5a0227d50da35896678b3 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b0b05ae406102f73fc40e8e2e298317750c398dd |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/179c1f518c66208ff1f386d088103f59c6be955d |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/962764ef601b99c27d3b7284b552eed4c46ea692 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f9b05c5f43f064de9751f997d75f4d279de569ab |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/520d04f9b56ea402d184d2fc68121123949e4f15 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/066b7eec98273d43922afb194522b2b6bd9c8f41 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ea0dda88d39a0adbcf264f3ef095ba0a8aebb95f |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6efb2aa71166d0494480481204937a2016f3499f |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f8237893afbdbb2b189d86556797fea56331b9ce |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9cc1624e775b139abfd13c9c0b2534518b430899 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c01204d2baaba5f6cfcb309506cceeb4ed40f753 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4e0acc0cec9f271e557861d55eb0b1f1298f5fdf |     
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/14040e771006f66928b6d94136d106abc78e14af | ORPH
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c2356aea2df6f6a103fde8322bb77303dbc74456 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6c68b8500bbbbdf7f885172705e9eef4490a3a55 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/93fa02c0442071a70f38e54445cd3c8b97029e6d |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f6a440bc98778ffa4bc38aa867b16e1c27dc29c1 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8ea3d8561f6535bfaa5ca48de262c4e85d42af51 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/68df31e1029626535b1793e2f5f50ab16b3c4ace |     
    i586     |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/017a281ebe051c07358644bb2df8055a9cc02f41 |     
    i686     |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/9da5069eeccae6c81b01717df15c7c674979e5a1 |     
    i586     |        host-ruby-3.0.2         | NOK | http://autobuild.buildroot.net/results/72e80103b8001d05253c87862d7e83be3baee7ed |     
    arm      |          ipcalc-1.0.1          | NOK | http://autobuild.buildroot.net/results/ca668cad5d61b1166427c648225ff5e109c9e4c0 |     
    i586     |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/8ce56621db7abb6601d357f8b191ba7242b1f186 |     
microblazeel | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/9f6156aa9f3752da8a0e8730d62266dac25b50b3 |     
    arm      |        lighttpd-1.4.61         | NOK | http://autobuild.buildroot.net/results/fc97712c65fa590e8bc8676ed13d853e7a58aa4f |     
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e3782f858c23031da70accb7a834cf398ab3c7fd | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/7e419922e8344c563ef8b71be83b7cf421526f47 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/565af2be41832c1da2d3524ace10b1d2fd0c1007 |     
    arc      |     python-watchdog-2.1.6      | NOK | http://autobuild.buildroot.net/results/edbabd36e745f173de7320fb23858737be0236a4 |     
    i686     |     python-watchdog-2.1.6      | NOK | http://autobuild.buildroot.net/results/08664ed5126d6ca3c77b93504857810da06284f7 |     
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/bd6853be0d7ba40b29db80592225235244c6833e |     
    arc      |         samba4-4.14.8          | NOK | http://autobuild.buildroot.net/results/5c10887790edbc3e498b893074895041979ae0a5 |     
    arm      |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/40a8c2d9f58fbe490b6832754fdf8ac4ee0804fc |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ad102d1ffb0dc310b38b862722bfe8c5f26ff492 |     
    i686     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/12d59ebadcd8ce764e4e302910ed3c99f811d61a |     
   s390x     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/75a330a508a4ec8186345d9ead1c2fd42a69f858 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e4d8737d591c2d9b8ac351bb9585783678b34253 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e31b0dc75203a7703a58884c3c9ff70cef6ab264 |     
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/04324b2adab5cc7cef523f8bb92389b707be0a16 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/e143a0a336ac17f538d3aef94b26ca769ad47d8c | ORPH
 powerpc64   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/39f98a89a50f2bbf51e2d370f8a72b6dfa7fda13 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/3fb3401a01e1f62c69202c6e69036d95c9adba29 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/62cf220ce1405d279ee9fe7eb00edd0b224b870b | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/cfa4b422df88b7a410b9d0ad11e1319833e85012 | ORPH
   sparc     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f0b21a297955bba0b8849d0185d9e8cea21629d6 | ORPH
    sh4      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/dceb087b524c46fd109fe4e9a5a41adb70fdabf0 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4ad22bacf35693a1809142e8fb3abc2b61c6540a | ORPH
   x86_64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/e00d17a86daa877c4c6a7636a1928981737d4f59 |     
   sparc     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/a0ccfac032cfc546f812f23c6b045a689e2b5ade |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/aaf8f24b3135756bc5981225fab7b051239c2529 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/372dadf7fe2db6ce71947e903b9ef649f4c67230 |     
  powerpc    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/fbd99e2f1ad9db791fdd7a251fbd5dab2a5ff162 | ORPH
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/401cfba6b027462bb31ba13ad502e3b6e5cad162 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
monkey-f54856ce250c4e257354... | 2 
                    olsr-0.9.8 | 2 
               capnproto-0.8.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
               qt5webkit-5.9.1 | 1 
                rocksdb-6.13.3 | 1 
xdriver_xf86-video-amdgpu-1... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0375c9bf97f9d1e20feb1838385a904a184f07bc |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7a70045697671a67b1901fe8fbb4d227fe42bcf4 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c8bb6b72551862d3cd611ca019ab4744827ec02d |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3b6eb93fb6d59b99960265a79cf5a072e10cc733 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/e4c0d5017c4ded97ea5aaa872c4a6224596aa1f3 |     
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/2938328ae1de1e83b5ee1d8bfd38688dc085347c |     
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d6777472dabc6e8711f3156fc40345eeb36049eb | ORPH
    i686     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0f7466de2bd7070076a92bd9735a846373635ce4 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3d221b3b84ebbeb8c3ba19d039265e0873016023 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/bd4245c57b51b6c35b1faa14f2a38b46090f18bc |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f4f73cdc3d1b96b700aeeb77c08d726cd4abac99 |     
    i586     | xdriver_xf86-video-amdgpu-1... | NOK | http://autobuild.buildroot.net/results/e786118db87f65bdcb913656a7b6d9b3187a212c |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                host-go-1.16.9 | 2 
          gstreamer1-mm-1.10.0 | 1 
                    olsr-0.9.8 | 1 
                  vim-8.2.3565 | 1 
 xdriver_xf86-video-sis-0.12.0 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/56db0af247ad4ebb39a30971eab4bbeea889fa52 | ORPH
  mips64el   |         host-go-1.16.9         | NOK | http://autobuild.buildroot.net/results/25abaa658a0c911515edeca3aed492ae6288100a |     
  mips64el   |         host-go-1.16.9         | NOK | http://autobuild.buildroot.net/results/fde9361a32e8762c22b3fa44c58299048defc5c6 |     
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8ccc214a435b6338e9ba0436bbd38833ebfbc2d1 | ORPH
    sh4      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/e6c42b2fab0af1d98e16c6198c543e5f8975592a | ORPH
   x86_64    | xdriver_xf86-video-sis-0.12.0  | NOK | http://autobuild.buildroot.net/results/1ce1d5b02b2070cb6d47ec8d0dbdfa3e0033631e |     


Gitlab CI results for 2021-11-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417711  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417663  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417823  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417630  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417694  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417697  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
