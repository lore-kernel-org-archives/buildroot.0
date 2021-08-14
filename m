Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA76C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 06:56:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D161A61038
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 06:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D161A61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9593080F2B;
	Sat, 14 Aug 2021 06:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6yAhdkWdceII; Sat, 14 Aug 2021 06:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBCF480EA0;
	Sat, 14 Aug 2021 06:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65D911BF3DA
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 06:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 542F5400C3
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 06:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4Yz7cUJ-Jhl for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 06:56:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FABE40001
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 06:56:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 152CB240007
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 06:56:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Aug 2021 06:56:38 -0000
Message-Id: <20210814065647.542F5400C3@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-13
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

Autobuild statistics for 2021-08-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 32  | 10  |  0  | 42  |
  2021.05.x  | 39  |  6  |  2  | 47  |
    master   | 153 | 48  |  0  | 201 |
     next    | 33  | 27  |  0  | 60  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                harfbuzz-2.8.2 | 4 
          refpolicy-2.20210203 | 4 
             host-cairo-1.16.0 | 3 
                    mpv-0.33.1 | 3 
                      gdb-10.1 | 2 
  gobject-introspection-1.68.0 | 2 
                   gvfs-1.44.1 | 2 
               libtheora-1.1.1 | 2 
                  ndisc6-1.0.4 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
               collectd-5.12.0 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                   gssdp-1.3.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                librsvg-2.50.5 | 1 
                 mesa3d-21.1.6 | 1 
                mono-6.12.0.90 | 1 
                opencv3-3.4.15 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.15.2 | 1 
            qt5location-5.15.2 | 1 
                 ripgrep-0.8.1 | 1 
                  rygel-0.38.3 | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f558fb291664cd3fd699651f81e31877865accc5 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3b4b0e689bdc01d603b3ed96d9af299b840f50ef |     
    mips     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/047eb1bfa4d5c129a92e1dd561d2564d7a3185fe |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/02b10c29c03bb786f8afde9deb2d972ac1a24a69 | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/782b67d66687a516313ba574cc7a657b8796372c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2f30e71dc79429d4d970543d99c7a99e5c871cd8 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/a6bd367b91f5ed35317397f8f95e1c4b37d78039 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/2b56a80c5c298a0de28af03252e5f79bd5cf1602 | ORPH
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d09cdbd12275bd8791154740a97bfdf8a12543d7 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/9456f5a3ccffd757cdf3ae76447463d00b2b4042 | ORPH
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/ad8a48d4e80924d882190bf0881ff23d1b75fe69 |     
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/967a5763378dbc79869693ad99d3163e336c19e4 | ORPH
powerpc64le  |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/7e60fda5aa20b4063324608c5cde5f140296e717 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/af829fd5c4dce96705e3f3290be3523564fddfe9 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2d6e6be2136e31a1a6db4332a16f3f31da7815bf | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/8c0c2f8f2bcb952af095319b5fc9ef26135a0a73 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/c1b6839157c79b47f93febe4d96eede0e017cd87 | ORPH
  riscv64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/7fad657130e00ffdcac88f12a80a88de257c259f |     
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/00e29958cecfffa4e994ab549637117dd8f55c30 |     
  riscv64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/94bf2cfa5810507ca76e1bfee5d852fdcdec4f42 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8ae4efc45d6092f7f202e3095dd4a9cdba59c8a3 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/caf8dba6b2baa566e753d5229d2a609291465912 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cfd891c9794526d59432a3abd4fbdbe109efa3c4 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a5830c3d23193327746861c39a0046b9e04d3dc3 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/81342a5f689350999f29fb233be88b230d8f7e61 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/13cf87e541967e13514d05f9ec102ccb2e89a8c8 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/5e3e5d5315989fb310372d50ba6fb5a233651503 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/1afa88dccf277de0060bda67721b475b8aa702c1 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/17648bd9c8ffa0f492786925eef1ff68d6325db1 | ORPH
  mips64el   |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/04c68cf79295c8d2efe1f25bc18ea89684a9067a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4c7f514b8f99793ef9962a8b1c79a8ca53c70d6b |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8b3180fd7f719d3b250d297c839f92288ca7eef9 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/76f300eb2edfa837b2a4c7e42230772c1d99637b |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a4a3810cc75b7cec72f5d413ed27aea090b927f6 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5bfdb6a7627fd8120afca02ca1d0da1426852c41 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/91285f6ed493422b1c60b8d8b68e310151c04c7f | ORPH
    mips     |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/2de61d6ec8f539c1bdb7f94d28024299f1c1156d |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d6dcf44329ab3db162c15d850992cc62e153a530 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/28aab82e1142404b3c66a0a8ccb0f650c6ed449a |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6a42baea937183aa79586c41c3e5a392d536884f |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/acb575021fa42da3a25d5db174b97effaa0f39e0 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2fb7564f080dd90d4964691f092d68bfa08ccfe2 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/aaf189740f3903732140b77fc61aeb5a20c7ff7e |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8c7466f923e8c31eaea8e2de5b9771ec8878d031 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/5bb4e22d0a059fc36e759dc23eb9df57f9014761 |     
powerpc64le  |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/44b43f14242d397f958d247f418d3ef5351ebb1e |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/66a71d3b01df1101dcf00cf57c25a3e66e6c5eae |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/06a79bf3493ebd21503ee2426c8e2ab508148e49 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 3 
               apcupsd-3.14.14 | 1 
  gobject-introspection-1.64.1 | 1 
          libmodsecurity-3.0.5 | 1 
