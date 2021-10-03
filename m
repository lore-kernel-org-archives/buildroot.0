Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C2DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 06:57:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B9361B27
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 06:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8B9361B27
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66710608F7;
	Sun,  3 Oct 2021 06:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bsc2MdsNJIDS; Sun,  3 Oct 2021 06:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE6C61710;
	Sun,  3 Oct 2021 06:57:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9DB81BF2B8
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 06:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C435B61710
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 06:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UU-3zTaKr0lP for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 06:57:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 851A9608F7
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 06:57:40 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 678BE40008
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 06:57:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 03 Oct 2021 06:57:37 -0000
Message-Id: <20211003065743.C435B61710@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-02
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

Autobuild statistics for 2021-10-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  | 49  |  0  | 77  |
  2021.05.x  | 24  | 52  |  1  | 77  |
  2021.08.x  | 22  | 57  |  0  | 79  |
    master   | 52  | 229 |  0  | 281 |

Classification of failures by reason for master
-----------------------------------------------

toolchain-external-bootlin-... | 96
          linux-headers-5.14.3 | 37
     toolchain-external-custom | 29
toolchain-external-codesour... | 17
toolchain-external-codesour... | 9 
                 wavemon-0.9.4 | 5 
toolchain-external-arm-aarc... | 4 
toolchain-external-codesour... | 4 
                  uhd-3.15.0.0 | 3 
                       unknown | 3 
               usbredir-0.11.0 | 3 
                   gstd-0.13.0 | 2 
 Makefile:740: target-finalize | 2 
toolchain-external-andes-nds32 | 2 
                  zbar-0.23.90 | 2 
                 diffutils-3.8 | 1 
                 gerbera-1.9.1 | 1 
  gobject-introspection-1.68.0 | 1 
  host-python-inflection-0.5.1 | 1 
                liburcu-0.13.0 | 1 
               linux-pam-1.5.1 | 1 
               luasyslog-2.2.0 | 1 
