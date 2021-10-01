Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2600CC433FE
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 06:59:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0713561A7B
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 06:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0713561A7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99442842DF;
	Fri,  1 Oct 2021 06:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f60qzCewJ_mC; Fri,  1 Oct 2021 06:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA80842E7;
	Fri,  1 Oct 2021 06:59:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 170AC1BF2C0
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 06:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB0116149C
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 06:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbG5KNQQtZdk for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 06:59:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D9C16063F
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 06:59:45 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9DA6260002
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 06:59:42 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 01 Oct 2021 06:59:42 -0000
Message-Id: <20211001065948.EB0116149C@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-30
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

Autobuild statistics for 2021-09-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 23  | 55  |  0  | 78  |
  2021.05.x  | 22  | 54  |  0  | 76  |
  2021.08.x  | 28  | 62  |  0  | 90  |
    master   | 50  | 262 |  0  | 312 |

Classification of failures by reason for master
-----------------------------------------------

toolchain-external-bootlin-... | 117
     toolchain-external-custom | 38
          linux-headers-5.14.3 | 33
toolchain-external-codesour... | 12
                 wavemon-0.9.4 | 8 
toolchain-external-andes-nds32 | 7 
toolchain-external-arm-aarc... | 5 
toolchain-external-codesour... | 5 
  host-python-inflection-0.5.1 | 4 
toolchain-external-codesour... | 4 
                       unknown | 4 
  gobject-introspection-1.68.0 | 3 
               usbredir-0.11.0 | 3 
                     gdbm-1.21 | 2 
                liburcu-0.13.0 | 2 
 Makefile:740: target-finalize | 2 
             python-pip-21.2.4 | 2 
            python-ujson-4.1.0 | 2 
               apcupsd-3.14.14 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                  ndisc6-1.0.4 | 1 
         python-psycopg2-2.9.1 | 1 
                 samba4-4.14.7 | 1 
                  uhd-3.15.0.0 | 1 
                  zbar-0.23.90 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/37d1b6547f29d17fecafca6e3948e6b9d5652b9f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/947e3e7737ea35f5f570418b73e8ae8f5ffd3430 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/89cebe119f2caafdc0e9584dd3babe3cd539a5d4 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b4d336829dba902b940f625baafdd2f4bce30ab7 |     
  powerpc    |           gdbm-1.21            | NOK | http://autobuild.buildroot.net/results/171ef43bb974e9e34d80ce70c976f45a382e54f4 | ORPH
  powerpc    |           gdbm-1.21            | NOK | http://autobuild.buildroot.net/results/47b70a294158917021898bada748288688c02565 | ORPH
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/c4be41fa08265a57ab2969de838ae0c13066d803 | ORPH
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d91bc5d3759d7fc86a7a2f32324ba1ab8790a1d5 | ORPH
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/161269c21eda79522dcb2393ec5a16826acbf704 | ORPH
    arm      |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/5e06a69b7beb6ca168bb1b9b57fb40027024e9f3 |     
    arm      |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/42ff064925e96227a2da339d0296e91c40c41cfe |     
   mipsel    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/b0f7e56fd1dfe891396adc2b232a2663a9715196 |     
   xtensa    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/e5763454b1813f402f951f5cfa49fa2dfb57d3e0 |     
  powerpc    |         liburcu-0.13.0         | NOK | http://autobuild.buildroot.net/results/ee5790ca8ac443ee8fb2efc4687deaa494655234 |     
  powerpc    |         liburcu-0.13.0         | NOK | http://autobuild.buildroot.net/results/6ca8d2de0a3811af7982eba534ff6f5e8a7c440b |     
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/aff2a2049c2ccbd30b76e1c020efa086227a71cc | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/d3107a17dad7759bd26c1c97fa9ec21a46aafac3 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/42476b85f1f32106519d6f252e3a734e385c9692 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/bf1a3b033a05d20fa15b34732920f28f62840bdf | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/acac13ea8d3b14f25d522e85f7d6c80b41e46696 | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/e4df1a38238df591e4a959f7c58282a9ecd7c8c7 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/9b9c34948d6b8e4fdc8af8e7769c356ef9960121 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/6c173b8d63eabb349a8171aeb1d6c63cb7c626b6 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/5404a0950e8f58594f529aaf329e92404752e553 | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/92db0cfeaf39af3b063dae4b1b7b1a20aabfecba | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/1c821718fb603236bd6ac54ccd1def5be24db38c | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/edbd4d6fff22e84b17ec584783a5f495ce6356c8 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/034a54d362cc176f197ed61d858985d0f21d917f | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/6ed21e04f1d2902ffab0b609e7073ca7bbc104f7 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/f86eb9a90ea32dcd313dd6965a2bb0ab3e8f38c4 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/d26ce2b87340c3bedfad17d4188d43b019245e0a | ORPH
   s390x     |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/9f1c7425e9c7966b19f350617b1af68035195b34 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/ee0caa4cad890cd21a776ca7b729b71df2d7ef60 | ORPH
  riscv64    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/a491ea234cbf095a7579b0041f07f0c73db6933a | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/43a9b37eee149f142c4bb7d6f8aa57662a1174c7 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/f477c8f8ce77e770028b694f9b4b42be126633e5 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/63d2a3f1e78dde3fa218ba29b25d60aa20c797f3 | ORPH
   xtensa    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/8d499f8a4256db8f1e8799cc3c2623e64f668af3 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/8adc5b34566f686f30f78f5f450db8373fb8d5d5 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/5d28cd8cb44701a92cb88df00bba96628762a3c5 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/48b1e9907e6b9481f73e854151175521b8986aba | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/cdfc7b70e25447bfe9ca54e48211b31428fd8574 | ORPH
  powerpc    |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/269b72fd1b3b30721e8a84ba189bf5f01c3f0a71 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/ab25ff70ecc0c282b22e9320d4d260269f8ceb54 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/5c45e4552d2ad0e8c15bc79f1e04d4f7493b8868 | ORPH
    arm      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/17c4a85187720a26d84cf1b28b5aa381eb756fc3 | ORPH
