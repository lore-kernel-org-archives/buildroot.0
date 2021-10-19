Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2236CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 05:51:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB1416115A
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 05:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB1416115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E3F640229;
	Tue, 19 Oct 2021 05:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmkEhGh3F-hO; Tue, 19 Oct 2021 05:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1E4640272;
	Tue, 19 Oct 2021 05:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C88CB1BF83E
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 05:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76A340272
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 05:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwHvnhFZJCRF for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 05:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 587C540229
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 05:51:49 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0468CFF80F
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 05:51:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Oct 2021 05:51:45 -0000
Message-Id: <20211019055151.B76A340272@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-18
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

Autobuild statistics for 2021-10-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 27  |  7  |  0  | 34  |
  2021.08.x  | 33  |  3  |  0  | 36  |
    master   | 42  | 41  |  0  | 83  |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 7 
          shairport-sync-3.3.8 | 6 
                  boinc-7.18.1 | 5 
              tinydtls-0.9-rc1 | 5 
libpam-nfc-bb762e0e64919511... | 3 
                      gdb-10.2 | 2 
                  uhd-3.15.0.0 | 2 
               capnproto-0.8.0 | 1 
                flannel-0.14.0 | 1 
              host-erlang-22.2 | 1 
               host-qemu-6.1.0 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                  mupdf-1.18.0 | 1 
          python-libusb1-2.0.1 | 1 
           python-pybind-2.6.1 | 1 
                       unknown | 1 
             util-linux-2.37.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/9476c1f313b0e950db1c87c9acadc34d0f819b33 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/484be96b86f84621a5cca231fd6ccbb000330267 |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/62b8f0f51c3b2e9ce2ef249ce056f1de7a7ad1cb |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/f9a6743075c8b8fd1934d17b68ad1306d26ca58b |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/ae84fc99f4b8b5f657558b1170511d69129ec93c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f8238e1a5ada2b51cb2c7a4e8263171c3417508f |     
    i586     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/e1b1bc4c8fa0ff1dc2b47ec2152e3be615ca2a0d |     
   x86_64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/9dbc72b8b6d4e9b965039ee5b4fabc0e2620b92c | ORPH
   x86_64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/4fedab13d581f5b2d24ea7e406ac2b2f6e3b0e51 | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1ba8ecf1eeab2cada7a9d0d87f6c9035b2ce99c0 |     
powerpc64le  |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/14cd0250d55c5ca5dc1d297aee1b927fda889531 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/f7136e14059fb8360dca02f14600f314f553be53 |     
    arm      | libpam-nfc-bb762e0e64919511... | NOK | http://autobuild.buildroot.net/results/f054f1668ff09e0a7b5c172f6b34182318732b88 |     
  riscv32    | libpam-nfc-bb762e0e64919511... | NOK | http://autobuild.buildroot.net/results/89bd78a0b638dc206f96e1781b2c497674d0b3d9 |     
   xtensa    | libpam-nfc-bb762e0e64919511... | NOK | http://autobuild.buildroot.net/results/4f34844e891efc60babb1bbdd15586ec40842481 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/624a8fc8e7e2164bd27347a2687d4ed0bd566a63 |     
   xtensa    |      python-libusb1-2.0.1      | NOK | http://autobuild.buildroot.net/results/2e1caa6017b507ed20890f5491425ee7b8103907 |     
   nios2     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69 |     
  mips64el   |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/6af5bb930e84ae4db6164acf6223e29987ef1da9 |     
    arm      |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/18a25df47b6f3b032dcc0f8042a4440efcb268d3 |     
  riscv64    |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/732baf0c3d3549a50e1890e896323c4cee8b1561 |     
    arm      |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/a0fc61b3fb696577b4264cb6eef02d491d268fc3 |     
  riscv64    |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/2998600ed25fce980b73832e448024051795b3c1 |     
    arm      |      shairport-sync-3.3.8      | NOK | http://autobuild.buildroot.net/results/9d0503bc2505b8905fb55cff01360d9e1ecc200b |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8ddc110c7dd3ecc2ccd8cb224c87a41fcb086bbc |     
   mipsel    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/0ddf1c07abea36994e40e090b10152b37dd43ddb |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4782c395f2e9fe9ac06a338fe64ce17796f61618 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/346bb56e51db480fdc3abb0051d0ef047e98c90f |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d76fd738293552fabc2396d316e14b443f2b2e47 |     
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8fb4b5e9437dfdf4d92b54722b9ff48834e30442 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c112bc53f96f6344b5ad4905f6afd7de3906cbcc | ORPH
    m68k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/32f008f899abf5ddfa06125917d2f68138c1c31c | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/62f54e3245015b6d10916d93e28adb464173bcc0 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/dc4a598d27fb3abbd4f28738876e7590b659515b | ORPH
