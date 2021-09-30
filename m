Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A697C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:07:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98A5F615E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98A5F615E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59624400FD;
	Thu, 30 Sep 2021 07:07:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68K2XBekcBd6; Thu, 30 Sep 2021 07:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A3B8402D6;
	Thu, 30 Sep 2021 07:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CBBE1BF297
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C12B84031
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smrIE_C07u05 for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:07:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D10083FBC
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:07:46 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1AB5140007
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:07:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Sep 2021 07:07:43 -0000
Message-Id: <20210930070749.0C12B84031@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-29
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

Autobuild statistics for 2021-09-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 29  | 32  |  0  | 61  |
  2021.05.x  | 22  | 13  |  0  | 35  |
  2021.08.x  | 22  | 14  |  0  | 36  |
    master   | 69  | 116 |  0  | 185 |

Classification of failures by reason for master
-----------------------------------------------

toolchain-external-bootlin-... | 44
          linux-headers-5.14.3 | 13
     toolchain-external-custom | 9 
  host-python-inflection-0.5.1 | 7 
               usbredir-0.11.0 | 6 
                 wavemon-0.9.4 | 6 
                host-odb-2.4.0 | 3 
         python-psycopg2-2.9.1 | 3 
toolchain-external-codesour... | 3 
toolchain-external-codesour... | 3 
                    ffmpeg-4.4 | 2 
                     gdbm-1.21 | 2 
                liburcu-0.13.0 | 2 
                  zeromq-4.3.4 | 2 
                      bmon-4.0 | 1 
                      gdb-10.2 | 1 
  gobject-introspection-1.68.0 | 1 
                      iwd-1.18 | 1 
                mongodb-4.2.11 | 1 
       python-matplotlib-3.0.3 | 1 
             python-pip-21.2.4 | 1 
            python-ujson-4.1.0 | 1 
                 samba4-4.14.7 | 1 
               target-finalize | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/b86cc41e81d88b417a6875a626f67265ac1ac17c | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5ddf2ef976933e598808a4ee5a8039e3a9128f0e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ebed332362d1b87815a7a47cd70fd7042dae00b0 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/56bb0a8a8cdef35684e0e15c32a0e0020e83fa73 | ORPH
