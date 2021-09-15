Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C3CC433FE
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 07:00:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 047376121F
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 07:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 047376121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B48404CB;
	Wed, 15 Sep 2021 07:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DmNj_oEVQ0Lc; Wed, 15 Sep 2021 07:00:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB24404CE;
	Wed, 15 Sep 2021 07:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78FDA1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 07:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69B2182400
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 07:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAGbb5ganbJv for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 07:00:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F008823F6
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 07:00:36 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id CDF3210001B
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 07:00:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Sep 2021 07:00:33 -0000
Message-Id: <20210915070039.69B2182400@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-14
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

Autobuild statistics for 2021-09-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 50  |  9  |  0  | 59  |
  2021.05.x  | 56  |  7  |  0  | 63  |
  2021.08.x  | 38  |  5  |  0  | 43  |
    master   | 140 | 166 |  2  | 308 |

Classification of failures by reason for master
-----------------------------------------------

package/pcre/pcre.mk:33: ho... | 45
package/pcre/pcre.mk:32: pc... | 27
              host-libcap-2.52 | 12
          host-pcre-legal-info | 12
               pcre-legal-info | 10
                  uhd-3.15.0.0 | 8 
                 libfuse-2.9.9 | 5 
               capnproto-0.8.0 | 4 
                    ffmpeg-4.4 | 4 
              gnuradio-3.8.2.0 | 4 
              xapp_xeyes-1.2.0 | 4 
                      fio-3.27 | 3 
                       unknown | 3 
                 apitrace-10.0 | 2 
                 diffutils-3.7 | 2 
            erlang-jiffy-1.0.6 | 2 
               pipewire-0.3.35 | 2 
               apcupsd-3.14.14 | 1 
                    attr-2.5.1 | 1 
                flannel-0.14.0 | 1 
                     host-llvm | 1 
                host-odb-2.4.0 | 1 
             kismet-2021-06-R1 | 1 
               libgpgme-1.15.1 | 1 
                   libiio-0.23 | 1 
               luasyslog-2.2.0 | 1 
                mono-6.12.0.90 | 1 
                    mpv-0.33.1 | 1 
                  mupdf-1.18.0 | 1 
                poppler-0.84.0 | 1 
           python-pybind-2.6.1 | 1 
          refpolicy-2.20210203 | 1 
                 samba4-4.14.7 | 1 
           uboot-tools-2021.07 | 1 
                     wpewebkit | 1 
              wpewebkit-2.32.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e707eab040afaa44717f55ff00c5cb652b1085d9 |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/7da106fc6b1fd20978b3f6cd12720cbabb0fa9ce |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/ac5e5b1e30249ae0fb8b9179338b47c60c026bcc |     
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/a8be1a22650156b536e4a9056485dc6304c29986 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5c601bb3d8f4271902cb511a371df74c93323e40 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3a0f5343c6e1c196015f88bd9a29714bf655a0d6 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/feb9019afe77d05d90668e219cfe8ae61eb5cbb2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f95700c374469fce0e542deeee2608837f9e0f92 |     
   s390x     |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/a5cc1b95a15d74b08ac48f9d5b94a801d7ac122d | ORPH
   s390x     |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/4ac0bdbc346d5c0c766e8dc6526dc0a9ac11e749 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9482a0cf9fa1602eb6b8a2fea02ef006312c5bc9 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8f04210cc6951fee30c0bb99f6af843a5a268205 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d9249c38aeba6b1aedd7e639901561d288764ada |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/4e241628647ff3d3c82dbe4bc05043ec98feb406 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/503032177b5e6e492b58bdc4d3684986129c3769 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e5940e63bbccb2c11f3c0b43bad2bb0d645daee9 |     
  powerpc    |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/97753cc8550b7581cb07173fcea1e4029376eb3a |     
  riscv64    |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/ec5369a8fbd4ec4c31b85b0a63b5474dae075d8f |     
   s390x     |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/a29469e92ab9e75f15f15b74c4f8b459ef265786 |     
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/860f62637f859d1e8c0fe252e65614ce93376798 |     
    arc      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/a61b0b76f2553e72a8401cc7ca74be2f3645b32b |     
    mips     |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/9dbd9159a7db07e18671e7363bc1080e2746b193 |     
