Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9273C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 07:26:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C1861179
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 07:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32C1861179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1FD5605F5;
	Fri,  6 Aug 2021 07:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJ2z1DLS_m88; Fri,  6 Aug 2021 07:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC1260616;
	Fri,  6 Aug 2021 07:26:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41C441BF83B
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 07:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 262C640455
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 07:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TStQEjcKlJQ for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 07:26:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF27740453
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 07:26:28 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 67DFE6000B
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 07:26:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Aug 2021 07:26:25 -0000
Message-Id: <20210806072632.262C640455@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-05
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

Autobuild statistics for 2021-08-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 292 | 83  | 19  | 394 |
  2021.05.x  | 336 | 56  | 21  | 413 |
    master   | 1467 | 520 | 66  | 2053 |
     next    | 255 | 358 | 36  | 649 |

Classification of failures by reason for master
-----------------------------------------------

                  host-python3 | 54
                    mpv-0.33.1 | 35
          refpolicy-2.20210203 | 28
                       unknown | 28
                 libebml-1.4.2 | 24
                 pixman-0.40.0 | 23
                  zeromq-4.3.4 | 20
                   gconf-3.2.6 | 19
  gobject-introspection-1.68.0 | 18
                    qemu-6.0.0 | 16
               capnproto-0.8.0 | 13
                    ffmpeg-4.4 | 12
          libmodsecurity-3.0.5 | 12
                librsvg-2.50.5 | 12
                         glibc | 10
                   libnss-3.68 | 10
                    mpd-0.22.8 | 10
                 openal-1.21.1 | 10
                  polkit-0.119 | 10
                      gdb-10.1 | 9 
             libmediaart-1.9.4 | 9 
                harfbuzz-2.8.2 | 8 
               libgtk2-2.24.33 | 8 
                 dc3dd-7.2.641 | 7 
            erlang-jiffy-1.0.6 | 7 
              libostree-2021.3 | 7 
                 mesa3d-21.1.6 | 7 
        host-sentry-cli-1.57.0 | 6 
kvm-unit-tests-kvm-unit-tes... | 6 
 Makefile:740: target-finalize | 6 
                   sdl2-2.0.14 | 6 
                suricata-6.0.3 | 6 
               apcupsd-3.14.14 | 5 
               libtheora-1.1.1 | 5 
         nvidia-driver-390.132 | 5 
  system-config-printer-1.5.15 | 5 
