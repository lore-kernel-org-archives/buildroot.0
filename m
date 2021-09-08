Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2456C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 07:08:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1454D61154
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 07:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1454D61154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7E43605DF;
	Wed,  8 Sep 2021 07:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTSQgHDKhtw2; Wed,  8 Sep 2021 07:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F8BC6062B;
	Wed,  8 Sep 2021 07:08:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 178031BF397
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 07:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0740682F4A
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 07:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Da9GbA7MUnB2 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 07:08:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FA2180D83
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 07:08:28 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id F40F0240011
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 07:08:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 08 Sep 2021 07:08:25 -0000
Message-Id: <20210908070831.0740682F4A@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-07
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

Autobuild statistics for 2021-09-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 55  | 19  |  1  | 75  |
  2021.05.x  | 53  | 15  |  2  | 70  |
  2021.08.x  | 43  |  3  |  0  | 46  |
    master   | 166 | 66  |  2  | 234 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.52 | 10
              gnuradio-3.8.2.0 | 9 
               libglib2-2.68.2 | 8 
                  uhd-3.15.0.0 | 6 
          refpolicy-2.20210203 | 5 
               apcupsd-3.14.14 | 2 
                  autofs-5.1.7 | 2 
                  boost-1.77.0 | 2 
               capnproto-0.8.0 | 2 
                    ffmpeg-4.4 | 2 
                      gdb-10.2 | 2 
  gobject-introspection-1.68.0 | 2 
                       unknown | 2 
                 apitrace-10.0 | 1 
                ejabberd-20.07 | 1 
            erlang-jiffy-1.0.6 | 1 
                flannel-0.14.0 | 1 
                harfbuzz-2.9.0 | 1 
                     host-llvm | 1 
                       mongodb | 1 
                   mpd-0.22.10 | 1 
                    mpv-0.33.1 | 1 
                 opencv4-4.5.3 | 1 
               pipewire-0.3.32 | 1 
               qt5webkit-5.9.1 | 1 
                suricata-6.0.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/11614b201da67821b63d8f955247c3e27e70199b |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b7daf30c1d9063241777142990a365dd5115daf3 |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/494ef38c6423a8d9cc1bcf547f6643e8349269ff |     
   s390x     |          autofs-5.1.7          | NOK | http://autobuild.buildroot.net/results/c489de62140223085e05da00c56eecabf2740919 |     
    arm      |          autofs-5.1.7          | NOK | http://autobuild.buildroot.net/results/ede02ceb42659a0d719d5de6c6140ddbdec8ce72 |     
    arm      |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/1415d37c2b67dc22b03ead028d0efda1d33f363d |     
    arm      |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/1defc731cb42ebbb1bb267f863924b4ef1eeb583 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9ca3725233975e6069d4dc0dedb46fe9ca0c1597 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2a212d0b090e4fc7923afda9cd712518cb6ad6bf |     
    arm      |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/00d48a8d99f81f894edd87d959ce28b6cd56a502 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2690cf68de3e75bc6d96084480af3b4944df7fbe |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f4188aaad59aa270150441305301759008a27636 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3ef74bef45444b152557772835adab863a2ecbd4 |     
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/7069ccb3b508351e30bf76d56e0777b86fbb89dd |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/6a66640dcff2a2c63af446d5722721061305fc28 | ORPH
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/e2cee1ea53c3043d2f8b41312e2b674b965a40ae | ORPH
  riscv64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/0ec3b120013f37600d26e8bd2026958637e7f8fc |     
   x86_64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/5ecdd4450b2a1dec14cb1b9a9161103347787e35 |     
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/68b96c1b4b6aff432f25191c04f1cc41c460dcd7 |     
   xtensa    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/69fc44d65a1678d88fbcba5e511216699a3be11a |     
   xtensa    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/2e8a4768c733f7875a7596bb33ad42c1d00d2376 |     
    i686     |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/a3a92b2f12f12ef5721b5fedb19d8f84f7a13e49 |     
  powerpc    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/25021e22b6e26c30bbe645f1fd577b9648573856 |     
 powerpc64   |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/41d41e6c9e36ac35aa25b563be7ca6c7a47ed5cf |     
   xtensa    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/733a4d97c0301088fe5a9ba3a69feca09e82553a |     
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/cc3e7e6249b00d010e78b570662f65eefef9723b | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/793cd4bcd909a1259d88fdca56a74558cb848ed9 | ORPH
    arc      |         harfbuzz-2.9.0         | NOK | http://autobuild.buildroot.net/results/e4da9ba40c8f4567601d404e20dd6a0b322210c2 | ORPH
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0714aad98352635f27ba9ee5fcc0afe60586368f |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/544542eb66bd42d858e6a241250c6efeba577c7e |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1661d342294575c7ec704d12e9eac089984e64a1 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/850b30ed71fe2dd7d99743bf9a46963cedd912ae |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/720cfaa8e855dab5b77ec4a7da49a8d5ac103ddc |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4309a40cc8d32024ab4d61993c93a29d96ce2a59 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/063bbd913b0a3ac2e2af691f6e4ef4c83e0f666f |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a52c8bd679d7a97f39109bebc723d5ada5f5cbbc |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/174e54d6ea8af1799f3f8d5a695bf27d3ebe586d |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d90d5b6d0fb77d2bab5f75fa8555138b2c925c5a |     
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/0016caccaed1973a7486db57074c70e473d5d773 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/14df02cfdd4c94642af4225ab3c924a94387bca5 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/53352aeef392eb401cc23e68623e0fa57d45c201 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/2019ef0eb9f754d3582ee95df700c748e41d390a |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/d535d806cdbd317b2774c671473dda60b6346f2f |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/212f91ab4267405dccf75579d803c23c2e55c045 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/b6861eb96d0b864afe0bec212eb39a6c89d6f16b |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/f77416838733592ac3f70ae2e105976ff3cacbd3 |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/ba78178b0fd80d9aa2aa2f7fb4af6191282e479a |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/adb3d5baea4598667c7c24f70bab269939ab3721 |     
   xtensa    |          mpd-0.22.10           | NOK | http://autobuild.buildroot.net/results/5dcf90d830a8ff9dacbc498a28a033de1d708a7f |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6353148d2abea6676a7d7baa4f812bbd4b2d5aaa |     
    arm      |         opencv4-4.5.3          | NOK | http://autobuild.buildroot.net/results/d5cb2420a837578d81443b113a4fcd71576ff19d |     
    i686     |        pipewire-0.3.32         | NOK | http://autobuild.buildroot.net/results/65e3a9185b3b84ad78cd05f788f741b8734d2bbc |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/ff7bd3a1f6f5414b902663b354ba42013d5a5908 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/070a72ac09f5ec37f058258bdf05eaeb993d2bbb |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b5b477fce877a8d108a5dc6238ef8e9c2f8d34ba |     
    sh4      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/833e9747c36f58900d2d3e206982d6fd466509ea |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a7451e077ed947766cd2c4c550a9eaeb905f2762 |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/618a1873183c02930fcd105931554a8c4f1fa12c |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/bd84136a59d1cc2831a2eff7bd3d55831b72917a |     