make: *** Waiting for unfin... | 1 
             python-pip-21.2.4 | 1 
                 samba4-4.14.7 | 1 
               target-finalize | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/cbe215354429b4147a2dbd9181a46e836ba74055 | ORPH
   nios2     |         gerbera-1.9.1          | NOK | http://autobuild.buildroot.net/results/ae9d1580ea3f759651a5ff9656ae2136d9c3428e |     
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/7aa1cd06fcad76237b5bd9c4cc8cd974a9ebbdf5 | ORPH
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/1238a6aef9d23f0e82e033c9cb43122df5064fd6 |     
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/1e3c329dba7692ea79890e136492fac5bd632fa9 |     
    arm      |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/a2031129d33819b10ae595e93c8f82fea57de1c8 |     
    arm      |         liburcu-0.13.0         | NOK | http://autobuild.buildroot.net/results/a05cc1374d81a5a1053cd7f58af6245067a3675e |     
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/6477ccc01455a8020722c6dea48e1142ece233d7 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/a96ba6dd2346137cf59acbd91e987874fc113d2e | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/2fccf18f17fb610e3b6b88b4d40f16479355ac58 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/c897111c881bce8610d3c563e499ff6f138a5f67 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/a9516f5ec4ab3669dbf068bb7606af32014fba89 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/488e2294727a0fdffab3dfc29e6088c1ce786f6f | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/88ae4d4b4d19e26bed4d0311bcf9127747fd7285 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/102588ee47e9792d376f3ecd05db1e77d4284b10 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/b4e2455793c44f24d484787fa1d7ef7ec2c9061c | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/a0035134de5640c61a7698c554c0a3d7717d87cb | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/0c3b348b6950c168d1a72ccd8b1f7bcfc9bcb618 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/6588c3fb01a06f960bb250534d801a45b802c43c | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/36a4c5beb932849575e44b029d3f0b0f8f6e1191 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/0e46cf14440953da5d5ecffd0f0cdd12b6267f3b | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/e391b0c164d9388542eb6452d9af447eb95b8ef6 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/8f9c581d1ff8eb4710a4b72792fee3c5162c6d0f | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/712d2625f831407b1d958e6342a8ab5497b9f341 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/3df10904b73f8c491470a7ecaacc627e6d5a7d41 | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/d7d01b02e3d65d990d0640d1a4cfe43098bd2a81 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/1586116883f9611c238b2bc32c93b313f942350b | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/018e00f5d18225b6f4a79813b414beeebf066ef5 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/c3d8b0a0389f4708d30010a826736efa733136b5 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/69e8cdfe5ebdb953a72ca54f7dceed18c78b9cc2 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/e98c1330bc49dcadc0b20a5afccbc6749769cba3 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/82309f437bc06f8a3d7ae1015c24ff117f8b6d43 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/f8dc8fb9e1d8f9485f13042a9f750eca34f94dfd | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/9a71dd989300304a58f03a06cadedc7cf90ce168 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/f0e7456f19f4dc75a3c42e45ceeffec1d0b08403 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/cfa1b6bc17e988ded39d83d3b526dcdc7d020957 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/758ce5ad63c5da792d00087317909b60f8b3ba5d | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/46bfbad3430ca21606a1f4ec186080e42829ec48 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/da29160b12a0d5bc52ffd29dcfe7e893a55badff | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/014082cd13878aa18116c684127aa851be18f4fe | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/c1a91ec4af49143bde6d0eccf634b9f4daf5f87d | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/34825e8024b05d62c1fbba5d89b7410b4b250d85 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/6be26c05b2a9d9c5d2281236a8022e981a624c93 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/66ddf47e7d3d148a819b7c12df4a502c18f5213a | ORPH
    sh4      |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/4a644769da72011b06e9c6a0de6c4b317f7ed76e | ORPH
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/be0d0d1f9200eaa4c932181c8090f4201b4d183c |     
microblazeel | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/b40979878ec384c201820c93e6e2b99040ab286c |     
  sparc64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/f83955bc2717557f346ca3fdb36856de6e669c7d |     
  mips64el   | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/21f7a1306ebc689a469a7828055611f96b91dd50 |     
    sh4      |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/fc62b8ae1042d0c60a5d2c4b9dfef800ae262499 |     
    arc      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/8b1d887efa65405273f450c491166d5d1b872076 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2426b312d0d0a96d72a544d1491537a434662854 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/23e2889d6678d49d7f6bf7418aff5a7bc058ef6d |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/98adb2250d4c92e4bdd4c484b935770cc0544fd6 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/5873ad8f58153f6a807c096dedf5eae419f39360 | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/1d092ee0747c75508199c1ff9b543ec1aaffb43a | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/84282056e7c34345abdaf3cfd1d1f4589f336085 | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/93e7e32338abddc27b2299cf156b72b829c61dbe | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/70bad3e350c126783ffd9207f41d67634b3ac21a | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7fb56c2ecfad50caea6d6000eee774016c0fbf8c | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/199438960f7e4ed131e1db9c3b818a706c576192 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d8c2e332fba408a893872daacfa1037c4f5c4ca0 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6a7461e3a1cab6106cd534200eec011f0e7262a6 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7837ce35b1dd5e77b4651475b78ed3ecc5652f35 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fd6eb086e16110e45232edbe89d0a9ecbbc70c6c | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/63bccf0672e380ae710824c35968d59daf7eb6a2 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5cb496b9319925f7a40fdc595828888a174c0556 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2d0ebbff20b86d5e79f8ba07c9ffb70ff7fbf634 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/af1f5de1867a56ba36a9b5165d43ae4bb42c65a5 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/de963c16a01f889f5ae7b555707fe632629c3c57 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8efa7429ca9f778218caa9414dfcd625c2f5927c | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5fcd68d6dd89b27b9c9b7866279a044bb6a1bcf8 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6c4f4c31a3b9e0484ef462aa90c2b4bf9f68a5af | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/345901b0aca65e8d9dcbe3e5b4f64c7c5ec8274d | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2233099dffa93bb5885283b104f66010d89bc0a3 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/404c87cd50b041255ddf7b00b1197e7fa5a48a8e | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f68b346f97e34b8a0db6653bfe75a86662a29874 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6ac06bf67c3dce5f8a07cd684878619ee232cc8b | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/91d78e8a06d50f3cabda8662285a08ecc879bee7 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0951a954575030dd2f5f4b1b796031ddbab2c181 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/844b184a1f0c28df5037e6c0cdf66b941f14ef4e | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c867b18bdc2ff6151261ea727269575d8b653266 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/26401693da20ebf061491b99fd8719dbc0bad52e | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dfde2e6e3e1af8273f00fe07590c3269364f4954 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/72eff81a8b3c4fe7d1be57cd75256b3d2c6c7663 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2557cc3129d147e49f9fcb6b3e0467a6c0784767 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9fa5cf40cd3ee06c776dc01cde4b8ef269add4df | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/86f8c1c75986145ece76b4aa5c34bab27a07fb78 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0de3cfc2047ee927d8e49ef140854da5793f5db8 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/30c4596880c3dce9849302ac3ff69d9c64f35f93 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0fe212da14cc653a8b53e539a53f277335f18cc7 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/732ecdf1e162bd5b6d995f744f532166397f1772 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/548c257f4e3e9102bfde8f63ebec47a63361b078 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/90d34a33e6232884b3daf5b13177384a9c8dcc99 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ce4cdaf30f003eff61a6fe80313e43c67503fcf6 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ca1f9673334737b859fba181692d825f85a85514 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d720618f4019789b5c04bff9c66d3e68e0556be2 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2ad61a99fa169876c3382b8bfa1823fe8b3318e3 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a3de18a5fd3576a5be09059807104c277c73c09a | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0ad853ad4d4d5320f5f96ab0ddf6612edae589db | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/64270e4820cac459524bff2f5a5ddfe27f102955 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/647038f3aa77b0a018769abe0e0006cfd0393623 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/086d1efdd38b7d4c19d9ab618efbf8f91acad1ae | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ac5387556b392d28acc51ac0cac7e2844c74126a | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d67820afd4976e1cb59ae7e9dd7c945ea577a496 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/82317a3ba9fa1797393d5438cc51c462cc1a2f28 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1d4ca2918963e3c468eafefb333c7f0fed08296a | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/41485fd10b408dbe42a2e727b9ef97bffb17f7f5 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e1deabfdbb83c6b7e718c762c0c2d5aaed5129b8 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/28aa989b50cc11be9b68c5cc2f015af32076dd01 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/15dc9286db5c49e596493fc104d72098f56b7c88 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/510dfcd668f993170c07bef4522dcedfbe6cf849 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4027b5e96981e489b4a2fdfce877782db4aba232 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b0eaabe6d8673751d20633b4cf4c9ff9c8ea104c | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5ce86c27940495d522c3271ee7b0672c6e10f87b | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d86533194854324f4dc8e6af79a773823f4a2df6 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/aca36a8b7c37363bc54cfb762c63f2378c818f26 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/03041854c344fb63eb7ed90dbe464b1be8e19f26 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6a1c680baf5b02482e72aa1ed31341435d803174 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f5e035bf66bc1f77f28666af2db255e5125813a9 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a2f916f35645f59f0b384a0e0655de2a84ab30a2 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a6441dfc48aab69103729a9bef9ae41c14897fec | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2c3b91593bed637629118791ba762350a3400132 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/20ae25ecd881ff80b0a35e6959b2f5b6bc721819 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ce42cd66ea233fcb8f9d4a6337dfd813339bd1ad | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9ab6a4986cb21b7208b27b71551e11577a841d26 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ec436a6994449d6871d0b1119f4fd615f11ee4f9 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a4050ff153e4543653f647c02828a2e2d6631104 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f1ce985f956b54962d28d44f21749c302213276d | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/acb22562825edadfb6d2f90e9e5d2b7d6777dbc9 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c9b057fd9ef743db783cba680449329e45a7a3db | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2b444738b8c9153d5610a2749c683c4ebf43937a | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b4145838f2d7e7796411a9aaf9ffeef7b8edf075 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d00c44edeedc1cddad116a0dc137cf60ca24219c | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7a0db33182b40273ac45ea0a1e9ee3da1e6f843e | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/36a93a4d23126e44f2306994b9859e7a04760417 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/aedd2e65157944f3d8aec938f143e60c43f1efdd | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/97843b9682808ee169d031b2ffa2121a49eb0fd6 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b6cb0fad795f40813e275a73d18123449c5bda3c | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a7bc5fe67af348d4bc3de8d8462ed3214a4b0a32 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f3a8a5cab2247a9e530c2ab258555c3ea9921f90 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c3023cac7c6be76078bcefab87f46c3007907591 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1fb2faaa810f3b8eb2f24a6b8de33b5b647eb2e5 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0eba116f4aee2bac5977e4c575f86186aff95c8e | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/567a1f39d41ace42dbe42bb609e5a54e2be08b6e | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/aae4e7759a4536ccfb5e6f02efa2838d9aa9c401 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a0489fee0e50e54e17c88f5fceec2641594cfcba | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/efaccde4e1d0cd1c0fdb539332fdbe8447815dc8 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1f33499f36e7cebc738e6b471cf40590218fed76 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f8a93e964fbbf32924bc131563a5807c8154b80c | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f8a7a8d4eaf96f7ffa636565a058cb296d1b5055 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/91db7d03343b26e1d8f9638e4dfc144549b95445 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d095beac854802440482c4a97a7051e54494038e | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/04c5d49b3f2b03a9648830d3496d8884a4924d27 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3bedf09215bba7c132a8e90cbb117c4a607cd286 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7d43f30c785f4e59dc07c605a312481a018173f5 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d1e7381ceaf020643f490ab71056cabded19b863 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8f70c46cfd579ce79123d2ac998229a858812d2f | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/df13d07385f5066388fd133c7b37d3364b424f9f | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ac43f56c60a2f2db52ca98cc9cbef897a4ea9fb2 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/2c71fa6b517b96496c66af426bc89a655d47fd2c | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7284531cc09d1d3d5852d730ce8390bc4bd453cc | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d31506542c8be9c743716472ec6a500c01caa663 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1d14ddf1e9374d767896d71d641e6f5ec46e9a95 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/324953d20dfaa941626c59df3bc19904d45e7f0c | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c0bbb7efa3cce42882c5ddab079c36ba87587a2e | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ecb53778bbe79b7becfb70fbe509457922798c2c | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/5be4a6923c55cdcb9a6c67c34c28f95b45a5a2ed | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/85e0b18d32459e2c9648e40ce534e8d47ae64f6c | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a359b7e9d04a4cba603c36b35a5098008ab036fe | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1933ccf6b4fcdf3c2d00f595d0f17e336730b0a8 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/efeae3a8df3b3bc835d860691b01f2fd5b2a948d | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7d466175d76003d7cb59f18a92571899ea4d3810 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/452dac526ea661582ef07fb511e41ef13b53544e | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3e20de628ccb4b7efb13c213bffdc339b60855e3 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/5d86b9501728ba2eb3542b5fb3b77e217bb8ac4f | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/fff21c52e885de4f6c5220c338d5f9f5f3eef561 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/288969664e9d44d0a073d0ed58aad518a60dc135 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f9a8ebd08747ab81b4069cccf5e18e13ab504c32 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3d973adbba5c804e9d4714399024500a0965dac6 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f0ad93b4045e60c60c444d2f0ecd076dbd5259ae | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f123481fe07b0aa719c306dd4e5a4697185c48f5 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1d8633e51a4c4119204aa33102929e97967ae07f | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/fe926a50089ecf9f755104ce30af07ef400f39cd | ORPH
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/7fa4dc245d86b0f8fe7af8a98fae394b0bdb899d |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/70ff46091b7f49676d0c9d615045899ecd337ff0 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/bfd6a1823378229bf86c8a4aca26f747a9a19dd8 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/498cf31ef6f4e2b9c7c6d4fcf5dd07d3d61e96a4 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f1e2054dfdc845b1145a1f27cd63edbf2db676a5 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/fe63f391d32edd345d2bd4b4fe84a0a23170b89f |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/132f23a48bbbc47b041bd9ab8d13177e92a3f757 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ecb663ed0a6af64688e982d21a1d121e9737369a |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/034d664135594cba700e99d7e920e19f602411ba |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/85137a927cd357ff68b89a864929b334b2100916 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c0abb6283dbe67d6ed03b801a10da4c4868b8b33 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e4c3dfb389827759e032e9e26b75ee6f2c44dfa3 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/49fd4af6e5912ba525b071e303214c1dcc6db9be |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ac63930a420712f7f865d04331b6fafffe9e7371 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1ccaa898baaad95f58cb0fb72e2365618237c46f |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/09d283085ff59d4ea37d8541b3c17c67525b017c |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9fb6c8576fd527ec74647258226906e3b72caba0 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/a3076a52c0d4d252bcfeabca815c5104b276b926 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e8a53de0692fd66dcddd7a478b04d769d2ceb19b |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/827d8056e70776254ed8fe73541b8266a487a6f1 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/12312ec1b21e0fb6f3141f8bfd83f23376e1c974 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/b3940fd01834ed48ca553c5df20fc780d3efdf1c |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/5019af53ab2a18619e1f68be605e47913669cfe9 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/b66d34604fa1f8ff7895ac8d25738284f5fff6d4 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/48c7472252443b077c1be781daa861caf071caab |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/a26d62f0a7019de101e591a7beec27951d9e8e46 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/010a1cc8561b9bbb3f2244dd6a0afd9713a1a4c0 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/2e65716d83df41d5e1b8df969c8c891ddc512819 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/87ceb419fa0f5074eadf09532d559a0809e4ab72 |     
   xtensa    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/6ae4e990568b43668674b13b482935db0899e680 |     