android-tools-4.2.2+git2013... | 4 
               belle-sip-4.4.8 | 4 
                   gvfs-1.44.1 | 4 
                 libqmi-1.28.6 | 4 
              libsecret-0.20.4 | 4 
                  mupdf-1.18.0 | 4 
                  nginx-1.20.1 | 4 
                      poke-1.2 | 4 
                qt5base-5.15.2 | 4 
                 ripgrep-0.8.1 | 4 
            libqrtr-glib-1.0.0 | 3 
   openvmtools-10.3.5-10430147 | 3 
                      tar-1.34 | 3 
  binutils-arc-2020.09-release | 2 
                flannel-0.14.0 | 2 
                       gdb-9.2 | 2 
                   gssdp-1.3.0 | 2 
                   guile-3.0.4 | 2 
             kismet-2021-06-R1 | 2 
               libgtk3-3.24.30 | 2 
          lua-lunix-20170920-1 | 2 
                mongodb-4.2.11 | 2 
                mono-6.12.0.90 | 2 
                 openmpi-4.0.0 | 2 
                poppler-0.84.0 | 2 
               qt5webkit-5.9.1 | 2 
                xenomai-3.0.10 | 2 
         xlib_libxshmfence-1.3 | 2 
                 apitrace-10.0 | 1 
                apparmor-3.0.1 | 1 
                ejabberd-20.07 | 1 
              fstrcmp-0.7.D001 | 1 
      gst1-plugins-base-1.18.4 | 1 
          gstreamer1-mm-1.10.0 | 1 
           heirloom-mailx-12.5 | 1 
             host-cairo-1.16.0 | 1 
                ipmiutil-3.1.7 | 1 
                        lapack | 1 
                 libuwsc-3.3.5 | 1 
                libvips-8.10.6 | 1 
                 libvirt-7.4.0 | 1 
                lmbench-3.0-a9 | 1 
          modem-manager-1.16.6 | 1 
                   ogre-1.12.0 | 1 
                  pango-1.48.7 | 1 
                     php-8.0.9 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                   poco-1.10.1 | 1 
               pulseview-0.4.2 | 1 
           python-pybind-2.6.1 | 1 
                          qpdf | 1 
        qt5imageformats-5.15.2 | 1 
            qt5location-5.15.2 | 1 
             s390-tools-2.17.0 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  udisks-2.9.2 | 1 
                  uhd-3.15.0.0 | 1 
                upower-0.99.11 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a98a7d4a39421ec950f56af5cefe2e6215795d47 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c96aa19425bcc1797e5c96ffa84ed20fe094926b |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0e1ec0f0f3632c12bbb2fe0b4eca49fd205ba150 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/aebd6a370d4dea8b3b0dfdffba1ad149a11de3f0 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2ab2ba2011b0945bb627c11699d747995997d6ab |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3bb5ed4cf7c3f6adf40cc737b48d39085bc158a4 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/eac924bca0a67757e66a6142b49b40505febcead |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3db8250fe99e084306bfb4c830e88f9a27263fd2 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b1e87398b45a1073d67c1c32c3af91789e3866bb |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/556e645a60c7e1273e47595f24ac3d4d08b7c14f |     
   nios2     |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/4011f20d17d9c5ac63a0fd6eb0a271904f280ede |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/42bfaf195d0a9e33b469386242d9d7b8d48cccdd |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/dc1eb0db70ee4d3dab91ddb8f0c47d6d3c7f17a7 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/9474634db3b20d3e3d14cce5712f2733e6e31a78 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/7015186a674f1238f200c7076ce9c0fcc8aec5e4 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/dcd371ed7d100535137eeacad0a240cba961e972 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/88c92246256fe9e686874581a28f2a618af9527a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/621e3b766be1c79801a222549196035015e2d5f5 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/db11cbf95d743790b6cb6c29e2b741657a38fe67 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7faa318bf44b6a733a076a01f1c3c79ee026e86b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c6f96465c5c304e2b09863976af7ad22287f3ebe |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bb0c73fbd2115bd9e4d201d500f27209ea245c05 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0f74ef4578dba618e4aaac2da3041983cc8ce9a8 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f92c4c537c464c3b9056c892f6321deadc7df393 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0c67af45ebbd87a2e77d9e04580d1116356aa389 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e549343e3c1eeabdf1eed4328b7e7d6dc394d5bb |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/192fcefcab9ac36759d05dc2a413ec8f113d2512 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/76a1f23882b149a687bb54a97634c5021f2a65d9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/98025966658cd66760a7ea1dc04c528fc9a37e8a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/994a81c2686048eb9fe65031d19af37a94d92440 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/adc50cbab8ee6c656e77b0257ea8ff9793d18927 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a42cc4099c749366ae2e9e67cde30ab010dff7ba | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/34e9ac0de835301f1147859258f91199ffb7b49a | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d9864e2a27a9f6cd3b8fd14cfd698c473b013798 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ce5254a81488d3895f590a7af481d83a11491185 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/259e4df6c21c01fea0ef05ea85c0d0950d1b830d | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3aa2178cdf42d646fb1921b5e69f452ccebe5aaa | ORPH
  aarch64    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/6cee742e8855fde1cde3b6661875f29d9a29f6f3 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4c9267a3624bd943993fc0d9ec00f4d23d3757c7 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/19fc12798fc15f8e9edbf923d32056f68224aece |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a1a6835b5c2735c0c0823d8046e99d74515886ed |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2211bf403725dcb6fad599b92d87cdab974b14d3 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ea7ff6475b18f6a3344621dd4d73ce6c089e009b |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d16103ef4fa8f33871af41f6932b4ebb3a1616e2 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3b294bac79f4d11a4236f65d663f47ab7d923986 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/82d7470bc23c37d50a00fd757ac7b8d7bfd72bcf |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b87213283da2799103c831a14fddbf615780ae21 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e6c61b1162de56539d1bda9e16be0b6e32a2aa3f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/83e2c5462f63804fa7af3dbaa0c68d829fbf6302 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0451d797def6500bfeae6ebc82d6e0f4d5afd0de |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/20fa394686c9723e2fdf014a577bb47f71ffcf02 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8608f2a2a02849a9baf79fa19b76339c9f2b71d9 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8b8fa2cfe8e0ffacb840137d77fcb434a0b12a45 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7a58bd703ffb94365cf6302d755569ceda8a6c1e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/32d4897e723ec68bca0df552d6e4c4f2f39ecbc6 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0820d757a037e8dc8c9beaefa882d4d2db34a102 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/373622d1ab51f7374c47690f876ca8305f911a55 |     
    i586     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/7770b2276ca93e2b5b328092bab78caef3946d09 |     
    i586     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/313aafb5a7bf45ddf96128c79523e0406b8532db |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/185c82298b072336ffa6bf452e337e826bd0f34e |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5ba8fb63a8a2746138491f0a9e63f01afb2fff91 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/1520685910779648de580e0400f7e17823552ebe |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/435ed738e7ab313e89830e26c47c303fe2f8c1d7 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/02c5cdca2cff2867f7884503844b734462029ab8 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/707c90ac8b8eea6b4a88de21bcee034369c019cd |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/937659914d5991e5714917d5aadfa9f8f8a4c44a |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/610b711ad56e37806bff6b698e9f6ecd1964f7f4 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/6ae0be5719cffc2a6dde5baf2ee451b103263665 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/18b8af2c12408a75eeaba9f03ce225353d292dd8 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/1e177d64613949dc93201f9591df034ba9222e06 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/083910d27d506e27d6ffd61766903fe62c1f4bf2 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5402a642c7d28945081e5928b765688671b0c84d |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/32002f236958f553130b1a756f45791522c45efe |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/9d0cbb9378258f8d097401a023776aa8bb7d121e |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/79211ac3b70aa6dd5e07f32c8ae05a9dad729483 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/3835555b54a8be703dd397c68dc99a9116a11365 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/598651812f75cc6af55623ef3ff6778f0bf12e76 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/54447e77ba651bbdab6f3e065a1e55218f4fc231 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/6d7fc8e8b605e86612153d46b66318e1906966ac |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/33b9fa3533b5f3913d2767f9f427db22331e5ae6 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d0ebbc780af6a863b75dabd9d970c6b24e6dc0be | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/541febffec1907ff706afb89b7e0ea1672a7ef74 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/b2d4c6a96cdef2bd308ec6e7c9e5fd8c710322c5 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/2be4a7d697e20a134de702c4fa96dcb150d898bb | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/1b6fad68a791dec4550754693f3338a9b4d49bab | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/e3667207304424fe366b097382043cbe55780435 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/50b4134db4db07f633d1e9efffca90609959ef76 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/2f026f1a8d407fa7113cd80ee216da71a1720dad | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/2e8d74b5ec2cb6f933e007a9fd2accf10d18a6af | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/8dec5b68316b7ecf6d6bf8a22364732ab45f6151 | ORPH
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/4645cc636477fdf0d55d2a47d6b27bf5e359aece |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/f997065190b3b5ea3ff6f4319bec8a5c12fbb17e |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/769a700217c385c6f8fc3bf8ac148db8b855f190 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/9d8c227e2f91319235d594bfdd3e73e0defa2b04 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/823a394901c9e3594117d5d13828a9f67ac51150 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/1fcb97f7a80d353689d3a0e165732b5ae070a203 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/7fd8b7937b0e6e1c3386dc597ea24822acd37964 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/20adf0151d99b2c428bd7ce45eadcf9c26599b8f |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/5c6d15503b2298929b879df58818a6c3a910e059 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/76bb901e164ad10fd26d5e2dbc8d5132193d7cc1 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/5a65ab705999455562e78ed628f3e72b27a7a349 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/52603d3907fab0aaf658fcf760de3f01f01ce155 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4a0c04df1dd86a2f61f70dae0b6370633a1c68c6 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/e9ddecb06125cee787603a84fd222667f584f621 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/fba15c34aef0a17fa6aa4c24d76edb045024a418 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4f7d7ff137fc10caca16fd8a8925ad31487eef16 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/51a8c3f51737a871ad25290c8fa368504951ad2a | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/623527743b7455d8e6743a8e8325334e6bf5f1ab | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a4c3ffb871be46905db5cfd9719dbc60d14ea33a | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4ea75b44aa858c71639c849a95a1c0b1f965e403 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b719b796b3c7ea23f5443710af586d1c855a97cb | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/1fa0f8c8811b8e69aa59dbf0609515d01c88431d | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/efbaaf21c5d986f5bbdd1573484214414ec54236 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6025da04d6569fe6b1541752d2e8809049ec150a | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/5215e0a426d9782e1d0c92d9278ea31d0b7bc2c7 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/8fca92c860e340578195b2bfa50fa7d1deb09ac6 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/dc14f6a1e629765c2d5e7d8f66b3daccf7634c5a | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/f3e1c5b0960b3ff786c08a2004aca64ca96adfb2 | ORPH
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/4cbb7ed6f9c74c8635a0893d283cbd6b73b0b887 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/108249c3ef7e4cea1d4ca898cb62d5bba0514471 |     
  riscv32    |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/ab3a72c906edc4f274211cd686ccb21c2ebdb829 | ORPH
    arm      |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/727771ed26f3336d770e7df73ca3bdfde251cfd8 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/4a3a5585cf359beabc289da10ff071f296a2c70c | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/b413e259f931d55add5c4a55bfed80fee65a9b5d | ORPH
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/daf1376d2ab5a9d337642c1308286f9a421c4607 | ORPH
    arc      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/abab17d7238677cb2b5ebddbe1a82f7614ca7635 | ORPH
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/be83e80554d32f7bf61324d8bbaf4a61520da0f6 | ORPH
   xtensa    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/61ecd2a988c0210312189a83a303e009f80d5520 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/a558d968e2712ee78791f84f57a8842c1fe7426c | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/cc409642596700d07906d2d679de2c71fb503a25 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/c947403267f01714f241e67a758320610978a9be | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/922e08a3243dcbc4c1d9a043a8b99f46220d211c | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/9382661a27ed6ad775cb4bf45c440a8cfd6b9c4f | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/d93732f2a0746d2fadff98fc1a3169a9110f2436 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/54abfd2adfcb0b30c67c66ac04b0e872a74b3592 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/6ff8da4cb7720f69f26fb45ae6916d5227921624 | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/c35cbdae18034e58c6a076b8dddd4cc9fda90ccb |     
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/b9a484548f329851e4fb672b58fb3032d0172613 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/776dd1d4c30136f5cc74028a99d18cfa86a104cd |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/4ccd5fae5097d45a85201928e9fa9c2b0dd0b5de |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1f2371b0958f81be5b161c67e0ea26cad701a269 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1dc0fd383df55e43d9a96292ee034751effce0a1 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/2b5c1db0550ce7324d3a26da4be115c8a69fc30d |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/671ac44f3417d3b53435b60b4a2f1ac73fd5a1e7 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/64ee787f8d76a04370b3b6b41b086a3bf9e53621 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a284cd601b664578240495e3926d3314b12afe5e |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/d9ea5758d8496c8a63294349991abdc4545f73a0 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0e7aca36c7256e339dd8452c192c290cd6676d14 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/1caab2171c3badb918ea1b0218afd9660495eb44 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/3ff777aeb0bcbd296bed01e948e3581221c041be |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/9916e82792fbd1f3ef77ef1e2ae6d122f61f499f |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/1c7861262fa76c78adf7c62d7cbb2cc35aa7e6e4 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7bba527a501a7971a3b9ce082e36b6c3be2a949a |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0c86abd93938c9ec8a04f2b3e589f46c67878ed6 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/948722db874cb1300694d458aff5098e5a88df29 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0ffd5bf231da1c0f0ddad67e2de7e29b1a6547b8 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/df7548d95a05146281b0b6f005a22a50bd58505d |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/31e3af50cf44a2846438775f55eb9b496a260330 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/b30fce81715bc0b3e83c344fc7283db4a175ee5f |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/52227a6e99638a06621577ebbe1961998f6f084a |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0e39fbef1236c2817470f442bbc4704b6d2cb647 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/4b6d86b8bde2b31e632ecf5b2bf25623e3693a34 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7f624755fc55f966d3f6302845393297f7782ddb |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/effc77146fabdf26976048a839412618c014b057 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/9b256f260aa9d08988abc63c4edd917d53f3acb4 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/be94dc549efdedd50b82a96264832f17d37bc62f |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/8c867d4633f3b8f48836ea6986e982a066dd8b80 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d37aa98484d49463c6f0ebe524c10bd7f97d5141 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/fff88d7bda5b12993b315cbcc34dfe3c06e8e881 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/94aebd872819ea4d22136cf3f73c87f5b7fe0093 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/825675d551d73cf4f1f606a661d4ae34a2cd5274 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b441fcb12039f9da69730febb0defc67de44efe9 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/337def6e991a4e260eebdb1bf1256fa31d6a890e |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/eb7975fe7e417e0b04475aeb78d79f18bb8e95e4 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/332b358630e7266f9ef82131e9f78b9d19c8a8df |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/85db84bd69873c37fbb896bc828d2480aefa733b |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/3d8e481d8788d16a69f10fbf9e7a98493a810c43 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/3dfb4b06b47346c56575087c9ca0441d67194476 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0dc1a7b74ea4d1130673e118a8e45a6cfae631d9 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/fc84434712e954f6ad4822868f6ffb1f65547372 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/76ab71289288e68f84eb26bbca15e31939cee6a3 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f21c3b1995c1680739acdbf31fbdcbb893953b21 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b3c337ce107617dab5184a894bc3aa14d180c576 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/593c7366eaef7076f230157db296ee601b971cca |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/72dd728b207b1194bcb54bbc9fd0820b5f8d6192 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/7baaa31537db81549c8bdaa39bd429d4aac75e8c |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/915bd2537a7337ea4991d24b0795c9fc4f0caccd |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/37c1c7d5920dc8c11f702588898793f803d8b3c1 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/7c5f08c9513a249c5e1cb2bf5ad4316511bacbf8 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6675fe5f4b568e0952ac51ab8092dceef0ec468e |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/83c4a900a7f7b31932c6ab45210e1b9781530213 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/49dd2920494cbd33253b14f512a37fb60acf3ce0 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8e049c8e4df843882015cdc815be9876f0008f86 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/089c8612d570d1c5dc634182b9d981a12f2a8dbf |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5484b568dcbcbfc189e5432fad3d9388f82922e0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/604917c74286f3396614e3e069fef4b8979745be |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/613a8b807e54bf824d3510cfefeeaa62d50e2f15 |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6cab5c6268b157f182bbdd7c18d7f1fa80e1f361 |     
   x86_64    |         ipmiutil-3.1.7         | NOK | http://autobuild.buildroot.net/results/2005af881726473f2cda176e90c1e41e4baea67c |     
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/f7b0d04b451c7e5132cd4d3380b6a5327957835f | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/540c8099fe97e2932e68cc02eaeefb15acc79a85 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/42488d3d0f15b1553387d4edf8eb26382acf23b0 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/63a720cb43ad7a3b85dd3f19f33debefe70a3143 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/da72efb4d579ac8e1deed6a6df495a602fe73fd6 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ba56f25007c6083b669259146a2e8ad4f802b380 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c0e4a30d3252233f7b81d300d794ca0402be0279 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/212d5f19515d19479546160d0c9198b9a8f24ec5 |     
   x86_64    |             lapack             | TIM | http://autobuild.buildroot.net/results/c1929a0eb94b0a3b0b8c693975683a3529f8bf0b |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/99d70367a029d6467c8eff29004c77a9a276fbde |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3a28507127eae47994ca62e2b656da32bd2fb1f8 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/85e5d2e9acf6dc5449e10d653022c188c99eb2f5 |     
  sparc64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1fdb100f7def415d8705c565fef8a1d2e407d6b7 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/7fce6598d934552842351fde259a1b068cba17a4 |     
    sh4      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4b706fe2c636a23f0dc5d803857a9704b810dbd7 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/35571126b42541ffec00eca2d89488575699ed70 |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/54b63887a92776f18362c63b8c9d6bd905672751 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/49098b864c189d556bab8a7cd11a600f9cd960fe |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ef0cc5fb9e4ae730863df444a9f4ce279fb4f009 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/997d0d6204ad7a5456f25392257c8d876a1289ca |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8a7a0f2407202ee5ede72b3c2a1a69020ae51f2d |     
    i686     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/9e17d6f384c1778bec64309a134f95edde3b11a5 |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d1e269d33ba3f60039e5858f81755ee6928bb100 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/a0193c40e1b1eccd0b858cae652468b75a8e8f65 |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/06041b2d5b1d6962c83574822b5ef0be90ccabfe |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1104bb7829459bb128f7e7681e1040e4ca6f3f6d |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/a6e8bc56f999569e1b19331d252bb8ef54dbc58e |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/0a6fbda3fdb132de4303ba31e90ad9c7b96611ae |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8e69b8c460c5d29671b2c2dc3507ceea521b5e35 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d0899514de5e1b41da3981bc323f259c2f53e1ba |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/410578769b2a6f2d1dbf238c591023caf9710429 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c77e519d16f71884ca358c707a24a45e14d7045a |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8906aca450045d80e919812cfca38ef9b0b579a4 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/659b35a3f2a312f12ecc4e20a091ac11ea74b4e8 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/f51269d1a9df612e3e69aded227a03d704df1def |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/b8cee3f03882340f774594f08acab3e1edb26add |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/3c01d1d4f25217fbbc0025d38d7321cda4f73ef1 |     
    arm      |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/717f30d80cda585bcbb9cdca70899a4f9d43fd93 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/fc112e15d3986efb5c13587c9c3f92bd7df19742 |     
   nios2     |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/16591edcf73e8a76c24b4405db43f26e6b21cc59 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/f0ccd13ab5eb614039c5a02e82e1f2f8aa52a53a |     
  aarch64    |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/48e6ee1fd9397e534397ce2f66c10e400fa55c48 |     
  aarch64    |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/605966533f38a0ccf0caa3d6f31ba1b30eb83ac3 |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b1f21cf20b8ed659bb31335048d075fc5886a5ef |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/280a239c3100e65ce3e4fc99e20f42c7a2324242 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/bb9a91ed46c04f4b1d06a7d860261c53190a6a4e |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/cae073c66711a2929565e7b4fa1ed953c1f764a6 |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/5356db89d5b5dc0637373e11ecea124b18aacbe5 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/bc3d24163ca62f9ab8514e0e0795297697fb7167 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/de98de966de2a9ed959a8683545df0846109b1f5 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/4ecc819e3aceb466f1035f91264f521f71e8129b |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/448385e60bab1f79002acd8a425b9114318936a6 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bbcc82b2a5d5b99a323fde37f4782c112987b374 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/14c8f2fb9709a2b1796d5857dac32939c8c580bc |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0e2f0f3bf2d7b3c18a5f6695321d6edcbb96f893 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/17f5b259d8346fb99b5d25faf220efe153c55b70 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/76d46db1e7ebe69f65bf70c0355a10ab677c7e94 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/833b7237b60f62db77753f79a90606134ffe4e97 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1ca41f9166ed6fdc64345302bc8fb8323cb35d07 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/601b364e4b1ddcbc100aefe097e09bbb4a493c22 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ca3e7f85468a98e9946835ce8f7f0b12a5555b44 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a5e1a353f820ec78cc34e5b1256f3579213f5f1f |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b7efbddabccbdee1446ec752a8cd5f4675c223f6 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/707a62340927b488e66c91d06b3cd1b7f09b4de6 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/10280e320ccf6696954cde9a8c407cc623de5afc |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/128e882fbd866549573b0093f25a7cafd629e94e |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b2573b0d2270271e6c2cef00c1d8baf90012c3c7 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/bc394fa4ccacd5544bb68a7d3f1ef87573969f6a |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/d9038c3b4340d85ee44b61e04a07d4a912122d5e |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/9f18859b56d4765d7351a9929776f60f4871d98e |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/50be3107e686b6a20012d47da64e6c694932dae2 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/13d5b860567a265531acbe72c0e0848a9fcac034 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/db4dd079d37806ef35559d0c841f7f311cae82e7 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/5366defaa9485b1f5a982435ae65df935b8f1f42 |     
    arm      |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/d0f9c9a0afd7cf7ba37bbaab31d65c34a1aa21e0 |     
 powerpc64   |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/86aad8bcf29f4ea6920a8b0903446753509a7775 |     
   mipsel    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/253826378d4bd86ed3161dd65709ac5578912055 |     
   mipsel    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/849b830c8233f972f1ecd73c35a40ab72ded2eac |     
   mipsel    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/52d8d519912108479d84a486d0501fb4ea0d1603 |     
  sparc64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/17c1d2c4887398ba215ba7872271c4696bab7805 |     
  riscv64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/2b5ceb6a168a61f728122d5faa63e66f9a2cee9e |     
    arm      |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/c14fadcd3206aa7aa31ec6239445b8d9a7bd2ca1 |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/a67d9c1bc44e590cd866eeebe51c6c03ad8ebd3e |     
   mipsel    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/123df43ec1b3480949e984d226e3e22622291496 |     
 powerpc64   |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/8d41a50d723b428312a50e9472c3e2324dea3596 |     
 powerpc64   |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/e0b73311f87dfc81ac37e38e36adfef1ce8d1334 |     
  riscv64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/377b87bdaaef131b2482350f361f3c17bbf9a00e |     
  aarch64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/3ec3f521775e5c53ab8579770a852d206e06ba04 |     
  sparc64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/a11ab63a46b9b72e1dbd9e14d5a0bb4a60c99db9 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/881f6475842f9c51b646f93091ebc810bb89fc73 |     
    arm      |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/ac19c30bcdefa2d1d82deb4cd365b90b36897b55 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/326e9d65443217fa9bd89088a93baa7b9c741fee |     
    arm      |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/fe24d488ad04780dc69082116f21e2e9adae4a14 |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/61f6bc66c3284c1d3bfc118de60eb7884a1ea79d |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/15e9ed6fb73843be4ee745a88feecb0fe26c7059 |     
 powerpc64   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/04bdd74c69ae066a2f8e7cdaa0442aad585d7580 |     
    arm      |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/d98d959c50216096b9c4c2cc1c8fb933904c9408 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/7cb1d6400ca95b9f7306f69c5ebe7558d1baa4a3 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/bbad609d7390d0bce9f345b4446d8dc05b560d8f |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/094f280f49719982ce3d3fb302f2226cb3084f51 |     
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/0563b456398ce027eb058a7a496008b4b2716df9 | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/7dec135a8f218b41cf13bc177cb0f250e7386639 | ORPH
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/888515dd70773cd445e09ae0180a786d5902be7b | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/6f2d7565d37892215f0ba7125b953ea7ba4d3674 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a1f6f5e36b4e68a6c08bb7005e62d7256075d804 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/aae65618584c6575903e73187f184dd1b981d317 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/da6be8367dac4f24c8080cc678cdef107e128d72 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6cffb69460c058142452cc8ace726bcfcc193f82 | ORPH
   xtensa    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0e160f2d6e4a445dacdab330ed83cf46bf973c5c | ORPH
    arm      |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/b00dc0d7805e8a66590cf89aef3b284e250010d0 |     
  sparc64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/672f9d69d3a31678609015bea5bd6e2a0fc88c8e |     
    i686     |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/70a68d832b69b4bf70aceaa46b86db7a55406805 |     
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/7ef808df8424e4a669d9060aeb42afcdd4b53a0e | ORPH
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/6a5bfa9bdfab1954c006560f76f23796bf6b3f11 |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/baaa39ab1b7043fa8711978527a7fb32e28de3f5 |     
   nios2     | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/89700ad6dc4619f12b85100354be3b27590a5475 |     
  sparc64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/8d2175d290140b204f51b7845a37501e32102a93 |     
  sparc64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/031116d06203bfeef729ee537e9783f218e45181 |     
  powerpc    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/e32b0681a6aa4cac7e75af5f2ad8a7499ba70acf |     
  riscv32    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/97043bdbbf77c61878ce6f41e5f805e125315c2c |     
  riscv64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/6e2e4b1bee24f102761c14137a45925426467467 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/262f5a1e76a27be353d8a070b0a523b6d7a689dd |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/0294d33ec6e574f1897ba7b88d246dcae9ffdc84 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/6eec8b83f467536731f4d529c00e3750c9033d47 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/d49d8795c3be4614a36b64471a12e4b012f4468c |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/8180e366911f6cfbef7b46519f8ce66e4675735d |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/27512ec11441f3d79e3a6762ad061f1d7d381aa1 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/b2fa6c1289335b96e38eaaea955107c9baa79d61 |     
 powerpc64   |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/679ec978414904cf4a10b2e9fbbe46aa77126c5c |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/acd91cb193275e4448c1dcfad2e3053500e034a2 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/24e62a742ade79505ae9c4e7f75257203ed08005 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/e271d0f7fd5481ff3c353d7d5c177b6cd270691c |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/874fbe57cac67d064de43892075182cdf4f71291 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/8f0bfc21fc91a02bbeb6fff41e99897f609faa97 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/bc7c08b9b61e3ef179cc69a91c5bef786b6c0859 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/b7692a82a9cb0a6d37bfa9b9e2a3e0f87ac54650 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/057e8de11b42eb95d4ff510a8d4e74f6e97f7421 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/48024efeb9ca329c0f90134237dfb0c2c6feaa9c |     
   sparc     |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/6c6414d06caad140d8d3577ac1982a653d5c4d23 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/c47955ac7cf0eb170d52236527fdd52093af9e78 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/90dc7e2e9a80caabb3981f79da3aa8854db46558 |     
   x86_64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/7a1ef137d8572747d47427f9b9ef3996339e90aa |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/5edb1fa530a7556ba26225d194ba1eb8de7982f4 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/447da7b9d67a3ceaeb6e3625c9e597bfc4836fb0 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/de540f129789abddf28a46579a833d39e0365e49 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b98985812093fcec7a933478166533af1e46756e |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/fc66f15b48d37422fa679a64f97846d97c7f4498 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6ef7298dee48d7ee5b482f25415f6c0f7c4ba40e |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ab8e6381e9ace41374bc90f3a63ecb05b6085609 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/11a2c5dbbab8c1d0a3f7821784894d94ecc08bfd |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1ad091fdcd7da56995bcbc8797618e7ee980dff6 |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9a2c66a7e150284f76f094fc46f5e29f87e9ccf0 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4621d66b7e87f2f7f4720549e95335cda5a8b86e |     
  riscv32    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c2efd002345e0a690f95289f5dc3346c9ec842d4 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2458523701f24c1b6f6d6cc8f64f69a607544dd2 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c68c1648e26b5709afe9ce20d8965fc7489a0e8e |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c37b79f8d0b916bc454042a38cb6c0c5d96dbf4e |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/fcdf1724193bf8ce829d294db36ebd3444b5fddf |     
  sparc64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b725fc6dcf3921892c7b6928a1a80ec4a96c4d5e |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/82fd4183af839a36b7db14c5800b43c84181af50 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/089da0a403a64b8e476499b1326fa207acc20611 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8c4b14963a3146785e5af3246bbcad557f9ca1f4 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/df86ac08f0b3dec745cd36e9433fb2507469a17f |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/352fbe3988127762e48f83936a682674d0911800 |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3cb422a46b74872932580bd12262fa603649f7dd |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ce3cfb2d4e55e885f5f6bdc268172301f05905f1 |     
