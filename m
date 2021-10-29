Return-Path: <SRS0=WOAM=PR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878CBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 06:18:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC22B61151
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 06:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC22B61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36BB7405DE;
	Fri, 29 Oct 2021 06:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ZrjXY7QIsGg; Fri, 29 Oct 2021 06:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68C6240595;
	Fri, 29 Oct 2021 06:18:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CAB31BF47E
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 06:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 519F840595
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 06:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HBdXQS6X02f for <buildroot@lists.busybox.net>;
 Fri, 29 Oct 2021 06:18:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3B6440594
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 06:18:41 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A9D51E000A
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 06:18:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Oct 2021 06:18:38 -0000
Message-Id: <20211029061844.519F840595@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-28
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

Autobuild statistics for 2021-10-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  | 16  |  0  | 50  |
  2021.08.x  | 41  |  3  |  0  | 44  |
    master   | 55  | 118 |  0  | 173 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 49
                  boinc-7.18.1 | 9 
                tpm2-tss-3.1.0 | 9 
              host-erlang-22.2 | 8 
              tinydtls-0.9-rc1 | 6 
             transmission-3.00 | 4 
                    olsr-0.9.8 | 3 
                       unknown | 3 
         python-watchdog-2.1.6 | 2 
                  uhd-3.15.0.0 | 2 
                  vim-8.2.3565 | 2 
                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
                    atk-2.36.0 | 1 
  binutils-arc-2020.09-release | 1 
                    bird-2.0.8 | 1 
                 diffutils-3.8 | 1 
               host-ruby-3.0.2 | 1 
                   iperf-2.1.4 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                librsvg-2.50.7 | 1 
            lttng-tools-2.12.3 | 1 
                 mesa3d-21.1.8 | 1 
                   mpd-0.22.11 | 1 
                nodejs-14.18.1 | 1 
                 openal-1.21.1 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
            python-ujson-4.2.0 | 1 
          refpolicy-2.20210908 | 1 
                sg3_utils-1.46 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d0f522ff62da43c66e16290e13cc73a094b49a39 |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/d20805ce973b70da340c52ec90047673f232681b | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/66f6c976e293159f857a343ff6ae42a8bfd76eab |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/5d62b0331fa6795e8d34a54b2c87eda4cce8e4c1 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/f519fd28a41afabd371691aa2f0d4c0b2939d1e9 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/d87175ae06b424e73bcd59573d7d81ce2fa47a7a |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/d4597183cf0b6dd19fbcf1799cc8fe30f4b46975 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/643057ab90da01e2294504f1a91b53f96c285eea |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/e10b3904b877662a67937ccfd864d6cec991c84b |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/126ea133ca8625f81a88477ce03ff49b09e40882 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/e2035f6740913efb4dfda840e43356a62cb081bf |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/6cefff8722b0c2029c2c2d995f4a95d90a117a50 |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/51747aba9d9a22dfc39bcdd22ddf70e52c959240 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/59b807e53faed706f0bb85d4029641ff7196f8de |     
    or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b41f272a433025c2381207cc5e4e915670f6c20b |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9328918897d5e45b18214852aa83bce520ddeb33 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9bb3260bbaf95a9de6eb2ef67c7722c8a1df690d |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2f684080e106d668d933efd4f521b33fa6ef52f0 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4f8106676788ceecd89726c729d010955ba86a8f |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cbfbdcc82e1769ddb057af4c011033f879bd710f |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c1346d4ad69888bfff2a2fb8c8295f900f5a73fc |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/797878b20e236c4556ee2b80832b8b05b7cfb56c |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/81dc06df9d1d18c4354ab17537f983847eac74f3 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a8f18a97826bf599ef6b71218ec60f850d010a5d |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c25d5c89955376c94b06eeb5145a4924f8a590f1 |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ee30f5c67bb3706b8ea3e3f22a47b45f8d09c73f |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6dec00e0987cbf3a26eec9d9426fb7dd3b93ebd6 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b4232c520de20ec24d08e798131cc8758860468d |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b4ba6f4350f27b556b731adc55074eb2165265ba |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/635833063d52f0fbc0454b0ceaf6ba16e9149b6b |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/42c07a8f3befc646590da46b59e4da6a2f3cc28f |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/beb679f83cceee182812223d7b94ee9251ef22ed |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/31a94282f7c481d3f3a29b45c73c00c39bca086b |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bb307b23b45b5a23f2415d19b2c408ecc7e86000 |     
 powerpc64   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8f4cac6c1be724a69491f99626c222858b411cdf |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b931854fa3676f0017eb2b4bf8cd7bafb43cbf2c |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8577281b7facf72d47f2b642e01f7d6b77e14489 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c076df1a1bc88233a566bfb4f8c8841bc2c4eed1 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/70776a7b655ff7254ef8cf1feb7b8ccb3b6e9776 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/dfea010c193d7c87c394eb9b4b9dcbd7f7165448 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3d85037a96b883264d36d95063eed93b01972b09 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e17afaf1b9806493e6eac0dc7a1225ff1d815e51 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d62dabd973d5cf38b4d8d09ebf17e368236d122f |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cf82b34047b5d7820b1bc664eef00b5a13131d83 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/369fafd94d6796906ff8747cedd38b2172739d58 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/732d152a2fe6baeb0407aaa2f53e603b73e8c088 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/63efd91095656c189a85425b36e376a369dc2293 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e8b49dffab2bfc90daf1a25ba58b5612ccbfb59b |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9f091f6df0603b1559b8b10eb1ec76e5c33020ef |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0e2293d75c69024102618784a339bb812b2b47a7 |     
    sh4      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9a08edff84ef01e56314ee4a8fbec5ec2d92315e |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0794f5f95334e06b64323bfde53acc8ca2627af7 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/632a7065d9c935e1131768a986d437708c0f94d9 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/72f437f5e07da17f9ab000bfa71c9f0bc3d19a5e |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2c69dd0d7a63d9e427625f9670ae49a696e1e3fc |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/aa9019e6418eb6a7bea5ca19e9b2dc6bfa99ec4b |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a2f696afd36db1e79f6d60dd31e9c37083a387f2 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8048bd8b7d6b697d06b2daf4ca3e862826111eba |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1a21ebf2fd8ab65828a23de13f38bf08a7281c21 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/849fcc98d9fb5ab54c7594b9c2cc9bf147c57ac1 |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cc98bcd51922c4f31e6cbe6979f4883c407f4ba3 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/70db1b3ce7a10f6015c2c08130f32c7fe4adaff6 |     
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/6a940ae35b72840a657f1e36a5cf1ad7cb9f673a | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5d879470ecfa9cd3ad5375ae532a5f9c715a4eb6 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6e281dc7e273fbc8921806d7db238cf6a936ca2f |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/cc7e0a687e09999fb7d58ca173b18aee082dfe16 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/203e9b199174053a8983c30d08f3385e6395581e |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/eb0d0936a01a43f6e7acb74efcf9e59ae74a49f2 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/59122815738e3470f75643645923dc85f09bac54 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/24ce5313dc076815010a905d3b877c1501c33801 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/45680121beda39bec26b25f9cc218701261b5b8a |     
  nds32le    |        host-ruby-3.0.2         | NOK | http://autobuild.buildroot.net/results/a61a15eb49ada1948b546aa1946c0ea7999908be |     
  riscv64    |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/60bcbe1640f551313d547d95bbbbae84f5b61b15 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/efb1282ebca2bf3aba6355580a714cf94109c570 |     
    arm      |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/f89afebe00b39230f341b4bcdf8c2caca39a4d37 |     
    arm      |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/bcec369bf1d6307964d76e69f67f659911977cce |     
    sh4      |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/38d835a0f9dc50093e53cdb891f45f8b3abb5efc |     
   mipsel    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/8df0222c0f38f7fdce3869e2c4b6f315ea7e5044 |     
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/1bd8a040c01c54aaa1b5d40ddb46be712d1aa844 |     
    sh4      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/02b9118eb77b66fb28dd2d592da62874cfd3a332 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/7dafc4840073c1ea880e0ba5e6a86c4e6bdcd3fe | ORPH
   xtensa    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9b4ca23ec8831e148a24737f75910a319a4fbd8d | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2dfc21aec622793ae1f96133bbca54e3bc4de853 |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/cde140eb635fe78749a65ace980b4809d42a6781 | ORPH
  riscv64    |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/61cc675281ba25d6ebee4892175e9c7222aabb79 |     
    arm      |     python-watchdog-2.1.6      | NOK | http://autobuild.buildroot.net/results/9d4abcb029f4e44a9cb454faa8416d8ebccb5b2e |     
  riscv64    |     python-watchdog-2.1.6      | NOK | http://autobuild.buildroot.net/results/3afe7a4a5239bc1428abf07834abcd8935762df9 |     
   s390x     |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/d583666c75a96ab3ae8583345dd106d03bddf1e8 |     
    i586     |         sg3_utils-1.46         | NOK | http://autobuild.buildroot.net/results/a72d5979ba4184c38e7caccf67a3fa37983ea0af |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7d47ed3d93714d90ead046cb890c91662a94d371 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a4c875a205d4d5ec75e986b4b64f7bf26c373454 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/6b60453a92a99e41694466073344ba7b840971ff |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d5b6ff245b4e4b5d62f54bbaf096a0152f8fa5bc |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/48830852a1d233e024e12ce0a1d787b3ed56850d |     
  sparc64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f9d2bcdf791e94dfc0e27aa0a878603be86e359e |     
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c34f536ed0e1e0193a03fb5137f2f3652c209db6 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a685472bf8014409da2e43f6af2e8259a605f6f7 | ORPH
   sparc     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/56a7b2a283f6995373b315efea7d3e133ee86fad | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8991cf23ddd5024607fb8e1ad3d3e38df23baffd | ORPH
    or1k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c3183ff6a9a0680eebc0d83c7deacfdbce44c4cc | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b505086d484e5ec27e8bde5193d9460019f9f7b7 | ORPH
  sparc64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ed316f12442c1e6f5992c860c5f10cecc6bc6aee | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4e714d243aeea81c1fdb87a3a6d7d5c5ce91965c | ORPH