microblazeel |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/86203d9915403368612b8ae93123c60b71466910 | ORPH
    arc      |      linux-headers-5.14.3      | NOK | http://autobuild.buildroot.net/results/d5ced36ee4043b78bba33af4084076782baf0c1f | ORPH
 powerpc64   | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/d0cf4f4c01280093d3beb19a5527f7ffd0a7d259 |     
   x86_64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/34ca29833d9cb65933065e4790609c26373c4502 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/fe4485cbfeed883cc2f0250260f5ba73aad505a8 | ORPH
  aarch64    |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/4aeb361876982cd3c92d572ee2cdb6db04cd9616 |     
    arc      |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/777c0f13cc139f130d600868f515c0251be97991 |     
   mipsel    |     python-psycopg2-2.9.1      | NOK | http://autobuild.buildroot.net/results/15867d4ddbcb03f17fb9c700238e95b83605929b |     
    or1k     |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/b26edcda1bdc76a79e8b735dc7c5f8891efd0322 |     
    or1k     |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/a82f794f130b0c8d5d626c507bae2e22d15f801b |     
    arc      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/e13a828e3cb6784ca360884bbaf7bfa8376b50c7 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/ef89e8dc06d45bb31d8211b417ac7e3555641ac6 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/3b872f47a82d52bdcf3509e401d3a3e119a9d144 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/60a72a03fee19aa92886aa9906b411c8460ae7ae |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/7c3d13bac47e90cfb038a25f08cf81e375fe3319 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/60f2a9d89ee459aba952bfa50d2a031f16010c07 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/c562175183a61d408834bea62d695f8c72be99ea |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/c3e473e0266c1fe1d1a4d247f6831cc7031ea872 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/7116562f38eb75d5e75933f465fdd559df1da9ca | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/7eea5e9d6ec89c48b9c4dbddd9c91a6bb8857643 | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/a159bea7e097060aec9c698cb0cf6c165caff8c5 | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/a05c623384cad252fb5a2cb1a0a8d4b3ada8f0fb | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/97e8f9597526e957a13c1beb943037560c403d9c | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1abd9a10318d2ff8fb98a5a6e5a58982c2b2f1fb | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2b80c11c95b8424bc5d3ec9dcf0b0cc5b83c044f | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/83f2a399837fc72402545b653fc9bb5f551067fd | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bf9d26a229fef46b258dd0f2596bec5b14831dc9 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/70c4867d31eb9ade92a3516e6d9d7323e5d8bd97 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c9edbdd907562266cc1d74d8f872136d61514c4d | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9d2a5eb5f51cced75c8856bb68aa2c380aa7b2c2 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3a91030e1b2f73008a5776714c82b23e6ac856a0 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f30e2be56aee02a66839932e87ff4089a98b3562 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1cd4e79edfb805602e0ae0e1f6edb9fb7f4d1c55 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7f077f77418a50f55905ce981d3b44e88ad67c62 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/14042fb9c15ad82a42ff1aee0e0894fbb1b8da43 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5bf796a22a7440d92906a009938a8311891f79a5 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f6d13d610c8a299ef6d104fad7a43680dbb43a4b | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c9f8c8f08171ac9c7bf91d7b8d65b942bf273b29 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eff2354b746916a508de91688f368dd7cc294e87 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8642661bcb96677114bc2e234b14375eb3103d38 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c8aad1c4a390d695b5169432c9bead5c430911ae | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1edbfc2c36a872f0c7ec58cfc464a4b04d5809d6 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5bfe7ffc363265d03dd284d730e38b25d1b63269 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fc499a62ac184295a77557e7b3560a5d8df5a585 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1ffa7083a34037a05b5e89413b41badea73f6449 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/38b26947732e4100630b78ee982ce402d25141e4 | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e9c3103fc513f623c0363c83e726389f0e0d007b | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/132b120504250b6d10ad2fb1b49e69d2647a5d7e | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a03f1233a72085d0831c9d8430206c10b6cc57f0 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/35b3dbce2ed0baa60a63c234d65a9c2a7cde7d7f | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ab65cd796f1bd9c2e57f457ddb4f1eb9217f46e4 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f5d0eb24209eb1740a149c1c14c31f91e8c6850d | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/42c7fcd81c70e8651e517168bbe9e4e5c567f129 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ac0cdcdc3f1fc97e06577aa82177e6495fe48014 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/354faf8a843aaa64c43cb0a42f44ddd5a9eb6d48 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/214de28939bce35f7658a86385ab172fc7a2902b | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9d7fbd91c942f7a3b62512d24bb31d4e8b4814d9 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3b6ab366c5d7c1b6a5fa9598d9ae111b6a6472ee | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c6bc4e13c69f589a547b3f4680ed61e209a03f3d | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bf0a114c6f8e953c91b71164483c2aaf0b4d41da | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5a8316504ead8fc0f09e25253a062b5f8654a1aa | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b43a6a6129abd98058fbb22cb2b11074691bfe23 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a5ebaa3eb9cc3357db779ba127ec28d3a2f004d5 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/288a65fd5827a827f145f098b1d222228cd4c141 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4e60fdc524007f83bfc2738cb408b6a62c334753 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e3ef3fa6dfd38d4d37f6f8064c13fdbf9b0ed1e6 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/63fbdac1072feb87b1b128641264f017edc280ec | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7b4396e3eaee72627cd272708ec0ae6e681a8974 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bbbbba940fd4d06741b521698f918da6678ca3f8 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/148a458df1a733aa6640150647318c9a42602914 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5980ab95bce4cd2dd1cd98bce57dbe78e9f3b64b | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fff8a11ccd8c3871380c56152d7b16d00c81d5a4 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fe1b15052cf244e460e66e1e524f7c747aadb598 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b3ada9a382388fba808c40d3b1ed79792c594435 | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/126f87fc6fa41f633af37455d89ba220d7c0f4ab | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4e5707ebd0badc5754092d2ddf36cad6c3dafe34 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fdb7ddc023086233fa6b9e73a197dba036bd0b19 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6eec3d5f8a089db3f3fd44dfc47743d527c73614 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/22ec6a988b72f70ce9073aab76be6075cc91f4b5 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0200a94639aa3ec0e88229182351cb182817b215 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6be8b100e0220debfe1fffaec5e155e668039bed | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f536af22105538cbdaa96ba03d3dc3c97651f953 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/076312439c70806ada0fa6f44d5ba5c9229e7479 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9256c5d8a63b8619bacaacfe58d9af79b43f2a59 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a56c0b06ea5277ec89c403f1657ecf1274de3ae0 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9d488a1990a01541dce3723f259e2b3041e86d14 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8f450f2fe6adec2c1f76fcbf20f5d6e7a9f8651b | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d12f24c7ce7c04f02241968cd4ba6a049e861df9 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/75c5103d3a8bd82b79ba9bc438594238bfec7a63 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fafd4fd90861c9c804e823bde8e95ae2512426bf | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4f16e75bb8fc7e8d8667fca35161c2a96dff2425 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e8d283f76a9676f74e4af22ebc77c008566aaf18 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5fd6b83553a36df13c7a2838e0927dfd05c980ec | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/740d0e4ee1f8bdb997e0c9cb2722381d48871af3 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0be906e80d2500192a9e5e4f0a5eb143dd44e532 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/818c63d64fe169a81d294744caefe6eaf3c3f850 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/feae9d2edb3ee6aa3a0b68c138686783f8d781e6 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/017d421f9546b31ba45720a9bfeebe29a127733c | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7fa2bfad02c1f1e96ac585943f8060f98b56c16a | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6234438d4619813cd1bebbd5d1812162c9a47e97 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8098b5759ceaddec38bfcab5b2a6e335e96ae97e | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ec7ad5c67c243e14860a461249e92063781db0f3 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/070ae92c82276dfe9c2433d626c5880efa31772f | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a335d46e694e031a04bdef1f3bb0d4f1effa8515 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/68da647138c96c3d7d98d071fe42a0639a27e671 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f6e764c35e26ba7a640aad9ba0cdc19533f888b9 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5ad517bfefd34e926746d37c76a32c7f0eac76d5 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1afece4faaad6358d2345b914ecde8f8b53af2fb | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/66a268cd2e60507db04e3b54380ad2c9ea2fbdb1 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1dcf308fa7ae1ab26e996ea3f5ac87f33d5bd70d | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/20915335bd07b47887a69ee23bd0a8d6b604f0c2 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fbc765a66d9f8d62b7fbbd67bb04f4809c3b9316 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4dccd297a781060ae04cff521aeea536ac1c9f7c | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d789ab26cf579dfd16a0a37fe370f33be16fab2b | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/26f84cef88c12c4f2701eef1997c85fb3939b334 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fb35a9726ea4fe9786479da6a497b0434c98af54 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/027903954a3520159fffa67d35fe36f68907f4c5 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c37fbcfed4fa66749db27657e02ba29ce82af997 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/149f46a799c3f2db4987fc873cb015b8bb2e9c60 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fa8a6f554703d65ce3a937f735af4c2c4ec35093 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/012b0476f8040d953d1ed0a82f10e87f3741fc9b | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/527c6cbe67a59919977d8069f79d57eff1bd292d | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1b4384bf363de821b79f08768dd3304f6c59788e | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d098af5493fd2c9a0d65d36a7c25b974a931bef3 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/489b0188fc7cdee4790943aaaea2af91459c7beb | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e558f8255bd28ac29d5ee46583ccc2b6cb460e4c | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/23772933b26f9d23a3e3bb3df5d8703e013f5d02 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5a2d65ff84092b9b11704143d1e66cc6f3539657 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3006886851bd57e64dd20a986d37c73a6da29f74 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e654af5eda8f4b275d901a5efe98ad027dc834c2 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/928184f8d8466102b203577172a86ff0a946f762 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2e90a852b56b7de173dab06e78022bf3314d825e | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f2f71e7816dc4d3438ccba0b7db9ddd65ce1951e | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3a3882d5b30b859d7d156eab61882c977e115ba3 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/699765a0f2fe1fe453c80103b8ec7a425429835f | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4698a4f7b5012d00e3a9edcd7ad690fc2e9d2e88 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/357696d5960fcda8c01d30cab2f3db25179237d5 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/db407dc5751c31e9a64f7e2bed81b5b82674b40d | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8f98a51a3405923fb0e6564a8dd2247ab4874c96 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ed2ab90e64648a50c42abbb9fd322ea8beb1e416 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a6782199a74ef9e19bb7d9e6a47e457f6d85d726 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/eacc766f8ffa197443c4c0437d7d0cc701e0845b | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/acc30916ca81f8f9f5c169b9887a3569ef1be026 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/56fedabecde7c61671e7c9c921afe5fbf16d2003 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ac987adc4a6b0e13c57fc6bc88aae7467971ca96 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/566f878824a860153233121f6027b1f65b2ea2a1 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/48c1a8a861b5e37455837b512b9ca545408e4c36 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/bd4657afef130bfb1f54ee00bea43df8f68977b9 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/afa48e9ec6e6da87ecbc5ab1a2b5ba904af14cda | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/fc7703bef7859561c3ba8f2c42e2531d5aacdcb5 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a67b05c15aeac65134946d77e848a2272dcc56a8 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/25b8cc9203acc0f9d5c62ffe05e8b55e310514f8 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ef683048d46e7f77c39b92def465093ae8a0ce44 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/964e42261c0fb4e4644658bad40979bc9d42522e | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9dabf4af349459d8daa757752c3f063fd73c774f | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0ec0a12664e0efa6a51c6c09bb9e3843a2f808b4 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7ddf27f0459b8ac65013fdcd5f1fb2684947ac81 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d121ca66494b49f8ab45962a016116999432fd1a | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/bb7740ebf10257d20b1ce9eac75dea4ca7d8fdfb | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f85d850a8c3be56c85daf3fea7159078fbf1c7a7 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/95fc8dbf522c78296af519badb92e2f952a24faa | ORPH
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/af7cbaedac008cc29c975e472889ca986c5ea264 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/a1f03b9ebe16ebb069979d247f25c86afc56a8ce |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/a90d3aaabdb5038ceb30b53dab150a9895339a0f |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/47d102c7d45729d566172f91e87341286fbcce7d |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/0fcf4e61c92c5f71e7de582d57b1e81d673318c7 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9db18bcb4a310d6cff9ee73615cac848eadbde6b |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1b240e351e2f3ff2bfa19c724042b138c129dd08 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9f7f5a21eca4ca1ffc3b6ba3ec044f3bfc8d89e3 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/89205f8f5681485a963ef163f143c64ca40b4ead |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/08833ff49ce10168382f3e14344666edea5892ea |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/eae8d6b9e7b4262c7e6f5cc66b4a613eabc91f5a |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/5e5afea91af8bc8afab9c7e5329263bc87991464 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/ec84c1154f556815207242f54acff1dad4c7ae54 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/368d5d6b6da8a6253574511cac723d8b5d25f661 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1ff9387ef83a9d478e509d687f0ee4879de8734f |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/3c776bb0f625d1ae5a6867fd0cad9d114f66fd68 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1d2eda68b305438edfc571d6526e929d956698f0 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/33b587d5092c06cc2343b766d0d929f348a09e10 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/229c3c7f4d5e33010655d6494c19f86b6533e9c8 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e36be2c0efaab4195d7b40a32e854da845df7945 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/967226bfffdc2aa22a9a30f4aa318ad7d0b1f982 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/50a8bb0a5f111bd9fddc7139046c8c62389d2e12 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e562a5a8ef9a70557d2fb4dcb046e2e359714358 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c3fc31b9196871e6a7fdd202c9904a18d03781d2 |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/040914ac120bd8bdbc1d0d8b5a4018e3529fb72c |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/4086a212d623b047e99ae8b3befc65df210cee08 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/58db822b54b1c5170aaa5f7700ce6027e72d2b0e |     
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/08f31db8afd892a701d24acf110e6f173b24541c |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/3ce88583770ad185bff427d1d582fb1a277cec88 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/b8941e657d5b9cb6266a60eb02ce0f1293b66256 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1ecf8d913857030e0b3037341e137fbc49441937 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/47ce280a3e3d9529839e11fa1f15cce1bd5a2aac |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/4327f0fd7a9a6f323425859898381daffecc6262 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/09eb0f411ed0a4ccd59ff2d047e0c70a4113bb4d |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/b3c2f14d46e97446117e7d16b00a968acb561dc8 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/2013b3809970eb04e66c84c39ecc36261797159b |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/20849c875b62eff26dc2ede693488e5cd50ffa3d |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c879f678200e3bf0337a8e5871cd6d8790729a14 |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/9abeec9a5f138706493902076ae8fa8552ea9347 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0cf10f6d4e33662e7499d5846aaf39c27c352e6b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7608116ada27492caf565081a7df891af3c40d5a |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/081f0b8ee334596ccfe8b900638c73cda65659aa |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/015c28f3eda39630b64b7297600cb8423c300338 |     
  powerpc    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/2657832d0b3062a22c6a328fb6a8c18d2ec7e0c2 |     
    m68k     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/e7900e062f8602853e28c878b9ff0d6f7bcf0a34 |     
    i586     |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/85c283a802120a170ee7d115b8ab4e31d245f424 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1cb867b7a473dee947316b6724fbbf87625bd4b8 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cac3c63e3a11a0525036d1f9eb2db7ac719fba9d |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e9df6422078248c2ae7f01796dda570f3971a36c |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7f0c0a0cbec14912d18f25e98664935a5cc67970 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/65ea18ea25a057b1c2cea7d1a1c2408ee51470df |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/253db1d2762056105a0bfcdccc9043a68e4199c1 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7a2fb0c8e4d79329632fdd412907924bc9f50fc0 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8179f1bfb90aca1880110c0a50422496339dfa4d |     
  riscv64    |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/aa2aca718d2f42cf53eb3852b08429e4058ef5db |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