microblazeel |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9eaf719cd0b37c0256773f1bb7fa58787d12ab23 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a477ba484265daf4ffc151bfef4ce063c4ac8eca |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5c937b3357a783fbc4fe37ac2c4db60373d600bd |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0b3b9cfd8a6b690346559d6d6dfcee0c42df6f86 |     
 aarch64_be  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/806ed15da7a05a5802dac799017d9b0352ef3a66 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/de319f28ba990d080c0bfdba2e15b2d16e1c06e8 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/53d577fce47698f7a255fc94c713e87159dbc544 |     
  riscv32    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d438591f5948e8eee0ec58f07120e0d63a2bba14 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f31967154bc473d4bb36d6f4db2c111b6dc0e085 |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/89ea42006be15cead4b101c635a7fb6a8f5eefb1 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4370b77ab0484ceaf0d4710783beed77b62d312d |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3f25a92aeb7aec2fbdc15025f2ebeacaebc04b85 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/ed46cf424574691495596b6c17467644dcc651b5 |     
   mipsel    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/5b2df615da0a6c0811636df62fb55f0031cd0d74 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/220b7d8e55342e03f09102a2e18d8461aadb924e |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/7a6bf14e83faf7c27393028a290b77b7b3d1e769 |     
    or1k     |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/df8862e5aae817a685eea814c1bf5a11fb977292 |     
  powerpc    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/a25f9f27bc0b52ee34851b706e9ee31e69236fb8 |     
  powerpc    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/0ce066428e9a23bdeb08376f8088e19274e98799 |     
   xtensa    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/8edcf4bd23993ac6340b32d5f6dc03f61e44ea2e |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/db1b7b458af51b538cbf4e61e22c74d62fa18b2f |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/83a0297d1460921f14f65b01c3a202280eae490e |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/94848cb7a0401248df9c0559397b93b8faa6e9a6 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/d67339141149ca962ca1369c885a1d4b9feb1746 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/7a409a267cb7ab41490822fdb6cbd77174dbd22d |     
   x86_64    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/491f89e45610a7752c0700ac02b80a92b7876ec3 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/6b7097d7da207a553ce3cd32a91239fb9830c4cb |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/b953c8355dc13084cd523cf7713520a51d393d93 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2df4bc7e023c7b13075eda74c32400428e754579 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/aef0ff46790bd3aee432bd3916e6aa01c6fe4d77 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/9b07e3fcc5e16775074a1b7cb8a242a5b3ea7591 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/376d2d73625050962a63d6333c976fd66bcebd7d |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/88004226db11ad8ce63d7528e56d92b27be57a33 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/7b02d3f3ef7075e335dc6f823aa1a297f9afb2b8 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/61b72d97ce94d2bf87917daf7d7e4ead26b0c685 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/da86b2280d1ecec6293553de22b6c200d9e49cce |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/50db23360bca97d274b476ed1ad66c8e3ca7dd42 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/0c6d007b3286eb16c0c610f5c8645f72c158d134 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6c8d7aaf85332a5733feeaf84d8924226aa95640 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9d71c00f66f10875dc8f0cab4cdda323a808e69d |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/ba3e09433802c055812405bc2a867115988c38b3 |     
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/de2397851e711fee5e0c4f840150b5e5c42b0a5e | ORPH
    arm      |           php-8.0.9            | NOK | http://autobuild.buildroot.net/results/9718f031893c83f47625cd490cf5c5d67a561697 |     
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/2443559df8c2357476e4cbdbebb08280cbb80a3b | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c4bfdde59b8062208bf3102e82353c6735ef4ffa |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bce1e69b5c9c7275b0e537dcad8ba92903b7670d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0a7a51b291cee17ce0afbc63879dab139211b45b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e07befa03d3341d8eea37f3a9a1187c2b4dc648e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/823185e6516cafd53b0ee937fac7e870f050c0ea |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/34ee79f9adfff420674dd7d9f08d641c1bb75d5f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b8041f2c1f563dd6572d1353cfbef60f17582f9a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6b0f3e2f28de8c29ea1c120a60eae5722c6b5428 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fc91c37a11187b4688659d2cac61147260d88f67 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fb9875819d0101b9fd5917f443e56c82fa053f7d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8dd684a28ddaaeffd83276bbff021218d008a31b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/41d1619c709386e88c81fbb6d22b11e99cee7d88 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/aa5e48008358191b3e4b1bc9b19474c05a469334 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a31a84db9af0039e54120993eefc3467155f3875 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e05661b99ed7bfe53b3e674b7d17cd7cdd4aa227 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5d4e6ed3836d741eca17eb66f59604429d797e53 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/41d8feba9ed33da92f3b2db3ba377736f4f81c4a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/722de209d798f07077d3697147b5e9ef6d7ac4f8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/65f8b64bddea9e9ae82e6cf513eac5253fd2c5d3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/585ee5a18f9cf99e50f98ba24e37c1619bdfc521 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0b6bfd4a04822ab49230ff08d6bc3e357b6f81fd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/853986120c72dcd9ceca9d002d13ba7a4e81d617 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/370338743630615308d1d75d910d6499c2dd7a22 |     
  powerpc    |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/bb33fc29d242b10ba16bba192281ff281c17d438 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/da055bec1caf071567db791c7aef33eef529f545 | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/f4392d53a60a0c969af050890b766312ea3801cf | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/9d75e6995f453d3ff616af8d5cc9c52a21859e2a | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/9b98576d6654bfb4502b6bad0a11c962a38a2b7a | ORPH
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/330754adf45cacd4a0c76154b58351a321bfbb08 |     
   mipsel    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/8f6a593045d205ffed04b94070116d8e59eb27e1 |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/f8cddfba09ac710af2ad9fca34fbabb8185afbcb |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/4d8b3379532ebe4f6ed1b82a2f615c5cd7b1023a |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/b6a3dcc90c3faf9db2917187514f56888e4c9739 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/d2bbd7096bba5667ad5a572313d71f59e0723b6c |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/e0629b22b3025deb8e182271f539edd2ef116f3e |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/edb95971e9e87ddc3b350225a17fda93ec395ee8 |     
 powerpc64   |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/2f95c3b16115cedc42201f1f982fc9f23aa98c2c |     
  riscv32    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/63e30c04570897263104484b64acc1ef81a56b14 |     
  riscv32    |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/de7892ab357d97929647836ad4fbf07517c8f78a |     
    arm      |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/5a7f7a9196b5c4019159c3e1b931e27bac3c6417 |     
  powerpc    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/2ab2b04f05fc2bc0d1823b57f2ca0b25071fd99b |     
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/3b143daa24692a8f7adf13af5fd359624c363f67 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/3f24a74cd88f918f8da9d968b5559513cef5aa9a |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0205970ef6d9b838a18d0c28e35d753646d4e1dc |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/56722e84605e22da7dcac5b3c82cfbc9784d9f02 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/7ba433c7b72a279af22fc7c599ccae0e09d944a3 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/3b6e0d2c96e95b7e4a5ec441fb9b6345fb60c035 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4c9eda1074abfe1f02b5015b6715eb4b4c16ee9f |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/42f77628b49cc3cd18a59ee6387e2ba00d104866 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/e25e0a6b71073386006c0ebde63b95350a69079e |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/75e49f6a2c675cc8ae243871cd35a8d7d3c6532f |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/6043c1df825156da55ba4180005e5c24bc6d3468 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/8292df7a2157a6e0c27801f43b4939d7fca775ed |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/6e27b1dc19ede13ea305665f912e8ae195714e9e |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/613c2fc2bbd1c22bc228fe674d1a33689403d534 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/75ffa1a7c6fc4928081fa5abbde124b40d17eeaa |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/42f20f164d7797471f3a04ad7bd4f9ee89fef772 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d96d7e4f86ad12c1d156ae0d087efd7e089781ed |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/fb91d920ca40128a0d360ec971fd1fa5ae147072 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b1c1a23d359bdb629636ba4119cc3b9f44e905c7 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/9033df734c3431189fb126bc9e7159725d7852ff |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/dc52bace62e35b23fb9fb8ff2953bc45898bd4f8 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/9b7d3b87da3f6017ffe02eca90da76a7aaf4be28 |     
  aarch64    |     qt5imageformats-5.15.2     | NOK | http://autobuild.buildroot.net/results/7780d505d4607bfb2d735f4651529c153cb10401 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/d244c54b2730052e7c0dcaa4965e344bf6c1541f |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/057bee97da4aed890451ec4fa3a41a6f9c8011c9 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/063cf1cf3cb20d70547deb658d09cefd26aed0d0 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a1d4096ec0f96053142f87819de6cc92788c7017 |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a7963b046f55c2c194d85f39937bdc0f8fbee5be |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8488a4703a96f042d576757100dd30068c6d82af |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b11e6fb8683b93adc38f592b71a88792b59362b6 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9455db77e15020496cbbca431dc53937585e66ac |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/186622a1da5833b9de6569bf94a1afccab9f9fd7 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/51ef3540d76110fd12a1062402e196b0d2367a43 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6ff7971febb92d3124f8f37203300f5ed69f252d |     
    mips     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/094c20a3d374a815d0068a6125dfd72bed8eabdc |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/df2979fa3fa807419f1d4b0acff1c95c29f31178 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7cae67e7b4e27cafebfff39f21b73ffa7280d18f |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0f1d3dcc383a953378ca35758456421e3914fb80 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c3d951ff740a5c8cc706f8bfef4f067924e55272 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/173d7b5df34a87857f1d7398434117f47d4ebdfb |     
   s390x     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/707bec774311031c9ee69717d6cb6befeea2bfd7 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/af35b27d2188a95116a582118163f2ced1a5bb0e |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ffcd4868d9bf429797eb3a1721faebb6e13c34d4 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3b180750489b3e9111b9d09092592018d2628512 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2d5f54f5b50b96494d30e66ba35520efff32d156 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8fc07e928103d61b5dcfbc873f47e61a638ecc73 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/27cedfed4e7b0dedb5325611dcbaf3decd91bcef |     
    or1k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b2faac654f687ce002add83abd70ad2e9e7d8a09 |     
 aarch64_be  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2544796eea5219a9648872627bac5b3eb47c1a5b |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9ea48703196755a4d28a9c7fcb49598e9de0c9da |     
   s390x     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ccbc85e2abc6b3f84800521fb0758293a01b361f |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/87b4d5e78eb7f7c5a2425944f9caa808c3afcb59 |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/42f854e0eb496100e6291b448c3abefcf6ea0df4 |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1a778ff722fa4d3a06ccb433e1cc0af0fcc4a05f |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/359a8cb96a61b57e61e95e1ea0fe1f0e8f58adea |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/b6c58d2c450d681a7061a9203b145421d8e5fdd7 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/1c3cc39690b4fe4c59bcba2a993ad1d9df24f13a |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/a708f3616c4e730ebea00d1101ef5a873a21e09d |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/b4e1b7c292399df7beaa561012d299e94f832996 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/ed52f2e5b1b349c22c30f3402ec6a1617f030f81 |     
    i586     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/3f9fee0a34ba012364892de4b063c27cb1c4206f |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/17806d18ad7f04bacc47605914608e5132ec90e5 |     
    m68k     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/6c37a3b0394423b02b47955ed9bbd1297bc6b8d9 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f27994e77b77f43b698fee20660ab0ca05168669 |     
    or1k     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/3e982b114da85b1ca766c2bcc22bcf589c67970f |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/5ba5529eeacd05c13f436de590ff3da611d7e073 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/5ce9c17a7967ee71fa1619b455b433b285cb87aa |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/cc6e2d6ad6e57696592079eb36586ed552aa7466 |     
    arm      |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/908d1a8d2eecb64a41103fe99555ec00818f667b |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/840d16da3d6e9ec3a89d0f82ee28792d05961919 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/3462de989400dbbf79da576dad40766e319fa83d |     
    arm      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/07759d39278407ae9847fb852976d7f4ab310e6e | ORPH
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/c08e73eaf3687c7764119a16178e014e8361982f | ORPH
   x86_64    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/bf7a8bcb61aeb44fc16fb27278b23c783bcf4df4 | ORPH
   nios2     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/01b1a65952428145b2244fc07dcd77fc3adb191d | ORPH
    i686     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/19dd7ae0f0bcbf7a80691d73eccea4ad371ddcc8 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/a01c55a0bbb8611d29687b1a7aa368f1400a0c68 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/53beef05aee1f1c3eedd5e1fdf85d28104c467c0 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/83c08981348e6c6967c84bfc0d37c8c47aa1a12f | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/16de3cf1284f691d4290d0b511a5fcd1a99e2d7b |     
   nios2     |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/36aba416a4f7ff4988b222ab432aad0970fd47f4 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/1591ff7fabb09e4eb79f3aa293fbb228c255c45b |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/5db308428ee3a7c50e12c2a424276559055a6304 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9ad88d4e6a895b015f8d3c4c022bfc4dd97aaed1 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/52b0a1b1c6d889efd1863d92891d7fc6bd544e2b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9599a5f0c1228c9d2611621cd793e9dca111cdc9 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ef5d3585ecb8a4507b974e42e0fba33ad9f98916 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c71c1d13cad9cf72d519a86cbbdcbc098ff615a9 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/61a9505e957b52f2b4b6dc93da8e4ba2c6e7f450 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/c259f8385af409e5cb75333d3ad57351a9b47164 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1fd89a4cdfd63402edb18ff1eb8f4daa3b971765 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a30328302c7d514913eea6d85f4216467bed563b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f2f5cf78b57f8aed8bfb1bd75e42386f940cbcb6 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/dca225852d453abe57f1d89d16f0a01d57a27739 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/4b97c0f37015e6f57534fdb496b8fd7a479180aa |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d2f9121276e8a7c202e88e25876b5a26f4c95189 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/2d4cd306120b66223ae566df87602825910bd6cf |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/9773b6edcda8dd8b6afa495eeaec781ac8904cc4 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d0369e907785fc0708a1711f06f59c157121a588 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f9c1932e5b5911e80b2e658dce0dbbe2e464c8c5 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4ff43895e28c0321811a5616d56cee07124d3dbc |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/03bd1088266ea802593d2183f72e36ad1643f9d8 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a8ee4e5a7ff5d79bb5598f89009693eaba76b051 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e5943fcfd2b6803658fdb03e16573b4e98bf8abf |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a22ed64d6e90307b4ac60c5e42764332aa30ebdb |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/beed660e6f51d0f2a64d975979e2597dacaa1bc7 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f1b97065f6fc3bc0742847691a251d6d61b01ddb |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/9cb6b9e4470a1a5e590c520a509a3dfcdb2ace0b |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/5531937c82ac2dc00f1222265bd47bab1afa16a7 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c1e4a81dbde80a48555258139dbbb25169503b74 |     
  aarch64    |         upower-0.99.11         | NOK | http://autobuild.buildroot.net/results/e03cdfa73095a48d434142c1c4c0c348e2934a8b |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/572cd2c6e42ce180a27ddf5a74b07f13cb5ec846 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/308720dde2b958a3c56dffe06d8dccc806123638 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5262e843a5695df55cbd94037d3d71421b58fbcd |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/82591bf121f83e331ca05be3df64ea2a1fc7ac44 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/2fe541c22c5bac68a4355a02028d4c9617314694 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/913606743142beead425c3ff649d9fb989f3794d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e1536ea7186e72e9452e2d690bdc971653adc20d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0b6fc73332a1fd68fb41536825e1618771d68e14 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6c30bf3296d889cb62428debe241a7fdd5fdbb7e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/16f82cd2c8c303c6a72c4782b9f81f0aaed86605 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e311886a2d096ed87e005526c407be31f9f3ffc1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fb72e3a0333cd4f61cd97265514e2e65839602bf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6170755613cee2de2643531b83da17a8d1e47591 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fe8ef727a4c1a14c748c7c65aa9ba8111fbda035 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bcde3c1b856af52154d13814308731fccf4e742c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7a84ba562b15d6198b191f849c05b44d3698dded |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ffb7821eb7f2f6c21a1fb4f6982829fab91655ba |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b701b7b98f46ba679c09c7f8c04b81ac7a1b0505 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f59ce0b760f63fcf5c1a1b5243714064a6ef9fdd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/90f37b3f653c1c5bc03610ef27075847a73456c3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2b57bed047b78ea7247552813675f0b0db2a2026 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c3eb3014e18c9bd6fed8f267cd409ca3237b117f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a7b82cfb852879a0225b53b19e82fd9eb18f93ef |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8eae357107c407f703b071c0cc137c45222b9264 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c5c534cd2a25efa6df7d2ce2e805a26511f64cb8 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  host-python3 | 17
                flannel-0.12.0 | 7 
                       unknown | 7 
          libmodsecurity-3.0.5 | 6 