microblazeel |           gdbm-1.21            | NOK | http://autobuild.buildroot.net/results/5dc0e2667910f5a656b022321525ac8072b36a6f | ORPH
microblazeel |           gdbm-1.21            | NOK | http://autobuild.buildroot.net/results/b35ccdf734a02f0866fba7d86d44a8b452601607 | ORPH
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3db10c42662fcac82554c2cf7faca164bc98648a | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ef6d0aa9ce783174fcb97f1ec3605ec986b4d281 | ORPH
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8f5866a8502812feac6ccd3c3fc15262b885b4bc | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d37c4271e66d923f7af6a4e3dbad603fcd1c8119 | ORPH
  mips64el   |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/3c44c91fc40e02259a8785c408aeab08b7d0cc30 |     
    m68k     |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/454f348c613172386f3abaabc7fe9d975bb84798 |     
  riscv64    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/93c51aacbba2894b444aa7e820393c151ac89de0 |     
    arm      |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/47eccdf0e450c43842ca868ae4f0c7559c609166 |     
   x86_64    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/5c2c88b9c69a6a3f4f9c4690bc65cb61baf4cfe2 |     
   nios2     |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/d9e903ac9012a8d02a7b642cf2f45239fe54dd4a |     
   sparc     |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/e5aca8a1417f059947bf4d92357b43d1990a964d |     
  riscv64    |            iwd-1.18            | NOK | http://autobuild.buildroot.net/results/edf0c85f45feb778c4c7d90d399ee281e33c3631 |     
  powerpc    |         liburcu-0.13.0         | NOK | http://autobuild.buildroot.net/results/435d127728b014d565dd75861f87e18716f9fe5e |     
  powerpc    |         liburcu-0.13.0         | NOK | http://autobuild.buildroot.net/results/f2c9f455892bb08e741b719ca3f843edbfbefb81 |     
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/0abd6f65f27b3605ef7975b226c4e0f12bee9590 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/01bb27fc032d7146eaa48c766458986b34f01afe | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/0fc61e99d6af2546a1cebe44db7d017c6207d6fe | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/a3eba81889e91a0ef3788fa05200e4b49f37c38b | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/1b14a8e2b6f1d2a0a96f104564970db91de096b7 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/7f711d5b44c5752c158c1ab8aa47ae06f920c800 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/92ec54bd62d0438c8c67af71264eeeade0151433 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/1cda295ba45af90075d0eeb75f3847a2dda0d154 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/85c5f493def64cb50060fb7b205ee1b4913f44ec | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/42e4ff79f288c5807c003f0b545991826035c984 | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/774c3bd1e14655e1e27e2aff5c14faeff8ddf9b7 | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/f5c6c977e958d052e33ee4a8b3edb7cf41a51c3e | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/4ec716d3c9d4056265f3c9d073610e14b1de1958 | ORPH
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/198b44d0dbd9e4ccb08867c9947df5decf966a66 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/b32c0901782d5b8b5efbda8c7e09d88ef68c8b37 |     
  powerpc    |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/00331b5a0cdfb8c6c365764444660eba1a1a4758 |     
    arc      |     python-psycopg2-2.9.1      | NOK | http://autobuild.buildroot.net/results/fad30ee4d305a8ffaa8f5fc8f3d3d259a6a6b9ff |     
    m68k     |     python-psycopg2-2.9.1      | NOK | http://autobuild.buildroot.net/results/f8a2cf9eea500e2c617381840b849225f12b56f1 |     
    m68k     |     python-psycopg2-2.9.1      | NOK | http://autobuild.buildroot.net/results/6fa667d582879584f2027dd1dc74556d59daef57 |     
    arc      |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/b180cb4286b9524e1547caf1a76d8761e17e5d43 |     
   s390x     |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/498038d0b165ba37317d1b36adab55d3d62e8e02 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b7c376d8a28a9452c00b957b6a74f57f9653be90 |     
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b6e2fbd84e3a5cb56652babbe29b7618ea9f36ec | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f252355b6edb0211cc2cb975bc4bc53d51815b2d | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d6bb5882c755d09daa454ec63dd9344b8c3487a5 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5bbce91a49b3a820cd3dbdcac70863005295c931 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/101dca8243fbacfa5c4e190a13110dcf8f70c4d1 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4f3f1b0b3bdd51460ba0fc1ce7ec043fd8abcc8e | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a7e959fe2e04a7f0522ee3bc0b5049a35beadd57 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/644119cab24a964c056966816a874d2dee42d4a8 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4f38f7f6aa1ad4ca61fcf82fe83eebc221f551e0 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fb1490e9ce43bf240fa3d33f6018cd8faf0c5813 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/06c375324e3c1e277d102d69418a019dab89e736 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/468e4d4022b315689f699fb619700b26f2748676 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/82dbe30e71920fd0beae38244d8d9af5dbe89183 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b088b2fcabeca0bb29ecb758019973083db575ff | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d901c8e6257ff3e5c52876f540c064eda1868372 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4b734ace2ac0051bdb0ab3657db7651d9b820047 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/773f0429d888e730ef4dfc87adecf1d40b160599 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/91cfd47dbf0bfeb9eda3c7d4a0e78cadc9741d1f | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e9b20fd41ed38f1b955c2a6f4a6294c9f0cc696c | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d9901701b94c40d1eb6371ce5c7dfa39f2bbc72f | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2f693e1f6019da465c1796f1e7b584290e975504 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fb8546ebce8ba5413b9c8c07f188ffbdd540135b | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a3792cd05c37755c4fa20c66d498245c80c271ad | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/67d57af627996ffa962d959cf8d4a44ce60d1dab | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4f174cb42e386f9b163f25c2dc5c5598c98f43a6 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/aad2b03af872669fcc7e7e5c750413729df39a10 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cfde33aac1756b5c91a85533d3247d004e92e541 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/582d92d4ca371e6ed15814ee89d2692ec932a918 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e20b1c83914461083660beb89da743c96baa1e3b | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/de63538942878cd0203b863c48c3ea779c7b498c | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/503baba0bb10d5c0c88a50663ba3f3f617366086 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3958a7d4793454674bace4d0ca6c2b4e5ac2acd2 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f2dcce9f60d131593dd868c41a2bf464ad73ec9a | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5a4e802a1069c1222733b0d11421e37911f440aa | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1c477ba8a9684bc804bf85d9051f3aeedc39cdae | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ea92e9f0e5b1724161e17820c22e5d7a0289cce5 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ca77a20b8cb7f6d80c0a04b758907948a3faadc2 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1cfc0d9a1e4aaca886768a1f7e260c1e0b68dc1c | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/32609b3de0315245c5b01b07e497e2d6da2c839c | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b93aa0e777258face9c2be1108a61d1715e62c8c | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4418cfc12b8f660fb8d4914e67bbde7639ff5160 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/33dc15ae890693d485ae08c9ac1d628635ff19d1 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c5441e2f90b6a57c8c54ccfb55f9d27e1ec290f2 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/479d7b8206d8203119b9c0441cf21db9e7df1bab | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d12fbb652bbb338ec93ec57a64b5d2ee7052c4e1 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/43273d621ad44c68f97301cd431e724a5496d44b | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ee6423fb66a68c2b0326db699a922a275ea76697 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c4d7cdd7685b8c2fe4a7867b03cc9aa829699808 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/421f1a2f720c08a6f29b9af8da151844de44e8f8 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/03c18e9bae0f4e764df38bf12d13c90ddda02a6b | ORPH
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/63010739238d2c096e9fdcfb178be3ebd3032fc6 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/72c376084de12489696cc3c9b73071c8701e9c01 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/97b9d575c0adc01b2a50802e3f23678c89a81743 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9f2873d5aff9c40165165c2fe6639a21b479b37b |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/37fb74ff740fbed6b86b03468d99160e6edc20e5 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ce65c678f962fe624e61dc025cd67baa82a9fa6e |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e9cc8937ba3fe1ba7c749b52aa58ee370d4e9e91 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/5b83d958fa6feaff65d178a60d43d5b18af9ccf4 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ff941585881131fc70ea73457ab8bfad1bd7900c |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/131c566afefecc6c0ec4e75831166ab1f945898e |     
microblazeel |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/baa58667920cd50592bb46313587db5df29dcdcb |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/73ec4826bfb461e9af6a7d28671b25c39b68473a |     
    arm      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/9dd1604e2288d42ad6fbca28852344a2c1ef63f4 |     
    arc      |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/9252655bfd87f67016dde77bc8217ddf4b0c1f18 |     
   sparc     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/1e9f0941bc6b2336e071491090c9ecbd3f813263 |     
  powerpc    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/9cacc9be84efdb2fdc87c6a9fc2fd73c07adb980 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/534890eb5f8484bc69bce5781853779132169b88 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/be65ef378ad381e15f1f92374b53f99a97f2c950 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c8c84caada46487b95bac7bea8d1823df9e667f8 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c7ae7b62c21c0a7a69875e22856c341ecb8deca9 |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/998c1ea480c0619c0c0446c6bf2152719ec02918 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/332424f38196f48320f1d800f0bd43c83602ca88 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ba141f42c3b24daacf9a525f4c848dfb00523dbc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b57afd0b6ccaacf8dbb7a0e5226e7594f995ba61 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