powerpc64le  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/9ff287670950ef772d6e3fc08803d76fb158c71d |     
    m68k     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/153e2c024f38afcc4c547a4baff74ebea99cac1a |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/104ce4dbc4d0bf85d0878e4c005f718fa52be466 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c1d843c346eea8a7459dc182f2e6f1b3c3c51ccb |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a9b749da2dd794eacfa02b78b17ad1475f7f67da |     
   xtensa    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/b0cf0a6468645f375dafced327586ee2d8d519bc |     
   sparc     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/5ebf53d958911371e294cb4d674e359e3ec764dc |     
  powerpc    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/1b22a25382acb2665f37500db3d161a667b3bab1 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e7221237fc11bbb4af91ff82a980d2ea29052382 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3e6dca377d2273b3413d9a9571170d5398b48581 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ef36c713b8fa38f2e2bdc9d69e7667ac8607be78 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b26fa3dbb71edc931b0e2cbb00ef0d188429311d |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7b734efa896e24e4e7c7d4cbc85d04582cb45969 |     
    arm      |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/119d9c312203c60895d94ee0367407cac9f4053a |     
   xtensa    |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/c657e22f0a4b7dce1447131bc40217b00420be67 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

toolchain-external-bootlin-... | 23
         linux-headers-5.10.64 | 5 
        host-sentry-cli-1.57.0 | 4 
     toolchain-external-custom | 3 
                       unknown | 3 