monkey-f54856ce250c4e257354... | 5 
                rocksdb-6.13.3 | 5 
                  zeromq-4.3.4 | 5 
  gobject-introspection-1.64.1 | 4 
                 pixman-0.40.0 | 4 
                    htop-3.0.5 | 3 
               binutils-2.35.2 | 2 
            erlang-jiffy-1.0.6 | 2 
                  gensio-2.2.3 | 2 
                 gerbera-1.6.4 | 2 
                mono-6.12.0.90 | 2 
                    mpd-0.22.6 | 2 
   openvmtools-10.3.5-10430147 | 2 
               belle-sip-4.4.8 | 1 
            docker-cli-20.10.7 | 1 
               domoticz-2020.1 | 1 
                   eigen-3.3.7 | 1 
        glib-networking-2.66.0 | 1 
                         glibc | 1 
                   gvfs-1.44.1 | 1 
           heirloom-mailx-12.5 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                   httping-2.5 | 1 
              irqbalance-1.7.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                        lapack | 1 
                 libp11-0.4.11 | 1 
                 mesa3d-20.3.5 | 1 
                    mpv-0.33.1 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
                oprofile-1.4.0 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
            qt5location-5.15.2 | 1 
                   sdl2-2.0.14 | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/fe7e344d27601dea25510a3381c94d2d1856951c |     
   mipsel    |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/09ca1a502a2fcc4ebd75eb36cc2f411100d61fac |     
    i586     |        binutils-2.35.2         | NOK | http://autobuild.buildroot.net/results/0e42c5fe9d91a0405d1a84f17a0b1200fa6248f4 |     
    i586     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/d11587623853338497ecd45800fe7fd07e6ac250 |     
 powerpc64   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/7920d4a2b5de2c8b98f9afea7a50720f7a9f3f4a |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/6bc2d461670bf813d26a753bdbfe3a58bc0872e5 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d38add4aa8c5a11ce824a2d9460e9682d4c16c25 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5c4043ab06c48447aaf1bc64078d25da0d03c4cd |     
  aarch64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/31244cd54ded673b62111606ca60cb092867aa8e |     
  aarch64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/ffd4a68b04db6193b591d8baf1c26510e2e07472 |     
    arm      |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/1fc25178593b91b8e30d32a986ed361f0dac4ea8 |     
   x86_64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/81f06668ceec415cafbeea853f85ea6a38146d35 |     