microblazeel |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/5ffba1c0d4d36ea2e3d95df2bd5159bf69a422c5 |     
    i586     |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/6452083e2d5f98682e3993241fae832038d06ad3 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9dcc5b3ea1101988202105c5ff0375e0f3b140a6 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/57c718adcd2d1f0c4c6cd19f72ce70f719125acc |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/53bb1ff5001abe365a2ea88e2cd2ea590aa7abc2 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/10624042a5367bebc915bff69deacd7e2a4e5cb2 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/82903528f273da32907518b9ddd29fc837aab60b |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/04a2b477903fb0d1100a7a646184cafa59296589 |     
    or1k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/030f21083c7bed90b1890197c6c058d89dbfff61 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2ff71f51ebde2d94ac28af497b00e2f0c36d30ef |     
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bbaa55a869b434ddcc46b3ded632336d42959919 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/77e97922f0ed1688b3f87caee63433e13375a348 |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/595b8963c25e6f0a9894b60357aa101f313d326d |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c65b53fadd168debc3e32751cb5d79c02136e476 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/3a88d412085f785bdd1366b4c7a1cf65ad0c4144 |     
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3577bf3236fa5669e7f71462d10d33a7a43a85dd | ORPH
  mips64el   |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/46528dc0f643f5cfdacf2932b590ffd939aff7fa | ORPH
    m68k     |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/55697dd618f90979152fb7195f780aae0d6c16a4 | ORPH
    or1k     |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/8f3670fc2d7ec01b541ba3da04482e1bb2909581 | ORPH
  aarch64    |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/575ff7ac9047aeafd8665c422898c454ae5c71ef | ORPH
    arm      |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/cfe6472e736d62a5f42f1c8b77a0fedfeea0c875 | ORPH
    i686     |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/c2d9c094da734e8ceefc1a411f43b909c9bf3bf8 | ORPH
    arm      |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/9d0a3530c00e78ae55876bcb6681aa46f97298db | ORPH
   mipsel    |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/d7b5f1fd275bd2363379c85a47cb863034c57319 | ORPH
    arm      |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/2315569e6e7a964391d81110f0ff34f23f888824 | ORPH
microblazeel |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/5d8ddcdc743e4c26dcc9efc08e46a399e6bce4db | ORPH
  powerpc    |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/098dfae2c6337bb27eae0802cdaa97fce0149903 | ORPH
   x86_64    |      host-pcre-legal-info      | NOK | http://autobuild.buildroot.net/results/9239f83eb43890304c7cacf61dc6349a50beb2eb | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/f66d26cfc3814731e199ae04c574ebc867083e8d | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/4d530215b96cb59f6c2c6d8a229c7661fe2fb3c8 | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/4c1a0792cbefad2dda39f32223f4707b94de1371 | ORPH
   s390x     |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/bb64f06b66f7bf60c356c556bb7ec51eb741653c | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/0cd41656c60e25cb401e3091ad831345aa7a196c | ORPH
   s390x     |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/6a970dd762d573c8ae547e3219bcdb34189b1d96 | ORPH
   s390x     |        libgpgme-1.15.1         | NOK | http://autobuild.buildroot.net/results/cb9181f2b2bb8b269ffa5ed973cb123b4fbee3be | ORPH
    arm      |          libiio-0.23           | NOK | http://autobuild.buildroot.net/results/0c8434bd72aad6930ceff7d4d5b2be281da4491e |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/e08166c8b8af0c41c55b404e7a18a64dd2cef118 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/34985116d54ccb19ad5199219eb579e908ec6ba1 |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5ae706e94eb6e5a3aa69368f81c5d12e608b1a5a |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/10775a3c8a18e11e162e6fc4b1bf4feaeb95285b |     
   nios2     | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/2aaa112ffad251f5dd45681d3a425fec08f7caaf |     
    m68k     | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/20e06a23c787f18ce464124eab89a2f535722ba1 |     
    arc      | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/c8d5d33e7fa3037b6fa41d51852748076392851d |     
  riscv64    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/aa169bbe53e71f3522aaaf2559e17dc0350cc756 |     