toolchain-external-bootlin-... | 11
         linux-headers-5.10.64 | 8 
     toolchain-external-custom | 4 
        host-sentry-cli-1.57.0 | 3 
                mono-6.12.0.90 | 1 
                rocksdb-6.13.3 | 1 
toolchain-external-codesour... | 1 
toolchain-external-codesour... | 1 
toolchain-external-codesour... | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e877f189c770b94215848cc82441263b5a56b723 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e055ae4be2d8ae099811dbb3969b154a423e3786 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/af22966e987fd8796eead11980816e493db2f3b9 |     
    arm      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/532ffb7e22fcfad1c7103776dd58a5f2b17a2af0 | ORPH
   xtensa    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/b4d6626b786d58f26613d658ce765a3bb2bbd06f | ORPH
    arc      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/5a9c71e51341f252d2605abc83bc46e147b93e8a | ORPH
  powerpc    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/8c802d90b315ce5c4b74ab55064cc33da4f7c1e0 | ORPH
    arm      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/e215ef8de91a46867021b8a28b51830112cc77d3 | ORPH
    arc      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/def2b6a27f69920ee282741dc8a4a5156372d9ea | ORPH
  riscv64    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/53743f4b8e7475d1535e8edee5e3ef7c83555d43 | ORPH
   xtensa    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/4b70cb4c53d70a4fcbee09551665d916cfd8468f | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/8562c43f310275728b8ef77c65f274a161af3ddd |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/83c5ed8a38b81fc2a7643070691d176e224bbd9c |     
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b378a5f5bdc0a68f074bf7deb77d62a1362ccf11 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a64cc0a3c43d0fd0cd8b87efd4a4a13cf83a7090 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fbf823c0bfb1e8c749fec85fe007ce5530b10ffe | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eb204e56b9755661ff9145142a28b889d5ee9481 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/289bd30f9a4101e91e22600ac02de4423708e6af | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a8b42c307363e92d511dc450812cf7954831d7d0 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/28905c3ae15e9e77f4e3c61109a029706c29af23 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9395de5d59bd150dbce48de56051e43ff5edbd7e | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fbac956a8c6c64aaa2e7fa9e54ac8637ced501b9 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e2cca877bdfb0982ea57ea4b1635fbe984f6613b | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7cdb0edd315e3a220361b7a9271ab5f07b7e3f81 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/34da58a33406c395b00e6eed0c0f10e230edd44d | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/834d002ecc89ddd5acea0b0f786d121baed8aada | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0074e41b02c54c2c0435044dc96b03f2e45be498 | ORPH
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1d9417793ee2034d228f3fae8092ad877de036dd |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e3dbbd5edc52aefd7c975b4a22ae40fc5c60be9a |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ad2d36a044bb0fd9cabf974ef97e2bcee1cdd35c |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/5c48ab8f3d93dbe510437ba21ef14523a470acc4 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/8440db2b374011f61d5ec6815d74dcdfee108a92 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

