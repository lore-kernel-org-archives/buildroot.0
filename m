Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C100C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 05:55:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02C1060FE3
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 05:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02C1060FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C70840015;
	Sat, 30 Oct 2021 05:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9Nz2bV4NrKW; Sat, 30 Oct 2021 05:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DC70400D4;
	Sat, 30 Oct 2021 05:54:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6573D1BF401
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 05:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54B7F605CB
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 05:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crarC9aiNZy5 for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 05:54:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5D7D605C1
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 05:54:51 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F0DFD6000B
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 05:54:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Oct 2021 05:54:48 -0000
Message-Id: <20211030055454.54B7F605CB@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-29
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

Autobuild statistics for 2021-10-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 31  | 12  |  0  | 43  |
  2021.08.x  | 44  |  3  |  0  | 47  |
    master   | 56  | 95  |  0  | 151 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 39
                  boinc-7.18.1 | 10
                tpm2-tss-3.1.0 | 8 
              tinydtls-0.9-rc1 | 7 
              host-erlang-22.2 | 5 
             transmission-3.00 | 5 
                       unknown | 3 
libdbi-88b8477d57153b9f736d... | 2 
               lighttpd-1.4.60 | 2 
                    olsr-0.9.8 | 2 
                    atk-2.36.0 | 1 
               capnproto-0.8.0 | 1 
                 diffutils-3.8 | 1 
                    gcr-3.40.0 | 1 
                      gdb-10.2 | 1 
           host-mono-6.12.0.90 | 1 
                  ipcalc-1.0.1 | 1 
               libtheora-1.1.1 | 1 
               linux-pam-1.5.1 | 1 
                 mesa3d-21.1.8 | 1 
          refpolicy-2.20210908 | 1 
                softhsm2-2.6.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/79fda65c8704cb37c7313cc21ce67de7a9095ffd | ORPH
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/aa195309f314b870b489509d19f5fc615f03f7b7 |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/31de167a196c7a7c2d642da7ffe1bbbe35517421 |     
microblazeel |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/a1f6240f2a91eeff23b0c8987a2321c653473cc3 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/38978bab7468541e40c9332477fa91dc10a15671 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/3484a32c46c92ede707d69c3cef6fe5b40798969 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b107dc5b7c7efebb6ad151d656fb5638890e1ed9 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b04527afd7f5e9ded6af2f03c9c67df9ada7705c |     
   s390x     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b93381eff53e089a57a26815a0325e3c96bd87a0 |     
  riscv32    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/710ff28bf6cbecc65ec830209cd44cd5fc7e97be |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/9998cf8917012fb7d71e4cd5cc0d85b37c23bfc5 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4447ab406e0a509bdf73577a63a34b7506f8b28b |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6724fa8eaca244a86aa33542a9536c100b102268 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8e2cac0fd51463e915c3043c525a3d1264cb4dc8 |     
   nios2     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9e8a49d9e03f4b0f20393620c61f4aa15324e662 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/95327162abf9d3a58f54837ccf042166ef6589cb |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2037d15ba2566dd6fb982a80f85e4a99758e9641 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/275ee49feb2b542f8cd751d3594dcd383fde7acb |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/846e170d44ef242aa952d98abcc350b8d8c1f003 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/58cfc34db47339c2a277f330aafbd2ea3b0c956b |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/11119f51b7f6e35e0ecfca9335b26ca1d7513b89 |     
   nios2     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b84642c25334e14574143d76996544e28aa9dc9c |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/250dc4c5595d39719eb4c1c999620dee575c68eb |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2d08b80baa7683cb9f88739d1080008c6ac66adc |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/55dc8e7d7eb10978a7c00e32df2f7a53a6b2a84d |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9073c09eabec92dff1993a10aecab43dbd1902e8 |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5462e1db98a8f84c35549b32745048e8ca0f47e7 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0bb7426f50f28ec79a6bde5ec0b20477d1b17795 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bdc28c91d93c34a460f067fd782ad02ede4f674a |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1183223a3b1385c628087a4e7fb61b4b9e595e75 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/345afcbb5814eab86f6a34772a72f803d66217c2 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f8db5d799e971f4dcb7818fe34c5e8a059dfd86d |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cf0bb4feba812479ab5d39d4087bc3bb419374b2 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/178ce7ecc73e6cd2c3a20192d511e147d556bb3e |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f7a09afc64f0de09c872a7c93850842413df4a3d |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/415bc6bed6daa7ef474e643cfe19a91934e0aec3 |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5608473207cc3e92191279330a9e741df409e639 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6fea27011e05f2ab1e3e7a80c1dcc45b634cd5dc |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/48fba7c2c9fd240b02c57410d32164cf1f0d2fcf |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/80f9954a4334eb388613c07f288b852521db1e08 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/53fa0ba88d6169256e91937d63573158bad494f8 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9711ccebb9c3e2fa8f17d969d8b431d4301677e3 |     
  nds32le    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ec494a6d53b81911f6a3060a9eb8f827ebf361a5 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9fc7852068154139814f084f3f5786efbcf8709a |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d0cc7184e0ef0e660c5e27d032b3dad384bb48b6 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f7d47acbc41ce97ee41b28bd5017599ef9a008d3 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ff3981a155a794bde6d735d854629792cafc02bf |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/98d820a7ffb2cbc68a80a8f0e25ea37fff9f3a45 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a5a4619d8847ec01ecca8b3beff94c55f6053fb9 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e652731e7cd7a088680b997ec9bc8af4c745007f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/39155488f9b365d09c9ccc932b35b0abee3d842a |     
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/eff60ebddb126641c243aae0a2d0ab0a7ef7e7c9 | ORPH
  riscv32    |           gcr-3.40.0           | NOK | http://autobuild.buildroot.net/results/67a47386019c2a700df348ad6846064e0950e87b | ORPH
    i586     |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/7bde8e18137a4c96ee350a9f2604d9e71ebf932e | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/eaa1b7aca3a57383c5e54db5fc0560a7fb8cb4f0 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7b9abfa43ff5657b607e2578b640ddb343eed928 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/149efb4094f211f05a73a0ba2aa6da38a26fe3bc |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7a86e826fa768b8c4c61ac78e48d94a18b78d170 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7cb5a0f2893eea954877a29c8470dfb231cbc1eb |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/4d005291627e803e928ab34f250ef2b040114c72 |     