powerpc64le  |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/1f148d818d391c8c14ad0f5ab708a4496ef347f2 |     
    i586     |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/a3b87378b2fc4589951571fdd55c957f84afc128 |     
    i586     |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/5dbda9d3695b425c9c001d66c72ceb76291528d0 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/228ad749323b72a67406afc9f99a0938e0befed2 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/7f2ec55d821e02854524781306bc3dbec9020951 |     
  powerpc    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/492774277aa7f0aae2cb7bcc43e53d486dfee176 |     
  riscv64    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/6758120066807d55fd8c194b9ee17aeb70231e35 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/38753d0ab55b119803024068208a07c618ebcffa | ORPH
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/3542e4c99b827d28af5554eee92e6f432a03f53a |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/523c0eb7e7e75501756d8efee42fb30e2fd8d362 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0a5a549b556e7a4ade4eba8c91d4036ad6120d15 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ce06ce8ef01e1c17c134e7bf50b77d3fc6eed515 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/dc018fc940f435f6b12be6e4b23f4e7e713afbe2 | ORPH
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/23e82fb1453c53f4450755ca8199d6ddea70ac7a | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/a015d7470331b38f7680f913619ccee88ae114ef |     
   x86_64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/3070d67b992ec5d057ada7b39ce15e9fde286442 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/217409ad0f606d525435173c7e52e0f7ebe5b770 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/46113c0e16730551f18c0393eb18877577ecf5c9 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/725e500f14c84b35cf40cf6832ef801912d9c1b0 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/5b74e4de792e78da9291843de5cd4dff5ddd8473 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/8d1e48377aecb5b36499ff7bbc189bd36089878f |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c1f08b0bccd951f94984cba8ac186f21e8de998b |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/f5a7e2ef50d7c4ef1e2f3151fd62ac97543a5cdb |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/8a5d9668014aebdad632befad9631416e4f5ccf7 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/cd0f64dbd323450a6a96a87ee5e31fd151f0bb14 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f7f91b9cc86341339018436e86041128f0b0a6ec |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/9589e3e0ca0fbadf5235a30f724459ff5e1e8658 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/535c62e7d8b5d8a8fb92a7a38be2b9a033840dda |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1a5edf0d07f838272d42d7c2d30f44809f336655 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ed2ce6f67970bfaccfe449ec29985f12e79c612b |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c5ecc3530cc6f823d3e2732df53808c246782ee3 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/3ee7705269273c4c609c7a88c0435a216e5f3ae1 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/565a0250acc69648e5e9c6b969b03821b586191c |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/14bfcf2da7a30c337c519b7a5d3123de04f04c25 |     
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c90415aa35b5d67150e2ee70f7e0cffa3aae7dac | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8a9e98bcbab05cf1027de41f507f0a2c71d78eca | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8fcf7dbd7f7db38c5b3d56728cfb395f6dc2b472 | ORPH
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/a916fc6b5f694ed8d69f84442095670e21196646 |     
   sparc     |        irqbalance-1.7.0        | NOK | http://autobuild.buildroot.net/results/13ff4fea88498ca156374373360395f27baeb5e3 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/04885eac39e3c3855a27a327987587b5b5479102 |     
   sparc     |             lapack             | TIM | http://autobuild.buildroot.net/results/cc3c072eead43edc911be61c4b8fe0d770d02993 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2420cda070c33307032135bb9d96b21970f5dd9b |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0cd393f504303d295c2a60fd0ddf5f1c25a6bdab |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/12a56a52c1c494f190017b00087e517d5a8fefd4 |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c81d7401dc92eb6a687680bbee3149ae95e04e99 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/644db42a76237cafb47bea1f1093bbb57c306e37 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/52415b5416d294eb47e0ce8f8a9070728deb324d |     
  riscv32    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/7ea5831ed61083474d870a65f88c00610e20156e | ORPH
  riscv32    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/daa168c9f8807bab0ee443b5171f1c3743459132 |     
  sparc64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6f0aab28e0ae24723b3782d83afea6afafd0cb9c |     
  sparc64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8622168afc0f483dcb9b720614adf79bd8bda9f8 |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/9d50259368adeb41fc7f595e8a9f026ab716f458 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/cc17962592765699c10454b9ec73b7d2167e9dd6 |     
    i586     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/5b80b0defc5af3973a010eefc8ba463db806bef6 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4d28bc3345de2e519b0fed9227193a06d716cbfb |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4550139be15c8053a16e2c06f9b487735dfb4cd5 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c013e9251f6bc486527ee38e0cfed0e9c326ca98 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/58bbc67fd9f47f6aca159374d6245123a39fb55b |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1ebd54e40b9f18269b291d4c2f5a52dd6cbf3314 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/fa6e76177a76d9e079bc1df47f1d396af5ab7f44 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/9fe4fd77fd34dd390718f97d479bd942596b04be | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/03867fa9c9b4e19ed8ebf17222d6d39175265067 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9924d012f2f8cde89a80184374aebabc6d02e223 |     
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/43f7f568dd5c37399a4453aa0e379512787a8466 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/e20b138a30b5c7e99601415dda6eb7493fa129be |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b58051c5cb5278c58710b9721f9ee74d1227ba66 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6f2bc0e98b02a82da5146ac6a28853e4dbaab357 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/18ced486eca5c813c77df9d70ae04e521bd0f6a6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c46ebd7f92cc54d77e719e4bec6081ca3246eef9 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/019c4daca7c51e064e8aecb2018937f1abf520c8 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/343162d789a3041b58256b50b2ca202b67697e42 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d84c68ea4d6d4479543c254007854ccebf6b71ff |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7132c4dd7b5e0cdc5ab03d362c08de8e2cb163ac |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/924a7b00068dc44d3a3540dc41bbd264aa131dcd |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e40db41dcc0841e3bd181275d54f1774bebbfb78 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/d6b399d3cad15add4435dbb523f309a696c71b62 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/84b57c53e4a7bcf2f44c4f5256ec7b9aabd2441f |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/a89758b1f4ce2c57be837b58fce05ffbf7fcbf59 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5dc3f967ab4a0a65788fefdb28b4fdb38f4e401a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/185440513d70a3f5f6c644b75ce779fecd19f12b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/1a1889a2a5f07336c05527c3fe1653fd31cc2526 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/cca75c217a88fff65b7b231775dffada621f31ff |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f13980fdc90e72059e72ba88b154d1ee2e21d4e2 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9e7989485d7d17f160967504028db0fc19b64329 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/5248279fe9f53e0217b666ef72a2fa839d56799b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/20908a5ec252f81c536c4f99ae3e2b99cfb40843 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4d28aa10b75548dca4fb83a0dce75fcb5bb31679 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/57c06f56dff8dd52b9e753441304b6b7855113c7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/dc66413a6f263ec2bf7eca81611d53123e90b52e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4ae15cc3de55feac249d82bb99efd26b3bb02344 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  host-python3 | 18
                flannel-0.12.0 | 8 
          libmodsecurity-3.0.5 | 7 
               capnproto-0.8.0 | 5 
                 pixman-0.40.0 | 5 
                    ffmpeg-4.4 | 3 
                 mesa3d-21.0.3 | 3 
                 openal-1.20.1 | 3 
                  zeromq-4.3.4 | 3 
                         glibc | 2 
        host-sentry-cli-1.57.0 | 2 
 Makefile:755: target-finalize | 2 
                 openmpi-4.0.0 | 2 
                      bmon-4.0 | 1 
            erlang-jiffy-1.0.6 | 1 
                     host-mono | 1 
                    htop-3.0.5 | 1 