toolchain-external-codesour... | 2 
toolchain-external-codesour... | 2 
               apcupsd-3.14.14 | 1 
azure-iot-sdk-c-LTS_07_2020... | 1 
                  gensio-2.2.3 | 1 
monkey-f54856ce250c4e257354... | 1 
                qt5base-5.15.2 | 1 
toolchain-external-andes-nds32 | 1 
toolchain-external-arm-aarc... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/59cec15716e8a8785bb4fdf7809024c8e538a81b |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/1e0770ef149ebfacead37fe4f24879f07f368271 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/78a4c9d1877599364005f27b7c6dc45b7d686de8 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/630388caf4d87ce8a9cf4e0f0f8604b40790002b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/48c28d1e1253decc5cb2904eabc5182bb728927d |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0adc00850bb2040f947bcc670dfc4311753cbcb3 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/14738766021dc22a06ebc92777f630f7189b1a8f |     
   s390x     |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/22f4211a8e98c4c25809055dfaf79864d36f32ee | ORPH
  riscv64    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/d7230423b73aa919182b58ca18f544611940dfde | ORPH
    arc      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/cd62a32caf9171ba088e207d612ac07726c7412f | ORPH
  riscv64    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/9abcff11b5f7f0e4d4435972cfed93885b84db79 | ORPH
   xtensa    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/6d808ac3e3d0fb165b8c3db63f70aca390fe7309 | ORPH
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/dd475d89a186874b5b2708ca8cb1e7f036f96e84 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/0ef419f5e2cf23a395630fc90722a2395940d5cc |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/f71b1c5b3c756f57231a65db75f2e7184c689118 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/d68d620ba31761afb6bea1f669d24e5120ea5603 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c846d405a5df1462b0c2e6beb356498f7c1d83ac | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5e862625efdcfe45e6bef8da659eb53df3c91bf4 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ecdd6b4c2f0bb8699e235a6ea90e1e94b1531e47 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/174774ea78583b29b16e03e605e284fccaeb0fb5 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9a661fcb00a13e99b140eddb22f6f8d89e1c9e00 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d41cd0777319ba15bcd1c9b3bd827bd118881220 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/08646e6d778d3dccbe4f89c3717abe359a77b1fc | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/50360e93c638ea4815e04fbfe83840c94c0450eb | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/310218010168d42eaaa42dda70fc18f1b10027bd | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ea637cf331331ef17cbdad3eb53880b41b7c6c01 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4bfe6a07d41cd3ee9fd4141793c6e7bb3a826bb0 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3c228cedac3dd5d78eee61c58bfc6e634f616e4f | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9258ae9640bc0561684fcb7f3e04fb6018895b1e | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1c370b81fb0e2c6ccd6ffddd5e4dca6d93c3d7c7 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8ec68c3da08bc3bc29aa08d73e90d63ca06dfa6d | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1bd15037a32d76c8cc128c2f3630b35278a4d5d4 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ea60d0c172839cb2e3fe9299b19b2100a66e360c | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3fbb5c8162687dc9068ca0898a72605125182119 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7b779cc00125e7411f0bd74f1d98d3f9c6fa1bde | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/422156e03a1349d11487c1ac1ac02ac2c5f3e7a7 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4eeeff757404206e043d8e86850956ff959349e9 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/71b10d506bf664e50c3d4e1b10b6c73ab064c091 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/53c97a6fc85f0afbcbc725c5db8624db9c915e39 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8eb1d26fa0c5767dc615818fbe263c8ecf8aa6f2 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9fd03d1de06fbf3f49cb15e0030e5120459aafe4 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/52aded8e3498b5cf4f9b65826b34eb25dcf638f7 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/cfccdeebd9600be952a04292c8fc0b1f271cfcd8 | ORPH
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ac97d6676f470f10a1bcca963b5a1a5996334976 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/3474df1b3beae011683490c292476858372f603d |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/4c23c6a6d57c9674a4b2f3df7240c4d2fbd9f86d |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/443612f55eb094b673f77331db9f7ef43a034a14 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3ceef4d34791f8a4995e79ff6dc4dfb046e1ff4a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/59e1582c9c3e740c7fc6a4807fc1380496590586 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

