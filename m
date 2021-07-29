Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08639C432BE
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 05:47:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FA061053
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 05:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82FA061053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3422283AC1;
	Thu, 29 Jul 2021 05:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3o198-KO_UQ; Thu, 29 Jul 2021 05:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E5C83AC5;
	Thu, 29 Jul 2021 05:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A6071BF947
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 05:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1989140520
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 05:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gi8mPIvemQqw for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 05:47:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05D124051F
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 05:47:48 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BBD6D1BF203
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 05:47:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Jul 2021 05:47:45 -0000
Message-Id: <20210729054751.1989140520@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-28
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

Autobuild statistics for 2021-07-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 27  | 10  |  0  | 37  |
  2021.05.x  | 27  | 10  |  0  | 37  |
    master   | 57  | 120 |  0  | 177 |

Classification of failures by reason for master
-----------------------------------------------

                  libogg-1.3.5 | 75
             bluez5_utils-5.60 | 13
                  exiv2-0.27.4 | 9 
  gobject-introspection-1.68.0 | 2 
         host-gcc-final-10.3.0 | 2 
         host-gcc-final-11.1.0 | 2 
                host-odb-2.4.0 | 2 
        host-sentry-cli-1.57.0 | 2 
          libmodsecurity-3.0.5 | 2 
make: *** wait: No child pr... | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.4.8 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                    daq3-3.0.4 | 1 
              open62541-v1.2.2 | 1 
                 openal-1.21.1 | 1 
          refpolicy-2.20210203 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f18d1e3f5396a9195eb91a8b4d63a1bde18a1b1e |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/6dba09fff6e2d91a2f686e0c2815a79dafb8e752 |     
   mipsel    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/51859886ccf92e9551a2e86ef26d9ee0fc1cee72 |     