toolchain-external-bootlin-... | 20
     toolchain-external-custom | 13
         linux-headers-5.10.64 | 9 
toolchain-external-codesour... | 4 
toolchain-external-codesour... | 3 
        host-sentry-cli-1.57.0 | 2 
              syslog-ng-3.30.1 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/576cc3a4c364bc3e0c4ed43f9693a6c5275a7f50 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/17bfda4f5d171cd54da923091c1eddfdea9adcf5 |     
    arc      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/fb292e8ec5b05a00767ab5b58a52b20c1b244c45 | ORPH
  riscv64    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/20c0163b6c70c8df740f0af286097f89402121a0 | ORPH
microblazeel |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/c0bd47f39dfef1954c2275fd005859e84a415636 | ORPH
    arc      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/5650b5566974da9daaaca6dc34885f8d0c1a60b4 | ORPH
  powerpc    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/363206485781c3a62fe1928f4cb0f0a2f2891d05 | ORPH
  riscv64    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/433656928736cb45f67d92f189532a4e327727e9 | ORPH
    arc      |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/b63a11fef40252ad92a8c5d2e27531427200e285 | ORPH
   s390x     |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/ce9a719674c009b4dd491f6fac1b1e4b4db587c2 | ORPH
  riscv64    |     linux-headers-5.10.64      | NOK | http://autobuild.buildroot.net/results/66b4f01d3c7250c9575be1ea8ad6198c3e1bb912 | ORPH
  riscv64    |        syslog-ng-3.30.1        | NOK | http://autobuild.buildroot.net/results/6b6acd4298e3fdc51a38f9aa5f822098993842b5 |     
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/780664ac764f248a520e1342ad3bd714b3faeec5 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b89b692d7564086e88dda9aee5347e91deaa4fda | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/752bbd7011d548fbb299f5d2367fa90fc2e625cb | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1877aff15280b498f8e4161a942be49b50914ac3 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f434830ef98fc6241e501541dfae2109cb33dac4 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eecb54b809d871286410ec6231f7eb7192b4c0bf | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2cbcffc2a5383e5a537278db3c683a2596539e65 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b4eba43f1b6b297399e5b9d83d56c7009ad05572 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5c4e899f64981d8146fad4f94d357941d5a096e7 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7a3337f6d26e56db107a17e1d5e95aa45d4cba60 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8e36a0c1501edd1456027af2258118cfa9af206d | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6bb87a942c87db555fd0e4e14675b9acd97cbb81 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/09e86a65790f5f3c74f742d59850caec02a0ce00 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2420d2ef8274876cc3d65bea53f1b1fdd15f2f8d | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/50f4cfed571aeeefa8448c9bb8ff3a82d2d28db7 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ba149540878ebfa2569d4e8ec8939f07a0549f7b | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/582ec23a13302a4bb9df1fc68a1ccdb6b6ef9a71 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f51cb7939cb351e26e57fcbe191a217c66f01daa | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9c212797be902a67682a75d0f4c9b06001f4ef64 | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5f290bc115c693b5cec14a279e811fda52ab2fa6 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/e33f11f23ee9f3ebc3fb1b25e4554a992e5f8d55 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/e1b8810e7071457d13a45b542109459028ad371b | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/644afe12eb16f119ab08a872dfe1315f9027d890 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a1b9fdf7f3f7293b4a90e11a1c8882f5e609bcdc | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f98562a850c2cb7710a99b187cd2112a7cdd830a | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/de98b4d028a608f09e6e86f9e4bef9a414ec3c20 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/be3094322af1f288f0893d3cd1da99a25bc4ced8 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/308c0e0243b019c8fe7524664426b8df8c9cf0cd | ORPH
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f200262d8695ae7fd794ed7ded6b02d29e3af64a |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f71e3c674e467675a6d850fa8e614e7562e7b8c5 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/98197ef72189aaa8c3112a2964d8175375ba13c4 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/6380b10f6d1265bac0695f595094b34fdbf4f019 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/26256b3d1213ed576d2a5969e3c77655987cfce9 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/eee1e51be9b86b27b4f731451b332bc6f4fc4474 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/08e8003192dc4ab61d42c95b2ae84da0430ca152 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/8380dcdc9b79b853fc57775af8fb409d4d2055cb |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/379649bc2bba73121de5294e3f02508cfa9814a5 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/c05ae57ae28ab1f4217bc7d335dabfc7fc65e3f0 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/93ba897c22a3b3714b3a40c3c9ca4fa6672ad2b9 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/8eb9997f152d7ab1ac72e76061b892c4741b6137 |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/753162d18425e5e0f0261396cf44b0401fb02a9b |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/32b9c90ead50454175888fa86cdb1e6bb9dfc8d9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/066179ec7395dcca393b283fe1c2795be6a3635c |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

