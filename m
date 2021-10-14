Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C10C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 07:10:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01B760FE8
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 07:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E01B760FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8696B40775;
	Thu, 14 Oct 2021 07:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYbeo1izoCZT; Thu, 14 Oct 2021 07:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C524077C;
	Thu, 14 Oct 2021 07:10:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7A331BF86B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 07:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9646740417
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 07:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id deSOz2-5MAdn for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 07:10:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 552D640402
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 07:10:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 363EB60014
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 07:10:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Oct 2021 07:10:30 -0000
Message-Id: <20211014071035.9646740417@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-13
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

Autobuild statistics for 2021-10-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 31  |  9  |  0  | 40  |
  2021.05.x  | 31  |  7  |  2  | 40  |
  2021.08.x  | 30  |  1  |  0  | 31  |
    master   | 40  | 95  |  0  | 135 |

Classification of failures by reason for master
-----------------------------------------------

                     apr-1.7.0 | 37
                       unknown | 19
                libgpiod-1.6.3 | 8 
                tpm2-tss-3.1.0 | 7 
              asterisk-16.14.1 | 6 
           oracle-mysql-5.1.73 | 5 
   host-python-decorator-5.1.0 | 3 
                openocd-0.11.0 | 3 
              tinydtls-0.9-rc1 | 2 
                  boinc-7.18.1 | 1 
            docker-cli-20.10.8 | 1 
           host-openocd-0.11.0 | 1 
      host-oracle-mysql-5.1.73 | 1 
             transmission-3.00 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/a277eb49e4a743cb2617d929c16551a49161d316 |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/8a0aacfcd394c3a41b547d6e78ee0da2ae1f78cc |     
   sparc     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/275b1f4f7601a24dfd31ddf742d6022a3ac3616d |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/99c33cb269e528b52727ab146c72def9fd56cb95 |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/fe096f7a595f5038b1465ecbb8c472b47c031690 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/dab0e3b8424328e4159f2a6e9a33b1bf3945da13 |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d01c723f1bcc4411899a291286d2e736588870cd |     
  mips64el   |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/bb99e90191c6e1ef46e89d8d03b23656c7637043 |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/446c4072929b3e61bf8237457c1d66c15dc92028 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/0a5d0b0cab533385bfb12bfa266e57f39764c3c5 |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/42243050aea843836c28961501db6d47bb189bc3 |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/1942c818fc85749ad73106e0f61b0e5c4b780b0d |     
   x86_64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d4959ed0e1685966a4ebc8227ca8978bf99ff21f |     
    or1k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3189484070b252efe45528e9222aed8efda4740e |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/1ec70d19cf05d78dd892ce2b06e48026a101a98e |     
   sparc     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/6f7b64d35a736cd80a813f4151e361a8453f72c5 |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/110f0b1e48d8d77eb47ccfc93a42a5b28fca45ae |     
   x86_64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/e03fc3f3d33f62e7a17ab88ee2a68e6dc802de1e |     
   xtensa    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/2361769d21c41f3067a84812e072c94d9856efeb |     
   nios2     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d7a98b27512e6d4360790cc658ed2bf2c1ab6a2e |     
  powerpc    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/88075518c0bbc29be8562c8a0bf8d9ee06f0289f |     
    i586     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/6ba3e9aa6a7d0a7c74ce602d24e396b8b39f8b36 |     
    m68k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/60b789524c6f754ed228c77c4564084158b56687 |     
    m68k     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/3897fcd20ad35b25f1f70b0c96e0ade3f1392e3b |     
  riscv64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/be329776d332cc9bfc0a2c846bd9c9718d8acd08 |     
    arc      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/6bdca03ebbe4ea828e55067787d4a58e3ccb33fa |     
  aarch64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/bbef09b98b78a921fb76f52625f95b46ad600940 |     
    mips     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/74d46dfcdfdd8e263cfe74b571232f9ec4e6b0dd |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4f2857ad8f663cd6e9ced1ee8c8ea4123edb356f |     
   s390x     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/74a4d7b9502ee6a116f1dca89bd8b39e493aedee |     
    i586     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/0a1ce64886dce3e9af66d0c2ce8bbdfc01b9e63c |     
  aarch64    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/80d1cd2563a8db598d6d26bb081fb41ff8b72c1c |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/aeae4b9d75e5e5808f306af4add819bb46a64bf4 |     
    i586     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/24cefeb67ac76135a9ca782b3022c4fc63e0a3f1 |     