microblazeel | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/a5b57a3eae11c87eff1ed8fe6808395b2ade31de |     
  powerpc    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/02e17f8a409e8c769f5f7f92afc2619a27735db2 |     
    arc      | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/91d7331bdb790629debbd1bb002ca1359a39d10a |     
    arm      | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/1db347fa68a506747ed9c5870d3f10f8a2527886 |     
  riscv64    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/adf53302cda5fdf7a4e4124eeaa2321ff43de4da |     
   x86_64    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/045cd98a4067f1314deb66f52240d2db2000ec4d |     
microblazeel | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/4d9777b85bb8edd37ba0eb51b98e93c743b36a25 |     
   mipsel    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/ae7bf4c3e9c53314c919169b2d023d2705b04330 |     
   x86_64    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/883d973163393d30970a838f752bb0ccc76532cf |     
microblazeel | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/bc5124cd76830a5b4238a54315cce31f595cd004 |     
    m68k     | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/a95d131d98786f1f9f04123a9d616bac82075173 |     
microblazeel | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/4095576b6f30d1860ff06a60f1025db640bf3843 |     
    arm      | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/15feee2084091abc447d856f88dc8f69f5ab23b0 |     
powerpc64le  | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/0d7abd236e16918bc9afe4fbde290331a2a4dcd1 |     
    arm      | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/816651e0721d11ba4b02163e33405ac0269434fa |     
    arm      | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/2aa59eaf049128aabcf2df3792ea3da7c4e02ee5 |     
   nios2     | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/8d0383bcb9580596a5a2a2e8100ff194b59ba96a |     
  riscv64    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/8ff1e9696acd9996187eca58f88b91453ad02d85 |     
  riscv64    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/77d840093adc80c31b90c6f8e54aed1b285ae55e |     
   x86_64    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/7e9ee9cf9186a081be77f3b19008a04486f48ce4 |     
    m68k     | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/b223e1b1cc783728df245eb595e3ec5d82e8ae97 |     
 powerpc64   | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/1703980bb93a4ac72eaed9de288fc82eb31d1ea0 |     
  powerpc    | package/pcre/pcre.mk:32: pc... | NOK | http://autobuild.buildroot.net/results/f4b7849ae520814c42c583fc7bc754570c880ce1 |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/b0c3c3f3f4e3e2aa87fb7ab1127593b34c68b31d |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/2e94ef7e03ef06d3cebd4b901a3e8ffaf1958043 |     
    m68k     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/f3f32b441768155a0cb799b35f859f7d24dedeff |     
  riscv64    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/d901fa917aafb6ff8a83ade75a187386eab0a5b0 |     
    i686     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/ba2fe10950a8831593b7d8ba79cca9f839c2caf3 |     
    m68k     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/a4fd89b111ef429d5c5751940fb2e9361f7f8868 |     
   sparc     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/fdd56c3c4726e89ef6d8890f4cd5b623540b6484 |     
  powerpc    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/bef817f5be8cf1943cd7b5c9c453395a085bf189 |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/cc0ae3cffbcd0bb99968888cc48bf165e02b16ce |     
  aarch64    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/09550226d676f762c52cd879122c65ecfb37adbb |     
   sparc     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/75927dd9b39683b277137ee64d6e979e4734667a |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/179c152c40ad9d35ff4ade5fc3f7836865fc38ea |     
  riscv64    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/01c10c8433364f16963d3456e9bd8f8f2f39778d |     
   xtensa    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/feddf68bf1f6e2d0cd2e089e6fcb12c5118dfb89 |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/573d3d489837a13775234fb05334f4c9bf887f49 |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/5b3726656915a8d67bbfa730cbf2c6b149a0782b |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/42a4da11450d0c6590328944ecaaf1f6691381aa |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/d5e6b6478006009fdef2036fc2d72da8a31af77b |     
   nios2     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/0ee61b316d77a86b6261b8ff763337084d34fe6d |     
  mips64el   | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/e5c026322b6505f8bf3717ad7f927372079c58ad |     