toolchain-external-bootlin-... | 19
         linux-headers-5.12.19 | 11
     toolchain-external-custom | 11
  gobject-introspection-1.64.1 | 2 
        host-sentry-cli-1.57.0 | 2 
toolchain-external-codesour... | 2 
toolchain-external-codesour... | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
            erlang-jiffy-1.0.6 | 1 
              gnuradio-3.8.1.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f73fbd983cb97285507daba4ba8e80c74a47b253 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d2389cf05dd03438dd32db2c0a49a80844c633c2 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/36034e9465bf2fa316e2a7bb4eaf300c062d65ee |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f241c79a6ac05f6da2e06623738f8222b5b1393a | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7e66ec2f85c9b1b7511045ab0efae8a680753030 | ORPH
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/37d8fb58fb1c05b2170e38774ad0e119d6e583b0 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b2e4fc6baac1ec20cb1c879fe7fdad1e4a26bbd8 |     
    arc      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/4fb1b1cd204732bc51da2e971d27d26d85085017 | ORPH
    arc      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/c226d7b7d3113cfe015fc9d43bcd137a56088a50 | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/2cc0d5969238c66aa39ad1dda0881c33f22952a0 | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/f3797161f5571634e6e0b33b21fa067418957589 | ORPH
    arc      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/58ef515e0a3b6ef6fcdae0214a98079987290fb3 | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/631b5e9b6ed3fbc6d4cf695b710ccdee650df667 | ORPH
   s390x     |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/2bb4e5bf94e4dc936bfd8dcce8a715e3d9b7e3dd | ORPH
   s390x     |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/cb8498e27b5406dcbc021acc5267411e41f539b3 | ORPH
   s390x     |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/1a6e12789e404bfa40ebc47581d0ae63b15a1bdd | ORPH
    arm      |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/497c4a30165cb57d52a2ace14c2448e31d37b1ae | ORPH