microblazeel |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/01fc4db867acbfc918803ada03cca56e7bcb09cf |     
  riscv32    |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/5c36c25fc3286a547876fe8a5fa48e60102888dc |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/e1469fc7a1b22843833fe62ddf33133f1537630c |     
  sparc64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/29784516aaa28e69d360dcb024774d0a89e80c42 |     
  riscv64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/e46e8c0889b3f3d1b4c8cff758bb590854127a80 |     
   mipsel    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/81de9da17ae8deecf0baa8a96368f5c8375bce77 |     
   mipsel    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/fdba3bc07275eafcd63e71e25355cbcac3be1600 |     
   sparc     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/4f1fb39e8262492bd6e889ca782e0b2bd745e763 |     
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/1c21bb61118c447a600936936c3a7318f8dd432e |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/da4e6193c9abb89787cd009a736b04c18967fd64 |     
    i686     |       docker-cli-20.10.8       | NOK | http://autobuild.buildroot.net/results/51c01030c39f85282d51769d39079b0c21258bab |     
    arm      |      host-openocd-0.11.0       | NOK | http://autobuild.buildroot.net/results/f1f60edcaf17dda789cd2d223496f489c2fef61c | ORPH
  riscv64    |    host-oracle-mysql-5.1.73    | NOK | http://autobuild.buildroot.net/results/4d985c3f908ce2a4173ee51e0063d643b2bad91b | ORPH
   xtensa    |  host-python-decorator-5.1.0   | NOK | http://autobuild.buildroot.net/results/df57b4628930cddf341478a1ff3a046a62fc4bf9 |     
    m68k     |  host-python-decorator-5.1.0   | NOK | http://autobuild.buildroot.net/results/445510be453006c3faa2558ff6adc648cd748dda |     
  mips64el   |  host-python-decorator-5.1.0   | NOK | http://autobuild.buildroot.net/results/4c98a9d7b0ece6008eeb8a9444113ba354993278 |     
  sparc64    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/91153d69e1a2e1a0071da2025fe7c42116a071a5 |     
  riscv32    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/39db5a7ad87a0db70b20a745efa980d156a69b82 |     
  mips64el   |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/78429ee39db013d53493100f53f359c496d79369 |     
  mips64el   |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/6d6efa7aec4f6acd336248e72f1de0d16fd023f0 |     
   xtensa    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/bc7351ccddb6a327d3754e39d78a6e8fc27ca438 |     
  mips64el   |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/51c643d7f86686e78b045fff05d2c35f497a2618 |     
  riscv64    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/cc5544e0ea5044063a498db2a0f5aa8d95800336 |     
    arm      |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/defaf252b3a479aa53cbd990dfbaf990ccc339bb |     
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/37e456f05c63d11e52929a44c126960fd2d6d633 | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/e9e0729ba5d8951d53729f7cdb913cbbfbc1dc26 | ORPH
    m68k     |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/9a19a077c8161aca39abe25595c5a38c20d85715 | ORPH
   sparc     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/f01f2384369c3b0f2192f1c8d8be4001ed9a505d | ORPH
    arm      |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/c6689a077e0e698a6c0f02592be670cde461d74f | ORPH
    arc      |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/7fdf8999883ab62fc1bd2c49cb020e9b773ef50c | ORPH
   nios2     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/498f22f3cea954c25633464254ec2aa68926aca4 | ORPH
  powerpc    |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/6d1e08b683b9f10001c08eadadf7066acfb948c5 | ORPH
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fa23cdf0d454c2ad11af3cdcc2810cd442918667 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d314a71217b2ac43de3434e0b037cd038ae062c2 |     
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ab7bfb15650e309a34f1fda1ecdba545bc7b23ce | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/136e192b47a6485dd03924c663e91ee1df37c35a | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f2d5fd894a1c011369cd7aa15762e4162740b34c | ORPH
 powerpc64   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d81f1413c90608ade074ecda412866e4aa3d41db | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/3ea08391921aaa34982d8f0c5ca262d11be055ec | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c2b93ef2c73daede6a0cecb7d9cb2dc37de5bd23 | ORPH
    m68k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/eab44622f8d8ff4fbf464b5a98856382f019c2cb | ORPH