microblazeel |          ipcalc-1.0.1          | NOK | http://autobuild.buildroot.net/results/5f867aeab9c61538e34b14023d0ba327698d3c04 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/2e5262bd068ba3b90cd23253aeaf87cc2b4a27ea |     
   xtensa    | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/13a436a0407b5c9ef2a9afac1edefa8eaa6da9da |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6cd98c0f541271c0dac7ec72c045f16e5adea299 | ORPH
    arm      |        lighttpd-1.4.60         | NOK | http://autobuild.buildroot.net/results/6c9fa89af996defccaefb07c1c5669e7bb052de6 |     
    arm      |        lighttpd-1.4.60         | NOK | http://autobuild.buildroot.net/results/3ba4bc51f916653c05c2942c90bf8504a4bb5674 |     
    arm      |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/a6798a2b79789eec02df4d96e17f614d427eee1d | ORPH
    arm      |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/93ca8d3a5285ebd9fd5304b4d9f587d6b9d1bc1d |     
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/95ce46700059f36d03540fcd784bab68d71911f2 | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/80d3f37935ba655f91d4a1080af4d2889f2c4133 | ORPH
   mipsel    |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/63868f17e9b99b2bbc43d745573788dae7506dea |     
   nios2     |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/a05bb71cfe016f793c89b2a035835718836039c8 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c919cda3d579f99876c2ce927ac8fd0387069da6 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2481b1e11ca384f3ce17661f27a5eebecf01d0c4 |     
   mipsel    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3b25ebc9ed0c1ac02aabe25949485bad2cbc8a3e |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/97e56a86caa120d8669a4df8bba82c7990b5ef6f |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/161e26b0db443fc480c8f75ecc195de3de68df82 |     
   x86_64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3c1da8a542fbfe8469617b5ad93449561558e165 |     
   nios2     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/74ee5d5850879a053ef17c29ee82521ab08cc435 |     
    i686     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/dd177a6e601ea15ccf20bfb6cb0e2fe41aa489d5 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/26be1fc380ec0a3ce2a40832e6c7f9135faef353 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/39f374b3eec7b6d9c346eccd94d62453752ed05a | ORPH
   s390x     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4be107e9bdd9992bd1b1404a929bfac0d84b5aed | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/15873be1ae50625130b2e05e1f79d219d5039ed9 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/9c5cd9f9b570c09289e4fb1382f8ba10a4026f3c | ORPH
    i586     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1ebf9aab42fb837e9f138e5693152894331f1dd8 | ORPH
    i686     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a44e4a2fe666b6611f9ed05fe0b722f793c161e9 | ORPH
    m68k     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/54d8312821bdcfc0cddcc6895b4cf528b6a637cf |     
    arc      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/ea7e39c23fe6af4231c1c51403aaab66168b5d7b |     
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/377bbf970537ea799e05035379fe732a1ced35c6 |     
   nios2     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/86c67691c89d9f78292c5d058c009a874cbc855f |     