microblazeel |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/c4d077e22125fb886e6af522d472a0e56312439b |     
    i586     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/32f9c43aab4512800f38db8c576e42069199cee6 |     
microblazeel |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b13b744ae54a15bd38b22d72ed7f2ad395ebbe11 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/41b194235395a341b7d88f162df4c5301f075976 |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/c7aa48659f7aeec1e314623a9bf1dc6894e4ffcb |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/6ad39a0e4262541514ba94561a78a5c02ae04ee0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9165775b5e3c8be7b020e756b54add10a393147d |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/538cceaaab9cdb445beac88bd87ce5e000d8d50c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b637e8119aa3f61e851afc460e0cf7558f504a79 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 c-ares-1.17.2 | 5 
        host-sentry-cli-1.57.0 | 3 
                  apitrace-9.0 | 1 
            docker-cli-20.10.7 | 1 
docker-proxy-55685ba49593e6... | 1 
                libkrb5-1.18.4 | 1 
                       mongodb | 1 
monkey-f54856ce250c4e257354... | 1 
                qt5base-5.15.2 | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
              webkitgtk-2.30.6 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/df2a69205dbadcc5f510d252bfc65764cb35b475 |     
   s390x     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/22676bbb9da2c48e4694dfac6997efc8df6d4832 | ORPH
   x86_64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b866015d2c699e7d56036765c09583bcc3b24e5d | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/db8c2328e0f33b562fa7d877b4e8d4d137ad4d8e | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/5e5d5826d8f4130bdc2ee298e3773391e64108ab | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/7c948209f6e2878b1e26b2699d02c6577a22a28a | ORPH
    i686     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/1eba4ecad19f479b8d8f74d7bd2f2a9ca704de9b |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/f17b1026b56d145b8d78c9a930133211e67cca0d |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4ec3268b1b2b224d1722adc99416b4261cefaf1b |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c7f1b2f357ab53f5ac66d24ae42a61d0b8025f51 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d7c4fdde0ab2733a6f1db8aeb9aca09a9ab4394e |     
  riscv32    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/3a1a6545a112f9e326beb53c0717ab1bb4dd54cc |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/e05c190b40a206be2a29ce33e9c1bedef8856ca8 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/05fece53d7d7c9500cf0f34d731b859d04f1228d |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b7fa721919dae8c7adca30f816ceb50aa2f55959 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/5db37a814cc81f6aba91a956343b09c257386f6f |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/86609e297669abb5580b1f30abf15d991af06332 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/5e4957358cc7b81cbff999d083c119ad363105d4 |     
    arm      |        webkitgtk-2.30.6        | NOK | http://autobuild.buildroot.net/results/2fd6fbd50a2696893d3dcecc50e277c5635548a6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6c2fb2d18e6c214e5c65be8a00b3a7a0a12f35bf |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 c-ares-1.17.2 | 10
                    ffmpeg-4.4 | 1 
        host-sentry-cli-1.57.0 | 1 
                          llvm | 1 
                       mongodb | 1 
                mono-6.12.0.90 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/b155be63fffdb2dcb37c157c87ca747628a04aaa | ORPH
    i586     |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/dbd6e2e522f61b842e46059bb8b8cd462e8ff6bc | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/982c50d8755cfa9b583bf45ae49e301d440b243b | ORPH