microblazeel |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/4c73140906f8a627fc1baa8109085839766834cc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/449a731c0a1394c28f519e341ea145cb42af012d |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/159719bfbbaf0177f35b58efb0c3ebb0d6c5ea5e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f44184fdf14a1634896e2e4401f25525896e9829 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/ce0ca7f580e00509a953ba548e63832fae5ebc7d |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/28913f66eed7fa8cbfd86faef8519db50c3af409 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cbbc2f53a741f0a73c2b79ec8fbb0da6b84d4b15 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d60371e99173d5384bf44ea692210743a0ed37f4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/682732da19dd34400d3a46e6b7dd9d44afd0028e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/729b46a17876c739069aa01877f73d349827dd25 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6fcfa8440b9530646c773cb0c8a9522244db11d7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e6c4c8a81e490be9b606ec0d9d0787466d4f6dc9 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/63706be66dfb0e9c74e06b005c8a73a1b892c9d6 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/fc14ae68a54c4925a69da6ca63e0a9d1f40ea892 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bbe4de357cb3cbd56e762b5d513fe536580372dd |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/229e7ad803ddcc47ee83d67ffd562af45f931701 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/ebf6b8f3f2d29da68e48a9dea880be3271bb32a9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/177810f859a9055e04457201b2334e7c32020529 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/80a25fe555c6e37018018871996b07e7ec73817b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6c6a04cc1349b59f33bbef5243ada326a317db0e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 5 
               apcupsd-3.14.14 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-20.3.5 | 1 
            qt5location-5.15.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ac1eb457175ba50a1a270124df85397ece4ae3f9 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fec42b1fa3be63455ff4828b3949bf172baa2d48 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a2d2d46b90332b1836ad39be94f1409c1c8c5c7b |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c40980c8bafe0435812501bb00bfb4d9aece6205 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/595a1a0303500bf272bc70accb955519f4b1d384 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ad080c15c44b7b33124809ccd3c9551a034cc5c9 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/264e558546131e292fb308789c4ff1090c9ff2ac | ORPH
  mips64el   |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/6973f1de9d473c18694e70de344ce8e2dc32a9a3 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/75a079362458c25d331d607c3258b8fba8075eca |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                       unknown | 2 
              fstrcmp-0.7.D001 | 1 
 glslsandbox-player-2019.08.23 | 1 
           heirloom-mailx-12.5 | 1 
        host-sentry-cli-1.57.0 | 1 
                      linphone | 1 
                 python-uvloop | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/0884613497e43d89faa3f702431b4b07633ee6b7 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/093b2edbafbd3ae3febd2cd52c46a1cee1f4e770 |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/734de2ca1e7c0aa31cc7582ccb4c89f955d4ad4f |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/120733362327be7696a39eb6c281a5d070c455d5 |     
    arm      |            linphone            | TIM | http://autobuild.buildroot.net/results/387e679e169dd36aae7d51b3835fe16a754f30b4 |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/ad50929f21b0de8f71a4bdf0c44e7bea19b6b692 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/02e72759ee1658d6ff0cfc386b3e8ccbacc25d82 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/50bca6d1069237a729a46ab67e25ebdf426b5413 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cbebff1d64685597a1176726fb7a6a34cf24f06f |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            qt5location-5.15.2 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/71d8b71fbbf4dbb8cf2292dbb6be0d0424ca7f4b |     


Gitlab CI results for 2021-10-13
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