libcamera-3a1f67a8031ac5ad9... | 1 
                mono-6.12.0.90 | 1 
                    mpd-0.22.6 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
                qt5base-5.15.2 | 1 
                   sdl2-2.0.14 | 1 
                      tar-1.34 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/f0c174d8e2189acba655444d807f0f83707a189d | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c2d69027b4da194279989ce9ce8fb7aa989407a9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/af9977639452e76fe989bbf23dcb767f42f87c4d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/aadf0b7cadff4832162520d028daf6065f7d79af |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2e6f274b849a2d6c4c24c99d097280ff048c0fde |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f84baf771e69ee56158fd13e95d1f368d839e11a |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2fa26f37792346abbd82b403cf1e336fb97785a4 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c6cd97f363e8d675e3d11432ccec808f1109e529 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/125fad671c01a73fe702919422df8b559338bf5c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ecc4ab2328bb7bb4b5e419ee9d71d5575a9ae242 |     
   x86_64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/e5986c5f2c77e047e1b9032eb772a51c0836fa37 |     
   x86_64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/fafaf29786382eb1792f188618b0a73f98a7038a |     
   x86_64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/98258e0f8983aaa2788f86225f0b3a931763a00d |     
   x86_64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/5688573607a87f3fe2d5da653b3b0b8dcca88b7e |     
   x86_64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/5371d407a26f2160b0ce38455d5f05b5a9fe81dc |     
   x86_64    |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/24b16ba70d85eff67bb844be540732719f58a473 |     
    arm      |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/e276181c1f5c5b62e21205dec5fa6e70c31fb7f4 |     
    arm      |         flannel-0.12.0         | NOK | http://autobuild.buildroot.net/results/8e141cd9fa3d7736d3a40d138a303abcc960009a |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/86d207f8482d929d45604d77621dcf43cb0774b8 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/8c5aafd88bf0e471434ffed76f2035156f76920b |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/ab476255e4da7a582f0fa9fef64e6dd3e74bc863 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/645cb1710ea4f88ffe13364ec779f575aa454be2 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/e25197d8675a31796d8b2330bd319bb229d42044 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/00054ec7ad48314226c50597f782406a55efee1f |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/cf143c924f9d897ec11d2a02c3fd0ecb6d71bfc1 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/0c1a9c141047c126ab4be960767362f1fa4b976e |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/73d3ff07b40b930c542d104ff2bf89afbad21d6f |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f32296ec8cf09e1e6382b8915160053741cff022 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d94b7542a4bf0b89c22d154c4a949af2d746f1a0 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/3b46fa110337f975dba2a89e07cd8b10d2d5ee3f |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/d851ec884fd8b4e7d1f9ea2efc3d907298e2ede1 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/65cb3eac3817c0f7aaaa4613e39ded37a70be5d8 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b36e4bb978bca5a62a12a7410237910caa2ea1c3 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/fc2f3681ae44e5a1ee905c9e9c5c9f3746afa053 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a1909004c32f388bb375c0a959ac36b25416b625 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/394457a0fc0007c68cfd7e93670ce317a2810d1b |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/bd8004bbeadd4d56b05fd0bdf5234bad819cfe6f |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/bcbafb602184b5dd460786f25ca6987980bb42ef |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0fe347d42386556f34b937934a6b64ab4c2cbd7c |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8778864d73d3172a8901dee474a9eba3421bc2ba |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/97a725e990c63a8a0bd12b48c16f1000ceebf4cb |     
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/dd4e64a47827535346d97975cf94020135803e7c | ORPH
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/175e2c0c11178086d5a68d532f5a74d6b23ad63f |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/46403a9512b73ba7401e672e70bc2b33856a3c2d |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cb179c40cef21e7970f3ba4a58eada6bb29ad329 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0000df41711fad94d7962d4534c9ba45864914cd |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b4731ce6e29dd25b91196b1d90fb94cf83c3d62a |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1e49bbd74ef35a234c3de09147d1807c66f21bcc |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/95441aea4487baa4841ed7c30384dddfa27bbf72 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6f77c8f6b22312264de013add04e740f7e9c0265 |     
   xtensa    | Makefile:755: target-finalize  | NOK | http://autobuild.buildroot.net/results/3c30f4bd4e5cfdb695fe8f98ec657619a986385b |     
 aarch64_be  | Makefile:755: target-finalize  | NOK | http://autobuild.buildroot.net/results/39dcc7d436087d7a590a3746de7d2425ace37dce |     
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/14866c60d5e465edf9cede571279c793cd8f58c3 |     
   x86_64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/89b458131902929570d86e229943b8162201e1e4 |     
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/cac4564a61388d45abf70443d2ccb03d1a01d563 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9c85edf28005f13da5dbbd579026eec596efd4ba |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/5b65b4984b14571c99b4f1e529efbca4f4d3ddea |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/d3d5d786ab6db90c7e761698a19a1be92a888b89 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/cce4fe7b5a64cb1594de8671bf1997c9cac55b42 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/4ee531a531784a1197d7e0abeefb0cd6bf49b11d |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/da8f1f59acc8176264325c7b789a86f8cdd15866 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e425673462be1d403bcc83d93dec7297d47f4886 | ORPH
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/3bc8aa6725391618105c703831a9c5b0e6960b48 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5c1ba5b99f84b6d5f7803ff7e4f577e9b5d3c722 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5ed4d1e383d0be8efbb25a569865569d8f9c21a8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0d4b7225c0ade22544a52244a985070ee9c0e3bc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7a6e006cc1e480bf58218e2e76cf9d661e79dcb8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/918872adfbc29cd71ef65755bc0445c9fdd835de |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a7e076aeb38b56792d2129fe398c49a4873eeb4c |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/48f93208b10af7682a6c2140043ff64b7c5ceb3e |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/28c9cf4b766fc95b568be27690da7dc94ed5d124 | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/5056a25d924e6b22eb6fe46ac0e5b6dd7b90fa9e |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/fcd9c70d073a73cc44fbd5a3f74adc35e4cf8403 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9197d4b3a48e330a64186d33ef7c2ced9d7c3f7c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/46b03d1161b411a22f2ee3f5a2a5cd1cae5bedc3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1f91b37c73553bed729383fe3345cb6b5567ff18 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/18463dac2ea92259a4e70eca7f6c598cf427d096 |     


Classification of failures by reason for next
---------------------------------------------

              host-libcap-2.52 | 253
                  host-python3 | 30
                       unknown | 16
                    ffmpeg-4.4 | 5 
  gobject-introspection-1.68.0 | 5 