microblazeel |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/1d6121a9dd9c77a22290859d61aa4987c97b88de |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/84951e38fbbd5c2ef77dda0b024f2a624ea191ee |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e2a9894eb503123c924d1cf05ef875b172acd059 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/cd7a3bb00fd16ba85787f12c064fe41d83dd758e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 7 
                  zeromq-4.3.4 | 3 
                  gensio-2.2.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/46cd285aedd0d2c33a01e57b0e2d6b9c674ed53e |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5bbfd82cda50c6983a4b377b2e70afe089f0f11a |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/525cef9947eb8496f4f1b839e170e21856a48cd4 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/388903a5048997e37149c88c2e3acf89593d1c65 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8194241bce75d3e26e6ef6049b70f1bca4edb4a8 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c82f401c02a69a4522ba8c2a87a6fbf003c7232e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5710ace39117e85671148513941ae0c1d8a6f8b0 |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e9df394c311a1f4772916660c648b186afb60cdd |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/b950222b614899368fff9e5ad3d5382c1ddb8c31 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/838b6ef3706ed20409b714d281a222578d2c1836 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8c12428f6a21572f27ffbec08020df638b5b5586 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/74f6fa32a39bddfaaefbd80dd237bae4edbd9ace |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                   delve-1.6.1 | 1 
                 opencv4-4.5.3 | 1 
                  vim-8.2.3565 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/8425a9639d8dde054a19a7c03579bec7d7ccc32b |     
    arm      |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/7e2a968e80e215de21e07ae8dc6a0bd2d5ebb189 |     
microblazeel |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/af13255181a153cb3735b0f8669956d75f3bf700 | ORPH


Gitlab CI results for 2021-10-29
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729656  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729659  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729660  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729663  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729665  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729667  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729698  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729704  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729708  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729714  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729716  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729719  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729721  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729725  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729727  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729732  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729734  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729740  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729743  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729745  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729747  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729750  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729753  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729755  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729758  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729762  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729765  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729766  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729769  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729773  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729776  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729779  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729782  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729785  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729790  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729793  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729794  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729796  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729802  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729807  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729808  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729811  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729814  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729816  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729817  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729821  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729829  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729830  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729832  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729834  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729835  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729837  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729840  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729876  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729880  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729882  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729887  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729889  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729891  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729899  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729896  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729897  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729901  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729903  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729906  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729908  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729914  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729916  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729923  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729926  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729928  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729934  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729943  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729944  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729955  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729958  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729965  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729969  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729971  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729972  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729973  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729975  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729981  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729988  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730008  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730011  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730014  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730015  | ORPH 
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730020  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730017  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730022  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730024  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730026  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730027  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730031  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730034  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730033  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730037  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730039  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730046  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730047  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730053  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730063  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730066  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730070  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730071  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730154  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730172  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730174  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730177  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730196  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730198  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730202  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730204  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730208  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730213  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730218  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730220  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730227  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730231  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730233  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730237  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730239  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730242  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730243  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730246  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730253  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730254  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730257  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730259  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730260  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730263  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