toolchain-external-bootlin-... | 7 
        host-sentry-cli-1.57.0 | 2 
         linux-headers-5.12.19 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d35042ed4845f6a0bd53e92d7ee6f470c102566e |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/11fda93ac3d6e7bfbd620454bde1d3c7e7a9558d |     
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/4f412c41edecb1e8646806914664b549a554cbd8 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b61c0ee712f8d47da26117dec1d5beeadec62977 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6bf3e7551f687517c3fcff8fda05fb25f2d63989 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/726f2df92bce1cfc8a6364171634d425253c2cd9 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/26cabaf2fcce33947930ceec5149d28a9bac2ad4 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6d371470e5da28c9fedc1c65deab563d9b4bf670 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f6daf338984c5eb14de771e028a46ff7974b1d60 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6a9ac49db84e4791ae26092db6b598f7ea317478 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0917f9fa40875481685830e54aa2dd9c28f09936 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf224be0ab20c8059b2798fea29e979fd7f8075a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1b654248bc14add6cf34ebb43ff0fe953d403745 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

toolchain-external-bootlin-... | 8 
            erlang-jiffy-1.0.6 | 1 
                       gdb-9.2 | 1 
                  ndisc6-1.0.4 | 1 
                 systemd-249.4 | 1 
toolchain-external-codesour... | 1 
     toolchain-external-custom | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/efa51f32946bb99d1dad918cb807ad345a3e30f9 |     
  aarch64    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/96639cf6b21630f4f6455a86b2683887b52ec3ec | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b2d2aaee1128cffabb692e19fc2dac200109b765 | ORPH
  mips64el   |         systemd-249.4          | NOK | http://autobuild.buildroot.net/results/e561635421a112e7f8525c769eeb03f1b26c48c2 |     
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cf99ea90a950785177dbb6d7627e202c19e20d49 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/abbdc51e9396f58edb3757d514f6324852a5606b | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2379a93248c81694c8d241b1d1253f8209e50723 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0429d09b37e415cb61b98e29a24614263aa1c0f9 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d6e6094bcaa4f9e92c52e106eb64d720407fa5ef | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/92ba4e58e706da175c0d225fe71584c0cad16368 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c6233c41008b8d3c0f7cffdf59a1e580cc5a615b | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/768a1b8452a251aecd1bc616c2fd7fb4384b0fca | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d7d55bb028abf37c9bc56dd24b9efe4878144ca4 | ORPH
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f0a5acce707f13e87b844c2ab19fc5063577696c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