open2300-f21982e0b1f8321561... | 1 
                 openal-1.20.1 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3bb5ac34b61812c3c8872cafa6a6dff2d7d484da |     
    mips     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/cff50ffc343da69ac7af85a3080a066b79224560 | ORPH
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c653004b4c2e9ed32ca1e000cb92b0da62d88c1b |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/4a912e2395e7f6e6bb7a262f97eca84766119db7 |     
    i686     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/89a7cd81f44cb3d4ba6dc110d2af2c37ac1628d2 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/2215754a0aa80cf254ad4ca352e3a9c6a943e206 |     
   nios2     | open2300-f21982e0b1f8321561... | NOK | http://autobuild.buildroot.net/results/92915f44b452bf2b54800f02802147f40719aa79 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c7e06b32736800ec32b373694aa1ff710c4be4a7 |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/4904d6b54768f924d78cde7aa9baaa4471c9aef3 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/84568637b1136bfdf150881619f0a5a1e6245ac8 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                ipmiutil-3.1.7 | 1 
                       mongodb | 1 
                 openal-1.20.1 | 1 
                 python-uvloop | 1 
            qt5location-5.15.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9594f0764c34eee3d857a8057c34a5429ab67c5a |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7d98b08ffe11f8698964074be675e7b067a9ea02 |     
    i586     |         ipmiutil-3.1.7         | NOK | http://autobuild.buildroot.net/results/69f4fa327bd55cbcb1aafbd64e0ce5f62835f4d3 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/923a8c650ea1ec3484bd69cab9505ebd530c1fe0 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2b84bd5bbda110e31135a83c12bc71dc7bcd9d8a |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/aad53953c935226dc937857e3c7e9b6f117fa5be |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/c0c911bf77921dddfedd12c7b93e42942412e535 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/65928455d2a55390e1c2cc2ee353245ba1ca2be8 |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 8 
        host-sentry-cli-1.57.0 | 3 
               capnproto-0.8.0 | 2 
                      gdb-10.1 | 2 
              host-libcap-2.52 | 2 
                   libnss-3.68 | 2 
            erlang-jiffy-1.0.6 | 1 
                   gconf-3.2.6 | 1 
  gobject-introspection-1.68.0 | 1 
                   gssdp-1.3.0 | 1 
                    mpv-0.33.1 | 1 
                  nginx-1.20.1 | 1 
          refpolicy-2.20210203 | 1 
                suricata-6.0.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/80866680694df27be763a9a843b690019a2e885e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7e667938faee31a8948c17de28c94a33daed174b |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/92853971403b0d665e3ada25d90a2f65b8f11dd1 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/c0c9bc62eb5096fa6224854eb4b67e60f7e4e95b |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/adff17a4182a8ac1d33c07c962d1be370d4c5f33 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/ce47d616ee79d5f735779570ebc3b4a9c0f64c6a | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/22acdd598e8bb54139c1f156058811dc7b309c47 | ORPH
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/32eee2009ac1d154b7bfd26c1a59a02e2f57c31f |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a35af38aee9c2bfae4cb1f6c0ce4f8e418e3a6b3 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/32243fb24ba78f092a97eee6b4f01a9759022e45 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/98bc315c38ce5a59a84faa1cbeaa2f6feb6c51d5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aeb07d32cc002eda7116d31942c1462700731ba0 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a75f2cc8d4706a98b98afb13f86384e98933a59e |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c2c82ed8ea75168880cbea44bc5ee0ee5cc41419 |     
 aarch64_be  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/988a44dff391000d6a845146deaaa28d26a98738 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/9fc2aa98c0e3a4122af1db7a69d7f238d1a8b0b5 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ce76a7659492cfb56f60e525277199d481bebe34 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e8ccc4e23dd47323b68c945756abc2241dbc9afa |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/029cd9ef194abe62ca35921f19d4fb4876b7dea4 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/930e8ee83b6e8a923f5c13e981244f5b7648d4b8 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/019172095cc9e37f42f1a6b8a103a74885f8317a |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/546aed23bda71c2abb951f7d8e4ded517c21f064 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/bfda9e262d83f0c1b6fb5b361041d3d05dc0a899 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/929c92a60caaca62b24c54db5de75057b6daa4a5 |     
   mipsel    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/249a30fe90523031bb463c265ea240dbe1a16256 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5ea7e9de17252d21a53f95114ec0e5ff1f58c31e |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/8acf491464037e595dfba04cb1c157d8ee6dbf41 |     


Gitlab CI results for 2021-08-13
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662812  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662814  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662817  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662819  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662823  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662842  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662844  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662845  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662847  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662848  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662850  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662851  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662852  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662853  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662856  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662857  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662860  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662862  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662863  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662864  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662867  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662869  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662871  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662874  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662875  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662876  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662901  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662904  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662947  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662954  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662955  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662957  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662959  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662962  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662969  |      
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662975  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497662977  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663016  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663019  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663029  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663033  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663034  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663035  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663037  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663039  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663062  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663063  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663064  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663065  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663109  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663113  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663123  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663127  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663129  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663137  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663152  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663249  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663263  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663265  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663266  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663268  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663271  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663294  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663296  | ORPH 
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663302  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663303  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663329  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
