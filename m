Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C481C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 05:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A556115A
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 05:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54A556115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA0AB60819;
	Wed, 20 Oct 2021 05:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-6x5CnyILS9; Wed, 20 Oct 2021 05:52:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F1760824;
	Wed, 20 Oct 2021 05:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E50A1BF3C6
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 05:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A42040264
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 05:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNK-a5zBGhxn for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 05:52:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 731D4400C4
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 05:52:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 564AAE0007
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 05:52:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Oct 2021 05:52:47 -0000
Message-Id: <20211020055252.8A42040264@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-19
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

Autobuild statistics for 2021-10-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 32  |  7  |  0  | 39  |
  2021.08.x  | 34  |  2  |  0  | 36  |
    master   | 51  | 47  |  1  | 99  |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 11
                  boinc-7.18.1 | 6 
libdbi-88b8477d57153b9f736d... | 5 
             transmission-3.00 | 5 
               capnproto-0.8.0 | 2 
              host-erlang-22.2 | 2 
           host-mono-6.12.0.90 | 2 
          shairport-sync-3.3.8 | 2 
              tinydtls-0.9-rc1 | 2 
               host-qemu-6.1.0 | 1 
 Makefile:740: target-finalize | 1 
                mongodb-4.2.11 | 1 
                  mupdf-1.18.0 | 1 
               pipewire-0.3.38 | 1 
           python-pybind-2.6.1 | 1 
                          qpdf | 1 
                    ruby-3.0.2 | 1 
                 samba4-4.14.8 | 1 
                  uhd-3.15.0.0 | 1 
             util-linux-2.37.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/cc917eb925a49ecfeed919996fd6132ba0a30b21 |     
  sparc64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/1ee1fd7bc339b6fb6a9b3f1c223616a983642cf4 |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/f487b6860c8c7f6b13f25d3b858de105106565cb |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/a86af5684d40de4b0706173bfa48a6cdb846a7f1 |     
    sh4      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/45ace5c8af09efae27de0d83cd07e93e67cfbcfb |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/6ab399232c8f8c8a4cc56ef77ddd243e5fc4b84a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/43ab886a9c568b2dba8aaf6b34455828ea559455 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/efe14e040f44f14b1937dfadf305904970228570 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5cbd834dce33d9abd33450c5cba19a4e0d3688db |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0a527d54b4bf54cfd3e06c886484c285950620be |     
   x86_64    |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/1630fff1290b28f4b9150451307c7449163f6ef4 |     
  powerpc    |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/55f02e182793fbcc51679301f1ed343b90089251 |     
powerpc64le  |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/919c865301bf15f95d1387df20d6ec37496721f2 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/2a4e5b3bed90c1a19baeb10183db8c5ee4d017e8 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/9f409aaef748f3c7477dcb7cb036b0ebe378fb5d |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/4d69fcfbad993b30608d2ec92515af15510cd9e5 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/9918b5e705e77a9a87245330187014fb6a419dbe |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/bcf3a2d8c364d6dca82466198ae0aa49b377ad6c |     
  riscv64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/fd651abb3bc2fa33c861238acf1c4ad49fdac160 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/a958e1e60370504f8ef89c11fb89d9b3716a4204 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/5d88735998a22b831644de6f40c4e492a362db3a |     
   xtensa    |        pipewire-0.3.38         | NOK | http://autobuild.buildroot.net/results/dbc2971f5bb89fc10334d14d6f349cfae2d069d3 |     
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/01c18a42614fcbe53f2bdea992d9e3c749235d6c |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/f46854c77d2f2331d8069d6aa4f6d8d5d6696ed1 |     
    arm      |           ruby-3.0.2           | NOK | http://autobuild.buildroot.net/results/5ebdc2d0ef5bba429ccb35d3ebf64e3839122d4a |     
   s390x     |         samba4-4.14.8          | NOK | http://autobuild.buildroot.net/results/d6de6ed59c553f6f413d280f3c65184945bb3850 |     
  mips64el   |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/894ea104baf9bdf29dc6e6495f85f58e637f5842 |     
    arc      |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/3b7704ab5e32a0d35fa7cdaf587eb27f60d0f55c |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/02f3a3914dae016fbf8e31cbc84fa50d077ea9de |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ad6e728b456304f79daf4a8f0c0643bf6c35423e |     
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/52db9f8023314bfe9681502ec3755682907f098b | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/67da23db3da515f3344070fe005092ecd24cb80e | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ea6d4b875fcb931cee6bf78fb22943f77a7a7fa9 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ffbbd934ead1737fc4cb46d1057b30467c26061a | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f2879b5c69b32bd405f518b2a56e511102d24ea3 | ORPH
    i586     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4289a1e8bd443627da878cc7793f36bef31c6d98 | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d6482cd67eeb2c33be2b2b74ccd84639a9b2965f | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/cf624a495fd358a6b6aecbf41d6371ec538b6548 | ORPH
    m68k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/57ce822a1a361a8e165a1892ac726baf29c069b1 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/5e138e84b55f5ddc5f0f3f35c3a668a0a924a3fe | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/7e3484614e7e6d549eba8f0a7c789ce90ebbc497 | ORPH
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/c73a682f12a69a20fd02982a8fdea11df2086db1 |     
   nios2     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/731ef706394686556ae9480fbceb5c3837833dc8 |     
  riscv32    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/2aa537c09961f2279107c0e20b24f8fd4861ce42 |     
   x86_64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/fcec68d060918c4605e20ed9931c84f2d5752338 |     
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/35e33293b133fb27769adb9f73a52944cededc67 |     
   x86_64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/559d1deebd1022eaf9fb55cf6d8e780f6b4689e8 |     
    arm      |       util-linux-2.37.2        | NOK | http://autobuild.buildroot.net/results/cd8dc31472ea75ecf566f62adf7020798c10ee34 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

            docker-cli-20.10.8 | 1 
                  gensio-2.2.3 | 1 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 
               openldap-2.4.59 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       docker-cli-20.10.8       | NOK | http://autobuild.buildroot.net/results/e7b5775d29b9d3c0ca8ee17d05249e7a3d81e34c |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/19942799e80e8c37352971c469413e4dbd3700d4 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b73f452e1ddc0d8aab7adcec26d10808138cecb7 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/bf5fe34c9fcc8d3d4d1119e87ba90a33948abf24 | ORPH
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/660d4dac49b4fa5103ca14be2bcbaf202f5d020d |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/0ea10f1e6d647f1e61222da4e47853a27896b9e2 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/84a08197e99c21e763035daa4a3da9a47689a845 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

              libostree-2021.3 | 1 
              supertuxkart-1.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/c2590e3917fd71f4344b2363398f49429edabd4b |     
    i686     |        supertuxkart-1.1        | NOK | http://autobuild.buildroot.net/results/e8d0ddf7edeca5fbc210b0319cdc1e3fd4da4097 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