powerpc64le  |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/aff0e0e98f6614d041100eb4d21a787ebf7c5b96 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/a278cce0a82666d29d4f2ae0d6911af070475843 | ORPH
    arm      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/ca666ca395f70cdc42f7374a69faede0d7bc2775 | ORPH
  riscv64    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/f3dcd4018c7f7a792fd8f80cf5e1e53c2d69e574 | ORPH
    arc      |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/067361c2589235de06e09f59d2102afacb976928 | ORPH
  powerpc    |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/a44ff898f4861ccd7acc937b8679d3d5b6828594 | ORPH
 powerpc64   |         c-ares-1.17.2          | NOK | http://autobuild.buildroot.net/results/e615a3eb9cf15acb6728fe564fca5e256b5d7cb6 | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1c97df326af3cde7768754292f1374c9fb7e0831 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/27027a2109584bcc6396fdbce84cc76ce450c07e |     
    arm      |              llvm              | TIM | http://autobuild.buildroot.net/results/30c375c7b90d9db0cf6b87ef57806fcb7465eb25 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/9ab601c6f68a3a91effb32ab61ec9bbb153c3672 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ebc54e5dea63aca21a4072d294fdede41de559c7 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/1e22ce2e45ba0b6c0c0e557f63d8ebcc511ad226 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5855e6b54b378b87abeebd247001b284d8b9372e |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                 mesa3d-21.1.6 | 1 
                 openal-1.21.1 | 1 
                    qemu-6.0.0 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/f9a9dcdb8c9b1db6aa77ea929d87c72fd25b1042 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/b6d36d3fcd5f59c99349af61e4cd529591da2143 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/baa26aeab6ab50a79c1abf8af0aa5d1bf46271a2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