microblazeel |     linux-headers-5.12.19      | NOK | http://autobuild.buildroot.net/results/a78729b19a57e55842f2b13dbec00e36dcc7eb53 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/927d568e1ecf9f7c898bd0ac0ea543512c586940 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f378727711d0a834679b144f6f869068a761838d | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e69f5f686349467b374e699e13f5c4bea96634b5 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/da9d91960d0635281c848b305fe33e755149d9bc | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8bd5a6217ebf831cb99fa6c0f0ba1d33d75b196e | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/941db5995f61e309a869b27dbc2f121415de0d4d | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fdbe37e1c73f456ed3925350578fcdee69af80a3 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/76bd874434768701a6a83acd094232a19c677375 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7ffc0982cf1d17ac53b5bf7c1965e5aefeb6e7f3 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ca71578d9c1cac094a60d86660534a702852d3c4 | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/44aa608ddad2dda241e5031fdc94cabee9650c3f | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9eccf01ffc869798f8040d5a013fa6a316a51957 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/75e8c338d6c3280bb750ec1a6547157eef96206f | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fe6ec6dfc01a94652eddc9ac08675085c56bef3e | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7414d7d9ffb90798964735f2a151a8b6296a3fee | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c5b264044e848073e89dee471b94c77fa3b95e1d | ORPH
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3d127a78d1a86de3d73398d2d859f5dc91c3ec06 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/25c33e5cbf20a4b3802c9570493f224ac7d39d77 | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2d75ab62b212c3e08898c48fdc31b41ab80aa8c1 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/503658b0f9021c328f0624e49b35d766d78ff265 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/2b579e2697bbfceecfdfd93b682cfa38012c03b1 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/361d99e60889948a8b5011e3216c2acb883edf0a | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/96391a2a7f2a27ebd6b8526446998647befad87f | ORPH
    i686     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/734e09242a4ac227e05c34ef95611a30fea622b5 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/1009ebaa708c00b92966098a0c81c9a446d35bb0 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/877716b350c8d338b07ba3cb1c46784c4ee84825 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e922c86b7efaa41fce2ce676d2f9bfde6e5b1c2a |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/62a6d9f3626fbdf80f52493dc17ad8092908cd03 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/48e7bab32b1128fc85e4c867fb7c3a78932e37a6 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9c9ff94d55817569559f6bfbbb68213040379ec2 |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/a9c91dbf22c09a2a9cb37126ea9b9fda5ef20abc |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/27c1a51628e31f436e536c21a974ab0b7ea0fc24 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/fc188a684101edee9e5e295357645d27494c4fe4 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/e346eec64ab175921f42b4e74fd7544ef40cf4a9 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/229099e5b68d88e6edfc71e25802fcbcdeca0d68 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1f7153dcf74bdc853a936d4c07ab8ebbe14b699f |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

