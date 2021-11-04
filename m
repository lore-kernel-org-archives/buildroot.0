Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDB9C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:54:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 537B460F56
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 537B460F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECDE3400D4;
	Thu,  4 Nov 2021 06:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfCKYRe2DsqA; Thu,  4 Nov 2021 06:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4417040110;
	Thu,  4 Nov 2021 06:54:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99D7C1BF3F7
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88A6E81027
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pc7b5QglXUDn for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 06:54:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AE5B81025
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 06:54:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 40CB1FF809
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 06:54:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 04 Nov 2021 06:54:17 -0000
Message-Id: <20211104065422.88A6E81027@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-03
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

Autobuild statistics for 2021-11-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  |  9  |  0  | 50  |
  2021.08.x  | 33  |  6  |  0  | 39  |
    master   | 55  | 98  |  0  | 153 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 36
                  boinc-7.18.1 | 17
                tpm2-tss-3.1.0 | 12
                       unknown | 5 
              host-erlang-22.2 | 3 
              tinydtls-0.9-rc1 | 3 
             transmission-3.00 | 3 
                  vim-8.2.3565 | 3 
                   iperf-2.1.4 | 2 
libdbi-88b8477d57153b9f736d... | 2 
               lighttpd-1.4.61 | 2 
                    olsr-0.9.8 | 2 
                    bird-2.0.8 | 1 
                nodejs-14.18.1 | 1 
                 openal-1.21.1 | 1 
         python-watchdog-2.1.6 | 1 
                    qemu-6.1.0 | 1 
            qt5location-5.15.2 | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/6a5a4a6da331572a395719407fd25de4ac308336 |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/5eef8ff98f6c871f36b7ecd0e9e686ab54241bcd |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/d1d8aba4e9b383c597669a449ad7ed488ec94cf4 |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/d7de632361126fc3a0d4c65d2be613e1a2948e36 |     
   nios2     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/4afcdf2860b10cfcdf06db81384f66d30ce931ba |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2271a246ed7925296cb4d9a51297882169ae740e |     
   s390x     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/cc28f4f5c6dcc3da8adb8cfd07a7f9d5281dde6d |     
    m68k     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/ffa6d7214ea5ef87fa2f6227c32169d94d25beb3 |     
    m68k     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/0d77ab91d438e4f38687b229e9083cc80f5712c6 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8d898d77070029e29e428cf88cf69ecef91240dd |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/7f123c8e087983c4f951c5f4fc852a580d939150 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b8560f1f2da8b63621777f74646b2d20402e657d |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/afb823eed44cbcfb8115b43b96e69720e69931a3 |     
    sh4      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/1ab0e535743bacd870ed1047eb15f649d6c9ad7d |     
 powerpc64   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/4b346130c21f6bd958a15c6c19866fdeadd6f357 |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/db4d7796b38eafbdcadf1fcad2ceef5c082b2286 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2ad36167d62a8d44bf3b1c8a253bc532cfa65d10 |     
    m68k     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/52246c5952e69f7486363d850f63b53f6450fd3e |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d933af1f0197e2667a76e803dffa84a90b162207 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/118da421d652ea74f84675556e79486460344653 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4deee5e97c23c2b6e51ddf1eb5d1c238a7c616ad |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1bc7593373afe33b3fb59abf598e4027269e6bc2 |     
  sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a24fced5c86318b36ad176a349f5996526adf4a2 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e0eaea241169ec084981356a29167f2f1f74586f |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3f5bd6e342916a68fc686d71351cc1ab98487885 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8044ca67b34333838d787e7d9bc0b81e360fbf39 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/def95ed26bfaebd5ce3df698434ea6010e916055 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/231a8822b5992645151b42d3b4577e05cbc2a8b8 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3697c203b5e2763d15fff9220fde79ea61011642 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0c98cb842d6363c08e87faf62c405c7db8ea1e0e |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/fd00684034681686352f10aa7ffe63d592e1f1d9 |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4e24dce2b67f9c8fa8516f4f7a7753941d7e001f |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4bf166dfc55157b2c0030902867e43c7da9b834e |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6259b9f3912fb7460b5cb832f007d8e541b278f3 |     
  sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a2db90eebb589c2683f61ace2e9059341457c76d |     
  sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/dba3fac2fa9b0fa2a89182d04e33ab0319897475 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6d622776af40698b7ab7cea64ba8b5e4bbe2bda5 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c2855b643cc2d373b7826e7860d547b4d1f7932c |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5980fb8b8b2d27f0b35e9aa696a0551c2a4dd630 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5f451e8df5cf541bf83268ae42a721dcb9646365 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0517a6e18f7292670972e0faa8f5fe19b4b5305e |     
   nios2     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/704a61f6d583baab2c9b5d25feeb11307e8e96c4 |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/45d33178095071ba2918e40259f6be14eaf0c941 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e310f249864b724ad0cef5e4bb2e663077ae9780 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6fca8434082979d4026b6c818f0e1566d6b50389 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/976cf3c392728acca3fd806eb761dc434e392ba1 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9380e1c1e3550478eafada5819af4ff2cd62bc2c |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/dad6b3bc584edd23ce6c982f56240af2040c8a30 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bfbec9b3c54697e4f421d8dcc8681fd8e6114fe8 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/466d2ac7ac2ac64a5ad3d05e4d7d0a105cf595ea |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/975899e1f207485ec4b4755a154aec01b797efe6 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c23e5be3f0ecd6d98d5967971b6ebbc633517f60 |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d73c377eb4995a2434e94506ea8c9f10c1448793 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a371c45e0852458d7c3bf33d21f5f8b40119cad7 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/864ac9a7f803ad98639ed41e654c45ef5699c0ed |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/db905059ad180daa33ad03932e3d744df91895e5 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ee9aea7187f3a6b6d0a34ed46def77d17f357144 |     
   x86_64    |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/c65b9787360650e600efd9d1f312ebeca5e0b7c2 |     
    arm      |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/8db35e2aceb83e9d140870746fdc05dadedd8ad4 |     
  powerpc    | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/dc57afb326c8c03c756fa19f94ec87013623dc35 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/18f9fe93e0c2f1c8515b9198165f3c690562d0f7 |     
    arm      |        lighttpd-1.4.61         | NOK | http://autobuild.buildroot.net/results/52d99bf38e4bfd5cfbb6a2326f22c7415f6a8dc6 |     
    arm      |        lighttpd-1.4.61         | NOK | http://autobuild.buildroot.net/results/2f3d68e2bfadab86837f308810776f16af3addae |     
    arm      |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/12b3e3c84a1cebae43414424008df3b326288c02 |     
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/447e8005d38e96e4defc39d64700fc085c577c42 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/35203d1260326063b1b899fa67262f8ee7de9920 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/cc5769a59dc5d8a5ed39ffdb63ae299b1f950b1c |     
  riscv64    |     python-watchdog-2.1.6      | NOK | http://autobuild.buildroot.net/results/86483916744b0a6bbd76a70c4034ed852e2436fd |     
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/a5865b13de20f7fc8853b0e69d823e656b99f54e |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/0c422fa25f66590fe57513d158adc843d5cef1d6 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/442f10a4a0de9a46e22eec9bcf56951babce0889 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4e51a0faa548d883ba20b2aff7f9ecf828d1ebe8 |     
    i686     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7d69c16d765246478408e2a7a94f36cbaa54fdb7 |     
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/e3702ce3e497f0efa6345049a17ad52b2f303514 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/347d4011965f6c7e82f871948d6812eb0b7b07f8 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/22121440a1dcd1fe650638c2acf35597b793445e | ORPH
  riscv32    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/32985782bf6af659301a43cfb3a81b18fcf70faf | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/789162c71bfc87c8cf6817c1e51254dd3f4ba10b | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b92fc1c924f03ec64e0d90501473a52855d85115 | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b112e38a25d59853c79e6e5c7945b5b5096f909b | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a29b33bf41f9c524b831a165554f5e43dffa6594 | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/76080c2a4eee5d161de4cbef7580ecf592cd8fc7 | ORPH
    i586     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/e95f02b404aac59c5f6cf8204fe516f7c0199302 | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/07a020dfafd1bd8d7bfcf6575a75bc683ad7f09e | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/e7e5e8e67ca80e986b0fe9825f98f0e6f8c83954 | ORPH
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/49916dde1cc1ec174f0d9effb1798581448e01ad |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/8670719a88c3002f32aa82d65ef1eaa0f969a1bb |     
  nds32le    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/f4b6a3039f303ce81b2189e8188e005bf5dec5e6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b0c3e81e1f6791c4ba95e15941e2f033260e7ad5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/57c93b8a4c03a4e2312eff7d7bce233008aae3ae |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/2e0055263d1d8f9df00182a9823bd58bda09bdef |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/e050e77b06e9a84ab0ed68179bc90a526baf8a59 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dcce065cf393cd1f46320f85e88cb69a3e51cdc0 |     
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/ba95f0ec5d088529ca58cd35690c59f124e9db78 | ORPH
    m68k     |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/1f494729ee8a4337da5690356a38f7913e486bce | ORPH
   x86_64    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/c3eb8a5b7e443287e85d24d37fa45ff1c46850d5 | ORPH
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/17e9afeec0b5a202241181530bb8ff554bc9ab22 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7c8195b4e4c739e4dd075de01d7572a09b081f0c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  vim-8.2.3565 | 2 
                  gensio-2.2.3 | 1 
                haproxy-2.2.17 | 1 
                host-go-1.16.9 | 1 
        host-sentry-cli-1.57.0 | 1 
               luasyslog-2.2.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/8c175f65271fcce1d78a49e035088af3cd51b655 |     
    sh4      |         haproxy-2.2.17         | NOK | http://autobuild.buildroot.net/results/a6530e06a364b5e8704fe8ac03212adb2e811977 |     
  mips64el   |         host-go-1.16.9         | NOK | http://autobuild.buildroot.net/results/d4c597cbaee42960e3ffab5f1085e64ffa4ccbc6 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3a1a6e0cee67f7c8bec99f16fc388695384c5d98 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/574410abc6ee7da435b515bd682a0fd82b80253e |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/331c016bd219f911bffb2f759523b361f81a5c10 |     
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d8093b4214d82c823a76039ec15b15f2df33e1e8 | ORPH
  powerpc    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/85fc221439619f74029217fda373f1923987ecd2 | ORPH
    arc      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/20fc7fd91f9f9ee1981744f0fcee7a728e5a831c | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  zeromq-4.3.4 | 2 
                harfbuzz-2.8.2 | 1 
                     mtd-2.1.3 | 1 
                  mupdf-1.18.0 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/34aec95c3b1ed9b3be7b8a19fad82465c54d7a80 |     
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/2a64187a7f2199f1e2c25cc1ed2f21ef0f617bd4 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/85cc5b41f9653916966442633d783523e433c795 |     
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9575601e66178452f37f5f62693498881bc1540f | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2559c22bf1b27233e49ee0cc2a756409a1a062aa |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0b822e89c2e6148abf23491e0aadaa1f144e83db |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