openzwave-62444b0f979c337d2... | 5 
            erlang-jiffy-1.0.6 | 4 
                     gpsd-3.21 | 4 
                    mpd-0.22.8 | 4 
                 pixman-0.40.0 | 4 
               apcupsd-3.14.14 | 3 
                         glibc | 3 
          libmodsecurity-3.0.5 | 3 
                    qemu-6.0.0 | 3 
          refpolicy-2.20210203 | 3 
                suricata-6.0.3 | 3 
  system-config-printer-1.5.15 | 3 
                  zeromq-4.3.4 | 3 
                apparmor-3.0.1 | 2 
             bluez5_utils-5.60 | 2 
                      gdb-10.1 | 2 
                   guile-3.0.4 | 2 
                harfbuzz-2.8.2 | 2 
                   libcap-2.52 | 2 
                 libebml-1.4.2 | 2 
                   libnss-3.68 | 2 
                 openal-1.21.1 | 2 
                      poke-1.2 | 2 
                 dc3dd-7.2.641 | 1 
                   erlang-22.2 | 1 
                       gdb-9.2 | 1 
           heirloom-mailx-12.5 | 1 
                     host-mono | 1 
        host-sentry-cli-1.57.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libfuse3-3.10.4 | 1 
               libgtk2-2.24.33 | 1 
            libqrtr-glib-1.0.0 | 1 
                 mesa3d-21.1.6 | 1 
                    mpv-0.33.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                   poco-1.10.1 | 1 
                  polkit-0.119 | 1 
                qt5base-5.15.2 | 1 
            qt5location-5.15.2 | 1 
                usbguard-1.0.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/66a918c60fe667d2897620240a64510618bb35da |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/13db35f6632a88769a8e85bfe72f3cf6332f0c40 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4e5c079097a81fc26ad8950a27c28487afc5eb2b |     
   xtensa    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/dd71218768ebba8173646947ca6e4dc790303763 |     
   s390x     |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/ec696f8eb203f3a3fae03c1e45a301e4bb0f4ba9 |     
 powerpc64   |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/ea1b9dd5d898b599e11d6869d39226b41fffb5cb |     
  mips64el   |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/5a00b4fb09e8ca3bce1d5ec17b461acf0225574f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/513f79989f67a76af7896f5bda9c34acdb419a08 | ORPH
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/3cc8a3f979ca0cbf7c39b88611af0f1a132e6566 |     
    or1k     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/dfda4b191bf1716c4a1e8ba1edcbd9de45fcc1b5 |     
    or1k     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/96c4f2dd637c332a5e12235b477edab61f2ed763 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1673123742e89557e7fec1b9c2d7b845286e30eb |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9fa20da885c5c71d4be8cb26ff91b7d759b7f123 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/462c59301391b00da72000635c81ef6f1bc1f712 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9c67408912ee93f030213e67e8b7e251bb27ab76 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5eb4ca18f8b431d05d6f9b43950a0b8e7a7af39b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/643089f15f1e92a5020ce195fe823e39c247f4f8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/750fd3b37d2cd90f752bf4b01beb045330598a10 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/56f5c36f2037ca9189b03dbf85cb846b66488704 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/faef0f0d33d69496edf6fa14f7289457e3fd1cb8 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/ea0df2b600b6d6e5bde862e518de28fc9f4a878f | ORPH
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/1761db4c1eb28bbb0eaeaf959a0efa7429c2418e |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/141706ed591e637f40fe975891965ea4a2a2752c |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/dc1ce51618522400e43220c813a6aabe0b336e9b |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/bf5d478e7950b4fa5dbdd8eca1bfa085aa7fe338 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/522b98e04a0b10d275e6b63ffd28bb0b481644b5 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/8c98be366aed05b3a5dfd4f98ba0d57701adc877 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3ea7a01c91af93c152fa7591c8bc165ee881dcec | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3b00953134ea0f061f6ba093f25325354dcd935a | ORPH
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/7f5c02182d7200ff0d4bb9e7beaf7a5c9610b20f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/11c7b5fe92410bfee5e38b7f56b724e5619d6b64 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/139d22f01a5806cd58d3257632d1ab6526f8fd01 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/41ae9515ab8cb12b5eee5ceb82f6b04699697301 |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/8354794564160e5d34c41be3a7b1489b6c426ffe | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/67cf815360eecc621b6973897922cd319ea58b7a | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/51694259a9b15cec0e81042222171e7869c362ab | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/a856cac3e7ea9915cd0fb30e4b59e85839bd7a0a | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/7bdc4e87595770bb0da64d9ec0445f164e24975b |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ad939daf9f1d35709966c2b5460d6ebe2979f6d6 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0ce657b2aa59b0e640e423993ad768a6b3cd12fb |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/67a56402026b5853367dc11647b51f7da6934bf5 |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/87446dc74c8099849ec7e3dd9e2348101dfdddd6 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a96e9f634f526396c5dbce9ab41713a549d37df7 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b56b31cce2486ad051bfd2023977086fba1538ff |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7ab7053d8413012442cb6a50e69334c24edda256 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/dd3b5caf5cf34296a1e876558f01e6345a8a1bc6 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d80b225ef0c72221c92fd5f380289b46e31b5d37 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6f3ddc39bcc00c37e9fc4c3cc412d9d74fb834cf |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/35dcebaaf2cab0d445670b4dc4c6c4b81f5670b8 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ece169ab9674c4526ace70591c514ff96c8ba85e |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2bc511c59978deb4f31bae19923a63354b88d69c |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1fa28f71daf87ce712336262d06c4f239e8f9118 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9df87780c1204f8454409912f2e72efee719756c |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b3b4d915d30564e0d34294334c9bb930c1d63c59 |     
    or1k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/22cfeda1910a8f25f8a8bcf1cbe8a2200ea3cc5e |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/48fd086ad026836cd0796d18a00469829100af34 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d8b64a2619691b4bc1101db0758b7fab8a1b3dce |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6256ce8a5aee0ad0e42eb6fe2b29ff5821532164 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8de15e00506a6accd9110b63e4aca6699410e962 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/fca30339dd2c18c6698b2a24ba3cab97836a0f60 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9ac12333880456d70d9bf4a1ab58574e4b0a860a |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5ac12e6c67c6feb789f21aeeb7bd67d8ae5f406d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/78c99da5119a72fc80218f2bcc367b515116223b |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3454632224e9e670aecde5886c75c69fbd02e7d5 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1d142405e2b8b8c614a84b58f9bca39de6cabb12 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c0a1a4fcecd02103c894bd95d3a2c35b4117d403 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7a6b806e156dbad9deeb0cc334dbfbc333301ae2 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/82769574be9c19a7319e1e6d414de54141b2bc02 |     
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d4384e9859f587adf43f0fac48654077c657753f |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/17d2fd25ebbf8380832f4f5b446534fb92c99486 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d55aec95901757150fffa9ed6405f519e4041461 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/df7691afc1533f2208e5ac18d9688c702ac207da |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a2fee6a23deb8893de265d4cb49949726e4fab12 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0bdba3dbecef197d0158cbab1f6dba3f99a76cec |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7e82c94a77e93220ccaef2858886a2a1102e5409 |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ffc84d8309b6cc6bbe9530d959c86b1fca9a85c9 |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0599644a72a9abed72ca00c31121ab07aa20c6dd |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ad0cfb9c496ffd85fb61a165365f210f7661acf2 |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/821d33a120b675bd6461e12754c37e3e63ae355d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/319f3dc2193e94cd7e81efb6119bba3ac8d60249 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/861aa2c02f2a90d3027376f0fa53bc3968f475a3 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/88f16d379bbbfe8a353377871b41f3253c05aea9 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/65314a3dc2e7debb6533b02d8570b848163db5ad |     
    i586     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1fa878138e9e5248d0e396810b7c519b84179e6f |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2ef867c0750e94fef8d5353b0250f5c7611c2978 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1645fd37f8dfefa303064a910e0fba7fbc402bc9 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6d4866a79d2fd9393697d7985e9aa07a76befe26 |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bbaf2567471fe3dcf27e4340d7bab66761d2a222 |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d44f358afbd3ac6aa1c51af8e1b0852b5f04bb6a |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/483e94456ab7d6bfd4bd0ca82ebf3a2dfb7ed66d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ea717be492d6e75774bf5083cb343c010f9db75e |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/231ee4143452a939f736274111fbb7542c70bf3c |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/32f8b7d3c33cc70873ac0d639bceabe5b5f6e30a |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/65744c68ca832a66fc4a9dd94e67a01cc011d16b |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/394e5fc4307549af91a725178038172f4688e5f9 |     
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7b6cc1bcaff6408663e0faabfb6c1f56f0e2ffef |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b5f682d9996fefc9675cb308dbe0deb2f8090748 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c092085fdaaffd1218e55a8c046dabb20542df7b |     
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2b11bda898a03a87d564fcf98ca53bd5224afb44 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a40a67ca73ab7485d8f21dc6cd682596596a86c4 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/79f96543f7430294c3c631970364de4644f01d1f |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bb35bbff2b917bbf7b91c88e26db224573369dc8 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6ab4df8afb45401e0f45b258521498ca9e507d52 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c098abb5101d291a924ad093a9b04eef0b4df307 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/fd472ffe07078ecd02b5365dff457d421f29ab83 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1fb893c5b903b37e5bcae97e203f3f6ee7c1252c |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e3390091d225166002166a417a7fd73ebe38c44b |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f6b23f00719d4d7d5836bf7d35423dece64889e0 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/73196338b9b93d82852b19f356007e9ad61bcf63 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f3c678aa18b5ef3f8a16982a081a42a1e33c8e3b |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/24cb1c6d5e628bcec9afdf4522fb839059ea8abc |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/db1f7b6079fe78acb9ef9085990987ede83ecef1 |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f27784c0f03d6cc2bec83442f441ae7b6d89f552 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8860567349918a228ff9f46fd85419ea89b4a3b3 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d335d48c1520d66976fd662afc4ddbccaee1aa39 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/23b6a8db55fc45496cfe72372ad242152c91c7ee |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0425b6ea29ad5f525309213c833376cc0dd4dcff |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ce90a5db7ecfc8a5f3260fe1b123a3b0e799ea0c |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ff4ed9d819c329931669b821db6ff684b4e3dd92 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/98d6e2e7bdddaea47b3c1901980facdc5becfa35 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/231907cd1c9700333375b5f4809fc19bc762e2dd |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9171af36385c94d8cfe41a82072f7c707f928b8a |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d3506a18db2693c074708736eb017185cb7e39d8 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/aed778be8c20761c182206d3979a0691b518d9ac |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b4388d52ed26551b81825d538c3050f65aff622a |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6a7c1f2623196dceaa1a0ffcf342f15580fe6d0c |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e9f14bff4620d69351f0b872fe151a73683a49f3 |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/079b451e32fc178c5063a8db83fe917a72458d3e |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/22539e64a0a99278155429edf049138e2aedb9eb |     
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8e4fcb4899d9c751ff7423dba31f41ce15c2e6d5 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e668b49f0832e1709c3d0988d4c1e60e5046648b |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8222eabf349a36df95344f2bfe99cdf8860e18cd |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9cfc5b8ed43610a99008abfe6461db98da4f89f6 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/17cbaab811d96a4766db77ae84ee146a5a332e93 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9218b30eb86a8eced8d751acf16c2054728e2831 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7c0a6dfc5057ff07be80e0c3b66209429e123d5d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0bbac233604199908f91b6f8a40f8fb055dde5fa |     
    or1k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c09c66413b99f9e72e8b072c9df277e143b7e969 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3776cd97cd54e55cb8e88cca8555fb438daf4c6e |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3bc8f1909df0892da48d83a3861b5134279695d1 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ee1fc26e3178cbee36b656fc692b0e639b2a6f5e |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5eb0b41ed75958e34be838c79c94a205801a2d18 |     
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7a681d9441783f09e8c4598e22a1343b26e4c228 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/46137206dbc5ff76b3c1211649657094ce04f5f3 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/349040bb17130266f7505906a7fdebe722751b57 |     
    i586     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f0137d6618f65593d48deebd62680d41d0bc7308 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/19b97270677cb63c484813d34d38d5edfc2f0ac0 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ebc3f5420231018dd202b55bc2c6210039e013fb |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d9c594f62f21cbeb185720b37f81b599fe103e42 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f4c9ce3466abceb8f631865a7fff455acb7cfc8d |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8fa4593a5767beb5b4225e82af68165043dee93a |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/260b72e3ac4bcc8c30399ceb1c9a19026199a8e2 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8fecd96ed07ff268c4ab1007b557b8a285abe544 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3507156e9e307ccd9ca21ece3386b2889066f26c |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2738c40bbdadff13266b01ec17f9ef94c7c9768d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a732894e30acd9859255070856a694d587ac664b |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5debfa12ad4b13925c8ae8c99317cac649b515a8 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ee9a8250cc431ae1961be7e125c11a03c86c59a3 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e6e9ae3cd24a98abbe119d5c9ec298649fcde3de |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bae1524b2ec13f3d4bf4b5180edf6384c12de5b7 |     
    i586     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ae328c6f41011406d3db9933f0605ca234594f87 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7fd14f18b159484c44f5c5df5532539dc0da3966 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2f619b233e2cfb4d7eeb3cc178c849c74d11f2ca |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a78ea5e06f2e65b495703cbfe4e2c77a734d4197 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b01eaa40af414735b1c0432ace2fb1fe9e38e0f9 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e1ebc28bb7f032b950602fa5d6e2314a8680cf7b |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3c9cbca645e9fb3395070c01283d420e747c0cab |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3e7bcae57f3555ceadf3ca2f027d04085833832c |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3bc2197452128a6ac88ce970a4360a812205f09e |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d8ed381818f878485b34599b1fe820ec621e1fd5 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5af1115c62a3e37823f34c98f28ab034638cfb83 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/437079ee1cbbf47dc072b56ded0ad781e21b5263 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/204d9d12acb5680e5ec4eece2925fd0103957643 |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5f33799e4895627d330180e2ef4c945f906d4972 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/35d3f861b48dcdd03e59b4cbd0881e4b4bd92cca |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c515bc62bb1372ad7649caa280890f641272dda8 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a9764e6f352c804b612b379f40aed43a912a00e6 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/51bcbc704731ebfd0b124b713931e44bd49b790b |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4843ab30448e890350f4adf828eb918de2405296 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f15e60d9318a68b026a0864038e8be7cfa32aab3 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a8a76bc89bd808e65bc637b6540d84b4254c91ec |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c29f582dfb61cbadb2ae6c0234ba94e1a2e0c902 |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/75f7c8495c2ac999e04689243ba45ba6115887be |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c0ba942caaa6866fa1c5d41f122993cb9cd6d9cd |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1a2037655d37ed0e887edc1fc45c929ade2f80d0 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7ed322a203f6a8d78e1db5ca9678d6b5cc1c5337 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/32d94bd6b127d69fac3febba40b80745028ab52b |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e3d8ff6d3f46701453ba0989a8a995b9f8185982 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1bb0348f916271929efb1020d6d9b3c7866b7180 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/19f5d80505980ab06484f876415a49839fc9fad6 |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d2a34f15876940a469bca9b308bd5c043d2b95ee |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f7e3b31f46c4d53137ec7c3092a693d781dc6bd5 |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2bf672f272395419e7911fac7b3638b61fccccb2 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1987f263174f328a33cc91bef562adc7d442c119 |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1a4ea596c786221d16ca50545015b3f7ed76e710 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6f49d95643b03eb10df29eef37f56bac35c7fa3a |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/15ab0ae8cd797152ada194a567bbecb488f27a67 |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c1c164aba6771d6789dfb16d1006a47f1c2438ef |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2dd981b534059e4b524fdda7f2b835641ecd2c63 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d424dc30cf4b02c7d244c2032fbf8e4cc77e5786 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d927b07da10cfe894b8e35382cdb8375b28b1f99 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/64bf29b6b653ce40216be6e553ae0a6b89dfc9b8 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/46c06626215be41c98083acef8bd7b95361e8dcc |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c702cde8baf5dfd1a2d7939671174a935ee62546 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e71be8a9d8774003b516fac144cee7c7aa7bafdb |     
    i586     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1fe0458bafed3673e8f7ae334354485ee253f20c |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/04edfb9ba1a56b18f6cfa4090055d107f35c4d98 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1d491de31aefcab23cf97279d4b8dac06e6a8af2 |     
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/cbf8f5449ce2d439dee86052b582aaf5d91f4e2c |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/83a0a18e4866d316f02463dd6ab28626c886537e |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/aada1544671100efeb172680086f1c652e6a02d5 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c52e63baaf0048f05033e316551fb1993b995395 |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/08a6449fb8b1c4cb9216f605e097efb7eea89b1d |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/003c2896dc6ae6f02527b5a0dcee4b8c42b6a8a0 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4c5a73775b3229405720850156c486ae51f6a353 |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4e64ecf23d967508b88d0347fe47fe0a4d877a0f |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/329180f7d1088874281ecdf172d8ed32857b6c0c |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6e20fe0478e01266678135379fabc00e93909daf |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2b0d884204a3830e45dbf09580ca06d887e62260 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e28dc9817f9705d9da9df86d3d12ee8f390a789d |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/aec9007e540b831e7ecec59a46771b991fe4ed79 |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e63bbd65ca39f218ffd5209a9077df0134cd4240 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f6ed50c937082020fe9d29d0829d8225e5ac41db |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3573d34d7e69648b53cae070b13eaaf7bd86d2bb |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ab0ad8645168890c3a73738a841d445039413db7 |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/86faa6715a0324b27d5a8ed479c09bad79be0dc2 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a3478b0e08d9b6f4945a3d43c731be8d74fc7a22 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/55e9b7527061160f30f48a0e5e71a45ad59e8e9a |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a471aa8aec45de43f36a44d4e03a76ead526e83f |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b791d898d152ca8697af757809bea59764fe0777 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/28a7a6b5674ab3c925cdd6be0ab7c19535949e7e |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9065101364fe5b281378f8cec2c711d145454f49 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a54f1b1b79b4e196e197dc636bf2c83e411f65f4 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/487525ca9e64797206fa06ffa6ade543fc146458 |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/90927ac5b3319cd869c3b93194d9e739ce34a7f3 |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/10a552540554e77ea2a8ff1cd235e269977969c3 |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3ba92fefc25d482c78e824b73bc0d48070020907 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/abb6d5bce81e23bc919f615458fcc0aaa954e71f |     
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bead75ed8f12d1c0ca890a6b50327bd30690e10e |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/063c88a9d6c4a310d25889634b6207ffe203fc94 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5438d710c4aafa3a64cbd0a0581e629d55c8e2ec |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/7b8425450d393ce258a4c5065219a828dffe372c |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b9d178a0bdf661e3c5da2a2c7eb1330cbcb8f372 |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9385e45ba057a42840def89af0a94d9b67ba5087 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f542ad1eb53df2cb124baf2a1e57e90905dc85d0 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/db9180504d90a9104adfe4b478c550a5bd98db68 |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/dcdaba4033ad10f30ca8fe4bd80d2612e1254b17 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f20bf849a6ef45f68e0338df1e12f776fbf22f67 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0c2b532d3a596906f8c8f75b17e81db8e1f2c04c |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6f3e3521f4dfc1365aad279e94e4c6235bdb307f |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8e1b0d279321249b45a04137be50e96090113f8c |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1288db8c51af01ce59babf356e57ca462e4f2fea |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d041015655c3b225db68f6eb9c7bbbdd7ecc767e |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/631360a84acc2a73211186fcc4a4583ec81e531d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c5a7652e9d72b531fff9ebc520fae8aa4d72c8b4 |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/bffecfa3ccbe34650d42ddf61cdb0697656b36d3 |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d828e0074040440696b53c74bf6514d2068c3fc9 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/db975d660f45d8a50d6aa497edbe8314e1dc2ec7 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ffc28f8adf2fb5bbb5003305c854ab5b42b8c0a6 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ea743598b036d045bc3b70c4d3064c424ac51da9 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1318fec35fe2ba15e6def4a4ca6897fb7293f21c |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6cc45bd8e169f3122221450dbd325f0eef00dacd |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/92fff48341799a4b6dadfb014390070b8cf820cd |     
 aarch64_be  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/03810e25bb7b175b790a22bef358b6f651d12fb6 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b25ce4dd784d2a369b3052fb117e45e432d7baed |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c9ac460c356e05c0801bcb41f519ebf3428d6054 |     
    or1k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c064d9202760e46ffa5ac715b39f47b3543a1881 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9a3e4a643a2032bec55f5945d863883feaef829a |     
    or1k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6b8aa4e1f7c8fab9171fc796dee04f4d55007829 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8cfe25259d2b45b60102099b627a200dada7e2ff |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ddcb8ae7e3ed3e9bcba13dde985c948f229b78d2 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/efefb3accc98e377fb6263e03b33990033e6511d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b8ef005af873e51a2d9f5cd019b92be27d5310f0 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/11f2cd4d7d2ddc485eca5df3dd003d09672407b1 |     
    i686     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1f3e6997d5ac8049f5813bb4c475be0d721fe9ea |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0d791008f7cef5ff082ce5b56cd9b3fcde295d86 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b066a4da3f2070e17c7f52d99b03dc262ec56e87 |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b577f13ab1aebce1413383627ff70f14c65cecc4 |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/1291019b3d65a06e44aa836677228fe3b3af5637 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/75a2a1bbfeefc66417720f3f8dbcaa8386b36e81 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e4814dac36e394757541ed8120ae59e0e83402d3 |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/125cb5e02fcf73279511dc6c1e4ecebae32dbcb3 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/56b0c1e4b49345fed5eebd2af31cdf9b67b519d8 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/48c65b971a36d02199467fcb0d8185fb2d9aa69c |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/22a732302b282d76006d81513857c508970249dc |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3ea9141c035bc19367f10a62af09067e273abb8e |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3fe18f4d1f915f3138753a7eb540320fce799bd1 |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/cca3a0546a42dc7e0b2363925cf71370a08e3082 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c8846dec87c986ba817bca03cdaf46eaf431aa8f |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e3559be0cfeeabc14696f47845b393363e077bbb |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2f2e2cbc1ae622852d40f9a1e9f76faca27716d8 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/eb30b762a1d58808b5d4d60b81dee423c673e162 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4622526f06523abc19dafc4874bd350827df76ef |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/822159ad261c667f8033524f4a235a96b7ec1fd5 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/11d0d03259bafc07793dcfef5edf2ca15ef575be |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/cd3165bc514b9a0f681d663c70116ab9cd1594ba |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a8e1ca45dcc9e4ec56fd3115aba768e2ddbf4d75 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/a64e49e75773837b6d5eabd119e08c9c269dffd7 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/aa719d11d389dd122640d987a78b3556560946d7 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1299388f253bb2627194fd31cdf1802006618262 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c2c3c010f7a3c5666d00e59dba407c2717660c64 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/fb597a9bc2776d022684f5a53fe8f41596cbc778 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/66be2ef1a03e75ed0947ce9da8335365ca3ed1f5 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7e897816ed5938a4745909df7bf95cd56def61b0 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/59a15b7c57335368db75be1e463dc2774b262269 |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/2cd4214cf88adef616e7523c0a2819ba4069609b |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a2ffc0e7ca49ebacffa80e00429be9aed2d7d6fa |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/be9e33afc30b5c928ac80361088bba8a8936cdf3 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/184113e32d08d1e6232a28458a746bc6606b5b14 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/acbf8e096fa7894c2d78333a76308f09e9dd42b3 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/085237ed8d287e5cdf3edb25f3d40ea87ad006e3 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/ef168ca6cfcc95481b9d32a188eae68013695949 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/be36a4e23743268714e272a4f05583c31ce65da2 |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/2ee15dd96be5c7b2eba066170c1da6e033cc1874 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/b6cc5f3af01b723329c3c0e5facc0f2e8c8fb8de |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/fd53ccc975c655c8154cb56abc77658b1bde608f |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7fc0b6df84909b30b46f61edb0eb136fc7895b54 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/3eadbe21aa7ea2b3b668efc7e8ee534124908751 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e7e1ec7adb9550b125b0f31f241110034d75fd62 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/ca669a5fa57e57221ab8966ce357df75d081cf28 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/055dbe5fb9b937125c49c70138f0bc44d2ade322 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6b749024fd19c7ef951ad67bb67b03d4a9d9253b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4fd6c5b65622b3317292e00ec531de06cc6c821a |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/53be099ae17ed8d9ccf5bbea3478dd0d63524b14 |     
   x86_64    |          libcap-2.52           | NOK | http://autobuild.buildroot.net/results/f47a006e70649d64f88ba380e3d45567866e6992 |     