toolchain-external-bootlin-... | 15
         linux-headers-5.12.19 | 10
     toolchain-external-custom | 10
        host-sentry-cli-1.57.0 | 3 
toolchain-external-codesour... | 3 
toolchain-external-andes-nds32 | 2 
                       unknown | 2 
               capnproto-0.8.0 | 1 
            erlang-jiffy-1.0.6 | 1 
               luasyslog-2.2.0 | 1 
                  rpi-firmware | 1 
toolchain-external-arm-aarc... | 1 
toolchain-external-codesour... | 1 
toolchain-external-codesour... | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/14752db2ef48f672023b87f9afb46c416032fddb |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8812de7b7b759ca1e717daa4c93fa331284ffe40 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cb7726444fcbe79d44f92bba1bf64a5c94021f82 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7b6bd9b6a72d1864cf7eafebc66c0ab2f7ba1db7 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/12f0f52855aa2afdea6ce1f4a5856336aa68b3bb |     
   xtensa    |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/5ea2e9efc50d4f59d7308f0ea64fc9e77bc38b8d | ORPH
   s390x     |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/64df0989bd554ea3152a7e719b37eb0daaed12aa | ORPH
  powerpc    |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/05991308292e90373d9bf7f9704ca2c0cf50a420 | ORPH
microblazeel |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/3aa36c32d5dcdd7d8a1f6d2fef6e38eba3a3a242 | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/224eeed9fbe5410a7f66e97345ded7832914cd56 | ORPH
  riscv64    |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/5cad7dec6b6da0a338154674e0f97ffce194a609 | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/a75c2712c2d1481a928f64bb2fc96f77996ffbe1 | ORPH