microblazeel | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/c870f2d9a1f82f5d3485a8a655ef8d0835c358c2 |     
 powerpc64   | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/bc9c6e86be7707f1b8619da12fada5a3fc7b878b |     
    i686     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/6a2dc2b7d385ded9e4db62ce1c8ebba4d1fa8a84 |     
microblazeel | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/765167a9a8ce25aa2e94ebd8c6226517a4474836 |     
    sh4      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/424249bf1c2dd1d702781f47e096d2b69788f1ca |     
  powerpc    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/fc5ce2a4d44bd24249367aa221ef41e5f048d23d |     
powerpc64le  | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/c432d0fee63c1f372ac9533fc34df96bac67dd19 |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/9da734501a7189655a336d2110f22b2afa8c616f |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/91601c66a9695d69e7497610a052f9a29facd4e3 |     
  powerpc    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/fea79dbd54fce1acd165de42f7048d17c5242723 |     
    i586     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/20343e22399f8e26edf70f107a3b74e7870fcead |     
  riscv64    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/cb7115e32a416492051354c0fbf0ce5be315e243 |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/548f383d40cbe01d6253fe6166a8079ad406859c |     
   xtensa    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/e18e1090128a2d93756a5b698b98d2b4def42a8d |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/a54b3bd9c3a22f94c91a5c006aa0fc8073b83e48 |     
    i586     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/63856dd1bbe7e98d9266f0abd934fc56d73e6104 |     
   s390x     | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/b31c9e9a68fcb2a51463104e4bd59fcae126c0ec |     
 powerpc64   | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/6a23188d83172166a3a4afb6dc0826cb12e627ed |     
   x86_64    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/f1c5f50aee76678f8a8ee0807e140ff1c99b9c86 |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/fc98a877cdfe9d54e6fce59072408b89a76e5e7f |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/afb99f97033bdc4be6672ed1428f6f9516d908d2 |     
microblazeel | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/e76d9565f534861a3a5240839b9a6054f8bfe072 |     
  powerpc    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/edb8105c711dcb604a9bb4a72bf7a9e1295cbc6e |     
 powerpc64   | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/36da5f1abd5696580ff8f718ee2d52f50b638a22 |     
   x86_64    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/bc9c54c6f140b616ab2da36b7cc594a4e955742a |     
 aarch64_be  |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/6d03b1920e01880c1c419d404ce42236fa8f77e3 | ORPH
    i586     |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/becb7ce1ab74517209dd2522ad70839e042c7c8c | ORPH
  riscv64    |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/edd6179c7f01b79153ed7b2599f00f0bfc849caf | ORPH