powerpc64le  |          libcap-2.52           | NOK | http://autobuild.buildroot.net/results/7365f7673a41a9a349736ed11bc0036796ab54b8 |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/bfce33cd1052a05621c15a01f27b6f7355ad3448 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/84d2c0e036dc18f059a61cf62a1f72b79c8db8cb |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/018f94fa722c86cefa3485957155bc68029dfd4f |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/45f161efa07d599033bc24fb8d184ab0bc4466a3 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ab130df0ca5dafef003aef0e8906984f74d61f35 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1728172f33187e1c7df1a4c5cabb907de1aa1327 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/19a7ef91aa2c9050e02aa93fa666f12437a7b899 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/184bec2faead49c6e38473f1babd0113bca3ad6d |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b8c1cfc56d8d585b403f9701b35ac08df4488f50 |     
  aarch64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/e6966cbdcd50ba5c3014290c10767eb96266084c |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/0c4a05aefc8d0eba2e31e563cd88b35780cc4595 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/f63168201d43a63412fb71e634ab34eb27a39717 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/3c49bdf3d6d2486ac3e21bdafe77bb6bbf411b77 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/0dd2392d5fd44cf5eb002d814a82b05e7a6efe69 |     
  riscv64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/9518e43b2e807556d3a0eacf9c5ffe80925b25e8 |     
   s390x     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4bd4e0b1c69701d330f05a1da40b9ab5b1b029e6 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/568f6303318f0fda4040047472d54b3084a9717a |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/d9bb0bb666f4611f678bca13c7a4dbab958943ab |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/45b2912e9105c77fad7a1624f8f15e8f901c72e5 |     
    mips     | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/0ad26aea7c6b0a6ca5b28581f53d28b23f7abc1f |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/3179600b79d83b235d1f81b83dbe8ffb94a41222 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/69b4f35d48b6dcaca98d2c77280e965d3248652d |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/ca58a94b4e73c91528c5c7beb4878a3b46e136ae |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/92c0eae21fc7a64eaad892e1e03c2b718c822153 |     
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/7438597e7dba5ed35f9eb9b19be2fe6fe800b80b | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a2f697748ff2566d906825d292f77013660eb153 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8daf6555b04839a1ad2e3bd67f36aca787848f09 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7de920e1d1c3d9fd9a6ce7e17ad64ca6b873d61f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2d16dbac844d13c9d3c87baaa309292c4e1d785e |     
  mips64el   |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/d81904801a303ce1d95afa60b212ba0816a24c9f |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/911a43f91663bb3ffd0e9161b154301c7a07e97a | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/dcd5aa66a2c0ac74f87ba7760204842291e211d5 | ORPH
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/e7424975b0d47e8bb4c1b5e7a7a63affdec34ec7 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/c05b45caef639e6a28e848e13c36a13561d2b0d8 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/cffc3dbf2265c54c197336ca70e74962ecd75886 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/523fc1049fdb79279d6058bce70f536807aa9b43 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/0a2bbe79723a195167bb4588d243ab4c80d303a2 |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/86b729df0e196776428c4f722f2d60055e83cd2c |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7737ce374c0dd185fcb67fc0203a273e7d2a0db3 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/276c9c57762d7dd208e96fad2c37f0ffc774179c |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b66200f98d4e9c0a6700144765b8cc006aba1d10 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/6e24fd686095d84880f6b69bbb402bae2b307aa6 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/f0564d0cd53a6117f1735cf5273e137a97c619b4 |     
    i586     |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/ed53d101fd0c67b1d448851f612adf28e7df0c00 |     
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/86afd88ebe43c66a21be4adc0addab9a5392f493 | ORPH
   mipsel    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/82aeb960060fc61702c6b8202847a0fdb45e1108 | ORPH
    arm      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/42944d60e19452184abfeb957001e42375261e2e | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bd70a5bcbb078da5a58f269cdf9f3d5b852b5260 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f17cd42113d97628d511a3d9268ed458956986f2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/1991e4e22e7b4ececf617a942860b158287d7439 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/cecb78b191d39205db17131c779607c46d19dee8 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d057f4dc2b74e5fbdffd9b95b6124a3b4481cfca |     
   x86_64    |            unknown             | TIM | http://autobuild.buildroot.net/results/f544e4f2fca6ac1a2f4ebe3ed3df0e46b76f6c75 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/fbe5b5b74e9ea84926228f19495ef1ddd472dbeb |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/921fbcd2e8b7460f00bdf1c3c72d9f85ca891e08 |     
  powerpc    |            unknown             | TIM | http://autobuild.buildroot.net/results/15862278628cdc4fe6a63e680d32eb7718184053 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/a4e629f9de14b5d3f0baae6e82400ed4f6a8aa2f |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4afebef31e000feb33e1a0bde1d66f20f9222152 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f1b555822b76d30d7a30e04bae7edc9e9ba68fc |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b97fff2e2a5858122c161d728b0c7e3ac1830281 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/c38684e8bba98f47f7b6a28d2b9945ba2105b519 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/c342cde40c1725af14302fd5550a8512fc47883d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fb359c45df9f51c6a5e0561957b0ee889eb3fda2 |     
    arc      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/7171721dbfbab96dfb43fb16853ae74fb21b6979 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/505ba161ce1c6176acdc9e0265cfe3ad492cb48e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6f646605ef5285c0822344cd7def75d75805595b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8a1a62ef3f67b86a9b4d9c895ffc1087f0b45b38 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/83231e1a94a6abd4b432f7466cce8da7d9e0af6d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