toolchain-external-bootlin-... | 24
         linux-headers-5.13.16 | 14
     toolchain-external-custom | 10
                       unknown | 3 
toolchain-external-andes-nds32 | 2 
toolchain-external-arm-aarc... | 2 
toolchain-external-codesour... | 2 
toolchain-external-codesour... | 2 
toolchain-external-codesour... | 2 
                 mesa3d-21.1.6 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/6220ca0325206018616c0ee0d4ff9fad3ed4887e | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/d04382bb1bfe7aa90319d1bcc47898a396a2e935 | ORPH
  powerpc    |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/006539a9d9a05a7f9c0ff3a4a09d0d63ca9e26b8 | ORPH
  riscv64    |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/77bc1475bb25e26a6b448984e3fdd953f0bf04c9 | ORPH
   s390x     |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/0d17c1366ebffc74471381801d7e1d6b4cb09e6f | ORPH
    arc      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/42169db4a22fca94e98439c93ce245b3b9e526d3 | ORPH
   xtensa    |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/dd5d2c1e3020168db936b475ecd6aacfd7225e58 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/93a4f9631fcff06d107c37bf002a5e1c25b05ca8 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/6be008d7f18e8962e2c4950fdebca9e9ca0c4c4d | ORPH
microblazeel |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/cbfcfb6a215de68598e74d33580258e8ae5588b7 | ORPH
   s390x     |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/20e2494c5fc55346a5d6f35fb0c00b2c3c15c7de | ORPH
   s390x     |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/93eff6aed8507bc054c85238a155586be6b46252 | ORPH
    arm      |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/acdbc41c89e77aed93e37497acb5e8f47d20b7f7 | ORPH
  riscv64    |     linux-headers-5.13.16      | NOK | http://autobuild.buildroot.net/results/a0b81c568bec31bb10fd6cc146fd1ebdebe1b7d8 | ORPH
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/3f3ee7202a5df503a2a1e3ca10321fd26f97ff51 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/a7a7cdb295266ba021252c38f5e97a0d3234d1d0 |     
  nds32le    | toolchain-external-andes-nds32 | NOK | http://autobuild.buildroot.net/results/80d8760dcb78c0874f321fc13c855bd40faaa912 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/87a325bd2338d09303d88c26c11cea32b0b6d535 | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/0b503d4dfd244cd8cda511ab82223a2e3479deee | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/340860f3527007685b29a20504ab24c74820ee08 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d88615cc074b1c0e57386d6059ca622898650d57 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eb1e0b459c56fdaf6f23fa87f415fe73a65c72de | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d818209498d558ff309ec778ffc23414283a9c2e | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0af46dcc277dce203ee426d6f1dae30f451f770c | ORPH
  sparc64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/aca3557a3e698fbad4cf104a2033634fe536b906 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1b446aac5acd27b7449f537f88d545669b777d0c | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c4faf4b3ce0e91f0cc9389a45a50e586789157ab | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e350e8d7f6bf3368b1eff9fe32673fe504f2ccf5 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fca999ed300b81e6387b1cd45c064743159359c6 | ORPH
  riscv32    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/633ee89d4dd7fe73a713e213389b243568b5c9cc | ORPH
   x86_64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/094e8ffb6080a11335ab97464110e472a0e1cb22 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6972c4097a60dbeea525dfe8664d49444e1e261e | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/69afb79ccdc265e8faad35ecac66c5c71f4cf61a | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5f87efc99f4a9a4f7986aa10c281987eaca3ea09 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c3ea3afec93f405ef25dad45a53e39c3ab6fe242 | ORPH
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a8a7727b3f865f41fea639ac87cb2e06aebbd3d9 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8dfd1158662d938f786614484f16415d37550f05 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/198eadf1c61adec39bc9b294347e224d03c69477 | ORPH
   sparc     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b8197879c0d9c6368fe3f1bfb3451de1cbff6cfc | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1bf1a19df278c6bf0ec9ed543363f21df9cb7c31 | ORPH
   nios2     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f59f974e00de94ec198dd6d795b0e66103104084 | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1cd718f256a75ba88d48338eb8dd533bc59963ea | ORPH
   mipsel    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e2db1b74c75ec90af699ae4eb4b0f05fb8925711 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1e4b64acc9fdf3adf87036ecfb0e83e8894a18fe | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c8bdc7101344d37e2eb771214a91393a6e159f98 | ORPH
    mips     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ca3e1508c951339448b73791ca670e6da0727e64 | ORPH
  mips64el   | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/e24ea1cde8572362268f10dd38b1533896044f83 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f21ea17c120a8115b10e2ce434aa1454d04f45d7 | ORPH
   nios2     | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/4024330a2f4afc2b09d7fc3d9c0e0f59e922d71d | ORPH
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/fa22bd9733884de6bae2f97ee589a6ffbe6a936d |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/833bd7718b2d170194c2027b1d3c629b7f762d0f |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/20365546687ca532529079d352954bef805009f8 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/72e241b99d2c919f439e3f26c0a187d5466d77f2 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/34876b371006a1dd79d350d66bddfd7ae4f3c726 |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/b1c45fd0dae4e6262cdc7d9e62cbba458cee51c8 |     
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9e2f8d6170978dc3a0ac60d2a3f27d6aac656242 |     
 powerpc64   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/96d357046a10cfde214696499edbf6342ce477ca |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/d61a3b7b8ff7b1fe48656a6c083c7b187c442e1e |     
    i586     |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/95aa913c4bf8b56012d75c1a692d351dfa77cfd8 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/c436e99e7d43e73be1c9f9da20e6b57042947ab9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/82ff0316dd836bcb3ea1aa9808662a49ef045c93 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/868606eb08ee75f18bcd057431ad2fd869a27bde |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