microblazeel |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/a1dcf98fde9fe493ab9b66ed322da1a69b8f43f5 | ORPH
    arm      |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/7acd20ff0e2c9012ec44e4bd7e68373ff2639062 | ORPH
  powerpc    |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/92325d9680e60eded201ba3f3e9cbae8c9ec66ed | ORPH
   x86_64    |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/d4548233d40fe12c9a026a1335311adba4427448 | ORPH
  powerpc    |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/82e1eb1ac665c94f430217dde394e7f6e940c9f0 | ORPH
    i586     |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/78fee83a94e8e17206d13c474ed7ebf3864acc85 | ORPH
    arc      |        pcre-legal-info         | NOK | http://autobuild.buildroot.net/results/05ab4398341d4e9feae4645562472d514cad4909 | ORPH
  mips64el   |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/e0e997eed2115a71dd9ebf47042bcc4c31e78c81 |     
   nios2     |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/9079f259ec8674af42bcbe6948f19bb2a2acf3aa |     
  riscv32    |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/3bf185dc2ce945e353c35cf692db08e8ba3bfaa2 |     
 aarch64_be  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/b3394403d10b1a4f598343296d0de5682676768b |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/41fb49a4839d33ab881c3116686f226e10e1f87d |     
    arm      |         samba4-4.14.7          | NOK | http://autobuild.buildroot.net/results/3a2204ae9ef09e6b23386e8881983282e999202f |     
    arm      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/d71aba27ff0c7711f2cb67261183506f25217a5f |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/7481797dfcb0de7aaaaa341ca2ed090b1264dd6b |     
  mips64el   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/2e752c4be618b45455232aaaaa95e904cb283ade |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/2f645a980af6dc3a55524d56e59ad235505f9685 |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/70ac97921cf355f9c26a4d8962d6fb6de4f7487a |     
  aarch64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/cc47b3b5bfdbad02be0bdf948cda3927542abf77 |     
  mips64el   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/ed8f230f443ee641581d3ea770ec1d9eff365818 |     
 powerpc64   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/a992a69005aa154301d4f8e11297b22ba97bbb2f |     
   x86_64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/830b3b0cb055b5507df29613495232b00f620f8a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e7f582b8019413af149318b694d54d6615ae7eec |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/80c16b59f6dd0283305ccce681d8f6f49ab2b183 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f705a1208bf88116919f4c55078c19bc5fd0a3b4 |     
   x86_64    |           wpewebkit            | TIM | http://autobuild.buildroot.net/results/ba850dc7f3e0a38c6ca0477c34db4761747ff37b |     
    i686     |        wpewebkit-2.32.3        | NOK | http://autobuild.buildroot.net/results/8ce2ea2f90db4df5a61a775fe466b164eafeb605 |     
 aarch64_be  |        xapp_xeyes-1.2.0        | NOK | http://autobuild.buildroot.net/results/896f45fb9eadcd235aeab096db479ee0aa5d0860 |     
    arc      |        xapp_xeyes-1.2.0        | NOK | http://autobuild.buildroot.net/results/7504719ebfb060a789c12ead343bbd7ccad8f7df |     
  aarch64    |        xapp_xeyes-1.2.0        | NOK | http://autobuild.buildroot.net/results/040694c77ab9d906d30920ce6298cfd3f5a7120d |     
  aarch64    |        xapp_xeyes-1.2.0        | NOK | http://autobuild.buildroot.net/results/cd099cbee28e8c064cf7139f9af1ea567d4498e6 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 5 
               cutelyst-2.11.0 | 1 
monkey-f54856ce250c4e257354... | 1 
           python-pybind-2.6.1 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/ec273d31c53daef1dc390825ba10712a82025e5d |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3f7563057907d7b4113d99defb65fbd45b266981 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/488043810f1d34db2707aaf540d0d13dedefc141 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/781c48341ef000e9785f7e91539936f51c9a960e |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6bd3f15e71d38e15bdef94cca0fe621217bdb4ab |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7a3844fe533428f3ac9dcd0bbb912d38c9508ebe |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1e02e35dc4965fade9d883559239f424e8553170 |     
  mips64el   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/a8d9dea8f74182bbd5948f56877a905253ea94d4 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/161a6f75ad9be431a5c107381356320db658af2b |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
                    ffmpeg-4.4 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-21.0.3 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1078575998c04ca4e33c61a8de1edca975a13198 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f13eb5e3dae45778c1bf72f935a9e76b963015e7 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/8bbcda24027be8386aa9069f5f23750900311890 |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/6add9ff1f20c7a032e3f9bfae6eab72c985dacf9 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/eb344c47ecf42180ba537322b6595fd2e62ec5d0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fa57c8ad8c7fac87eb03a9a84178d7a247cfe96e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cd5eb249295ec98394b5da9195a409205d6270bb |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
               luasyslog-2.2.0 | 1 
       python-matplotlib-3.0.3 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7b7697dbde6aa2a27a3aba7af557cbe6841c8e76 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f25414fca583351966165f637808603d88f6a865 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9f3a802896412852e7a106c4484230f19821a89f |     
  aarch64    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/de0b4be7bf591f9fdf1fda2f7f40d31d944e31f7 |     
    mips     |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/48414a1f363e4d757d031a59ab866a0df438d128 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