microblazeel |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/c19b05588ea35a0e9bdab22c16f44c9e9dcd9002 | ORPH
microblazeel |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/474d51e43660d332803e5a39c7989ca180714525 | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/5636bc6ace756702d1237cd6b3cdc67b9de392ec | ORPH
  riscv32    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/19ff4e25b8c5b3d8a1beaccef1ed0a0bc5ea18dd |     
    arm      |          rpi-firmware          | TIM | http://autobuild.buildroot.net/results/4657f5b506c0d26bb3a6c9ef0b5756fe0b254a98 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/105bdbc40a9520b0659b04e5b48e15418abdc88b |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/34f9b258b0bff47d15632f3abb604f8af1fc49f4 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/7f728a6a4afd00b76a3e8757e401747f95d144a5 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cee674287b5d077147cd854630a3df5761fbadc1 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e04de50b81ae8630f7c75f0901104c56e32130d2 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f3236f5a6ec9e86de3e23cca43d451596f8adbd8 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0c36f54caa1880e400ac3a6932ce092cbcdaf74c | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/df6ccb91c259500fe84e5481003e5a7b1ad967c4 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f094d2b0ea8430dc4b0704f5828dfce395f33243 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a25dec1bb3aedd7950ff2a319ce0e5d46a5d8577 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ac93de398b1d9df631eb75bb9f93aee211a7eab7 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a81a53b00e9da87e84d186eb7e9f26266a0eac9e | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/de26b4173c1afcdc22e0ad5fadd6d56dcf28c656 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bc98a271aaf59fade0fb74123580fa039330ab37 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b37cb97aa43fad80cde7316a07380cc93d067fce | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6b5be0fd5e7b633c566019c5e5031f935122407c | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c78e59b45d958318d90e82a25a9ad64221909a0b | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/824915d6baf4f014ca05bcce39679cb29f20c811 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/419dce207a389fe0e6836a5ffa1cd238e899910e | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/74392de8a38e823a409fd496eced24c9f2b46f33 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/db51c597623d177b68bc46ce2f00242cba12f722 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9697f2dadca84937f23305b50de4135ff0b66ae3 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/83ad8f09adb07c0071e3786ba51b3195df3eaf19 | ORPH
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/b959eaf888f52cecf9a751881a6e72fcc797a284 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c1e322e73c35da8e2d9ae5a08ae158d573622c16 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/40bfb8a7df8040f397a649353e1ea5d8285d227e |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e0251498b2f680f1ce47bd4d405574b4995a8cdc |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/eca45f3b22e5eaaecb99fb1243c05c80a6a59c1c |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1107ae73c81ed37b2a8d427d310a5af84a4cb628 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1ab56cebee14fe1d620c3160d9e476447fa543ca |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/78ac8d0436142c69526d11e99f15879f5c669c66 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/20a3a71527c90005ca20e06b80e96565f0673c8a |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9e3a1aa4a07a1678b26c76048dbd086ae02020e1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6f2de458e6980e0d5bf3147f28a58417361471c2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7888a1a8d785fb734921f1b6eaeb302d054fef16 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/1ddda052feff0d7ff6c2d89c0cb40a7026bd485f |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