powerpc64le  |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/662247f660494a2595283438b7b36cae0221fdde | ORPH
    m68k     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/65e8db3d2522b95d040d5b8ce01bc1935184dc2e |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/7b8e9e449bd6259eb48b6e5877313aed1d3b2b22 |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/41504046956e8562cfa9f72c91b87b888f4f0b02 |     
  riscv32    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/9dde1b307de0f5a08507a1d60d8ee97dcc99a26d |     
   xtensa    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/54b4defdb09ff2d36153397b29aef57870386c44 |     
    i686     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/4c757bf631277f93143356b054a48c2c06a44e53 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/10292393381280f37f0f6a9c088f9427916de32b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e4b34033bbd06992c9e55a9dcedf666db44f74c2 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/68d636b97bcafbc5f05d2f26862a7463348b71f3 |     
    arm      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/c105325d2774e87c6d5617eb36c401ee160e0c09 | ORPH
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/7eb32fc9e6bac6a1a42b0e9d28cad57ca9258dc1 | ORPH
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/053b6c2b764a437235ac60767fb37cc403d1d098 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/21481094c31d94e173961e69af4c1f718c86e2f2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/af85c832c4e8243ba8ab9ff44f98cfb37f0c5142 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 7 
monkey-f54856ce250c4e257354... | 2 
                  vim-8.2.3565 | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
                 mesa3d-20.3.5 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/32724d4d6aeb65f98e516491a297bfae784526d3 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5cc9ca0831948a5f54174361cd8388126849f1d8 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5bb43d0ac08a936dd21288c971cde4be06dd21d2 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4bf9c0f0e2b6719a7e506ea355bf12d491de0d83 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/127f8d47f5ccfd2251eb4027423a1001361294ba |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4a8f7dac4c8fc939191a665eea5b033a956aca5d |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9978f00e95bfad5223f6f1235cf21e12d352122c |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bdeff15e79ffe0bfd66953d1b80b87cd90fbfc6c |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/6ffa35d24266af006f7c008d3f80033d244e000d |     
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8ecb7275055857d9bf3e9f05d0e654fcf6787b4c |     
   s390x     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/379d74fe3710591bf62311343dad2990e286f4ea |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/595e6ccf2c51b006eab3015b47df4ef0aa48405a |     
    sh4      |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/badb02c543038f3efd38c7a948e520d9b483764e | ORPH
  powerpc    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/552817fbf83a30f33a7327686d7eae82a4748ebf | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bd31d16b528a0cf582a8cb7e0b745e3e87bfaf53 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0e3a3629941789d44d3797ef538706effcf53cc0 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                       gdb-9.2 | 1 
                  mupdf-1.18.0 | 1 
                  vim-8.2.3565 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/6b7ee4108fb0f7effb3f408b57bee1b0afc5f011 | ORPH
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/3cad30f813a9805fd5cd06075193bd08aad25007 |     
   mipsel    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/77b795cfbd2ca9664e8f015aa3412f632715f6de | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