powerpc64le  |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d88650cb06c4f8f3a2d05eb2ee35ac51578a1b75 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/19dcce690b17b6688b8418817cb044d831b69f14 | ORPH
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/ac67aa84f4b38ebc6b85a256e5d80fe7b3fe50d5 |     
powerpc64le  |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/c734243b832a428451a0747cdc2487f4597e22f2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7a942751174fa095b6f9395120ec9b8db035326f |     
    arm      |       util-linux-2.37.2        | NOK | http://autobuild.buildroot.net/results/9fe724e1c2f1b539ce92e063f3df0c287758da2b | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1898f3fc49aaecfc8a005100a4d9a9f43bb9ae22 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               capnproto-0.8.0 | 1 
libcamera-ab72e6641c56e876f... | 1 
                 mesa3d-20.3.5 | 1 
               openldap-2.4.59 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9ef444f4172a4b517f55ef660e4c880f990aa728 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f7e381b02edffcce5fcb45531c0972ff60d9b818 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8fa073f8c8d18de01b5f8da5a17ea55ee0ad2d02 |     
  aarch64    | libcamera-ab72e6641c56e876f... | NOK | http://autobuild.buildroot.net/results/2a216971f94c2198a3415439595ee2a1daaf08a5 |     
    sh4      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/fb473d87de19010da93d9bb593e3033ece6fd4eb |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/517941e9a084522bc457982544ff5921218780ef |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/0943e9da3fd50b59392a48c1b983fad18625cb60 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 2 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3233416d4924cf0826d9e0e67ad93747e7837867 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/48d5cf141d1f1c94691050cf3dc74607d7aead03 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0668392ac2a9b3583bd5e7012a367bcb913e461c |     


Gitlab CI results for 2021-10-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590417  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592316  |      
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591830  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591832  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591834  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591838  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591850  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591855  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591857  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591862  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591942  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591944  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591953  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591955  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591962  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591967  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591969  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592031  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592035  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592044  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592048  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592049  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592050  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592052  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592053  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592056  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592058  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592061  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592063  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592064  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592066  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592067  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592069  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592070  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592072  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592073  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592076  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592078  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592081  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592083  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592085  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592092  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592094  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592096  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592100  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592102  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592104  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592112  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592113  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592114  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592120  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592122  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592123  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592125  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592129  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592130  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592132  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592134  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592135  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592136  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592138  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592144  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592147  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592148  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592155  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592156  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592157  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592160  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592161  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592163  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592164  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592165  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592166  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592169  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592172  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592173  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592174  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592185  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592190  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592191  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592195  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592204  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592205  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592215  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592216  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592219  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592221  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592227  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592231  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592246  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592249  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592256  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592259  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592303  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592306  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592311  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592313  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687592315  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591800  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591812  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590442  | ORPH 
  TestGdbHostGdbTarget11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590561  | ORPH 
       TestGdbHostOnly11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590566  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590571  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590529  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590530  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590500  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590502  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590504  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590512  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590514  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590584  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590596  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590635  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590616  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590619  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590651  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590662  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591223  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590623  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590598  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590601  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590636  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590649  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590604  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590657  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590630  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590614  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591310  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590625  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590659  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590515  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590665  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590671  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590672  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590676  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590682  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590687  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590691  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590703  | ORPH 
        TestPythonPy2Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590695  | ORPH 
   TestPythonPy2Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590705  | ORPH 
         TestPythonPy2Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590709  | ORPH 
        TestPythonPy2Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590712  | ORPH 
       TestPythonPy2Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590716  | ORPH 
 TestPythonPy2Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590744  | ORPH 
     TestPythonPy2Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590948  | ORPH 
      TestPythonPy2Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590953  | ORPH 
      TestPythonPy2Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590965  | ORPH 
TestPythonPy2Subprocess32 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590976  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590696  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590711  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590713  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590721  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590726  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590728  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590734  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590735  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590736  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590738  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590862  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590582  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590943  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590950  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590960  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590969  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591007  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591010  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591105  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591636  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591748  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591775  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591776  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590462  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590463  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590537  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590538  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590448  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591778  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590438  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591783  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591795  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1687591797  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