powerpc64le  |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/e062e839743349ac3be1d08717054def1970b362 |     
  mips64el   |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/551441ed94a85daef4f3fb593e5946aaa387e40f |     
   nios2     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/f5fd378bc8c3ba79cd0a259cb9cefaff3314252b |     
  riscv64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/4da71e54ed8abc205110aaf4763680edb59e6e27 |     
   xtensa    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/406dd4aea4fabd833a8a13cdbdfcf78e9b7fe074 |     
   xtensa    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/1f9f3aa763ec1003b042a35bf938328341b92f2b |     
    mips     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/80637f2dd9ea4596cdbe6a383cb5ad52a4320903 |     
  mips64el   |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/bc3bd6af0cb579ff26f68d11c83f73b78d598e44 |     
  riscv32    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/fa4f6be0d6d8b03d0e44e37e3e4f7cbbed57d94e |     
  riscv64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/9acad867aaeff020db2db06b38ae0a400389ce88 |     
    arm      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/d85d138df0ccfdf8fdc32f52ad6b8ceb2c9ea0a7 |     
  aarch64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/959c39bebbd80f26aec74870b357a2a681206ba5 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/bf8d82bc21dc9ed85d6e66f1ea58383f7e52c39a |     
    arm      |           daq3-3.0.4           | NOK | http://autobuild.buildroot.net/results/f052f084170d390d828aad52bbf8b546c4df82ce |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7433d3a5aab108137abaeecfbdb58f38cb509e41 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/19bc0b78eabbe2e1158398c8258e0378a42617b0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/71df86605232beb7ef3855b80c927f9178a61294 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f52c65b6bfa26b103d2ed9df57c2c995146931bf |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/45328090bdf49f0f7c049bf2da3afbb35c2db817 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c98c5aefb464b194fb913417f8b1c707dce04672 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/65b35e89b1e28c8101ee5842538642e9b0ab1aeb |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/77c1b2e64846e7f87addf41444a4895c146880af |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fe00b1f0ddd07a38603bb21cca477f5eb1720d51 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d831976ce0fdc92fdae2c316a94f6faafe66112b | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b58b79154824b7e44cfc288adf270661ffc47fc6 | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3adb62513bcc2c82b9ed9a46c2457f0597568252 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b94fb832b86cc3fce7c55fd74be8998053ecef76 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/552d7546ab3ca170da38d7cc899cea931cc9a1e6 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/d78152d253688dc99358ff5b1e8766418a1cfa3e |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d0605def5f7ad15beb0d55cd3ab15b8b4e806c9c | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/51ff8f227fc0b89cc01d33cec8c5fd03b6348ecf | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/83c306938f20de7cb0b96aee3d79d2a04ef0c434 |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/39abc18b8462c59e345b97224f6cf27e124ae61c |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/780d04686d47ee27f46e843e98e2b7acf639ca53 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/190c8f71385cf8c078c53919ea6f5a2211dbd943 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1ee943fe8c60495100151bfd09b00864a14d54f8 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b719b3be94f8d03da9374cf97fa7ec248e8fa283 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a7eaca2dc27a07c6f36d3d6ec7b80ff49298f79f |     
    or1k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/efe92d285017db4125e370e22fc52bd87b24a65a |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3e04c6b9b72923e545e54c4272de089e7fc183e4 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4479b25de1a5dada412a59a0d4105a76dcfb36af |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0933a273b7c02cd1a6b4f3f9995683fd411d798a |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/978dd01b443c483be9c6b76da1454d88e3ee4ff0 |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/87aaca787b45cb063635a14fe52ac1fc466afaed |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/08cf8c3e166bc54f4cd4575233fb76137d460950 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4d042c79c172fda054e1d3d1b7ac65f411b5f5d1 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d851dd8eb7c84a50580c60d0118028f2e24d6195 |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c533c881eaee394a172b0050b2dd1a02818bd504 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9d9d0b6a4207d93c6f100f0b22fef944964a31c0 |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a238c522eb8f1c08947ebf9a4f2099daba9bcce3 |     
    or1k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b12282ebdd46ee7311d8d95bafc1035d0ca78678 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7ee1593c28035a7ba7d6a44e4c0bd4a2296d16fd |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6f6ec57508297b6fb287f72bd2305bcbd70e73ce |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/dd87b90b1ab0cc85ff49b7311a122e33112cd81c |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a4a3da4c323d837e5074333bc6fdf3345d54b4a8 |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c81dcc2cdff79f69ad1a3f74b451fa76d1723e9f |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/15fb55d1055aa179a46e7c18ff8713b112b36bdb |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4a4458eafec1069accce8c0ef326f23791386c4f |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/dd6500580b338ae9ba3f1b6b483a1e5b4b23b182 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/466562b7053c499798ff0237ddd7be74288256b2 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/56225b5daa471668d25cbe3b794e83c75c6724f7 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/91333c6e36135b633345ff41b2e74716d6b627f1 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/fc5ac8fd978c6400d53c769c7473a31016fbdb01 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/afd1fd42710599655dbe8f0e52368bb759e31578 |     
    or1k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/18550af2d6a7fd8933c022fbf059c50074264f2c |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3213d86ce7c786ea09405f32da9463bc6fc43b65 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4caaec82a5f476e8032db3e8e461bc8ecfd3243c |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6bca3986ad1117d70cf3cccd4da85978518db1c1 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8fbcd1b4626514f335e4d12caaaabdf7f272eb9a |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ce4c4716afe59ff85aa40b05d528120f6a4f8649 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0f44fae5d5f188df53f85ce5d072d7a424df1c43 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/66267c4b3e08fe4377a170d19815cc84a695084e |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/41bf7499e4072163d95d17aedc1f556edf286322 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e11dbcb49b860015d6953d2b9c2e18ab46fce5a7 |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9a38360d6b14f42621db2255a5a138049c77eed9 |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/79f993a72d9b10e736389d1c038dc6fb51c6d1a1 |     
 powerpc64   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d11d92bea84cd767751d47f6844cedb70b1cf69a |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d6ed8e25b6879b4cfd60038131c646d335f0e241 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c47dd6d7008542f47ed9603515d54402abef5be3 |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/139abd3aa2657cef126b09183c7b6a1a2d891528 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c3a8ac04df7667fee12002b0b98319951ea88fb2 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/fb1b6bf1c71a8239d15829dfd288267898fb775d |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f90cec70d3598a768b48ed882af5ab2a52ae375c |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a353ceda6082835a24c8cec64ce8ef9e0f6ad5f6 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/015639a1ba38d590f84d6de494a4e913e61fad0d |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0535b1c91223ffae2fa6b48f61113bb93197a761 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/456d52c4c7796358aa7c254000fa99d428ebe8f6 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/37a4da48f867ab2fafb2a2ad28fad889e8b1fd31 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4741b9528a5c820c75922c2cddaa51d072eb6b89 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ec9fbde4204201c05e9f3d538a586b7f836df9f5 |     
  nds32le    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c9dde28bd6b1241ae173f996e8c52c3fb68a031c |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/354313fd484b912dd9aa6685929b56dee6aeb023 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e4e4b8104c2e4161cf4e03bc3a15d402948747b6 |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ed9f61d5ee355d83278a012b480ed7f6f605d24b |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8c80e6ee168a40a4ccb9345ebdd0e47225409aaa |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/46cf3e91564a1f03543d48b49ef49a539ee05ecb |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/91482de78956803c697d0c57760aa2c5b35aa555 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4b2a646e805d52d80367cfe7402c83483b256d7c |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f33f1268b0d365fe2d93cecbf15388ee09b1a31d |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6f9297121be51c5741d51215bfb07b73b04c7173 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e66490fd3a82bd15efc9d5b9e6b388f0614eab44 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7e72424760156f17aca7b65b155a5bcea5c0194f |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b037ab0f5df47b5e7fb6a097212e3f9e6bde716e |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/92e5e64f698c1a616179e9bdbcf338391b29abcd |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6d05199e23d2589ff2b535b64f759ee2f82a67f3 |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/852752a552c100edf3ca49852e29b8ceaf82318c |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/668e57011fdb2a28e40baaa1df03621ac028e112 |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/54a857a78d629b48d3eabb792ed97f69c189eaed |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d94ebeb8857c93ab00441d48c10e793eb64539b7 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/026054a98c46dbd4a608a9eb05c928c786528aa1 |     
   xtensa    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/01704957dd5646fdf5fce3f4c753a35e73190c32 |     
    sh4      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/bbcc10efcdc5358eac545603fb94e3d89eac5b1b |     
   nios2     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/eaa61ec8cfd558b89c6d5d80b9c38b1291951a5e | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/29f2f6069e6f3bffd37be13e8c02a6f01344cff3 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8fb9ef0f483981a682e1e45fdb8ee2a772c69374 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6ad7fe23fa6f94a2b4404efe12c16b2a30bb1130 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0d5af8d60d2fb243e1f683464a2bc0ae0219e940 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  exiv2-0.27.4 | 2 
                rocksdb-6.13.3 | 2 
            qt5location-5.15.2 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/09078961cadbea52c060e25ca0368a2cacca3c2a |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/69c74c6b46db4efd392ccb02518dff6bdb78239d |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ed6c32eba2a4cde3942ed2a098eed2778ad98fe4 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a02376afc8e913d73fe23ad9cc151a9bb872349b |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/11089a2435f6ee6cfe4a538f442b4cf056b172b9 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/0ce3ccc10850ea86cfb11d813245eaa4600ad97f |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/885ddae6723d104f10a115b4a704ea486da63fc3 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f191f51d27fde0a39e0b6f7fbe13afab2f7d5035 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/32585fd6737cbfc9ec284118c66bf455277ea1a5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/38f125ca0d52da89082c0b52f011008b9c0c51fd |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                    htop-3.0.5 | 2 
                  apitrace-9.0 | 1 
                   cegui-0-8-7 | 1 
                mono-6.12.0.90 | 1 
                    mpd-0.22.6 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/82c3ad3adcc81aa5dd5d7590f2fb8abd5ceb39fd |     
    arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ab8c1f5e464e6139446841453b51f3fe238e1267 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/27940bf3ad86fd8984fb5df6e2077e27c3280820 |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/93d3da343a481e7b58d1d349747427e05d868cf4 |     
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1e09794aa6250f5e2656b878c652917e4cc78940 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8a937a81ebb9f8c3e5844e3ec26748ebd6acaa5c | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b88bce62d3f4166cc47b0a5c3530484344be3989 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/f0c965684945efad461dd3239ec516bc2f5c4b5c |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/359c67058d784edd58cbeb401ef440dc9320f0f7 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fb5daf9df23439bc2cbccc6db3c140a8560250fb |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