toolchain-external-bootlin-... | 29
         linux-headers-5.13.16 | 12
     toolchain-external-custom | 8 
toolchain-external-codesour... | 2 
  gobject-introspection-1.68.0 | 1 
                mono-6.12.0.90 | 1 
toolchain-external-andes-nds32 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4a88803eedd6db34572d0d9b7a7c8c20d950ab26 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/5e24f6442b94096e87c77143f800789a2761d294 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/199dea46d1dc589069a296d7f7adcd342be7b118 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/cc01cad38a54aa1359c23b539ebaad889253abf4 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/f74eddb841c6faebf805b2464ac2175e7255c692 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/23dd33a612fa1f12dc4cb884ba6f8f9e18095e3c | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/9ccbc2bb620852199925104709d714621922cdf4 | ORPH
    arc      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/04b64bc94bdae557f64bfc38eef1fb9f34a5e32b | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/c3589261c8a396827aeb06a2864602980c15368c | ORPH
    arc      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/38dfb8e21dc8087b307339881904122210ca2777 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/34e508cdf99535aead4d26605e65233a7e49c5e6 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/7558731c1e00ecedba05fefd8964d6d060fd65c7 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/07d6fe807e7d4471b6e52659640c56ddbe8a2aee | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/cd8a662a9f0655373bd6fe6ef42b297340bb62e1 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/520a3adc5d8a736dcf3367e0af4f0cd95c8475f0 |     
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/10c1ae91b83a4048efa195802d18fc9daa406349 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/234cb9bdc3026524131a82ce5e67a8fa20235e0b | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d60ea23826ff8b8cad70f4d8910af6d1bb1de5db | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f29900b0c42554364066c5622549b7f0aa1925c9 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f6b213cc647dad64e1aef75afa7646e176921d8d | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/aa88f86b93de90f747e7c8ac26b6791d9cf9b434 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/44871766fba5998ba49f12c6df9c6629df9d723a | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/56268f90311a19ba5b44cfedbddb0fe7d47b41ed | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0a43d735a29300cef091ceabe16115e19251d09c | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5ab80f7ed30e6aaf8fc675a912aae7d9f26eeef3 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ecacabd9b070d0f63889ab3460ae115c8d0f8a16 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e8fe6ab26d0169d1a8eb2cfe457edad5f8ac60e1 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f8b797cb929e4d634a85f9b8fb0be777c34d099c | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a7f5b3e7ceda65580d28caeff258826dea48c173 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/220bde6407552161e18b1c56e7346635693b1b7b | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ca00e239e3c5636726035c30a4f272fc866438c0 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fd16441518674614636807ec8483b1f7626b5481 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eef1955c42dcc4dda48528bcb735bf1b04a67dfc | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3c6f5561560178a15efdbba3c2626c200f47da36 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0cdf26432dd303c29b5dba115ce9d0fae294ecda | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ee5c5d45c034ad6ea434f1cbe96ace1b027a034d | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/25df9371d4a9dd273630bd794411d30b6329744a | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/44cdbc7bef907e332c44c0797d210128dba44cfc | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/770f384a6a3edc13a16184849d11c56c410dd0d8 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ed1e5de2f4611c5829fd229518a912b28aa76416 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a6cee877c12da94fb5b02d3f5c0c03a9023f0974 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f6f219dd2095cfbf16d6db6be4757c4bf815f298 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dabeacef4970c8e2c61c72c60273be55625bcde1 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c9567ef0e9725b2e1e63afe69975e9e94d7fe1e5 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f682c438763f846c964ba3eaaf025a6ca291f816 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/159d8746c21df65730ab4c1da0f89361c2b7b91e | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/2f3fa4902b666d762ce72d96316e7b8f4a04bad3 | ORPH
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1730b45f3be31554450f29728dd2eb20981f7d49 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/747ff6b4106a8d0faa3a5dc61dc44065460e506f |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c4cb94e862a5881f6ffee764bff39a094f24f046 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/5f717f135daa5a06648aefca09e6ee8306e86ede |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9b426d1c94c673b5c44371964f5e50d5723b6522 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9cc458f0c214a3b2177fd178f06c613b48a5f140 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/35055a6dace2b7235a5adbe11a2011079436eb73 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c19a9add59f8adcc58163208287a0daa567483c8 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/7ef5cb88901afc6282804df1451cda2ee3e42907 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/487a0ba74f7059ca4a05ab60a96fe68c7b8e3e50 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
